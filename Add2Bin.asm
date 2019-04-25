.model small
.stack 50
.data
    msg1 db 'Nhap vao so a: $'
    
    msg2 db 10, 13, 'Nhap vao so b: $'
                               
    msg3 db 10, 13, 'A+B: $'
    a dw ?
    b dw ?
.code
    mov ax, @data
    mov ds, ax
    
    mov ah, 09
    lea dx, msg1
    int 21h
    
    ;Nhap a
    
    
    
    
    xor bx,bx
    mov cx, 16
    
    nhap:
    
    
    mov ah, 1
    int 21h
    sub al, 30h
    SHl bx, 1
    add bl, al
    loop nhap 
    
    
    mov a, bx
    
    ;Nhap b  
    
    mov ah, 09
    lea dx, msg2
    int 21h
    
    xor bx,bx
    mov cx, 16
    
    nhap2:
    
    
    mov ah, 1
    int 21h
    sub al, 30h
    SHl bx, 1
    add bl, al
    loop nhap2 
    
    
    mov b, bx
    ; Cong a va b     
    mov ax, a
    add bx, ax
    
    
    
    
    
    
    mov ah, 09
    lea dx, msg3
    int 21h
    
                        
    mov cx, 16
    inra:
        xor dl, dl 
        shl bx, 1
        
        adc dl, 30h
        
        mov ah, 02h
        int 21h
        loop inra
    
    
    thoat:
    
    mov ah, 4ch
    int 21h
end
    
     
    