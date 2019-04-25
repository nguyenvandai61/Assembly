.model tiny
.stack 100h
.data
    msg1 DB 13, 10, 'Tong cac phan tu chia het cho 7:$'
    msg2 DB 13, 10, '$'
    m DB 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
    a DB 0
.code
    main proc
           mov ax, @data
           mov ds, ax
           
           lea dx, msg1
           mov ah, 9
           int 21h
           
           mov cx, 20
           lea si, m
           
           mov a, 0
           duyet:
            mov al,[si] 
            mov bl, 7
            
            mov ah, 0
            
            div bl
            cmp ah, 0
            je tong
            jmp tiep
            tong:
                mov al, [si]
                mov bl, a
                add al, bl
                mov a, al
            tiep:
                inc si
                inc dl
                loop duyet
                
            mov al, a
            mov bl, 10
            mov cx, 0
            chia:
                mov ah, 0
                div bl
                mov dl, ah
                add dl, 30h
                push dx
                inc cx
                cmp al, 0
                je inso
                jmp chia
                
                inso:
                    pop dx
                    mov ah, 2
                    int 21h
                    loop inso
           ra:
            mov ah, 4ch
            int 21h
            main endp
    end main