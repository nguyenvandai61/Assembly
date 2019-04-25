.model small
.stack 50
.data
    msg1 DB 'Hay nhap mot ky tu: $'
    msg2 DB 10, 13, 'Ky tu da nhap: $'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea dx, msg1
        mov ah, 09h
        int 21h
        
        mov ah, 01h
        int 21h
        
        mov bl, al
        
        lea dx, msg2
        mov ah, 09h
        int 21h
        
        
        mov ah, 02h
        mov dl, bl
        int 21h 
                   
        mov ah, 4Ch
        int 21h
        
        main endp
    end main