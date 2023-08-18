EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74xx:74HC595 U1
U 1 1 645AA314
P 7050 5075
F 0 "U1" H 7375 5850 50  0000 L CNN
F 1 "74HC595" H 7200 5750 50  0000 L CNN
F 2 "conway:SOIC-16_3.9x9.9mm_P1.27mm_Custom_Hand_Solder" H 7050 5075 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 7050 5075 50  0001 C CNN
	1    7050 5075
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D8
U 1 1 645AAD02
P 5375 3700
F 0 "D8" H 5368 3917 50  0000 C CNN
F 1 "LED" H 5368 3826 50  0000 C CNN
F 2 "conway:PinHeader_1x02_P2.54mm_Vertical_Custom_Hand_Solder" H 5375 3700 50  0001 C CNN
F 3 "~" H 5375 3700 50  0001 C CNN
	1    5375 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D7
U 1 1 645ABC54
P 5400 4075
F 0 "D7" H 5393 4292 50  0000 C CNN
F 1 "LED" H 5393 4201 50  0000 C CNN
F 2 "conway:PinHeader_1x02_P2.54mm_Vertical_Custom_Hand_Solder" H 5400 4075 50  0001 C CNN
F 3 "~" H 5400 4075 50  0001 C CNN
	1    5400 4075
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D6
U 1 1 645AC228
P 5400 4425
F 0 "D6" H 5393 4642 50  0000 C CNN
F 1 "LED" H 5393 4551 50  0000 C CNN
F 2 "conway:PinHeader_1x02_P2.54mm_Vertical_Custom_Hand_Solder" H 5400 4425 50  0001 C CNN
F 3 "~" H 5400 4425 50  0001 C CNN
	1    5400 4425
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D5
U 1 1 645AC22E
P 5425 4775
F 0 "D5" H 5418 4992 50  0000 C CNN
F 1 "LED" H 5418 4901 50  0000 C CNN
F 2 "conway:PinHeader_1x02_P2.54mm_Vertical_Custom_Hand_Solder" H 5425 4775 50  0001 C CNN
F 3 "~" H 5425 4775 50  0001 C CNN
	1    5425 4775
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D4
U 1 1 645AD5DC
P 5425 5125
F 0 "D4" H 5418 5342 50  0000 C CNN
F 1 "LED" H 5418 5251 50  0000 C CNN
F 2 "conway:PinHeader_1x02_P2.54mm_Vertical_Custom_Hand_Solder" H 5425 5125 50  0001 C CNN
F 3 "~" H 5425 5125 50  0001 C CNN
	1    5425 5125
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 645AD5E2
P 5450 5475
F 0 "D3" H 5443 5692 50  0000 C CNN
F 1 "LED" H 5443 5601 50  0000 C CNN
F 2 "conway:PinHeader_1x02_P2.54mm_Vertical_Custom_Hand_Solder" H 5450 5475 50  0001 C CNN
F 3 "~" H 5450 5475 50  0001 C CNN
	1    5450 5475
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 645AD5E8
P 5450 5825
F 0 "D2" H 5443 6042 50  0000 C CNN
F 1 "LED" H 5443 5951 50  0000 C CNN
F 2 "conway:PinHeader_1x02_P2.54mm_Vertical_Custom_Hand_Solder" H 5450 5825 50  0001 C CNN
F 3 "~" H 5450 5825 50  0001 C CNN
	1    5450 5825
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 645AD5EE
P 5450 6175
F 0 "D1" H 5443 6392 50  0000 C CNN
F 1 "LED" H 5443 6301 50  0000 C CNN
F 2 "conway:PinHeader_1x02_P2.54mm_Vertical_Custom_Hand_Solder" H 5450 6175 50  0001 C CNN
F 3 "~" H 5450 6175 50  0001 C CNN
	1    5450 6175
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 645B61FC
P 4150 6300
F 0 "#PWR0101" H 4150 6050 50  0001 C CNN
F 1 "GND" H 4155 6127 50  0000 C CNN
F 2 "" H 4150 6300 50  0001 C CNN
F 3 "" H 4150 6300 50  0001 C CNN
	1    4150 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 5075 5850 5075
Wire Wire Line
	5850 5075 5850 4775
Wire Wire Line
	5850 4775 5575 4775
Wire Wire Line
	6650 4975 5975 4975
