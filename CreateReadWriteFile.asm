.model small
.stack 50
.data
    
    ;**********************
    ;* VARIABLES
    ;**********************   
    msg1 db 'Nhap chuoi: $'
    msg2 db 10, 13, 'Ghi file$'  
    msg3 db 10, 13, 'Dong file$'     
    msg4 db 10, 13, 'Mo file$'
    msg5 db 10, 13, 'Doc file$'
    str db 100,?,101 dup('$')
    newline db 10, 13, '$' 
    filename db 'Teststr.txt', 0
    handle dw ?
    buffer dw ?
    
    ;**********************
    ;* MACROS
    ;**********************
    print macro str
        lea dx, str
        mov ah, 09h
        int 21h
    endm
    
    
    scan macro str        
        lea dx, str
        mov ah, 0Ah
        int 21h
    endm
    
    createfile macro filename, handle
        mov ah, 3ch
        mov cx, 0
        lea dx, filename
        int 21h
        
        mov handle, ax    
    endm
    
    writefile macro handle, str
        mov ah, 40h
        mov bx, handle        
        mov ch, 0
        mov cl, str+1
        lea dx, str+2        
        int 21h
    endm
    
    closefile macro handle
        mov ah, 3eh
        mov bx, handle
        int 21h
    endm
    
    openfile macro filenam
       xor ax, ax
       mov ah, 3dh
       lea dx, filename
       int 21h      
    endm  
    
    readfile macro handle, buffer
         mov bx, handle
         mov cx, 1
        
        do:
          lea dx, buffer
          mov ah, 3fh
          int 21h
          
          
         
          cmp ax, 0
          je exit
          
          mov ah, 02h
          mov dx, buffer
          mov dh, 0 
          int 21h
        jmp do
    
    endm
    
    
            
    
.code

main proc
    mov ax, @data
    mov ds, ax
    
    print msg1
    scan str
    
    
    createfile filename, handle
    print msg2
    writefile handle, str
    
    print msg3
    closefile handle
    
    print msg4
    openfile filename
    
    print msg5
    print newline
    readfile handle, buffer
        
     
    exit:
    mov ah, 4ch
    int 21h
     
        
   main endp
end main