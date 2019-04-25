
.model small
.stack 100h
.data 
.code
    
    main proc
        mov ax, @data
        mov ds, ax
        
        mov bx, 0
        mov cx, 100
        TINHTONG:
            ADD BX,CX       
        LOOP TINHTONG
        
        ; In ra ket qua
        
        ; Chuyen bx
        xor ax, ax
        mov ax, bx
            mov cx, 0
            mov bx, 10
            LapDem1:
                mov dx, 0
                div bx
                push dx
                inc cx
                cmp ax, 0
                jnz LapDem1
            ; Xuat ket qua
            mov ah, 2
            LapDem2:
                pop dx
                or dl, '0'
                int 21h 
                loop LapDem2;
        
         
        ra:
            mov ah, 4ch
            int 21h
         
    main endp
end main