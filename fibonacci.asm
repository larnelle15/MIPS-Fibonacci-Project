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


read_input:
    
    li $v0, 5              
    syscall
    move $t0, $v0

    blt $t0, 25, invalid 
    blez $t0, invalid    
    j valid_input   


invalid:
    
    li $v0, 4        
    la $a0, error      
    syscall
    j main 


valid_input:
   
    li $t1, 0           
    li $t2, 1           
    move $t3, $t0       
    li $t4, 1  


    li $v0, 4            
    la $a0, fibo_msg    
    syscall


fibonacci_loop:
    
    move $a0, $t1       
    li $v0, 1           
    syscall


    li $v0, 4            
    la $a0, space      
    syscall


    add $t5, $t1, $t2   
    move $t1, $t2         
    move $t2, $t5 


    addi $t4, $t4, 1   
    blt $t4, $t3, fibonacci_loop # Loop until counter == N





