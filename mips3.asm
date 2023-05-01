.data
welcome:.asciiz"********** WELCOME TO VENDOR STOP **********\n"
costd:.asciiz"PRODUCT            COST(Rs)\n\nCOKE                            30\nSPRITE                          25\nWATER BOTTLE          20\nMANGO DRINK             15\n"
costs:.asciiz"SNACKS             COST(Rs)\n\nLAYS                          15\nKURLEEZ                           15\nCHEETOS                15\nSLANTY                  15\n"
coins:.asciiz"ACCEPTED COINS AND CASH\n\nRs.5 COIN - (f)\nRs.10 COIN - (t)\nRs.20 CASH - (T)\nRs.100 CASH - (H)"
ex:.asciiz"RETURN - R\nEXIT - X"
coinprompt:.asciiz"\nINSERT THE COIN\n"
acctotal:.asciiz"\nTHE ACCUMULATED TOTAL IS "
makesel:.asciiz"\nCOKE\t\t-\tC\nSPRITE\t\t-\tS\nWATER BOTTLE\t-\tW\nMANGO DRINK\t-\tM\nLAYS\t\t-\tL\nKURLEEZ\t\t-\tK\nCHEETOS\t        -\       E\nSLANTY\t        -\       N\n\n"
unit:.asciiz"Rs."
coke:.asciiz"YOUR SELECTION IS COKE\n"
sprite:.asciiz"YOUR SELECTION IS SPRITE\n"
water:.asciiz"YOUR SELECTION IS WATER BOTTLE\n"
mango:.asciiz"YOUR SELECTION IS MANGO DRINK\n"
LAYS:.asciiz"YOUR SELECTION IS LAYS\n"
KURLEEZ:.asciiz"YOUR SELECTION IS KURLEEZ\n"
CHEETOS:.asciiz"YOUR SELECTION IS CHEETOS\n"
SLANTY:.asciiz"YOUR SELECTION IS SLANTY\n"
retamt:.asciiz"\nRETURNED AMOUNT IS "
nodrink:.asciiz"DRINK NOT IN STOCK"
nosnack:.asciiz"SNACK NOT IN STOCK"
change:.asciiz"\nYOUR CHANGE IS "
errorinput:.asciiz"INPUT ERROR"
low:.asciiz"LESS COINS"
thanks:.asciiz"THANKS FOR VISITING"
cokeval:.word 10
spriteval:.word 1
waterval:.word 10
mangoval:.word 10
LAYSval:.word 10
KURLEEZval:.word 1
CHEETOSval:.word 10
SLANTYval:.word 10
cokep:.word 30
spritep:.word 25
waterp:.word 20
mangop:.word 15
LAYSp:.word 30
KURLEEZp:.word 25
CHEETOSp:.word 20
SLANTYp:.word 15
five:.word 5
ten:.word 10
twenty:.word 20
hundred:.word 100
nl:.asciiz"\n"
.text
li $s6,0
lw $s0,cokep
lw $s1,spritep
lw $s2,waterp
lw $s3,mangop
lw $t8,cokep
lw $t7,spritep
lw $t6,waterp
lw $t5,mangop
li $v0,55
li $a1,4
la $a0,welcome
li $s6,0
lw $s0,LAYSp
lw $s1,KURLEEZp
lw $s2,CHEETOSp
lw $s3,SLANTYp
lw $t8,LAYSp
lw $t7,KURLEEZp
lw $t6,CHEETOSp
lw $t5,SLANTYp
li $v0,55
li $a1,4
la $a0,welcome
syscall
li $v0,55
li $a1,4
la $a0,costd
syscall
li $v0,55
li $a1,4
la $a0,costs
syscall
li $v0,55
li $a1,4
la $a0,coins
syscall
li $v0,55
li $a1,4
la $a0,ex
syscall

