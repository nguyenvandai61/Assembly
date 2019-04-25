.model small
.stack 100h

.data 
    msg1 db 'Nhap vao chuoi so 1: $'
    msg2 db 10, 13, 'Nhap vao chuoi so 2: $'
    msg3 db 10, 13, 'Tong cua 2 chuoi so: $'  
    so1txt db 8,?,9 dup('$')
    so2txt db 8,?,9 dup('$') 
    so1 dw 0
    so2 dw 0
    
.code      
main proc
    mov ax, @data
    mov ds, ax
    
    ; In ra msg1
    mov ah, 09h
    lea dx, msg1
    int 21h           
    
    ; Nhap vao chuoi va chuyen sang so1 
    Nhap1:
    lea dx, so1txt
    mov ah, 0Ah
    int 21h
    
    lea si, so1txt+1
    xor cx, cx
    xor ax, ax
    mov cl, [si]
    inc si
    
    
    mov bl, 10
    lap:
        mov ax, so1
        mul bl
        add al, [si]
        sub ax, '0'
        mov so1, ax
        xor ax, ax
        inc si
        loop lap
    
        
        
        
    
    
    
    ; In ra msg2
    
    mov ah, 09h
    lea dx, msg2
    int 21h
    
    
    Nhap2:
    lea dx, so2txt
    mov ah, 0Ah
    int 21h
    
    lea si, so2txt+1
    xor cx, cx
    xor ax, ax 
    xor bx, bx
    mov cl, [si]
    inc si
    
    
    mov bl, 10
    lap2:
        mov ax, so2
        mul bl
        add al, [si]
        sub ax, '0'
        mov so2, ax
        
        xor ax, ax
        inc si
        loop lap2
        
    ; Tinh tong 
    tinhTong:
    mov ax, so1
    add ax, so2
    xor bx, bx
    mov bx, ax
    
    mov ah, 9
    lea dx, msg3
    int 21h
    
    
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
        
         
    
    
        
    mov ah, 4ch
    int 21h
  main endp
end main
  