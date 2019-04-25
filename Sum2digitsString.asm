.model small
.stack 100h

.data 
    msg1 db 'Nhap vao chuoi so 1: $'
    msg2 db 10, 13, 'Nhap vao chuoi so 2: $'
    msg3 db 10, 13, 'Tong cua 2 chuoi so: $'  
    so1 dw ?
    so2 dw ?
    
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
        mov ah, 1
        int 21h
    
        cmp al, 13
        je PrintMSG2
        
        sub al, 30h
        mov ah, 0
        mov cx, ax
        
        mov ax, so1
    
    
        mov bx, 10
        mul bx
        add ax, cx
        mov so1, ax
      jmp Nhap1
    
    ; In ra msg1
    PrintMSG2: 
    mov ah, 09h
    lea dx, msg2
    int 21h
    
      
    Nhap2:
            
    
        mov ah, 1
        int 21h 
    
        cmp al, 13
        je tinhTong
    
    
        sub ax, 30h
        mov ah, 0
        mov cx, ax
        mov ax, so2
    
    
        mov bx, 10
        mul bx
        add ax, cx
        mov so2, ax
      jmp Nhap2
    
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
  