promptUser:    
	li $v0,4    
       	la $a0,coinprompt       
       	syscall  
        la $a0,nl  
       	syscall                
       	li $v0, 12                  
       	syscall                     
       	move $s4, $v0  
parseInput:
	li $t0,'f'
	beq $s4,$t0,userfive
	j userfivedone
userfive:
	li $v0,4
	la $a0,nl
	syscall
	lw $s5,five
	add $s6,$s6,$s5
	li $v0,32
	la $a0,1000
	syscall
	li $v0,4
	la $a0,acctotal
	syscall
	la $a0,unit
	syscall
	li $v0,1
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,nl
	syscall
	j parseInput_exit
userfivedone:
	li $t0,'t'
	beq $s4,$t0,userten
	j usertendone
userten:
	li $v0,4
	la $a0,nl
	syscall
	lw $s5,ten
	add $s6,$s6,$s5
	li $v0,32
	la $a0,1000
	syscall
	li $v0,4
	la $a0,acctotal
	syscall
	la $a0,unit
	syscall
	li $v0,1
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,nl
	syscall
	j parseInput_exit
usertendone:	
	li $t0,'T'
	beq $s4,$t0,usertwenty
	j usertwentydone
usertwenty:
	li $v0,4
	la $a0,nl
	syscall
	lw $s5,twenty
	add $s6,$s6,$s5
	li $v0,32
	la $a0,1000
	syscall
	li $v0,4
	la $a0,acctotal
	syscall
	la $a0,unit
	syscall
	li $v0,1
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,nl
	syscall
	j parseInput_exit
usertwentydone:	
	li $t0,'H'
	beq $s4,$t0,userhundred
	j userhundreddone
userhundred:
	li $v0,4
	la $a0,nl
	syscall
	lw $s5,hundred
	add $s6,$s6,$s5
	li $v0,32
	la $a0,1000
	syscall
	li $v0,4
	la $a0,acctotal
	syscall
	la $a0,unit
	syscall
	li $v0,1
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,nl
	syscall
	j parseInput_exit
userhundreddone:
	li $t0,'R'
	beq $s4,$t0,returnchange
	j returnchangedone
returnchange:
	li $v0,4
	la $a0,nl
	syscall
	li $v0,32
	la $a0,1000
	syscall
	li $v0,4
	la $a0,retamt
	syscall
	li $v0,4
	la $a0,unit
	syscall 
	li $v0,1
	move $a0,$s6
	syscall
	xor $s6,$s6,$s6
	li $v0,4
	la $a0,nl
	syscall
	j parseInput_exit
returnchange1:
	li $v0,4
	la $a0,nl
	syscall
	li $v0,32
	la $a0,1000
	syscall
	li $v0,4
	la $a0,retamt
	syscall
	li $v0,4
	la $a0,unit
	syscall 
	li $v0,1
	move $a0,$s6
	syscall
	xor $s6,$s6,$s6
	li $v0,4
	la $a0,nl
	syscall
	j end
returnchangedone:
	li $t0,'X'
	beq $s4,$t0,returnchange1
	li $v0,55
	li $a1,4
	la $a0,errorinput
	syscall
	j parseinputdone
parseInput_exit:
	li $s7,200
	bge $s6,$s7,continue
	bge $s6,$t5,continue
	j parseinputdone
	
	
	continue:
	li $v0,32
	la $a0,1000
	syscall
	li $v0,4
	la $a0,makesel	
	syscall
	li $v0,12
	syscall 
	move $t0,$v0
	li $t1,'C'
	beq $t0,$t1,cokeL
	j cokeLdone
cokeL:
	blt $s6,$t8,c
	lw $t3,cokeval
	beq $t3,$zero,outofcoke
	j outofcokedone
outofcoke:
	li $v0,55
	la $a1,4
	la $a0,nodrink
	syscall
	j continuedone
