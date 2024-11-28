mov ax, 0x07c0    ; 0x07c0 -> ax
mov ds, ax        ; ax -> dx

mov ah, 0x0       ; 0x0 -> ah
mov al, 0x3       ; 0x3 -> al
int 0x10          ; 映像の出力を管理するBIOS(0x10)にint命令で割り込み 

mov si, msg       ; msg を si へ動かす。ソースインデックスに msg を格納
mov ah, 0x0E      ; 0x0E を ah へ動かす。画面の文字列を 0x10 へ割り込み可能に@

; ループ開始
print_character_loop:    
lodsb             ; lodsb命令 si から al に1byteロードする  

or al, al         ; al(0x3)と(0x3)をor演算。文字列が0になり終わると、プロセッサはオペランドの位置にジャンプ 
jz hang

cmp al, 13        ; alと13 (キャリッジリターン) を比較
je carriage_return ; キャリッジリターンなら carriage_return ラベルへジャンプ

cmp al, 10        ; alと10 (ラインフィード) を比較
je line_feed      ; ラインフィードなら line_feed ラベルへジャンプ

int 0x10          ; 文字列を画面にプリントする
jmp print_character_loop    ; ループの先頭に戻り、文字列が終わりでなければ次の文字をプリントする。

carriage_return:
mov ah, 0x0E      ; 0x0E を ah へ動かす。画面の文字列を 0x10 へ割り込み可能に@
mov al, 0         ; 0 (キャリッジリターン) を al へ動かす
int 0x10          ; キャリッジリターンを画面にプリントする
jmp print_character_loop    ; ループの先頭に戻る

line_feed:
mov ah, 0x0E      ; 0x0E を ah へ動かす。画面の文字列を 0x10 へ割り込み可能に@
mov al, 10        ; 10 (ラインフィード) を al へ動かす
int 0x10          ; ラインフィードを画面にプリントする
jmp print_character_loop    ; ループの先頭に戻る

; ループここまで

msg:
db 'Hello, World!', 13, 10, 'This is a XeroOS v1.1.0', 13, 10, 0    ; db => これらの値をmsgアドレスに格納する

hang:
jmp hang

times 510-($-$$) db 0

db 0x55
db 0xAA