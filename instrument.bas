1 REM �Initialize�
2 KEY OFF:CLS
3 SCREEN 1:COLOR 1
10 LOCATE 23, 11:PRINT�C D E F G A B C QUIT�;
20 LOCATE 25, 11:PRINT�1 2 3 4 5 6 7 8  9�
395 REM Check for keys 1-9
400 N$=INKEY$: IF N$=�� THEN 400
410 IF N$<�1� OR N$>�9� THEN 400
420 ON VAL(N$) GOTO 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000
995 REM Handle all keys
1000 SOUND 131, 5
1001 GOTO 400
2000 SOUND 147, 5
2001 GOTO 400
3000 SOUND 165, 5
3001 GOTO 400
4000 SOUND 175, 5
4001 GOTO 400
5000 SOUND 196, 5
5001 GOTO 400
6000 SOUND 220, 5
6001 GOTO 400
7000 SOUND 247, 5
7001 GOTO 400
8000 SOUND 262, 5
8001 GOTO 400
8995 REM If 9 is pressed, leave
8999 CLS 
9000 PRINT �End of program�
9001 SCREEN 0
9005 END 
