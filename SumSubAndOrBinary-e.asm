.model small
.stack 50
.data
    msg1 db 'Nhap nhi phan thu nhat: $'
    msg2 db 10, 13, 'Nhap nhi phan thu hai : $'
    msg3 db 10, 13, 'A + B: $'
    msg4 db 10, 13, 'A - B: $'
    msg5 db 10, 13, 'A + B: $'
    
    np1 dw ?
    np2 dw ?
.code             

    DecToBin PROC
        ; Chuyen bx
        xor ax, ax
        mov ax, bx
            mov cx, 0
            mov bx, 2
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
            ret
    DecToBin endp





main proc
    mov ax, @data
    mov ds, ax
    
    ; in ra msg1
    lea dx, msg1
    mov ah, 09h
    int 21h
    
    nhap1:
        mov ah, 01h
        int 21h  
        
        cmp al, 13
        je PrintMSG2
        
        sub al, 30h
        mov ah, 0
        mov cx, ax
        mov ax, np1
         
        mov bx, 2
        mul bx
        add ax, cx
        mov np1, ax 
        
        
        jmp nhap1
        
        
    
    ; in ra msg2
    PrintMSG2:
    lea dx, msg2
    mov ah, 09h
    
    int 21h
    nhap2:
        mov ah, 01h
        int 21h  
        
        cmp al,13
        je tinhTong
        
        sub al, 30h
        mov ah, 0
        mov cx, ax
         mov ax, np1 
        mov bx, 2
        mul bx
        add ax, cx
        mov np2, ax
        jmp nhap2
        
    tinhTong:
        
        mov ax, np1
        add ax, np2
        xor bx, bx
        mov bx, ax
    
        mov ah, 9
        lea dx, msg3
        int 21h
    
    
        call DecToBin
        jmp tinhHieu
                
                
    tinhHieu:
        mov ax, np1
        sub ax, np2
        xor bx, bx
        mov bx, ax
        
        
        lea dx, msg4
        mov ah, 9
        int 21h
        
        call DecToBin
        
    
        
        
    
    
    
    mov ah, 4ch
    int 21h
    
    main endp
 end main    