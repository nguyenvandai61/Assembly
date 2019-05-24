.model small
.stack 50h
.data
    msg1 db 'Nhap so: $'
    msg2 db 10, 13, 'Tong chu so: $'
    str db 100,?,101 dup('$')
    sum db 0                         
    @print macro msg
        mov ah, 09h
        lea dx, msg
        int 21h
    endm
    
    @scan macro str
        mov ah, 0Ah
        lea dx, str
        int 21h
    endm
    
    @sum macro str, sum
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
        mov sum, bl    
    endm
         
    
    @printdec macro num ; Chuyen bx
            xor ax, ax
            mov al, num 
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
     endm    
    
        
   
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        ; In ra msg1
        @print msg1
        
        ; Nhap so
        @scan str
        
        ; In ra msg2
        @print msg2
        
        @sum str, sum
        @printdec sum
        
        
         mov ah, 4ch
         int 21h
    main endp
 end main
            