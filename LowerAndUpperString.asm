.model small
.stack 50
.data
    msg1 DB 'Nhap vao mot chuoi: $'
    msg2 DB 10, 13, 'Doi thanh chuoi thuong: $'
    msg3 DB 10, 13, 'Doi thanh chuoi hoa: $'
    s DB 100,?,101 dup('$')
.code
    begin:
        mov ax, @data
        mov ds, ax
        
        ; In ra msg1
        lea dx, msg1
        mov ah, 9
        int 21h
        
        ; Doc xau vao dx
        mov ah, 0AH
        lea dx, s
        int 21h
                    
        ; In ra msg2            
        lea dx, msg2
        mov ah, 09h
        int 21h
        
        ; In chuoi thuong
        call InChuoiThuong
        
        ; In ra msg3
        lea dx, msg3
        mov ah, 09h
        int 21h     
        
        ; In chuoi hoa
        call InChuoiHoa
        
        ; End DOS              
        mov ah, 4ch
        int 21h
        
        ;****************
        InChuoiThuong proc
            lea si, s+1
            xor cx, cx
            mov cl, [si]
            inc si
            LapThuong:
                ; In ky tu
                mov ah, 02h
                mov dl,[si]
                cmp dl, 'A'
                jb LT1
                cmp dl, 'Z'
                ja LT1
                
                ; Thuong ky tu
                add dl, 20h
                LT1: inc si
                     int 21h
                
            loop LapThuong
            ret
        InChuoiThuong endp
        ;***************  
        InChuoiHoa proc
            ; [s+1] la length cua xau
            lea si, s+1
            xor cx, cx
            mov cl, [si]
            inc si
            LapHoa:          
                ; In ky tu
                mov ah, 02h
                mov dl, [si]
                cmp dl, 'a'
                jb LH1
                cmp dl, 'z'
                ja LH1
                ; Hoa ky tu
                sub dl, 20h
                LH1: inc si
                     int 21h
             loop LapHoa
             ret
         InChuoiHoa endp 
        ;*****************
    end        
    
        
        
        
        