.model small
.stack 50
.data
    msg1 DB 'Nhap vao 1 chuoi: $'
    msg2 DB 10, 13, 'Tong chieu dai cua chuoi: $'
    s DB 100,?,101 dup('$')
.code 
    begin:
        mov ax, @data
        mov ds, ax
        ; Xuat chuoi thong bao1
        mov ah, 09h
        lea dx, msg1
        int 21h
        
        ; Nhap chuoi s
        mov ah, 0Ah
        lea dx, s
        int 21h
        
        ; Xuat chuoi thong bao 2
        mov ah, 09h
        lea dx, msg2
        int 21h
        
        ; Tinh chieu dai cua chuoi
        xor ax, ax
        ; al chua length o dang hexa
        mov al, s+1
        
        
        mov cx, 0
        mov bx, 10
        LapDem1:
            mov dx, 0
            div bx
            push dx
            inc cx
            cmp ax, 0
            jnz LapDem1
            ; Xuat chieu dai chuoi
            mov ah, 2
            LapDem2:
                pop dx
                or dl, '0'
                int 21h
            loop LapDem2
            
            
       mov ah, 4ch
       int 21h
    end begin
        