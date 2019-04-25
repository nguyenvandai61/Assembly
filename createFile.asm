; Tao tep moi, doc ban phim, ghi ra tep, doc lai
; hien thi (tung ky tu)

.model small
.stack 100h

.data
    file  db  "file.txt", 0
    handle dw ?                 ; Con tro tep
    content db 20,?,21 dup('$')
    xuongdong db 10, 13, '$'    
    buffer db 20,?, 21 dup('$') ;
.code
main proc
        mov ax, @data              
        mov ds, ax                 

        mov ah,3ch
        mov cx,0
        lea dx, file
        int 21h
        
        ; Tao file that bai 
        jc thoat                   


        ; Tao file thanh cong
        mov handle, ax

        
        
        
        ; Nhap xau
        
        lea dx, content      
        mov ah, 0Ah
        int 21h
       
       
;        
        
        xor cx, cx
        xor dx, dx
        
        lea si, content
         
        mov cl, si+1
        lea dx, si+2
        
        ; Tien hanh ghi file bx noi dung dx
        mov ah,40h
        mov bx, handle 
        int 21h
     
        
        lea dx, xuongdong   
        mov ah, 09
        int 21h
        
        
        ; Mo file
        mov ah, 3dh
        xor al, al

        lea dx, file
        int 21h ; Mo file
        jc thoat;

        
        
        ; Doc file
	    mov bx, ax 
        mov ah, 3fh
        lea dx, buffer
        
        mov cx, 20
        int 21h
        jc thoat; Doc file bi loi


        
        
	    ;In ra block ky tu	       
        mov ah, 09h
        int 21h
        
        
        
        ; Dong tep tin
        mov ah, 3eh
        int 21h

thoat:
        mov ah, 4ch
        mov al, 0
        int 21h
main endp

