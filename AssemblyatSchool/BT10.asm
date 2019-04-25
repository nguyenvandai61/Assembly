.model small
.stack 50
.data
    msg1 DB 'Nhap vao so1: $'
    msg2 DB 10, 13, 'Nhap vao so2: $'
    msg3 DB 10, 13, 'Tich 2 so vua nhap: $'
    msg4 DB 10, 13, 'Thuong 2 so vua nhap: $'
    so1 DB ?
    so2 DB ?
.code   
; Tich so1 va so2 
        TICH proc
            xor cx, cx
            mov cl, so2 
            xor bx, bx
            mov bl, 0
            while:
                add bl, so1
            loop while
        ; In ra tich
                                
                      
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
            ret
        TICH endp
        

        THUONG proc  
            
         
            mov cl, 0 
            xor bx, bx
            mov bl, so1
            lap:
                sub bl, so2
                inc cl
                
                cmp bl, 0
                jz inra
            jmp lap
        ; In ra thuong
        inra:                   
            xor ax, ax   
            mov al, cl
            mov cx, 0
            mov bx, 10
            LapDemC1: 
                mov dx, 0
                div bx
                push dx
                inc cx
                cmp ax, 0
                jnz LapDemC1
            ; Xuat ket qua
            mov ah, 2
            LapDemC2:
                pop dx
                or dl, '0'
                int 21h 
                loop LapDemC2;
            ret
        THUONG endp        
        

    begin:
        mov ax, @data
        mov ds, ax
        
        ; Xuat chuoi thong bao1
        mov ah, 09h
        lea dx, msg1
        int 21h

        ;Nhap vao so1
        nhap1:            
            mov ah, 01h
            int 21h
            
            cmp al, 13
            je outnhap1
            
            sub al, 30h
            
            mov cl, al
            mov al, so1
            
            
            mov bl, 10
            mul bl
            
            add al, cl
            mov so1, al
            jmp nhap1
            
            
            
        outnhap1:    
         

        ; Xuat chuoi thong bao 2
        mov ah, 09h
        lea dx, msg2
        int 21h   
        
        ; Nhap vao so2
        nhap2:            
            mov ah, 01h
            int 21h
            
            cmp al, 13
            je outnhap2
            
            sub al, 30h
            
            mov cl, al
            mov al, so2
            
            
            mov bl, 10
            mul bl
            
            add al, cl
            mov so2, al
            jmp nhap2
            
            
        outnhap2:
        ; Xuat chuoi thong bao 3
        mov ah, 09h
        lea dx, msg3
        int 21h
        
        call TICH      
         ; In ra msg4
        
        
        lea dx, msg4
        mov ah, 09h
        int 21h
        xor dx, dx
        
        call THUONG                        
        
        mov ah, 4ch
        int 21h
    end begin


