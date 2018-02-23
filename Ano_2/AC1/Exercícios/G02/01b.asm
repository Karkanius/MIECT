	.data
	.text
	.globl main
main:	# leituras
	ori $v0,$0,5
	syscall		# chamada ao syscall "read_int()"
	or $t0,$0,$v0	# $t0 = $v0 = valor lido do teclado (valor de x pretendido)
	ori $v0,$0,5
	syscall		# chamada ao syscall "read_int()"
	or $t1,$0,$v0	# $t0 = $v0 = valor lido do teclado (valor de y pretendido)
#---------------------------------------------
	ori $a0,$0,10	# MUDANÇA
	ori $v0,$0,11	#   DE
	syscall		#  LINHA
#---------------------------------------------
	# AND
	and $t2,$t0,$t1
	or $a0,$0,$t2
	ori $v0,$0,1
	syscall
#---------------------------------------------
	ori $a0,$0,10	# MUDANÇA
	ori $v0,$0,11	#   DE
	syscall		#  LINHA
#---------------------------------------------
	# OR
	or $t3,$t0,$t1
	or $a0,$0,$t3
	ori $v0,$0,1
	syscall
#---------------------------------------------
	ori $a0,$0,10	# MUDANÇA
	ori $v0,$0,11	#   DE
	syscall		#  LINHA
#---------------------------------------------
	# NOR
	nor $t4,$t0,$t1
	or $a0,$0,$t4
	ori $v0,$0,1
	syscall
#---------------------------------------------
	ori $a0,$0,10	# MUDANÇA
	ori $v0,$0,11	#   DE
	syscall		#  LINHA
#---------------------------------------------
	# XOR
	xor $t5,$t0,$t1
	or $a0,$0,$t5
	ori $v0,$0,1
	syscall
#---------------------------------------------
	jr $ra		# fim do programa 
