// Conway's Game of Life 
// for circuit sculptures using shift registers
// version 3
// SandwichRising 2023


// game settings
const int columns = 8;        // how many columns of cells
const int cellsPerColumn = 8  ; // how many cells per column
int evolutionDelay = 3000; // delay in ms between cycles
const int percentChanceCell = 35; // desired percent of the board to get living cells on random roll
const int historyMax = 48;  // qty of gameboard histories to save

// hardware settings
const int PIN_DATA = 11; // using SPI port to increase transmit speed
const int PIN_CLOCK = 12; // using SPI port to increase transmit speed
const int PIN_LATCH = 8;
const int PIN_RANDOMSEED = A5; // unused analog pin left floating to generate seed on powerup
const int qty595 = 8; //how many 595 chips in use //Math.ceil((columns*cellsPerColumn)/8);
// options pins - physical switches may be added to these pins to set different modes if connected to GND
const int PIN_OPTION1 = A0;  // adds 1500ms to evolutionDelay
const int PIN_OPTION2 = A1;  // glider mode - lowers history count to preserve gliders
const int PIN_OPTION3 = A2;  // suppress data out (for demonstrating serial comms to the display manually) 
const int PIN_OPTION4 = A3;  // test leds
byte optionsContainer[4] = {0,0,0,0}; // (1)slow-mode, (2)suppress glitch, (3)suppress data out, (4)test leds



// hardware/software global variables

// GAME BOARD - 1d array of bytes to represent 2d grid
const int bytesPerGrid = (((columns * cellsPerColumn)/8) + 1);
byte grid[bytesPerGrid] = {0}; //{0x0F, 0xF0, 0xFF, 0xAA, 0x55, 0xFF, 0xF0, 0x0F}; // test pattern loaded into initial gameboard
byte tempgrid[bytesPerGrid] = {0}; // temp container to store next evolution without editing current
byte gridHistory[historyMax][bytesPerGrid];

// leds
int ledIntensity[columns][cellsPerColumn]; // tracks relative brightness of each led
int ledAdjuster[columns][cellsPerColumn];  // used to modify ledIntensity
int ledMax = 9; // 9 = smooth. higher numbers (99) can provide glitching effect to transitions
int intensitySteps = 55;   // ms between changing intensity levels
byte ledContainer[qty595]; // stores 8 bits of the board at a time to shiftOut()
const byte blankContainer[5] = {0,0,0,0,0};
const int ledMin = 0;

// timers
unsigned int currentMillis = 0;
unsigned int evolutionTimer = 0;
unsigned int displayTimer = 0;
unsigned int intensityTimer = 0;
unsigned int runTimer = 0;
bool runCalculator = false;
bool blankTemp = true;
int frameCounter = 1;

#define NORMAL 0
#define GLITCHY 1

// debug vars
unsigned int debugTimer = 0;
unsigned long cps = 0; // program cycles per second


// GAME BOARD/HISTORY HELPER FUNCTIONS
boolean readGrid(int row, int rowIndex) {  // reads out grid y x as bool, zero indexed

  //convert 2d request into 1d array of bytes bitshifted to have request placed on MSB
  byte examine = grid[(((row * cellsPerColumn) + rowIndex) / 8)]; //extract byte containing cell
  examine = examine << 7 - (((row * cellsPerColumn) + rowIndex) % 8);  //move bit to MSB
  return (examine >> 7); //return MSB bit as bool
  
}

void writeGrid(int row, int rowIndex, bool writeValue) {  // writes to grid, zero indexed

  //convert 2d request into 1d array of bytes to set or clear a location
  if (writeValue) bitSet(grid[(((row * cellsPerColumn) + rowIndex) / 8)], (((row * cellsPerColumn) + rowIndex) % 8));
  else bitClear(grid[(((row * cellsPerColumn) + rowIndex) / 8)], (((row * cellsPerColumn) + rowIndex) % 8));
}

