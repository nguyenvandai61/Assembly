.model small
.stack 50
.data
    msg1 db 'Nhap so thu nhat: $'
    msg2 db 10, 13, 'Nhap so thu hai:  $'
    msg3 db 10, 13, 'A + B: $'
    msg4 db 10, 13, 'A - B: $'
    msg5 db 10, 13, 'A & B: $'
    msg6 db 10, 13, 'A | B: $'
    
    
    so1txt db 16 dup(?)
                             
    so2txt db 16 dup(?)
    so1 dw ?
    so2 dw ?
.code             




main proc
    mov ax, @data
    mov ds, ax
    
    ; in ra msg1
    lea dx, msg1
    mov ah, 09h
    int 21h
    
    lea si, so1txt
    
    nhap1:
        mov ah, 01h
        int 21h  
        
        cmp al, 13
        je outnhap1
        
        mov [si], al
        inc si
        
        
        sub al, 30h
        
        mov ah, 0
        mov cx, ax
        mov ax, so1
         
        mov bx, 2
        mul bx
        add ax, cx
        mov so1, ax 
        
        
        jmp nhap1
        
        
    
    ; in ra msg2
    outnhap1:
    lea dx, msg2
    mov ah, 09h
    
    int 21h        
    
    
    lea si, so2txt
    
    nhap2:
        mov ah, 01h
        int 21h  
        
        cmp al,13
        je outnhap2
                   
        mov [si], al
        inc si
                   
        sub al, 30h
        mov ah, 0
        mov cx, ax
         mov ax, so2 
        mov bx, 2
        mul bx
        add ax, cx
        mov so2, ax
        jmp nhap2
    
    outnhap2:
    lea dx, msg3
    mov ah, 09h
    
    int 21h
        
    tinhTong: 
        mov ax, so1
        mov bx, so2
        add ax, bx
        
        
        mov cx, 0
                mov bx, 10
                
            chia:
                mov dx, 0
                div bx
                add dx, 30h
                push dx
                inc cx
                cmp ax, 0
  je inso
                jmp chia
                inso:
                    pop dx
                    mov ah, 2
                    int 21h
                    loop inso

               
    
    
        lea dx, msg4
        mov ah, 09h
    
        int 21h
   
    
                
    tinhHieu:
        mov ax, so1
        mov bx, so2
        sub ax, bx
        
        
        mov cx, 0
                mov bx, 10
                
            chia2:
                mov dx, 0
                div bx
                add dx, 30h
                push dx
                inc cx
                cmp ax, 0
  je inso2
                jmp chia2
                inso2:
                    pop dx
                    mov ah, 2
                    int 21h
                    loop inso2
      
      
        
    ANDop: 
     lea dx, msg5
    mov ah, 09h
    
    int 21h  
                  
    
    mov ax, so1
    mov bx, so2
    
    and ax, bx   
    
    xor cx, cx    
    mov cx, 0
    mov bx, 2
                
            chia3:
                mov dx, 0
                div bx
                add dx, 30h
                push dx
                inc cx
                cmp ax, 0
  je inso3
                jmp chia3
                inso3:
                    pop dx
                    mov ah, 2
                    int 21h
                    loop inso3

    
                  
     ORop:     
       lea dx, msg6
    mov ah, 09h
    
    int 21h  
                  
    
    mov ax, so1
    mov bx, so2
    
    or ax, bx   
    
    xor cx, cx    
    mov cx, 0
    mov bx, 2
                
            chia4:
                mov dx, 0
                div bx
                add dx, 30h
                push dx
                inc cx
                cmp ax, 0
  je inso4
                jmp chia4
                inso4:
                    pop dx
                    mov ah, 2
                    int 21h
                    loop inso4

    
   
     
        
        
        
    
                              
    
    mov ah, 4ch
    int 21h
;    
    main endp
 end main    