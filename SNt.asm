.model small
.stack 50
.data
    msg1 DB 10, 13, 'Nhap so: $'      
    msg2 DB 10, 13, 'La so nguyen to$' 
    msg3 DB 10, 13, 'Khong phai la so nguyen to$'
    nl db 10, 13, '$';
    so db ?
    dem db 0
    arr db 10 dup(?);
    ;arr db 23, 19, 56, 23, 15, 17,23,34, 29,13
.code
    main proc
        
        mov ax, @data
        mov ds, ax     
        
        ; Thong bao nhap so nguyen to         
        lea dx, msg1
        mov ah, 09h
        int 21h
        
        
        ; File
        mov ah,3ch
        mov cx,0
        lea dx, file
        int 21h
        
        ; Tao file that bai 
        jc thoat                   


        ; Tao file thanh cong
        mov handle, ax

        
        ; Nhap 10 so
        lea si, arr
        nhap:
            mov ah,1
            int 21h
            
            
            cmp al, ' '
            je SoMoi
            
            sub al, 30h
            mov ah, 0
            mov cl, al
            mov bx, 10
            mov al, so
            mul bl
            add al, cl
            mov so, al 
            jmp nhap
            
            SoMoi:      
                inc dem;
            
                mov al, so
                mov [si], al
                inc si
                xor ax, ax
                mov so, 0
                
                
                cmp dem, 10
                je outnhap 
                
                jmp nhap     
            
         outnhap:
         
                xor ax, ax
        
         
        mov dem, 0
        
        lea dx, msg1
        mov ah, 09h
        int 21h
         
        lea si, arr
         
           
         solve:
            xor ax, ax
            mov al, [si]
            mov so, al
            mov bl, 2
            
            lap:
               xor ax, ax
               mov al, so
               div bl
               cmp ah, 0
               je TangSI
               inc bl
               
               cmp bl, so
               je SNT
               jmp lap
               
                
               
        SNT:            
              	mov cx, 0
                mov bx, 10
                xor ax, ax
                mov al, so
                
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

        
        
        mov dl,32
        int 21h
        
        TangSI:    
        inc si
        inc dem
        cmp dem, 10
        jg ra
        
            
        jmp solve    
        
        ra:
        mov ah, 4Ch
        int 21h     
    
       main endp
    end main        
    
    
    
    
        
        
        
        
        je HienThiLai
        mov buffer, al
        lea dx, buffer
        mov bx, handle
        mov cx, 1
        mov ah, 40h
        int 21h
        jmp LapDoc            
       
       
;       ;

        HienThiLai:
        mov bx, handle
        mov ah, 4eh ; Dong file
        int 21h
        
        
        lea dx, xuongdong   
        mov ah, 09
        int 21h
        
        
        ; Mo file
        mov ah, 3dh
        xor al, al

        lea dx, file
        int 21h ; Mo file
        jc thoat ;

        
        
        ; Doc file
	    mov bx, ax
	    mov handle, bx
	    
	    mov cx, 1
	    ; Doc tung ky tu  
	    repeat:
        mov ah, 3fh
        lea dx, buffer
        int 21h
        jc thoat; if error
        
        cmp ax, 0
        je thoat ; EOF

        
        
	    ;In ra tung ky tu	       
        mov ah, 02h
        mov dl, buffer
        int 21h
        
        jmp repeat   
        
        
       


thoat:                   
        
        ; Dong tep tin
        mov bx, handle
        mov ah, 3eh
        int 21h
        