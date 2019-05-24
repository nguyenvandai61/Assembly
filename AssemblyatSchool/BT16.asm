.model small
.stack 50
.data
    msg1 DB 10, 13, 'Nhap so thu nhat: $'
    msg2 DB 10, 13, 'Nhap so thu hai : $'
    msg3 DB 10, 13, 'Uoc cua 2 so: $' 
    so1 dw 0
    so2 dw 0
    res dw 0
    
    @print macro msg
        lea dx, msg
        mov ah, 09h
        int 21h
    endm
    
    @input macro so, outnhap
        local nhap
        
        nhap:
            mov ah, 01h
            int 21h
            
            cmp al, 13
            
            je outnhap
            
            cmp al, '-'
            je nhap
            
            sub al, 30h
            mov ah, 0
            mov cx, ax
            mov bx, 10
            mov ax, so
            mul bx
            add ax, cx
            mov so, ax
            
            jmp nhap
       endm
       
       @printdec macro num
            local chia, inso
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
           
       endm
       
       
       @GCD macro so1, so2, res
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
        mov res, ax
       endm
.code
    main proc
        
        mov ax, @data
        mov ds, ax     
        
        @print msg1    
        @input so1, outnhap1
        
            
        outnhap1: 
        @print msg2
        @input so2, outnhap2    
        
         
     
        outnhap2:
        @print msg3
        @GCD so1, so2, res    
       
        @printdec res   

        mov ah, 4Ch
        int 21h     
    
       main endp
    end main