boolean readTemp(int row, int rowIndex) {  // reads grid, zero indexed

  //convert 2d request into 1d array of bytes bitshifted to have request placed on MSB
  byte examine = tempgrid[(((row * cellsPerColumn) + rowIndex) / 8)]; //extract byte containing cell
  examine = examine << 7 - (((row * cellsPerColumn) + rowIndex) % 8);  //move bit to MSB
  return (examine >> 7); //return MSB bit as bool
}

void writeTemp(int row, int rowIndex, bool writeValue) {  // writes to grid, zero indexed

  //convert 2d request into 1d array of bytes and sets or clears location
  if (writeValue) bitSet(tempgrid[(((row * cellsPerColumn) + rowIndex) / 8)], (((row * cellsPerColumn) + rowIndex) % 8));
  else bitClear(tempgrid[(((row * cellsPerColumn) + rowIndex) / 8)], (((row * cellsPerColumn) + rowIndex) % 8));
}

boolean readHistory(int histNum, int row, int rowIndex) {  // reads out grid y x as bool, zero indexed

  //convert 2d request into 1d array of bytes bitshifted to have request placed on MSB
  byte examine = gridHistory[histNum][(((row * cellsPerColumn) + rowIndex) / 8)]; //extract byte containing cell
  examine = examine << 7 - (((row * cellsPerColumn) + rowIndex) % 8);  //move bit to MSB
  return (examine >> 7); //return MSB bit as bool
  
}


void writeHistory(int histNum, int row, int rowIndex, bool writeValue) {  // writes single bit to history grid, zero indexed

  //convert 2d request into 1d array of bytes and set or clear
  if (writeValue) bitSet(gridHistory[histNum][(((row * cellsPerColumn) + rowIndex) / 8)], (((row * cellsPerColumn) + rowIndex) % 8));
  else bitClear(gridHistory[histNum][(((row * cellsPerColumn) + rowIndex) / 8)], (((row * cellsPerColumn) + rowIndex) % 8));
}


void writeHistoryBytes(int histNum, bool gridCopy) {  //grid copy TRUE = copy from grid, FALSE = copy from previous history

  for (int i = 0; i < bytesPerGrid; i++) {

    if (gridCopy) gridHistory[histNum][i] = grid[i];
    else gridHistory[histNum][i] = gridHistory[histNum + 1][i]; 
  }
}



// SETUP
void setup() {

  // debug - used to display gameboard and debug info over serial
  //Serial.begin(9600);

  // re-seed rng
  randomSeed(generateSeedNumber());

  // initialize output pins
  int outputPins[] = {PIN_DATA, PIN_CLOCK, PIN_LATCH};
  for (int i = 0; i < sizeof(outputPins); i++) {
    pinMode(outputPins[i], OUTPUT);
    digitalWrite(outputPins[i], LOW);
  } 
  // initialize input pins and detect options settings
  int inputPins[] = {PIN_OPTION1, PIN_OPTION2, PIN_OPTION3, PIN_OPTION4};
  for (int i = 0; i < sizeof(inputPins); i++) {
    pinMode(inputPins[i], INPUT_PULLUP);
    optionsContainer[i] = !digitalRead(inputPins[i]);
  } 
  if (optionsContainer[0]) evolutionDelay += 1500;

  //debug test screen - set screen to flash using software instead of physical switch
  //optionsContainer[3] = 1;
  
  fillGameBoard(false);
  fillLedsBlank();
  fillGameBoardHistory();
  
}


// LOOP
void loop() {

  currentMillis = millis();

  cycleEvolution();

  displayGameBoard();

  //displayDebug();

}




// setup functions

unsigned long generateSeedNumber() {
  unsigned long seedNumber = 0;
  for (int i = 0; i < 32; i++) {
    seedNumber = seedNumber << 1;
    bitWrite(seedNumber, 0, bitRead(analogRead(PIN_RANDOMSEED), 0));
  }
  return seedNumber;
}

void fillGameBoard(bool input) {

  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < cellsPerColumn; j++) {
        //gameBoard[i][j] = input;
        writeGrid(i, j, input);
        ledAdjuster[i][j] = (input) ? 1 : -1;
    }
  }
  displayGameBoard();
}


