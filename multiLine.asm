.model small
.stack 50
.data
    msg DB 'Chao mung ban den voi Assembly$'
    msg2 DB 10, 13, 'Assembly that de$'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov dx, offset msg
        mov ah, 09h
        int 21h
        
        mov dx, offset msg2
        mov ah, 09h
        int 21h
        
        mov ah, 4Ch
        int 21h
    main endp
 end main