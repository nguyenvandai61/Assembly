.model small
.stack 50h

.data
    chia10 dw 10
    thu db ?  
    ngay db ?
    thang db ?
    nam dw ?
    
    cn db 'Chu nhat $'
    t2 db 'Thu hai $'
    t3 db 'Thu ba $'
    t4 db 'Thu tu $'
    t5 db 'Thu nam $'
    t6 db 'Thu sau $'
    t7 db 'Thu bay $'   
    
    
     ;------ Thong bao ------- 
    print macro thongbao
        lea dx, thongbao
        mov ah, 9
        int 21h
    print endm
      
    ;------ In ngay thang nam -------
   printDate macro ng, th, n
        
        xor ax, ax
        mov al, ng
        call printDec
        
        
        xuyet
        xor ax, ax
        mov al, th
        call printDec
                
        xuyet
        
        
        mov ax, n
        call printDec
        
    endm
        
    ;--------- In dau xuyet---------
    xuyet macro 
        mov dl, 47
        mov ah, 2
        int 21h
    xuyet endm 
    
    
    ;--------- In thu --------
    inthu macro thu
        cmp thu, 0
        je chn
        cmp thu, 1
        je th2
        cmp thu, 2
        je th3
        cmp thu, 3
        je th4
        cmp thu, 4
        je th5
        cmp thu, 5
        je th6
        cmp thu, 6
        je th7     
        
    chn: lea dx, cn
        jmp inthu    
    th2: lea dx, t2
        jmp inthu
    th3: lea dx, t3
        jmp inthu
    th4: lea dx, t4
        jmp inthu
    th5: lea dx, t5
        jmp inthu
    th6: lea dx, t6
        jmp inthu
    th7: lea dx, t7
        jmp inthu
      inthu:   
        mov ah, 9
        int 21h
        
     endm
.code

   
     
                     
    
                 
                 
    ;--------- Main-----------
    
    main proc
       
       mov ax, @data
       mov ds, ax
       
        mov ah, 2ah
        int 21h
        
        mov thu, al
        
        mov ngay, dl
        mov thang, dh
        mov nam, cx
        
        inthu thu
        printDate ngay, thang, nam
       
       
       mov ah, 4ch
       int 21h
    main endp
    
    
  
    
    ;------ In so thap phan -------
    printDec proc
        xor cx, cx
            chia:
                mov dx, 0
                div chia10
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


            
        ret
        printDec endp
    
   
   
       
end