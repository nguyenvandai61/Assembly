.model small
.stack 50
.data
    msg1 DB 'Hay go mot phim: $'
    msg2 DB 10, 13, 'Ky tu nhan duoc la: $'
    kytu DB ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9 
        lea dx, msg1
        int 21h
        
        mov ah, 1
        int 21h
        mov kytu, al            
        
        mov ah, 9
        lea dx, msg2
        int 21h
        
        mov dl, kytu
        mov ah, 2
        int 21h 
               
        
        mov ah, 4CH
        int 21h
        
 
        main endp
    end main