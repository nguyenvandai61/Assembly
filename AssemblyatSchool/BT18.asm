.model small
.stack 50
.data
    msg1 DB 'Nhap vao day so: $'
    msg2 DB 10, 13, 'Trung binh cong: $'
    sum db 0
    so db 0
    nhan10 db 10
    n db 0
    
    @print macro msg
        lea dx, msg
        mov ah, 09h
        int 21h
    endm
        
.code
    main proc
        
        mov ax, @data
        mov ds, ax     
        
        mov bl, 0; 
        @print msg1       
        
        xor dx, dx
        nhap:
            mov ah, 01h
            int 21h
            
            mov ah, 0
            cmp al, 13
            je outNhap
            
            cmp al, 32
            jne layso
            
            mov dl, so
            add sum, dl
            mov so, 0
            inc n
            jmp nhap
            
            layso:
            sub al, 30h
            mov bl, al
            mov al, so
            mul nhan10
            add al, bl
            mov so, al             
            jmp nhap
            
        outNhap:    
        mov dl, so
        add sum, dl
        mov so, 0
        inc n
        
        lea dx, msg2
        mov ah, 09h
        int 21h
        
        mov ah, 0
        mov al, sum
        div n
            
            
        
        
        
        mov ah, 4Ch
        int 21h
     main endp
    end main