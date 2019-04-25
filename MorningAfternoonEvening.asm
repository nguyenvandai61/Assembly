.model tiny
.stack 50
.data
    msg1 db 'Nhap 1 ky tu tu man hinh: $' 
    msg2 db 10, 13, 'Good morning$'
    msg3 db 10, 13, 'Good afternoon$'
    msg4 db 10, 13, 'Good evening$'
    
    kyTu db ?
.code
    main proc       
        
        mov ax, @data
        mov ds, ax
        
        mov ah, 09h
        lea dx, msg1
        int 21h
        
        mov ah, 1
        int 21h
        mov kyTu, al
        
        cmp kyTu, 53h
        je insang
        cmp kyTu, 73h
        je insang
        
        cmp kyTu, 54h
        je intrua
        cmp kyTu, 74h
        je intrua
        
        cmp kyTu, 43h
        je inchieu
        cmp kyTu, 63h
        je inchieu
        
        
        jmp ra
        
        
        insang: 
            mov ah, 09h
            lea dx, msg2
            int 21h    
                   
        intrua: 
            mov ah, 09h
            lea dx, msg3
            int 21h
            
        inchieu: 
            mov ah, 09h
            lea dx, msg4
            int 21h
        
        ra:
        mov ah, 4ch
        int 21h
        
    main endp
    end main
        
        
    
    