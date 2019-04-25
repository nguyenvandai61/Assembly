.model tiny
.stack 100h
.data
    msg1 DB 'Nhap so kieu Word: $'
    msg2 DB 13, 10, 'Ma nhi phan tuong ung: $'
    so DW 0
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
            je nhiphan
            
            sub al, 30h
            mov ah, 0
            mov cx, ax
            mov bx, 10
            mov ax, so
            mul bx
            add ax, cx
            mov so, ax
       jmp nhap
            nhiphan:
             
                lea dx, msg2
                mov ah, 9
                int 21h
                
                mov cx, 0
                mov bx, 2
                mov ax, so
                
            chia:
                mov dx, 0
                div bx
                add dx, 30h
                push dx
                inc cx
                cmp ax, 0
                
            je inso
                jmp chia
                inso:
                    pop dx
                    mov ah, 2
                    int 21h
                    loop inso
                
                
        ra:
            mov ah, 4ch
            int 21h
          
          
       main endp
    end main