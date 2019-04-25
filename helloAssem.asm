.model small
.stack 50
.data
    msg DB 'Hello Assembly$'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov dx, offset msg
        mov ah, 09h
        int 21h
        
        mov ah, 4Ch
        int 21h
     main endp
    end main