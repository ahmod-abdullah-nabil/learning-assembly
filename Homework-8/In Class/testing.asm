.486
data segment use16
    buf  db 'fhhhhhhh$'
data ends
code segment use16
         assume cs:code,ds:data
    beg: mov    ax,data
         mov    ds,ax
         mov    ah,9
         lea    dx,buf
         int    21h
         mov    ah,4ch
         int    21h
code ends
end beg