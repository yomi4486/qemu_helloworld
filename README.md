### QEMU上で文字を表示するサンプル（自作OS的な何か）
アセンブリを使ったQEMU上で起動可能なプログラムです。
<table>
<tr>
<td>
参考文献
</td>
</tr>
<tr>
<td>

- [簡易的なOS自作 (Qiita)](https://qiita.com/suwa3/items/80574687644d70729be1)<br>
- [print string with bios interrupt 0x10 (StackOverflow)](https://stackoverflow.com/questions/27332266/print-string-with-bios-interrupt-0x10)<br>
- [https://programmer.main.jp/assembler/0_1.html](https://programmer.main.jp/assembler/0_1.html)<br>
</td>
</tr>
<table>

OSの起動
```
make run
```
バイナリファイルの削除
```
make clean
```
パッケージのインストール(Homebrewが入ってる場合)
```
make install
```
> Homebrewがインストールされていない場合は、`package.txt`内のライブラリをインストールしてください。