void fillLedsBlank() {

  for (int i = columns - 1; i >= 0; i--) {
    for (int j = cellsPerColumn - 1; j >= 0; j--) {
        ledAdjuster[i][j] = 0;
        ledIntensity[i][j] = 0;
    }
  }
  displayGameBoard();
}

void fillGameBoardHistory() {
  
  for (int h = 0; h < historyMax; h++) {
    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < cellsPerColumn; j++) {
        writeHistory(h,i,j,0);
      }
    }
  }
}



// loop functions

// applies Conway ruleset to gameBoard
void cycleEvolution(){
  
    // FIXME - code still running using inefficient boolean tempContainer instead of efficient tempgrid usage
   bool tempContainer[columns][cellsPerColumn];
    
    if((currentMillis - runTimer > 500) && runCalculator) { // half second delay between runs, along with flag
      
      if (checkAndUpdateBoardHistory()) {  // board history (and blank board) check
        
        // If check passes, perform Evolution Cycle
  
        glowStyle(NORMAL);
  
        const int neighborOffset[8][2] = {{-1,-1},{-1,0},{-1,1},{0,-1},{0,1},{1,-1},{1,0},{1,1}}; // x,y locations to check
        
        // cycle thru all locations to count how many neighbors each one has, then update cells
        for (int currentColumn = 0; currentColumn < columns; currentColumn++) {
          for (int currentCell = 0; currentCell < cellsPerColumn; currentCell++) {
  
            int totalNeighbors = 0;
  
            for (int neighborCycler = 0; neighborCycler < 8; neighborCycler++) {
  
              // set up column index number to check cell
              int columnIndex = currentColumn + neighborOffset[neighborCycler][0];
              // make sure the index is valid and didn't rollover
              if (columnIndex < 0) columnIndex += columns;
              else if (columnIndex >= columns) columnIndex -= columns;
  
              int cellIndex = currentCell + neighborOffset[neighborCycler][1];
              if (cellIndex < 0) cellIndex += cellsPerColumn;
              else if (cellIndex >= cellsPerColumn) cellIndex -= cellsPerColumn;
  
              // check if location alive, increment neighbor counter
              if (readGrid(columnIndex, cellIndex)) totalNeighbors += 1;
            }
  
  
  
            // if cell's location is alive....
            if (readGrid(currentColumn, currentCell)) {
  
              // if underpopulated or overpopulated, mark cell dead, otherwise mark alive
              if (totalNeighbors < 2 || totalNeighbors > 3) {
                tempContainer[currentColumn][currentCell] = false;
                //writeTemp(currentColumn,currentCell,false);
              }
              else tempContainer[currentColumn][currentCell] = true;
              //else writeTemp(currentColumn,currentCell,true);
  
            // else if cell location started dead....
            } else {
              
              // if exacty 3 neighbors are alive, come alive
              if (totalNeighbors == 3) tempContainer[currentColumn][currentCell] = true;
              //if (totalNeighbors == 3) writeTemp(currentColumn,currentCell,true);
            }
          }
        }
  
      runCalculator = false;  // prevent running evolution again until after board updates 
      runTimer = currentMillis;
  
      }
    }

    if (blankTemp) {
      for (int i = 0; i < columns; i++) {
        for (int j = 0; j < cellsPerColumn; j++) {
          tempContainer[i][j] = false;
        }
      }
      blankTemp = false;
    }

    
    
    if (currentMillis - evolutionTimer > evolutionDelay) {  // timer check

      evolutionTimer = currentMillis;  // timer update

      if (!isBlankBoard()){
        for (int i = 0; i < columns; i++) {
          for (int j = 0; j < cellsPerColumn; j++) {
  
            // fill gameboard with new data
            writeGrid(i, j, tempContainer[i][j]);
            // fill led adjuster to match
            ledAdjuster[i][j] = (tempContainer[i][j]) ? 1 : -1;
            //ledAdjuster[i][j] = (readTemp(i,j)) ? 1 : -1;
            
          }
        }
      } else randomizeGameBoard();
      
      //debug
      //displayDebug();       //display debug info over serial
      //printGameBoard();   //display gameboard over serial connection
      //printLedAdjuster(); //more debug serial info
      //printLedIntensity(); //more debug serial info

      runCalculator = true;
    }
    
}


