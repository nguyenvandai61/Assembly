.model small
.stack 50
.data
 .code
    main proc
        
        mov ax, @data
        mov ds, ax
       
        
        mov ax, 2563
        mov bx, 10
        xor cx, cx
        
        Lapchia:
        xor dx, dx
        div bx
        add dx, 30h
        push dx
        inc cx
        cmp ax, 0
        jne Lapchia
        Dochienthi:
        mov ah, 2
        pop dx
        int 21h
        loop Dochienthi    
                        
        mov ah, 4Ch
        int 21h
     main endp
    end main