.model small
.stack 50
.data
    msg1 db 'Nhap so1 duoi dang thap luc phan: $'
    msg2 db 10, 13, 'Ket qua thap phan: $'
  
    
    so1 dw ?
    
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
            
            add ax, cx
            mov so1, ax
            jmp nhap1
            
      outnhap1:
                       
                      
    lea dx, msg2
    mov ah, 9
    int 21h
     
     mov ax, so1;
     
           
     xor cx, cx
     
     mov bx, 10        
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