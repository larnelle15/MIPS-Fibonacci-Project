.data
prompt: .asciiz "Enter an integer (N >= 25): "  
error: .asciiz "Illegal Number!\n"            
fibo_msg: .asciiz "Fibonacci Sequence:\n"     
space: .asciiz " "                          


.text
.globl main


main:
    
    li $v0, 4           
    la $a0, prompt        
    syscall