outofcokedone:
	sub $t3,$t3,1
	sw $t3,cokeval
	li $v0,55
	li $a1,4
	la $a0,coke
	syscall
	li $v0,4
	la $a0,nl
	syscall
	sub $s6,$s6,$s0
	li $v0,4
	la $a0,change
	syscall
	li $v0,4
	la $a0,unit
	syscall
	li $v0,1
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,nl
	syscall
	li $v0,32
	la $a0,1000
	syscall
	j continuedone
cokeLdone:
	li $t1,'S'
	beq $t0,$t1,spriteL
	j spriteLdone
spriteL:
	blt $s6,$t7,c
	lw $t3,spriteval
	beq $t3,$zero,outofsprite
	j outofspritedone
outofsprite:
	li $v0,55
	la $a1,4
	la $a0,nodrink
	syscall
	j continuedone
outofspritedone:
	sub $t3,$t3,1
	sw $t3,spriteval
	li $v0,55
	li $a1,4
	la $a0,sprite
	syscall
	li $v0,4
	la $a0,nl
	syscall
	sub $s6,$s6,$s1
	li $v1,4
	la $a0,change
	syscall
	li $v0,4
	la $a0,unit
	syscall
	li $v0,1
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,nl
	syscall
	li $v0,32
	la $a0,1000
	syscall
	j continuedone
spriteLdone:
	li $t1,'W'
	beq $t0,$t1,waterL
	j waterLdone
waterL:
	blt $s6,$t6,c
	lw $t3,waterval
	beq $t3,$zero,outofwater
	j outofwaterdone
outofwater:
	li $v0,55
	la $a1,4
	la $a0,nodrink
	syscall
	j continuedone
outofwaterdone:
	sub $t3,$t3,1
	sw $t3,waterval
	li $v0,55
	li $a1,4
	la $a0,water
	syscall
	li $v0,4
	la $a0,nl
	syscall
	sub $s6,$s6,$s2
	li $v0,4
	la $a0,change
	syscall
	li $v0,4
	la $a0,unit
	syscall
	li $v0,1
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,nl
	syscall
	li $v0,32
	la $a0,1000
	syscall
	j continuedone
waterLdone:
	li $t1,'M'
	beq $t0,$t1,mangoL
	j mangoLdone
mangoL:
	blt $s6,$t5,c
	lw $t3,mangoval
	beq $t3,$zero,outofmango
	j outofmangodone
outofmango:
	li $v0,55
	la $a1,4
	la $a0,nodrink
	syscall
	j continuedone
outofmangodone:
	sub $t3,$t3,1
	sw $t3,mangoval
	li $v0,55
	li $a1,4
	la $a0,mango
	syscall
	li $v0,4
	la $a0,nl
	syscall
	sub $s6,$s6,$s3
	li $v0,4
	la $a0,change
	syscall
	li $v0,4
	la $a0,unit
	syscall
	li $v0,1
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,nl
	syscall
	li $v0,32
	la $a0,1000
	syscall
	j continuedone	
mangoLdone:
	li $t1,'X'
	beq $t0,$t1,returnchange1
	li $t1,'R'
	beq $t0,$t1,givechange
	j givechangedone
	

	li $v0,32
	la $a0,1000
	syscall
	li $v0,4
	la $a0,makesel	
	syscall
	li $v0,12
	syscall 
	move $t0,$v0
	li $t1,'L'
	beq $t0,$t1,LAYSL
	j LAYSLdone
LAYSL:
	blt $s6,$t8,c
	lw $t3,LAYSval
	beq $t3,$zero,outofLAYS
	j outofLAYSdone
outofLAYS:
	li $v0,55
	la $a1,4
	la $a0,nosnack
	syscall
	j continuedone
outofLAYSdone:
	sub $t3,$t3,1
	sw $t3,LAYSval
	li $v0,55
	li $a1,4
	la $a0,LAYS
	syscall
	li $v0,4
	la $a0,nl
	syscall
	sub $s6,$s6,$s0
	li $v0,4
	la $a0,change
	syscall
	li $v0,4
	la $a0,unit
	syscall
	li $v0,1
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,nl
	syscall
	li $v0,32
	la $a0,1000
	syscall
	j continuedone
