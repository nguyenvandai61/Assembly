.model tiny
.stack 50
.data   
    msg1 db 'Nhap ten: $'
    msg2 db 10, 13, 'Xin chao $'
    
    ten db 100,?,101 dup('$')
.code
    main proc       
        
        mov ax, @data
        mov ds, ax
                
        ; In ra msg1
        mov ah, 09h
        lea dx, msg1
        int 21h
                  
        ; Nhap xau      
        mov ah, 0Ah
        lea dx, ten
        int 21h  
       
        
        
        ; In ra msg2
        mov ah, 09h
        lea dx, msg2
        int 21h
                    
        ; In ra ten
        ;lea si, ten+1 
;        xor cx, cx
;        mov cl, [si]
;        inc si            
;        lap:                        
;            mov ah, 02h    
;            mov dl, [si]            
;    
;            inc si
;            int 21h
;            loop lap
;        
        lea dx, ten+2
        mov ah, 09h
        int 21h
        
;        ra:
        mov ah, 4ch
        int 21h
        
    main endp
    end main
        
        
    
    