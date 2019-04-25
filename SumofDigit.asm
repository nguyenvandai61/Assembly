.model small
.stack 50h
.data
    msg1 db 'Nhap so: $'
    msg2 db 10, 13, 'Tong chu so: $'
    str db 100,?,101 dup('$')
                             
    
   
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        ; In ra msg1
        mov ah, 09h
        lea dx, msg1
        int 21h
        
        ; Nhap so
        mov ah, 0Ah
        lea dx, str
        int 21h
        
        ; Xu ly
        lea si, str+1 
        xor cx, cx
        mov cl, [si]
        xor bx, bx
        mov bl, 0
        inc si
        lap: 
            mov dl, [si]
            sub dl, 30h
            add bl, dl
            inc si
            loop lap         
            
        ; In ra msg2
        lea dx, msg2
        mov ah, 09h
        int 21h
        
        
        ; Chuyen bx
        xor ax, ax
            mov al, bl
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
        
         mov ah, 4ch
         int 21h
    main endp
 end main
            