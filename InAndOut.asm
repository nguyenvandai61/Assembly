.model small
.stack 50
.data
    msg1 DB 'Hay nhap mot ky tu: $'
    msg2 DB 10, 13, 'Ky tu da nhap: $'
    KyTu DB ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea dx, msg1
        mov ah, 09h
        int 21h
        
        mov ah, 01h
        int 21h
        mov KyTu, al
        
        lea dx, msg2
        mov ah, 09h
        int 21h
        
        mov ah, 02h
        mov dl, KyTu
        int 21h
        
        mov ah, 4Ch
        int 21h
        
        main endp
    end main