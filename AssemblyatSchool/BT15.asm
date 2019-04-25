.model small
.stack 50
.data
    msg1 db 'Nhap x: $'
    msg2 db 10, 13, 'Giai thua: $'
    res dw 1
.code
    main proc
        mov ax, @data
        mov ds, ax

        lea dx, msg1
        mov ah, 09h
        int 21h
        
        mov ah, 01h
        int 21h
       
        sub ax, 30h
        
        mov cl, al
        xor ax, ax
        tich:
            mov ax, res; 
            mul cx
             mov res, ax  
            mov bx, ax
            loop tich
;                
        
        
        lea dx, msg2
        mov ah, 09h
        int 21h
        
                
                
        mov cx, 0
        mov bx, 10
        mov ax, res
        
        
                
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
    
                
        mov ah, 4ch
        int 21h
;        
    main endp
end main