Wire Wire Line
	5975 4975 5975 4425
Wire Wire Line
	5975 4425 5550 4425
Wire Wire Line
	6650 4875 6100 4875
Wire Wire Line
	6100 4875 6100 4075
Wire Wire Line
	6100 4075 5550 4075
Wire Wire Line
	6650 4775 6225 4775
Wire Wire Line
	6225 4775 6225 3700
Wire Wire Line
	6225 3700 5525 3700
$Comp
L power:GND #PWR0102
U 1 1 645BA352
P 7650 4275
F 0 "#PWR0102" H 7650 4025 50  0001 C CNN
F 1 "GND" H 7655 4102 50  0000 C CNN
F 2 "" H 7650 4275 50  0001 C CNN
F 3 "" H 7650 4275 50  0001 C CNN
	1    7650 4275
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7450 4875 7650 4875
Wire Wire Line
	7650 4875 7650 4275
Wire Wire Line
	7650 4275 7050 4275
Wire Wire Line
	7050 4275 7050 4375
Connection ~ 7650 4275
$Comp
L power:+5V #PWR0103
U 1 1 645BCE94
P 7875 5175
F 0 "#PWR0103" H 7875 5025 50  0001 C CNN
F 1 "+5V" H 7890 5348 50  0000 C CNN
F 2 "" H 7875 5175 50  0001 C CNN
F 3 "" H 7875 5175 50  0001 C CNN
	1    7875 5175
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 645BDEFC
P 7050 5800
F 0 "#PWR0104" H 7050 5650 50  0001 C CNN
F 1 "+5V" H 7065 5973 50  0000 C CNN
F 2 "" H 7050 5800 50  0001 C CNN
F 3 "" H 7050 5800 50  0001 C CNN
	1    7050 5800
	-1   0    0    1   
$EndComp
Wire Wire Line
	7050 5675 7050 5800
Text GLabel 8300 5475 2    50   Input ~ 0
data
Text GLabel 7975 4600 1    50   Input ~ 0
latch
Text GLabel 8075 4975 2    50   Input ~ 0
clk
Text GLabel 6475 4575 0    50   Input ~ 0
out
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 645D5CFE
P 6775 3800
F 0 "J4" H 6855 3842 50  0000 L CNN
F 1 "Conn_01x01" H 6855 3751 50  0000 L CNN
F 2 "conway:PinHeader_1x01_P2.54mm_Vertical_Custom_Right_Hand_Solder" H 6775 3800 50  0001 C CNN
F 3 "~" H 6775 3800 50  0001 C CNN
	1    6775 3800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 645D6885
P 6775 3625
F 0 "J2" H 6855 3667 50  0000 L CNN
F 1 "Conn_01x01" H 6855 3576 50  0000 L CNN
F 2 "conway:PinHeader_1x01_P2.54mm_Vertical_Custom_Left_Hand_Solder" H 6775 3625 50  0001 C CNN
F 3 "~" H 6775 3625 50  0001 C CNN
	1    6775 3625
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 645D87B5
P 8500 5875
F 0 "J5" H 8580 5917 50  0000 L CNN
F 1 "Conn_01x01" H 8580 5826 50  0000 L CNN
F 2 "conway:PinHeader_1x01_P2.54mm_Vertical_Custom_Left_Hand_Solder" H 8500 5875 50  0001 C CNN
F 3 "~" H 8500 5875 50  0001 C CNN
	1    8500 5875
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J3
U 1 1 645D87BB
P 8500 5700
F 0 "J3" H 8580 5742 50  0000 L CNN
F 1 "Conn_01x01" H 8580 5651 50  0000 L CNN
F 2 "conway:PinHeader_1x01_P2.54mm_Vertical_Custom_Right_Hand_Solder" H 8500 5700 50  0001 C CNN
F 3 "~" H 8500 5700 50  0001 C CNN
	1    8500 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4575 6475 4575
Wire Wire Line
	6475 4575 6475 3800
Wire Wire Line
	6475 3800 6575 3800
Wire Wire Line
	6475 3800 6475 3625
Wire Wire Line
	6475 3625 6575 3625
Connection ~ 6475 3800
Wire Wire Line
	7450 5175 7875 5175
