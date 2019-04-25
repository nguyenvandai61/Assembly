.model small
.stack 50
.data
.code

    mov ax, @data
    mov ds, ax
    
    mov ax, 280
    mov bl, 16
    
    div bl
    
    
    mov bl, 10
    mov ah, 0
    xor cx, cx       
    chia:
        div bl
        add ah, 30h            ;
        mov dl, ah
        push dx   
        inc cx
        xor ah, ah
        cmp al, 0
        je inra
        jmp chia
                  
    inra:
    
        mov ah, 02   
        pop dx
        mov al, dl 
        int 21h
        loop inra
        
        
        
        
        
        
       
   
    
end