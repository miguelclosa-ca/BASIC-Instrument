# Instrument, a BASIC music program written for the IBM PCjr


# Background
* In the early hours of July 3rd, 2024, I thought about taking a break from the projects I currently have and instead sought to find out if I still remembered BASIC.
* Instead of going to VS Code and creating a Visual Basic file, I thought, "maybe let's create a program in IBM BASIC using my IBM PCjr in the basement"
* I remembered the PCjr had some sound and graphics capabilities, so maybe a musical instrument program would be cool?

# Analysis
Okay, so this program seemed simple enough. All we'll need is to:
1. Keep the user in a loop until a button is pressed
2. Use one row of the keyboard (1-9) as the buttons which are valid inputs
3. For keys (1-8), play a sound through the monitor's speakers
4. For key 9, exit the program

# Design
In my head, I thought that if I were to code this on Java, I would accomplish this by doing the following:
```java
public static void main(String[] args){
        Scanner s = new Scanner(System.in);
        int opt;
        while (true){
            opt = s.nextInt();
            if (opt == 1){
// Assume System.out.println() plays some sound
                System.out.println("C");
            }else if (opt == 2){
                System.out.println("D");
// And keep going until 8
            } else if (opt == 9){
// Exit program
              break;
        }
}
```
All we'll need to do now is move this into BASIC. Or so I thought. 

# Roadblocks
1. I forgot just about all of the BASIC I had
* Besides GOTO, SCREEN, and other commands that handled different parts of the computer- tl;dr I only had a basic knowledge of BASIC at this point.
* To get past this roadblock, I consulted "Hands-on BASIC for the IBM PCjr", a book I got with the sale of my computer 10 years ago.
* In this book, there contained a quick reference section in the back which contained some useful commands, such as the INKEY$ command.
![image](https://github.com/miguelclosa-ca/BASIC-Instrument/assets/60299649/3eaa3cec-9132-47a8-8ae6-04924318df62)
* Additionally, there also contained a table of all the frequencies the SOUND command used. Neat!
![image](https://github.com/miguelclosa-ca/BASIC-Instrument/assets/60299649/6a9237c7-e32c-46a6-85f8-23a498d32158)

2. The batteries in my PCjr's keyboard were died and leaked
* When the time came to try the program out on physical hardware, I made the big mistake of leaving batteries in something that was not going to be used for quite some time, and discovered some very nasty batteries.
* After a quick removal and wipe with alcohol, I thankfully observed no rust and continued on with adding new batteries
* ***for the sake of preservation, I remembered to remove the batteries from the keyboard after my physical hardware test.***

# Implementation
The following section will be a run-down of the code I created.
```
1 REM “Initialize”
2 KEY OFF:CLS
3 SCREEN 1:COLOR 1
10 LOCATE 23, 11:PRINT”C D E F G A B C QUIT”;
20 LOCATE 25, 11:PRINT”1 2 3 4 5 6 7 8  9”
```
In this section:
* I cleared the key from the screen (shown below), and cleared the screen of all text.
![image](https://github.com/miguelclosa-ca/BASIC-Instrument/assets/60299649/f02b2fa9-2bc8-4c76-a3fd-5b9f125744c2)
* Next, I changed the screen colour to 1, which corresponds to blue.
* After, I used the LOCATE command to move two strings of text towards the bottom and centre of the screen (shown below).
![image](https://github.com/miguelclosa-ca/BASIC-Instrument/assets/60299649/fe02745e-974c-4613-aaf1-f95bcd69b8f9)
* (any REM commands correspond to REMARK, like commenting with # on Python or // with Java).

```
395 REM Check for keys 1-9
400 N$=INKEY$: IF N$=”” THEN 400
410 IF N$<”1” OR N$>”9” THEN 400
420 ON VAL(N$) GOTO 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000
```
In this section:
* I defined a value N$ to read from the keyboard buffer using INKEY$.
* The program will only accept keystrokes from 1-9 on the keyboard.
```
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
```
In this section:
* Once a valid keystroke has been heard, the computer will play a sound using the SOUND command corresponding to a key in the C major scale in the 1st octave for 5 clock ticks.
```
8995 REM If 9 is pressed, leave
8999 CLS 
9000 PRINT “End of program”
9001 SCREEN 0
9005 END
```
In this section:
* This handles if 9 is pressed on the keyboard.
* If so, clear the screen, and return the user back to BASIC.



# Media

### The program running on pcjs.org, an emulator for several IBM machines
![image](https://github.com/miguelclosa-ca/BASIC-Instrument/assets/60299649/a8c6247c-99ec-4a7d-b388-939b81a386ae)


### The program running on my IBM PCjr
![image](https://github.com/miguelclosa-ca/BASIC-Instrument/assets/60299649/7d70b7b7-d8b7-4c4e-81ac-9d68b177f524)
