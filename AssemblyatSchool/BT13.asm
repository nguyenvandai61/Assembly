.model small
.stack 50
.data
    msg1 db 'Nhap so1 duoi dang thap luc phan: $'
    msg2 db 10, 13, 'Nhap so2 duoi dang thap luc phan: $'
  
    msg3 db 10, 13, 'A + B = $'    
    
    msg4 db 10, 13, 'A - B = $'
    
    so1 dw ?
    so2 dw ?
    
.code
    mov ax, @data
    mov ds, ax
    
    lea dx, msg1
    mov ah, 9
    int 21h
    
    nhap1:
        mov ah, 1
        int 21h
        
        cmp al, 13
        je outnhap1
        
        cmp al, '9'
        jg xulychu
        xulyso:
            sub al, 30h
            jmp tachkytu
        xulychu:
            sub al, 'A'
            add al, 10
            
        tachkytu:
            
            mov cl, al
            mov ax, so1
            
            mov bl, 16
            mul bl
            xor ah, ah
            add ax, cx
            mov so1, ax
            jmp nhap1
            
      outnhap1:
                       
                      
    lea dx, msg2
    mov ah, 9
    int 21h
    
    nhap2:
        mov ah, 1
        int 21h
        
        cmp al, 13
        je outnhap2
        
        cmp al, '9'
        jg xulychu2
        xulyso2:
            sub al, 30h
            jmp tachkytu2
        xulychu2:
            sub al, 'A'
            add al, 10
            
        tachkytu2:
            
            mov cl, al
            mov ax, so2
            
            mov bl, 16
            mul bl
            xor ch, ch
            add ax, cx
            mov so2, ax
            jmp nhap2
            
     outnhap2:
      lea dx, msg3
     mov ah, 9
     int 21h
    
    
     mov ax, so1
     mov bx, so2
     add ax, bx
     
     xor dx, dx
     
           
     xor cx, cx
     
     mov bx, 2        
     chia:
        mov dx, 0
        div bx
        add dx, '0'
        push dx     
        inc cx
        cmp ax, 0
        je inra
        jmp chia
        inra:
            pop dx
            mov ah, 2
            int 21h
            loop inra
            
    
     lea dx, msg4
     mov ah, 9
     int 21h
    
    
     mov ax, so1
     mov bx, so2
     sub ax, bx
     
     xor dx, dx
     
           
     xor cx, cx
     
     mov bx, 2        
     chia2:
        mov dx, 0
        div bx
        add dx, '0'
        push dx     
        inc cx
        cmp ax, 0
        je inra2
        jmp chia2
        inra2:
            pop dx
            mov ah, 2
            int 21h
            loop inra2
            
end