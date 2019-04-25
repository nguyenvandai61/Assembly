.model small
.stack 50
.data
    msg1 DB 'Nhap ky tu: $'
    msg2 DB 10, 13, 'Ky tu da nhap: $'
    msg3 DB 10, 13, 'Ky tu lien sau: $'
    msg4 DB 10, 13, 'Ky tu lien truoc: $'   
    kyTu DB ?
.code
    main proc
        
        mov ax, @data
        mov ds, ax
        
        lea dx, msg1
        mov ah, 09h
        int 21h
        
        mov ah, 1
        int 21h
        mov kyTu, al
        
        lea dx, msg2
        mov ah, 09h
        int 21h
        
        mov dl, kyTu
        mov ah, 2
        int 21h
        
        lea dx, msg3
        mov ah, 09h
        int 21h
        
        inc kyTu
        mov dl, kyTu
        mov ah, 2
        int 21h
        
        dec kyTu
        dec kyTu
        
        lea dx, msg4
        mov ah, 09h
        int 21h
        mov dl, kyTu
        mov ah, 2
        int 21h
        
        
        mov ah, 4Ch
        int 21h
     main endp
    end main