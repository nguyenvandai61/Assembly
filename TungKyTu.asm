; Tao tep moi, doc ban phim, ghi ra tep, doc lai
; hien thi (tung ky tu)

.model small
.stack 100h

.data
    file  db  "file.txt", 0
    handle dw ?      ; Con tro tep
    xuongdong db 10, 13, '$'
    buffer db ? 
.code
main proc
        mov ax, @data              ;<- put in the execution path!
        mov ds, ax                 ;<- so below "main proc"

        mov ah,3ch
        mov cx,0
        lea dx, file
        int 21h
        
        ; Tao file that bai 
        jc thoat                   


        ; Tao file thanh cong
        mov handle, ax

        
        
        
        ; Nhap ky tu
        LapDoc:            
        mov ah, 1
        int 21h
        cmp al, 13
        
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
        
        mov ah, 4ch
        mov al, 0
        int 21h
main endp

