.model small
.stack 100h

.data
    msg1 db 'Nhap chuoi ky tu: $'       
    msg2 db 10, 13, 'Chuoi nguoc nhan: $'
    str db 100,?,101 dup('$')
.code                 
    main proc
        mov ax, @data
        mov ds, ax
        
        ; Hien msg1
        lea dx, msg1
        mov ah, 09h
        int 21h
               
        ; Nhap chuoi           
        mov ah,0Ah
        lea dx,str
        int 21h
                   
        
        ; Hien msg1
        lea dx, msg2
        mov ah, 09h
        int 21h           
                  
        ; Lay length
        lea si, str+1
        
        xor cx, cx
        mov cl, [si]
        xor bx, bx        
        while:
            mov ah, 02h   

            mov bx, si
            add bl, cl
            mov dl, [bx]
            int 21h     
            loop while 
        

        mov ah, 4ch
        int 21h  
    main endp
end main
  
    
     