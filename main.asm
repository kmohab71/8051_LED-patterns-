		switch_right BIT p3.5
		switch_left BIT p3.7
		switch_auto BIT p3.6
        mov p2,#000H
		mov p3,#0ffH
start:	mov a,#0feH
		mov p2,a
right:	JNB switch_right,left
		mov A,p2
		RR A
		mov p2,A
left:	JNB switch_left,auto
		mov A,p2
		RL A
		mov p2,A
		acall	delay
auto:	JNB switch_auto,right
		mov A,#0feH
		mov p2,A
		acall	delay
		mov B,8H
r_Loop:	RR	A
		mov p2,A
		acall	delay
		djnz B,r_loop
		mov B,#8H
l_Loop:	Rl	A
		mov p2,A
		acall	delay
		djnz B,l_loop		
seq:	mov r3,#0f7H
		mov r2,#0efH
loop1:	mov	a,r3
		rl	a
		mov r3,a
		mov	a,r2
		rr	a	
		mov r2,a
		orl a,r3
		mov p2,a
		acall	delay
		JB switch_auto,start	
		jmp loop1
delay:	mov r5,#7
Dloop:	mov r6,#255
Dloop2:	mov r7,#255
Dloop3:	djnz r7,Dloop3
		djnz r6,Dloop2
		djnz r5,Dloop
		ret
		
		End