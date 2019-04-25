.model small
.stack 50
.data
    msg1 DB 'Nhap 1 ky tu tu ban phim: $'
    msg2 DB 10, 13, 'Tu ky tu do den z: $'
    kyTu DB ?

.code
    main PROC     
        mov ax, @data
        mov ds, ax
        
        
        ; In ra man hinh msg1
        lea dx, msg1
        mov ah, 09
        int 21h
        
        ; Nhan ky tu tu ban phim
        mov ah, 1
        int 21h
        mov kyTu, al
        
        
        ; In ra man hinh msg2
        lea dx, msg2
        mov ah, 09
        int 21h
        
       
        
        ; Thuc hien loop
        lap:
                        
            ; So sanh ky tu voi 'z'
            cmp kyTu, 7ah
            ja ra
            
            inra:
                mov dl, kyTu
                mov ah, 02h
                int 21h
                
                inc kyTu
            loop lap
            
                  
        
        
        ra:
        mov ah, 4ch
        int 21h
        
    main endp
end main