// handles empty gameBoards, as well as gameboards with gliders and history repeats
bool checkAndUpdateBoardHistory(){

  bool proceedNormallyFlag = true;
  
  // if no cells are alive, regenerate random board
  if (isBlankBoard()) {
    
    proceedNormallyFlag = false;

  // else if there are populated cells...
  } else {
  
    // detect if current gameBoard has appeared in gameBoardHistory
    // bump items in the history back one history index
    // add gameBoard to the gameBoardHistory
    // h index 0 unused to keep incrementers in bounds

    int checkLength = historyMax;
    if (optionsContainer[1]) checkLength = 8; // option2 - preserve gliders by allowing patterns of +8

    for (int h = 1; h < checkLength; h++) {

      displayGameBoard();  // helps prevent some studder by displaying during calculations

      bool resetFlag = true;
      
      for (int i = 0; i < columns; i++) {
        for (int j = 0; j < cellsPerColumn; j++) {
          // check for difference in gameBoard vs history
          if (readGrid(i, j) != readHistory(h,i,j)) {
            resetFlag = false;
          }

          // bump history
          writeHistory((h-1),i,j,readHistory(h,i,j));
          // put gameboard in history
          if (h == (checkLength - 1)) writeHistory(h,i,j,readGrid(i,j));
        }
      }
      
      
      if (resetFlag) { 
        blankTemp = true;
        glowStyle(GLITCHY);
        proceedNormallyFlag = false;
      } 
    }
  }
  return proceedNormallyFlag;
}


// returns true if gameBoard is completely empty
bool isBlankBoard() { 

  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < cellsPerColumn; j++) {
      //if (gameBoard[i][j] != false) return false;
      if (readGrid(i,j) != false) return false;
    }
  }
  return true;

}


// refill gameboard and ledAdjuster with randomly generated cells
void randomizeGameBoard() {

  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < cellsPerColumn; j++) {

      //refill gameboard with random values (or ALL ON if option4 is selected)
      if (optionsContainer[3] == false) {
        writeGrid(i,j,((random(0,99) < percentChanceCell) ? true : false));
      } else  writeGrid(i,j,true);
      
      // fill led adjuster to match
      ledAdjuster[i][j] = (readGrid(i,j)) ? 1 : -1;

    }
  }
  
  glowStyle(GLITCHY);
}


// changes the way leds dim and glow, normalizes every evolutionCycle timer
void glowStyle(int stylePicker) {

  int switcher = stylePicker;
  // suppress glitch when using option4 (suppress glitch, and all leds on)
  if (optionsContainer[3]) switcher = 0;

  switch (switcher) {

    // normal
    case 0:
      ledMax = 9;
      intensitySteps = 55;
      break;

    // glitchy
    case 1: 
      ledMax = 99; // cause glitch effect
      intensitySteps = 5; // lower step delay to compensate for new ledMax
      increaseLedIntensity(); // increase brightness of already-on leds to compensate for new ledMax
      break;
  }
}

// helper for displaying glitch glow effects
void increaseLedIntensity(){

  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < cellsPerColumn; j++) {
      if (ledIntensity[i][j] > 0) ledIntensity[i][j] = (ledMax / 2);
    }
  }

}