$Comp
L Connector_Generic:Conn_01x04 J6
U 1 1 645DFC8D
P 8675 4600
F 0 "J6" H 8755 4592 50  0000 L CNN
F 1 "Conn_01x04" H 8755 4501 50  0000 L CNN
F 2 "conway:PinHeader_1x04_P2.54mm_Vertical_Custom_Hand_Solder" H 8675 4600 50  0001 C CNN
F 3 "~" H 8675 4600 50  0001 C CNN
	1    8675 4600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 645E0450
P 8475 4825
F 0 "#PWR0105" H 8475 4675 50  0001 C CNN
F 1 "+5V" H 8490 4998 50  0000 C CNN
F 2 "" H 8475 4825 50  0001 C CNN
F 3 "" H 8475 4825 50  0001 C CNN
	1    8475 4825
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 645E1904
P 8475 4500
F 0 "#PWR0106" H 8475 4250 50  0001 C CNN
F 1 "GND" H 8480 4327 50  0000 C CNN
F 2 "" H 8475 4500 50  0001 C CNN
F 3 "" H 8475 4500 50  0001 C CNN
	1    8475 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	8475 4800 8475 4825
Wire Wire Line
	7450 5275 8075 5275
Wire Wire Line
	7450 5475 8300 5475
$Comp
L Device:R_Pack04 RN1
U 1 1 645D6994
P 4350 4300
F 0 "RN1" V 3933 4300 50  0000 C CNN
F 1 "R_Pack04" V 4024 4300 50  0000 C CNN
F 2 "conway:R_Array_Convex_4x0603_Custom_Hand_Solder" V 4625 4300 50  0001 C CNN
F 3 "~" H 4350 4300 50  0001 C CNN
	1    4350 4300
	0    1    1    0   
$EndComp
Connection ~ 4150 4200
Wire Wire Line
	4150 4200 4150 4100
Connection ~ 4150 4300
Wire Wire Line
	4150 4300 4150 4200
Connection ~ 4150 4400
Wire Wire Line
	4150 4400 4150 4300
Wire Wire Line
	4850 5125 5275 5125
Wire Wire Line
	4550 4400 4800 4400
Wire Wire Line
	4800 4400 4800 3700
Wire Wire Line
	4800 3700 5225 3700
Wire Wire Line
	4550 4300 4975 4300
Wire Wire Line
	4975 4300 4975 4075
Wire Wire Line
	4975 4075 5250 4075
Wire Wire Line
	4925 4200 4925 4425
Wire Wire Line
	4925 4425 5250 4425
Wire Wire Line
	4550 4100 4725 4100
Wire Wire Line
	4725 4100 4725 4775
Wire Wire Line
	4725 4775 5275 4775
Wire Wire Line
	4550 4200 4925 4200
Wire Wire Line
	5900 5125 5575 5125
Wire Wire Line
	6650 5475 6525 5475
Wire Wire Line
	8300 5475 8300 5700
Connection ~ 8300 5700
Wire Wire Line
	8300 5700 8300 5875
Wire Wire Line
	4850 5125 4850 5475
Wire Wire Line
	4850 5475 4550 5475
Wire Wire Line
	5900 5125 5900 5175
Wire Wire Line
	5900 5175 6650 5175
Wire Wire Line
	5600 5475 6125 5475
Wire Wire Line
	6125 5475 6125 5275
Wire Wire Line
	6125 5275 6650 5275
Wire Wire Line
	5600 5825 6275 5825
Wire Wire Line
	6275 5825 6275 5375
Wire Wire Line
	6275 5375 6650 5375
Wire Wire Line
	6525 5475 6525 6175
Wire Wire Line
	5600 6175 6525 6175
Wire Wire Line
	7450 4975 7900 4975
Wire Wire Line
	7900 4600 8475 4600
Wire Wire Line
	7900 4600 7900 4975
Wire Wire Line
	8075 4700 8475 4700
Wire Wire Line
	8075 4700 8075 5275
Wire Wire Line
	5300 6175 4800 6175
Wire Wire Line
	4150 5775 4150 6300
Connection ~ 4150 5775
Wire Wire Line
	4150 5675 4150 5775
Connection ~ 4150 5675
Wire Wire Line
	4150 5575 4150 5675
Connection ~ 4150 5575
Wire Wire Line
	4150 5475 4150 5575
Wire Wire Line
	4150 4400 4150 5475
