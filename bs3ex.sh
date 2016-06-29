#!/bin/bash

#		Tue 28 June 2016  -  Copyright Brian Kilduff
#		This is a template script
#		Functions F1 and F2 can have a target directory and a destination folder set to create a backup
#		If further directories need to be backed up F2 can be copied and filled in, call it under F2
#		A date and time stamped folder is created in the destination folder in which a folder of $backnm is created
#		into this folder the target is copied, the function is confirmed as completed with a custom message
#		When the scipt ends a DONE MOTHERFUCKER message is printed to screen.
#		Name bs3ex.sh
#		Later that day  -  Support for modes eg Backup () to create lists of sources to backup from and to
#		Lists are replicable and interface options can be turned off with comments
#		If ad-hoc lists are being used then all items should use F1 () and never F2 ()
#		This will throw up a mkdir error for every item except the first which is fine...ish
#		It's fine.... it's just ugly..
#		Free to modify, distribute and use on condition that use is not charged for and modifications are freely available and free
#		to use. All derivative work should be free.
#		use \ as escape for paths with spaces eg /home/my\ folder/etc/etc/and\ me/

bkF()		{								#function bkF() begins
	echo "starting $backnm backup"						#prints starting "F1" backup to screen
		mkdir $destn							#creates folder at destination that ends in datestamp
			mkdir $destn/$backnm					#creates folder in datestamp folder called backupname
				cp -r $source $destn/$backnm			#copies from source to destination
					echo " "				#prints a blank line
						}				#function bkF() ends

bkF2()		{								#function bkF2() begins
	echo "starting $backnm backup"						#prints starting "F2 / F2 etc..." backup
		mkdir $destn/$backnm						#creates folder in datestamp folder called backupname
			cp -r $source $destn/$backnm				#copies from source to destination
				echo " "					#prints a blank line
						}				#function bkF2() ends

setdate()	{								#function setdate() begins
	datenow=$(date +%Y%m%d_%H%M%S)						#defines variable datenow as date and time in format ymd hms
		echo "datestamp is $datenow"					#prints datestamp is " current date" to screen
			echo ""							#prints a blank line
						}				#function setdate() ends

F1()		{								#function F1() begins
	backnm="F1"								#defines dest folder name in date folder
		source=/home/example/source/directory				#defines source folder
			destn=/home/example/destination/directory/$datenow	#defines destination folder with date folder appended
				bkF;						#calls bkF function
					echo "F1 Complete"			#after bkF() runs prints F1 complete to screen
						}				#function F1() ends

F2()		{								#function F2() begins
	backnm="F2"								#defines dest folder name in date folder
		source=/home/example/source/directory				#defines source folder
			destn=/home/example/destination/directory/$datenow	#defines destination folder with date folder appended
				bkF2;						#calls bkF2 function
					echo "F2 Complete"			#after bkF2() runs prints F2 complete to screen
						}				#function F2() ends

Backup()	{								#function Backup() begins
	setdate;								#calls setdate ()
		F1;								#calls F1 ()
			F2;							#calls F2 ()
				echo "DONE MOTHERFUCKER!"			#prints DONE MOTHERFUCKERS to screen
						}				#function Backup () ends

loopie()	{
Modes="Backup? exit?"								#List of available backup modes
	echo "which backup do you wish to run?"					#prompt for backup mode to use
		echo "$Modes"							#lists possible modes
			read mode						#reads users option
				$mode;						#calls that mode function
			echo "anything else? y/yes"				#Signals end of program
		read additional							#read user input and store as additional
	additional;
					}

additional()	{								#function additional () begins
if [ $additional = yes ]							#if user says yes restart loopie ()
	then loopie;
	elif [ $additional = y ]						#if yser says y restart loopie ()
	then loopie;
	else echo "ok, bye bye"							#otherwise, say goodbye
echo "Thanks for using Kilduff Backup tm"					
	echo "Amatuers in leading technology..."
		echo "or leaders in amatuer technology..."
			echo "either"
		echo "both..."
	exit									#otherwise finish loop
fi										#if loop closes
					}					#function additional () ends


loopie;										#start user interface by calling loopie

