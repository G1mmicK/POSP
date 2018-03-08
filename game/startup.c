/*
 * 	startup.c
 *
 */
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

#include "types.h"
#include "ports.h"
#include "graphicdisplay.h"
#include "ascii.h"
#include "keypad.h"
#include "object.h"
#include "level.h"
#include "AI.h"
#include "delay.h"

//Set appropriate FPS
#ifdef SIMULATOR
	#define TARGET_FPS 1000
#else
	#define TARGET_FPS 25
#endif

#define RAND_MAX 32767

static unsigned int next = 1;
int r = 0;

void startup(void);
static void init_app(void);
static void startingMessageAscii(void);
static void printScore(POBJECT p1, POBJECT p2);
static void updatePlayer1(POBJECT p1);
static void updatePlayer2(POBJECT p2);
unsigned int rand(void);
void srand(unsigned int seed);

int main(int argc, char **argv) {
	char nLevel;
	int prevScores;
	int gameoverCountdown = TARGET_FPS*0.5;	// delay after game is over
#ifdef SIMULATOR
	gameoverCountdown = 1;
#endif
	POBJECT p1 = &player1Object;
	POBJECT p2 = &player2Object;
	POBJECT AI1 = &AI1Object;
	init_app();
	init_graphic();
	init_ascii();
	clearBuffers();
#ifndef SIMULATOR
	graphic_clear_screen();
#endif
	
	clearBuffer();
	drawLevelSelectScreen();
	swapBuffers();
	ascii_write("SELECT     1, 2,", "LEVEL      3, 4");
	bool levelSelected = false;
	while(!levelSelected) {		// Level selection
		nLevel = keyb();
		switch(nLevel) {
			case 1:		chooseLevel(1);
						levelSelected = true;
						break;
			case 2:		chooseLevel(2);
						levelSelected = true;
						break;
			case 3:		chooseLevel(3);
						levelSelected = true;
						break;
			case 4:		chooseLevel(4);
						levelSelected = true;
						break;
		}
		r++;
	}

	srand(r); 					// Random seed based on time spent in level selection
#ifndef SIMULATOR
	startingMessageAscii();		// Countdown to start the game
#endif
	/* Load the level */
	clearBuffer();
	drawLevel();
	swapBuffers();
	
	chooseDot(rand());			// Choose random first dot location
	printScore(p1, p2);			// Print 0 - 0 starting scoreboard
	bool gameover = false;
	/*---------------------The game loop---------------------*/
	while(!gameover) {
		prevScores=p1->score+p2->score;
	
		clearBuffer();
		drawLevel();
		AI1->draw(AI1);
		p2->draw(p2);
		p1->move(p1);
		
		clearBuffer();
		drawLevel();
		AI1->draw(AI1);
		p1->draw(p1);
		p2->move(p2);
		
		clearBuffer();
		drawLevel();
		p1->draw(p1);
		p2->draw(p2);
		AI1->move(AI1);
		AI1->draw(AI1);
		drawDot();
		swapBuffers();
		
		/* User input */
		updatePlayer1(p1);
		updatePlayer2(p2);
		
		/* AI input */
		if (AI1->dirx == 0 && AI1->diry == 0)
			chooseAIDirection(AI1, p1, p2);
		
		/* Print score if it changed */
		if(prevScores != p1->score+p2->score)
			printScore(p1, p2);
		
		if (player1Eaten || player2Eaten || p1->score >= 20 || p2->score >= 20) {
			if (!gameoverCountdown--)
				gameover = true;
		}
		
		if (keyb1_2() == 5 && keyb3_4() == 6)	// force gameover by pressing 5 and 6 at the same time
			gameover = true;
		
		delay_milli(1000/TARGET_FPS);
	}
	/*-------------------------------------------------------*/
	
	ascii_write("     GAME OVER     ", "");
	if ( (player2Eaten || p1->score >= 20) && (player1Eaten || p2->score >= 20) ) {
		ascii_write("", "        DRAW        ");
	} else if (player2Eaten || p1->score >= 20) {
		ascii_write("", "<-- PLAYER 1 WINS    ");
	} else if (player1Eaten || p2->score >= 20) {
		ascii_write("", "   PLAYER 2 WINS --> ");
	} else {
		ascii_write("", "      -ERROR-      ");
	}
	
	delay_milli(1000);
	return 0;
}


