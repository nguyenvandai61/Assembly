
.model small
.stack 100h
.data          
    msg1 db 10, 13,'Nhap ky tu chu cai: $' 
    msg2 db 10, 13,'Ky tu chuyen: $'   
    kyTu db ?
.code
    
    main proc
        mov ax, @data
        mov ds, ax
        
        while:
            xor dx, dx                    
            lea dx, msg1
            mov ah, 09h
            int 21h
            
            ; Nhap ky tu
            mov ah, 01h 
            
            int 21h
            
            
            
            cmp al, 'A'
        
            jl while   
            cmp al, 'Z'
            jle DoiKyTu
            
            
            cmp al, 'a'
            jl while
                      
            cmp al, 'z'
        
            jg while   
            jmp DoiKyTu
       
       DoiKyTu:
          cmp al, 'Z'
          jg kytuthuong
          jmp kytuhoa
       
        
        
       kytuthuong: sub al, 20h
        jmp inra
       kytuhoa: add al, 20h
       
        inra: 
                mov bl, al  
                mov ah, 09h
                lea dx, msg2
                int 21h
        
        
                mov ah, 02h          
                mov dl, bl
             
                int 21h
        
         
        ra:
            mov ah, 4ch
            int 21h
         
    main endp
end main