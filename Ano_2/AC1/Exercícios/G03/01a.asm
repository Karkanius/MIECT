# Mapa de registos:
# $t0 – soma
# $t1 – value
# $t2 - i
	.data
str1:	.asciiz "Introduza um número: "
str2:	.asciiz "Valor ignorado\n"
str3:	.asciiz "A soma dos positivos é: "
	.eqv print_int, 1
	.eqv print_string,4
	.eqv read_int,5
	.text
	.globl main
main:	li $t0,0		# soma = 0;
	li $t2,0		# i = 0;
	
#FOR CYCLE - BEGIN	
	
for:	bge $t2,5,endfor	# while(i < 5) {
	la $a0,str1
	li $v0,print_string	# print_string("Introduza um número: ");
	syscall
	li $v0,read_int		# value=read_int();
	syscall
	or $t1,$0,$v0
	ble $t1,$0,else		# if(value > 0)
	add $t0,$t0,$t1		# soma += value;
	j endif			#

else:	la $a0,str2
	li $v0,print_string	# else
	syscall			# print_string("Valor ignorado\n");
	
endif:	addi $t2,$t2,1		# i++;
	j for			# }
	
#FOR CYCLE - END
	
endfor:	la $a0,str3		# print_string("...");
	li $v0,print_string
	syscall
	or $a0,$0,$t0
	li $v0,print_int	# print_int(soma);
	syscall
	jr $ra