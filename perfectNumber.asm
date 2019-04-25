.model small
.stack 50
.data
    msg1 DB 10, 13, 'Nhap so: $'      
    msg2 DB 10, 13, 'La so hoan hao$' 
    msg3 DB 10, 13, 'Khong phai la so hoan hao$'
    so dw 0
    tong dw 0;
.code
    main proc
        
        mov ax, @data
        mov ds, ax     
        
        
        lea dx, msg1
        mov ah, 09h
        int 21h
        
        nhap:
            mov ah,1
            int 21h
            
            cmp al, 13
            je outnhap
            
            sub al, 30h
            mov ah, 0
            mov cx, ax
            mov bx, 10
            mov ax, so
            mul bx
            add ax, cx
            mov so, ax 
            jmp nhap
            
         outnhap:
           mov ax, so
           
         solve:
            mov cx, 0
            
           lap:
            inc cx
            laydu:
                mov dx, 0
                div cx
                mov ax, so
                cmp dx, 0
                jne lap
                tinhTong:
                    mov bx, tong
                    add bx, cx
                    cmp ax, bx
                    je HOANHAO
                    jl KOHOANHAO
                    
                    mov tong, bx 
                    jmp lap
               
        HOANHAO:
            lea dx, msg2
            mov ah, 09h
            int 21h
            
            jmp ra
            
        KOHOANHAO:
            lea dx, msg3
            mov ah, 09h
            int 21h
            
            
        
        ra:
        mov ah, 4Ch
        int 21h     
    
       main endp
    end main