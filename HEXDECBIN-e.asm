.model small
.stack 50
.data
    msg1 db 'Nhap 1 ky tu: $'
    msg2 db 10,13,'Ma ASCII dang Hex: $'
    msg3 db 10,13,'Ma ASCII dang Dec: $'
    msg4 db 10,13,'Ma ASCII dang Bin: $'
    kyTu db ?
.code 
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, msg1
        int 21h
        
        mov ah, 01h
        int 21h           
        
        mov kyTu, al        
        ; Xu ly HEX ; ;
        mov ah, 9
        lea dx, msg2
        int 21h
            
            xor ax, ax
            mov al, kyTu
            xor cx, cx
            mov cl, 0
            mov bl, 16
                
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
           
            mov ah, 2    
            
             mov dl, 104
            int 21h     
            
                           
            
        ; Xu ly DEC
        DECC:
        mov ah, 09h    
        lea dx, msg3
        int 21h
        
        
                    
            xor ax, ax
            xor dx, dx
            xor cx, cx
            mov cl, 0
            mov bl, 10
            
            mov al, kyTu
                
            chia2:
                mov dx, 0
                div bx
                add dx, 30h
                push dx
                inc cl
                cmp al, 0
        je inso2
                jmp chia2
                inso2:
                    pop dx
                    mov ah, 2
                    int 21h
                    loop inso2
            mov dl, 'd'
            mov ah, 2
            int 21h

          
          ;   BIN
        
        mov ah, 9
        lea dx, msg4
        int 21h
            
            xor ax, ax
            mov al, kyTu
            mov cl, 0
            mov bl, 2
                
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
           
            mov ah, 2    
            
             mov dl, 'b'
            int 21h     
        
        
                     
        mov ah, 4ch
        int 21h
    main endp
end main