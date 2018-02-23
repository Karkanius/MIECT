	.data
	.eqv sv,4
	.text
	.globl main
main:	ori $t0,$0,0x862A5C1B	# Rsrc	($t0)
	ori $t1,$0,sv		# Imm	($t1)
#---------------------------------------------
	ori $a0,$0,10	# MUDANÇA
	ori $v0,$0,11	#   DE
	syscall		#  LINHA
#---------------------------------------------
	# SHIFT LEFT LOGICAL
	sll $t2,$t0,sv
	or $a0,$0,$t2
	ori $v0,$0,34
	syscall
#---------------------------------------------
	ori $a0,$0,10	# MUDANÇA
	ori $v0,$0,11	#   DE
	syscall		#  LINHA
#---------------------------------------------
	# SHIFT RIGHT LOGICAL
	srl $t3,$t0,sv
	or $a0,$0,$t3
	ori $v0,$0,34
	syscall
#---------------------------------------------
	ori $a0,$0,10	# MUDANÇA
	ori $v0,$0,11	#   DE
	syscall		#  LINHA
#---------------------------------------------
	# SHIFT RIGHT ARITHMETIC
	sra $t4,$t0,sv
	or $a0,$0,$t4
	ori $v0,$0,34
	syscall
#---------------------------------------------
	jr $ra		# fim do programa 
