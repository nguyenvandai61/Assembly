.model small
.stack 50
.data
    msg1 DB 'Hay go mot phim: $'
    msg2 DB 10, 13, 'Ky tu nhan duoc la: $'
    kytu DB ?
    
    print macro msg
        lea dx, msg
        mov ah, 09h
        int 21h
    endm
    
    printc macro char
        mov dl, char
        mov ah, 2
        int 21h 
    endm
    
    scan macro char
        mov ah, 1
        int 21h
        mov char, al
    endm            
        
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        print msg1
        scan kytu    
        
        print msg2
        printc kytu
               
        
        mov ah, 4CH
        int 21h
        
 
        main endp
    end main