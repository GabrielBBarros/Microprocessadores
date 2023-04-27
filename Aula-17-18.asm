
1)
//Jeito médio
mov dh, 4
mov cx, 101
mov si, 200
->mov al, [si]
shl al, 2
mov [si], al 
inc si
<-loop
int 20



//Jeito fácil
1)
mov cx, 101
mov si, 200
->shl byte ptr [si], 2
inc si
<-loop
