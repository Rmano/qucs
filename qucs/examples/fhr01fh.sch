<Qucs Schematic 0.0.3>
<Properties>
  <View=-40,-63,790,653,1,0,140>
  <Grid=10,10,1>
  <DataSet=fhr01fh.dat>
  <DataDisplay=fhr01fh.dpl>
  <OpenDisplay=1>
</Properties>
<Components>
  <C C1 1 190 160 17 -26 0 1 "280 fF" 1>
  <R R1 1 190 220 15 -26 0 1 "2.5" 1 "26.85" 0 "european" 0>
  <C C2 1 450 160 17 -26 0 1 "67 fF" 1>
  <R R3 1 290 280 15 -26 0 1 "0.5 Ohm" 1 "26.85" 0 "european" 0>
  <C C3 1 320 70 -26 17 0 2 "42 fF" 1>
  <C C8 1 320 -10 -26 17 0 0 "7 fF" 1>
  <L L3 1 290 360 10 -26 0 1 "72 pH" 1>
  <R R5 1 160 70 -26 15 0 0 "0.5" 1 "26.85" 0 "european" 0>
  <R R4 1 480 70 -26 15 0 0 "2.2" 1 "26.85" 0 "european" 0>
  <C C6 1 540 360 17 -26 0 1 "230 fF" 1>
  <C C7 1 640 360 17 -26 0 1 "0.1 pF" 1>
  <L L2 1 590 70 -26 10 0 0 "340 pH" 1>
  <C C5 1 100 360 17 -26 0 1 "150 fF" 1>
  <C C4 1 0 360 17 -26 0 1 "110 fF" 1>
  <L L1 1 50 70 -26 10 0 0 "360 pH" 1>
  <VCCS SRC1 1 300 160 -26 34 0 0 "57 mS" 1 "3 ps" 1>
  <GND * 1 290 440 0 0 0 0>
  <R R2 1 350 160 15 -26 0 1 "400" 1 "5240" 1 "european" 0>
  <.SP SP1 1 130 470 -50 35 0 0 "lin" 1 "1 GHz" 1 "23 GHz" 1 "150" 1 "yes" 1 "1" 1 "2" 1>
  <Pac P1 1 20 440 -26 18 1 2 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0>
  <Pac P2 1 650 440 -26 18 1 0 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0>
  <Eqn Eqn1 1 610 530 -19 13 0 0 "Ropt=real(rtoz(Sopt))" 1 "Xopt=imag(rtoz(Sopt))" 1 "Tmin=290*(Fmin-1)" 1 "yes" 0>
</Components>
<Wires>
  <190 130 270 130 "" 0 0 0>
  <190 190 270 190 "" 0 0 0>
  <190 250 290 250 "" 0 0 0>
  <450 190 450 250 "" 0 0 0>
  <290 250 450 250 "" 0 0 0>
  <350 70 450 70 "" 0 0 0>
  <450 70 450 130 "" 0 0 0>
  <190 70 290 70 "" 0 0 0>
  <190 70 190 130 "" 0 0 0>
  <290 310 290 330 "" 0 0 0>
  <540 390 640 390 "" 0 0 0>
  <290 390 540 390 "" 0 0 0>
  <350 -10 640 -10 "" 0 0 0>
  <540 70 540 330 "" 0 0 0>
  <510 70 540 70 "" 0 0 0>
  <0 390 100 390 "" 0 0 0>
  <100 390 290 390 "" 0 0 0>
  <100 70 100 330 "" 0 0 0>
  <100 70 130 70 "" 0 0 0>
  <0 70 0 330 "" 0 0 0>
  <0 70 20 70 "" 0 0 0>
  <80 70 100 70 "" 0 0 0>
  <540 70 560 70 "" 0 0 0>
  <640 -10 640 70 "" 0 0 0>
  <640 70 640 330 "" 0 0 0>
  <620 70 640 70 "" 0 0 0>
  <290 390 290 440 "" 0 0 0>
  <-30 70 0 70 "" 0 0 0>
  <640 70 720 70 "" 0 0 0>
  <0 -10 290 -10 "" 0 0 0>
  <0 -10 0 70 "" 0 0 0>
  <330 130 350 130 "" 0 0 0>
  <330 190 350 190 "" 0 0 0>
  <350 190 450 190 "" 0 0 0>
  <350 130 450 130 "" 0 0 0>
  <-30 440 -10 440 "" 0 0 0>
  <-30 70 -30 440 "" 0 0 0>
  <50 440 290 440 "" 0 0 0>
  <680 440 720 440 "" 0 0 0>
  <720 70 720 440 "" 0 0 0>
  <290 440 620 440 "" 0 0 0>
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Rectangle 120 40 400 270 #000000 0 2 #c0c0c0 1 0>
  <Text 430 290 14 #000000 0 "intrinsic FET  ">
  <Text 410 370 14 #ff0000 0 "source ">
  <Text -20 110 14 #ff0000 90 "gate ">
  <Text 640 110 14 #ff0000 90 "drain ">
  <Text 210 480 12 #000000 0 "small-signal model of Fujitsu HEMT FHR01FH (2V, 10mA) \ntaken from:  \nPospieszalski, "Modeling of Noise Parameters of MESFET's and \nMODFET's and their frequency and temperature dependence", \nIEEE Trans. Microwave Theory and Techniques, Sept. 1989 ">
</Paintings>
