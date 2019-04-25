.model small
.stack 50
.data
    msg1 DB 'Nhap vao ky tu viet hoa: $'
    msg2 DB 10, 13, 'Ky tu viet thuong: $'
    kyTu DB ?
.code 
    main proc
        mov ax, @data
        mov ds, ax
        
        lea dx, msg1
        mov ah, 9
        int 21h
        
        mov ah, 1
        int 21h
        
        add al, 20h
        mov kyTu, al
        
        
        lea dx, msg2
        mov ah, 9
        int 21h
        
        mov dl, kyTu
        mov ah, 2
        int 21h
        
        mov ah, 4Ch
        int 21h
        
      main endp
    end main