.model small
.stack 50
.data
    msg1 db 'Nhap 1 ky tu: $'
    msg2 db 10,13,'Ma ASCII dang Hex: $'
    msg3 db 10,13,'Ma ASCII dang Dec: $'
    msg4 db 10,13,'Ma ASCII dang Bin: $'
    kyTu db ?
    base db ?
    
    @print macro msg
        mov ah, 9
        lea dx, msg
        int 21h
    endm
    
    @scan macro char
        
        mov ah, 01h
        int 21h
        mov char, al     
    endm
    
    
    @convert macro char, base  
        local chia, inso,thoat     
            xor ax, ax
            mov al, kyTu
            xor cx, cx
            mov cl, 0
            mov bl, base
                
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
           
            mov ah, 2  
            cmp base, 10
            mov dl, 'd'
            je thoat
            mov dl, 'b'
            
            thoat:
            int 21h     
     endm             
    
.code 
    main proc
        mov ax, @data
        mov ds, ax
        
        
        @print msg1
        @scan kyTu
                
        ; Xu ly HEX ; ;
        @print msg2
        xor bx,bx
        mov bh,kytu 
        mov cx,2
      Lap3:
        mov dl,bh 
        shr dl,4
        cmp dl,10
        jb InSo
        add dl,37h
        jmp InChu
      InSo: 
        add dl,30h
      InChu:
        mov ah,02
        int 21h
        shl bx,4     
        loop Lap3 
            
                           
            
        ; Xu ly DEC
        @print msg3
         mov base, 10
         @convert kyTu, base
          ;   BIN
        @print msg4
         mov base, 2
         @convert kyTu, base
                   
        
        
                     
        mov ah, 4ch
        int 21h
    main endp
end main