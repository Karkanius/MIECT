# Mapa de registos
# res: $v0
# s: $a0
# *s: $t0
# digit: $t1
# Sub-rotina terminal: n�o devem ser usados registos $sx
atoi:	li $v0,0		# res = 0;
while:	lb $t0,...		# while(*s >= ...)
	blt $t0,'0',endwhl	#
	bgt $t0,'9',endwhl	# {
	sub $t1,$t0,'0'		# digit = *s � '0'
	addiu $a0,$a0,1		# s++;
	mul $v0,$v0,10		# res = 10 * res;
	add $v0,$v0,$t1		# res = 10 * res + digit;
endwhl:				# }
	jr $ra			# termina sub-rotina