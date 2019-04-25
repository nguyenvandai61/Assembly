.model small
.stack 50
.data
    msg1 DB 10, 13, 'Nhap so thu nhat: $'
    msg2 DB 10, 13, 'Nhap so thu hai : $'
    msg3 DB 10, 13, 'Uoc cua 2 so: $' 
    so1 dw 0
    so2 dw 0
.code
    main proc
        
        mov ax, @data
        mov ds, ax     
        
        
        lea dx, msg1
        mov ah, 09h
        int 21h
        
        nhap1:
            mov ah, 01h
            int 21h
            
            cmp al, 13
            
            je outnhap1
            
            cmp al, '-'
            je nhap1 
            
            sub al, 30h
            mov ah, 0
            mov cx, ax
            mov bx, 10
            mov ax, so1
            mul bx
            add ax, cx
            mov so1, ax
            
            jmp nhap1 
            
        outnhap1: 
            lea dx, msg2
            mov ah, 09h
            int 21h
    
         
            
        nhap2:
            mov ah, 1
            int 21h
            
            cmp al, 13
            
            je outnhap2
            
            cmp al, '-'
            je nhap2 
            
            sub al, 30h
            mov ah, 0
            mov cx, ax
            mov bx, 10
            mov ax, so2
            mul bx
            add ax, cx
            mov so2, ax
            
            jmp nhap2
            
        outnhap2:
            lea dx, msg3
            mov ah, 09h
            int 21h 
            
        Solve:
            mov ax, so1
            mov bx, so2
                          
            lap:
                mov dx, 0
                cmp bx, 0
                je endLoop 
            
                div bx
                mov ax, bx
                mov bx, dx
                jmp lap
       endLoop:  
            mov cx, 0
                mov bx, 10
                
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
       
                
       
    
        mov ah, 4Ch
        int 21h     
    
       main endp
    end main