unsigned int rand(void) {
	next = next * 1103515245 + 12345;
	return (unsigned int)(next/65536) % 32768;	
}	
void srand(unsigned int seed) {
	next = seed;
}

static void updatePlayer1(POBJECT p1) {
	static int p1NextDirx = 0;						// Allows for buffering the next movecommand while moving
	static int p1NextDiry = 0;
	switch( keyb1_2() ) { // Read left half of keypad 
		case 0:		p1NextDirx=p1->maxSpeed;		// right
					p1NextDiry=0;
					break;
		case 14:	p1NextDirx=-(p1->maxSpeed);		// left
					p1NextDiry=0;
					break;
		case 1:		p1NextDirx=0;					// up
					p1NextDiry=-(p1->maxSpeed);
					break;
		case 4:		p1NextDirx=0;					// down
					p1NextDiry=p1->maxSpeed;
					break;
	}
	if (p1->dirx == 0 && p1->diry == 0) {			// Change direction of p1 after reaching a stop
		p1->set_speed(p1, p1NextDirx, p1NextDiry);
		p1NextDirx = 0;
		p1NextDiry = 0;
	}
}

static void updatePlayer2(POBJECT p2) {
	static int p2NextDirx = 0;						// Allows for buffering the next movecommand while moving
	static int p2NextDiry = 0;
	switch( keyb3_4() ) { // Read right half of keypad
		case 13:	p2NextDirx=p2->maxSpeed;		// right
					p2NextDiry=0;
					break;
		case 15:	p2NextDirx=-(p2->maxSpeed);		// left
					p2NextDiry=0;
					break;
		case 10:	p2NextDirx=0;					// up
					p2NextDiry=-(p2->maxSpeed);
					break;
		case 11:	p2NextDirx=0;					// down
					p2NextDiry=p2->maxSpeed;
					break;
	}
	if (p2->dirx == 0 && p2->diry == 0) {			// Change direction of p2 after reaching a stop
		p2->set_speed(p2, p2NextDirx, p2NextDiry);
		p2NextDirx = 0;
		p2NextDiry = 0;
	}
}

static void printScore(POBJECT p1, POBJECT p2) {
	char scoreString[] = "  P1     -     P2";
	ascii_clear();
	
	if(p1->score < 10) {
		scoreString[7] = p1->score+48;
	} else if (10 <= p1->score && p1->score < 20) {
		scoreString[6] = 1+48;
		scoreString[7] = p1->score-10+48;
	} else if (p1->score == 20) {
		scoreString[6] = 2+48;
		scoreString[7] = 0+48;
	}
	
	if(p2->score < 10) {
		scoreString[11] = p2->score+48;
	} else if (10 <= p2->score && p2->score < 20) {
		scoreString[11] = 1+48;
		scoreString[12] = p2->score-10+48;
	} else if (p2->score == 20) {
		scoreString[11] = 2+48;
		scoreString[12] = 0+48;
	}
	
	ascii_write(scoreString, "");
}

static void startingMessageAscii(void) {
	ascii_clear();
	ascii_write("   STARTING IN...", "");
	delay_milli(500);
	ascii_clear();
	ascii_write("          3", "");
	delay_milli(400);
	ascii_clear();
	ascii_write("          2", "");
	delay_milli(400);
	ascii_clear();
	ascii_write("          1", "");
	delay_milli(400);
	ascii_clear();
	ascii_write("         GO", "");
	delay_milli(150);
}

static void init_app(void) {
	#ifdef USBDM
		//*((unsigned long *) 0x40023830) = 0x18;
	#endif
	
	/*-------display PE0-15------*/
	GPIO_E.moder = 0x55555555;
	
	/*-------keypad PD8-15------*/
	// PD12-15 = output, PD8-11 = input
	GPIO_D.moder = 0x55005555;
	
	// PD12-15 = push-pull
	GPIO_D.otyper &= ~0xFF00;
	GPIO_D.otyper |= 0x0F00;
	
	// PD8-11 = pull-down
	GPIO_D.pupdr &= ~0xFFFF0000;
	GPIO_D.pupdr |= 0x00AA0000;
}

void startup(void) {
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}