.model small
.stack 50
.data
    msg1 DB 'Nhap vao day so: $'
    msg2 DB 10, 13, 'Trung binh cong: $'
.code
    main proc
        
        mov ax, @data
        mov ds, ax     
        
        mov bl, 0; 
        mov cl, 0
               
        lea dx, msg1
        mov ah, 09h
        int 21h
        
        
        nhap:
            mov ah, 01h
            int 21h
            
            cmp al, 13
            je outNhap
            
            cmp al, 32
            je nhap:
            
            sub al, 30h
            
            add bl, al
            
            inc cx;
            
            jmp nhap
            
        outNhap:    
        
        lea dx, msg2
        mov ah, 09h
        int 21h
        
            mov ah, 0
            mov al, bl
            div cl
            
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