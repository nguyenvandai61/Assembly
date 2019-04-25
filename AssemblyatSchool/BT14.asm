.model small
.stack 50
.data
    msg1 db 'Nhap so thu nhat: $'
    msg2 db 10, 13, 'Nhap so thu hai : $'
    msg3 db 10, 13, 'A + B: $'
    msg4 db 10, 13, 'A - B: $'
    
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
    
    nhap1:
        mov ah, 01h
        int 21h  
        
        cmp al, 13
        je outnhap1
        
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
    nhap2:
        mov ah, 01h
        int 21h  
        
        cmp al,13
        je outnhap2
        
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

        
    
        
        
    
    
    
    mov ah, 4ch
    int 21h
    
    main endp
 end main    