Connection ~ 4150 5475
$Comp
L Device:R_Pack04 RN2
U 1 1 645D39DB
P 4350 5675
F 0 "RN2" V 3933 5675 50  0000 C CNN
F 1 "R_Pack04" V 4024 5675 50  0000 C CNN
F 2 "conway:R_Array_Convex_4x0603_Custom_Hand_Solder" V 4625 5675 50  0001 C CNN
F 3 "~" H 4350 5675 50  0001 C CNN
	1    4350 5675
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 5475 5025 5475
Wire Wire Line
	5300 5825 4900 5825
Wire Wire Line
	4800 6175 4800 5775
Wire Wire Line
	4800 5775 4550 5775
Wire Wire Line
	4900 5575 4550 5575
Wire Wire Line
	4900 5575 4900 5825
Wire Wire Line
	5025 5475 5025 5675
Wire Wire Line
	5025 5675 4550 5675
$Comp
L Connector_Generic:Conn_01x04 J1
U 1 1 646DE8AC
P 10225 1500
F 0 "J1" H 10075 1250 50  0000 L CNN
F 1 "Conn_01x04" H 10000 1175 50  0000 L CNN
F 2 "conway:PinHeader_1x04_P2.54mm_Vertical_Custom_Hand_Solder" H 10225 1500 50  0001 C CNN
F 3 "~" H 10225 1500 50  0001 C CNN
	1    10225 1500
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J7
U 1 1 646E0FFA
P 10225 2025
F 0 "J7" H 10050 1775 50  0000 L CNN
F 1 "Conn_01x04" H 10000 1700 50  0000 L CNN
F 2 "conway:PinHeader_1x04_P2.54mm_Vertical_Custom_Hand_Solder" H 10225 2025 50  0001 C CNN
F 3 "~" H 10225 2025 50  0001 C CNN
	1    10225 2025
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J8
U 1 1 646E706E
P 10225 2550
F 0 "J8" H 10075 2300 50  0000 L CNN
F 1 "Conn_01x04" H 10000 2225 50  0000 L CNN
F 2 "conway:PinHeader_1x04_P2.54mm_Vertical_Custom_Hand_Solder" H 10225 2550 50  0001 C CNN
F 3 "~" H 10225 2550 50  0001 C CNN
	1    10225 2550
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J9
U 1 1 646E7074
P 10225 3075
F 0 "J9" H 10050 2825 50  0000 L CNN
F 1 "Conn_01x04" H 10000 2750 50  0000 L CNN
F 2 "conway:PinHeader_1x04_P2.54mm_Vertical_Custom_Hand_Solder" H 10225 3075 50  0001 C CNN
F 3 "~" H 10225 3075 50  0001 C CNN
	1    10225 3075
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J10
U 1 1 646EC0E4
P 10225 3575
F 0 "J10" H 10075 3325 50  0000 L CNN
F 1 "Conn_01x04" H 10000 3250 50  0000 L CNN
F 2 "conway:PinHeader_1x04_P2.54mm_Vertical_Custom_Hand_Solder" H 10225 3575 50  0001 C CNN
F 3 "~" H 10225 3575 50  0001 C CNN
	1    10225 3575
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J11
U 1 1 646EC0EA
P 10225 4100
F 0 "J11" H 10050 3850 50  0000 L CNN
F 1 "Conn_01x04" H 10000 3775 50  0000 L CNN
F 2 "conway:PinHeader_1x04_P2.54mm_Vertical_Custom_Hand_Solder" H 10225 4100 50  0001 C CNN
F 3 "~" H 10225 4100 50  0001 C CNN
	1    10225 4100
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J12
U 1 1 646EC0F0
P 10225 4625
F 0 "J12" H 10075 4375 50  0000 L CNN
F 1 "Conn_01x04" H 10000 4300 50  0000 L CNN
F 2 "conway:PinHeader_1x04_P2.54mm_Vertical_Custom_Hand_Solder" H 10225 4625 50  0001 C CNN
F 3 "~" H 10225 4625 50  0001 C CNN
	1    10225 4625
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J13
U 1 1 646EC0F6
P 10225 5150
F 0 "J13" H 10050 4900 50  0000 L CNN
F 1 "Conn_01x04" H 10000 4825 50  0000 L CNN
F 2 "conway:PinHeader_1x04_P2.54mm_Vertical_Custom_Hand_Solder" H 10225 5150 50  0001 C CNN
F 3 "~" H 10225 5150 50  0001 C CNN
	1    10225 5150
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J14
U 1 1 646EEB55
P 10225 5675
F 0 "J14" H 10050 5425 50  0000 L CNN
F 1 "Conn_01x04" H 10000 5350 50  0000 L CNN
F 2 "conway:PinHeader_1x04_P2.54mm_Vertical_Custom_Hand_Solder" H 10225 5675 50  0001 C CNN
F 3 "~" H 10225 5675 50  0001 C CNN
	1    10225 5675
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10125 1700 10125 2225
Connection ~ 10125 2225
Wire Wire Line
	10125 2225 10125 2750