LAYSLdone:
	li $t1,'K'
	beq $t0,$t1,KURLEEZL
	j KURLEEZLdone
KURLEEZL:
	blt $s6,$t7,c
	lw $t3,KURLEEZval
	beq $t3,$zero,outofKURLEEZ
	j outofKURLEEZdone
outofKURLEEZ:
	li $v0,55
	la $a1,4
	la $a0,nosnack
	syscall
	j continuedone
outofKURLEEZdone:
	sub $t3,$t3,1
	sw $t3,KURLEEZval
	li $v0,55
	li $a1,4
	la $a0,KURLEEZ
	syscall
	li $v0,4
	la $a0,nl
	syscall
	sub $s6,$s6,$s1
	li $v1,4
	la $a0,change
	syscall
	li $v0,4
	la $a0,unit
	syscall
	li $v0,1
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,nl
	syscall
	li $v0,32
	la $a0,1000
	syscall
	j continuedone
KURLEEZLdone:
	li $t1,'E'
	beq $t0,$t1,CHEETOSL
	j CHEETOSLdone
CHEETOSL:
	blt $s6,$t6,c
	lw $t3,CHEETOSval
	beq $t3,$zero,outofCHEETOS
	j outofCHEETOSdone
outofCHEETOS:
	li $v0,55
	la $a1,4
	la $a0,nosnack
	syscall
	j continuedone
outofCHEETOSdone:
	sub $t3,$t3,1
	sw $t3,CHEETOSval
	li $v0,55
	li $a1,4
	la $a0,CHEETOS
	syscall
	li $v0,4
	la $a0,nl
	syscall
	sub $s6,$s6,$s2
	li $v0,4
	la $a0,change
	syscall
	li $v0,4
	la $a0,unit
	syscall
	li $v0,1
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,nl
	syscall
	li $v0,32
	la $a0,1000
	syscall
	j continuedone
CHEETOSLdone:
	li $t1,'N'
	beq $t0,$t1,SLANTYL
	j SLANTYLdone
SLANTYL:
	blt $s6,$t5,c
	lw $t3,SLANTYval
	beq $t3,$zero,outofSLANTY
	j outofSLANTYdone
outofSLANTY:
	li $v0,55
	la $a1,4
	la $a0,nosnack
	syscall
	j continuedone
outofSLANTYdone:
	sub $t3,$t3,1
	sw $t3,SLANTYval
	li $v0,55
	li $a1,4
	la $a0,SLANTY
	syscall
	li $v0,4
	la $a0,nl
	syscall
	sub $s6,$s6,$s3
	li $v0,4
	la $a0,change
	syscall
	li $v0,4
	la $a0,unit
	syscall
	li $v0,1
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,nl
	syscall
	li $v0,32
	la $a0,1000
	syscall
	j continuedone	
SLANTYLdone:
	li $t1,'X'
	beq $t0,$t1,returnchange1
	li $t1,'R'
	beq $t0,$t1,givechange
	j givechangedone
	
	givechange:
	li $v0,4
	la $a0,nl
	syscall
	la $a0,retamt
	syscall
	li $v0,4
	la $a0,unit
	syscall
	li $v0,1
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,nl
	syscall
	xor $s6,$s6,$s6
	j continuedone
givechangedone:
	li $v0,55
	la $a1,4
	la $a0,errorinput
	syscall
	j continue
c:
	li $v0,55
	li $a1,4
	la $a0,low
	syscall
	j promptUser
continuedone:
	blt $s6,$t5,promptUser
	bge $s6,$t5,continue
parseinputdone:
	j promptUser
	ori $v0,$0,10
	syscall
end:
	li $v0,55
	la $a0,thanks
	li $a1,4
	syscall
	li $v0,10
	syscall


