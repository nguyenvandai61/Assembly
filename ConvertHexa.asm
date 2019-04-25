.model tiny
.stack 100h
.data
    msg1 DB 'Nhap so kieu word: $'
    msg2 DB 10, 13, 'So do duoi dang HEX: $'
    a DW 0
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea dx, msg1
        mov ah, 9
        int 21h
        
     nhap:   
        mov ah, 1
        int 21h
        
        cmp al, 13
        je inso
        
        mov ah, 0
        sub al, 30h
        mov cx, ax
        mov ax, a
        
        mov bx, 10
        mul bx
        add ax, cx
         
        mov a, ax
        jmp nhap
        
        inso:
        
        lea dx, msg2
        mov ah, 9
        int 21h
        
        mov bx, 16
        mov ax, a
        mov cx, 0
        
        
        chia:
            mov dx, 0
            div bx
            cmp dx, 10
            jae doi   
            add dx, 30h
            jmp cat
            doi: add dx, 37h
            cat: push dx
                inc cx
                cmp ax, 0
                je hien
            jmp chia
            
            hien: 
                pop dx
                mov ah, 2
                int 21h
                loop hien
                
            ra:
                mov ah, 4ch
                int 21h
           main endp
    end main