Connection ~ 10125 2750
Wire Wire Line
	10125 2750 10125 3275
Connection ~ 10125 3275
Wire Wire Line
	10125 3275 10125 3775
Connection ~ 10125 3775
Wire Wire Line
	10125 3775 10125 4300
Connection ~ 10125 4300
Wire Wire Line
	10125 4300 10125 4825
Connection ~ 10125 4825
Wire Wire Line
	10125 4825 10125 5350
Wire Wire Line
	10125 5875 10125 5350
Connection ~ 10125 5350
Wire Wire Line
	10225 5875 10225 5350
Connection ~ 10225 2225
Wire Wire Line
	10225 2225 10225 1700
Connection ~ 10225 2750
Wire Wire Line
	10225 2750 10225 2225
Connection ~ 10225 3275
Wire Wire Line
	10225 3275 10225 2750
Connection ~ 10225 3775
Wire Wire Line
	10225 3775 10225 3275
Connection ~ 10225 4300
Wire Wire Line
	10225 4300 10225 3775
Connection ~ 10225 4825
Wire Wire Line
	10225 4825 10225 4300
Connection ~ 10225 5350
Wire Wire Line
	10225 5350 10225 4825
Wire Wire Line
	10325 1700 10325 2225
Connection ~ 10325 2225
Wire Wire Line
	10325 2225 10325 2750
Connection ~ 10325 2750
Wire Wire Line
	10325 2750 10325 3275
Connection ~ 10325 3275
Wire Wire Line
	10325 3275 10325 3775
Connection ~ 10325 3775
Wire Wire Line
	10325 3775 10325 4300
Connection ~ 10325 4300
Wire Wire Line
	10325 4300 10325 4825
Connection ~ 10325 4825
Wire Wire Line
	10325 4825 10325 5350
Connection ~ 10325 5350
Wire Wire Line
	10325 5350 10325 5875
Wire Wire Line
	10425 5875 10425 5350
Connection ~ 10425 2225
Wire Wire Line
	10425 2225 10425 1700
Connection ~ 10425 2750
Wire Wire Line
	10425 2750 10425 2225
Connection ~ 10425 3275
Wire Wire Line
	10425 3275 10425 2750
Connection ~ 10425 3775
Wire Wire Line
	10425 3775 10425 3275
Connection ~ 10425 4300
Wire Wire Line
	10425 4300 10425 3775
Connection ~ 10425 4825
Wire Wire Line
	10425 4825 10425 4300
Connection ~ 10425 5350
Wire Wire Line
	10425 5350 10425 4825
$Comp
L MCU_Microchip_ATmega:ATmega328P-PU U2
U 1 1 64741153
P 1750 2425
F 0 "U2" H 2075 4175 50  0000 R CNN
F 1 "ATmega328P-PU" H 2625 4250 50  0000 R CNN
F 2 "conway:DIP-28_W7.62mm_Custom_HandSolder" H 1750 2425 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 1750 2425 50  0001 C CNN
	1    1750 2425
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 647548F0
P 1750 4075
F 0 "#PWR0107" H 1750 3825 50  0001 C CNN
F 1 "GND" H 1755 3902 50  0000 C CNN
F 2 "" H 1750 4075 50  0001 C CNN
F 3 "" H 1750 4075 50  0001 C CNN
	1    1750 4075
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J16
U 1 1 64756FA5
P 3650 4125
F 0 "J16" H 3730 4117 50  0000 L CNN
F 1 "Conn_01x04" H 3275 3700 50  0000 L CNN
F 2 "conway:PinHeader_1x04_P2.54mm_Vertical_Custom_Hand_Solder" H 3650 4125 50  0001 C CNN
F 3 "~" H 3650 4125 50  0001 C CNN
	1    3650 4125
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 925  1750 925 
Wire Wire Line
	1150 925  1150 1225
