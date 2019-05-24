.model small
.stack 50
.data
    msg1 DB 'Hay nhap mot ky tu: $'
    msg2 DB 10, 13, 'Ky tu da nhap: $'
    
    print macro msg
      lea dx, msg
      mov ah, 09h
    int 21h
    
endm
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        print msg1
        
        mov ah, 01h
        int 21h
        
        mov bl, al
        
        print msg2
        
        
        mov ah, 02h
        mov dl, bl
        int 21h 
                   
        mov ah, 4Ch
        int 21h
        
        main endp
    end main