// translates ledIntensity array into ledContainer, then shiftOut()s the ledContainer
void displayGameBoard() {

  /* Fast Method Using SPI Bus
     This function is run in loop() without timers in order to rerun as quickly
     as possibile, causing the serial data stream out to the 595 chips to be the 
     bottleneck of the program. This allows as fast a display pf fps as possible,
     in order to simulate asyncronus dimming and brightening of leds.
  */

  incrementIntensity();
  
  //prep unused 595 locations in ledContainer (for gameboard sizes that aren't divisible by 8)
  int unused595pins = (columns*cellsPerColumn) % 8;
  for (int i = 0; i < unused595pins; i++) fillLedContainerBit(i, 0);

  // fill display (byte) containers to send to shiftOut() -> 595's 
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < cellsPerColumn; j++) {
      
      // convert row and cell number to overall led number
      //int ledNumber = ((columns*cellsPerColumn) - ((i*cellsPerColumn) + j)-1);
      int ledNumber = ((i*cellsPerColumn) + j);

      bool fillBit = false;

      // fills ledContainers using ledIntensity-based probability
      if (frameCounter % (ledMax + 1) < ledIntensity[i][j] && ledIntensity[i][j] > 0) {
        
        // applies dimmer to brighter leds. saves ~%50 power and only lowers perceived brightness a little
        if (frameCounter % 2 == 0 && (frameCounter % 10 > 4 || ledIntensity[i][j] > 7)) {;} //ledIntensity[i][j] > 7) {;}  // % 1: normal    % 2: half overall brightness
        
        //FIXME dimmer currently unused, no power savings
        //else fillBit = true; 
        fillBit = true; 
      }
      //fillLedContainerBit(ledNumber + unused595pins, fillBit);
      fillLedContainerBit(ledNumber, fillBit);
    }
  }
  

  if (optionsContainer[2] == false) {  // if DATA OUT isn't being suppressed by option3
    
    setLatch(LOW);  // allow 595's to fill register
    
      for (int i = 0; i < qty595; i++) {
        // shift out prepared ledContainer
        shiftOut(PIN_DATA, PIN_CLOCK, MSBFIRST, ledContainer[qty595 - i - 1]);
      }
    
    frameCounter++;
    if (frameCounter >= evolutionDelay) frameCounter = 1; // prevent rollover to zero
    setLatch(HIGH);  // latch the 595's to display register contents
  }
  
}


// adjusts ledIntensity using ledAdjuster to track how bright each led should be 
void incrementIntensity() {

  if (currentMillis - intensityTimer > intensitySteps) {

    for (int i = 0; i < columns; i++) {

      for (int j = 0; j < cellsPerColumn; j++) {

          // adjust intensity and stop adjustment when limits are reached
          ledIntensity[i][j] += ledAdjuster[i][j];
          if (ledIntensity[i][j] == ledMax || ledIntensity[i][j] == ledMin) ledAdjuster[i][j] = ledMin;
          
          //rollover protection
          else if (ledIntensity[i][j] > ledMax) {
            ledIntensity[i][j] = ledMax;

          //rollover protection
          } else if (ledIntensity[i][j] < ledMin) {
            ledIntensity[i][j] = ledMin;
          }
      }
    }
    intensityTimer = currentMillis;

  }

}


// fills given ledContainer bit with given bit
void fillLedContainerBit(int ledNumber, bool fillBit) {

    int index1 = (floor)(ledNumber/8);
    int index2 = ledNumber % 8;    
    bitWrite(ledContainer[index1], index2, fillBit);

}

// sets latch pin high or low
void setLatch(bool setting) {

  digitalWrite(PIN_LATCH, setting);

}



// Debug functions
void displayDebug() {

  cps++;

  if (currentMillis - debugTimer > 1000) {

    Serial.print("CPS: ");
    Serial.println(cps);
    debugTimer = currentMillis;
    cps = 0;

  }
}

void printGameBoard() {

    Serial.println();

    for (int i = 0; i < columns; i++) {

      for (int j = 0; j < cellsPerColumn; j++) {

        //if (gameBoard[i][j]) Serial.print('X');
        if (readGrid(i,j)) Serial.print('X');
        else Serial.print('_');
      }

      Serial.println();
    }
    
    Serial.println();

}

void printLedAdjuster() {

    Serial.println();

    for (int i = 0; i < columns; i++) {

      for (int j = 0; j < cellsPerColumn; j++) {

          Serial.print(ledAdjuster[i][j]);
      }

      Serial.println();
    }
    
    Serial.println();

}

void printLedIntensity() {

    Serial.println();

    for (int i = 0; i < columns; i++) {

      for (int j = 0; j < cellsPerColumn; j++) {

          Serial.print(ledIntensity[i][j]);
      }

      Serial.println();
    }
    
    Serial.println();

}
