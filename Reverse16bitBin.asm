.model small
.stack 50
.data
    msg1 db 'Nhap vao so a: $'
    
    msg2 db 10, 13, 'Ket qua: $'
.code
    mov ax, @data
    mov ds, ax
    
    mov ah, 09
    lea dx, msg1
    int 21h
    
    
    xor bx,bx
    mov cx, 16
    
    nhap:
    
    
    mov ah, 1
    int 21h
    sub al, 30h
    SHl bx, 1
    add bl, al
    loop nhap
    
    
    mov ah, 09
    lea dx, msg2
    int 21h
    
                        
    mov cx, 16
    inra:
        xor dl, dl 
        shr bx, 1
        
        adc dl, 30h
        
        mov ah, 02h
        int 21h
        loop inra
    
    
    thoat:
    
    mov ah, 4ch
    int 21h
end
    
     
    