Connection ~ 1750 925 
Wire Wire Line
	1750 925  1150 925 
Wire Wire Line
	1150 1225 1150 4325
Connection ~ 1150 1225
$Comp
L Device:R R1
U 1 1 64777760
P 2675 2725
F 0 "R1" V 2468 2725 50  0000 C CNN
F 1 "10k" V 2559 2725 50  0000 C CNN
F 2 "conway:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal_Custom_HandSolder" V 2605 2725 50  0001 C CNN
F 3 "~" H 2675 2725 50  0001 C CNN
	1    2675 2725
	0    1    1    0   
$EndComp
Wire Wire Line
	2525 2725 2350 2725
$Comp
L power:+5V #PWR0109
U 1 1 6477C1AF
P 3000 2725
F 0 "#PWR0109" H 3000 2575 50  0001 C CNN
F 1 "+5V" H 3015 2898 50  0000 C CNN
F 2 "" H 3000 2725 50  0001 C CNN
F 3 "" H 3000 2725 50  0001 C CNN
	1    3000 2725
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 2725 2825 2725
NoConn ~ 2350 1825
NoConn ~ 2350 1925
Text GLabel 2600 1225 1    50   Input ~ 0
latch2
Text GLabel 2825 1525 1    50   Input ~ 0
data2
Text GLabel 2825 1625 3    50   Input ~ 0
clk2
$Comp
L Connector_Generic:Conn_01x01 J15
U 1 1 64793B57
P 3425 1525
F 0 "J15" H 3505 1567 50  0000 L CNN
F 1 "Conn_01x01" H 3505 1476 50  0000 L CNN
F 2 "conway:PinHeader_1x01_P2.54mm_Vertical_Custom_Left_Hand_Solder" H 3425 1525 50  0001 C CNN
F 3 "~" H 3425 1525 50  0001 C CNN
	1    3425 1525
	1    0    0    -1  
$EndComp
Wire Wire Line
	3225 1525 2350 1525
Wire Wire Line
	1750 3925 1750 4025
Wire Wire Line
	3450 4325 2600 4325
Wire Wire Line
	3450 4025 2600 4025
Connection ~ 1750 4025
Wire Wire Line
	1750 4025 1750 4075
Wire Wire Line
	2350 1225 3200 1225
Wire Wire Line
	3200 1225 3200 4125
Wire Wire Line
	3200 4125 3450 4125
Wire Wire Line
	2350 1625 3125 1625
Wire Wire Line
	3125 1625 3125 4225
Wire Wire Line
	3125 4225 3450 4225
NoConn ~ 2350 1325
NoConn ~ 2350 1425
NoConn ~ 2350 1725
NoConn ~ 2350 2125
NoConn ~ 2350 2225
NoConn ~ 2350 2325
NoConn ~ 2350 2425
NoConn ~ 2350 2525
NoConn ~ 2350 2625
NoConn ~ 2350 2925
NoConn ~ 2350 3025
NoConn ~ 2350 3125
NoConn ~ 2350 3225
NoConn ~ 2350 3325
NoConn ~ 2350 3425
NoConn ~ 2350 3525
NoConn ~ 2350 3625
$Comp
L Device:CP C1
U 1 1 64822386
P 2600 4175
F 0 "C1" H 2482 4129 50  0000 R CNN
F 1 "CP" H 2482 4220 50  0000 R CNN
F 2 "conway:CP_Radial_D5.0mm_P2.50mm_Custom_HandSolder" H 2638 4025 50  0001 C CNN
F 3 "~" H 2600 4175 50  0001 C CNN
	1    2600 4175
	-1   0    0    1   
$EndComp
Connection ~ 2600 4325
Wire Wire Line
	2600 4325 1150 4325
Connection ~ 2600 4025
Wire Wire Line
	2600 4025 1750 4025
$Comp
L power:+5V #PWR0108
U 1 1 6482A541
P 1150 925
F 0 "#PWR0108" H 1150 775 50  0001 C CNN
F 1 "+5V" H 1165 1098 50  0000 C CNN
F 2 "" H 1150 925 50  0001 C CNN
F 3 "" H 1150 925 50  0001 C CNN
	1    1150 925 
	1    0    0    -1  
$EndComp
Connection ~ 1150 925 
$EndSCHEMATC
