#!/bin/bash

#入力引数チェック
echo "Enter the first number :"
read a
echo "Enter the second number : "
read b

#計算
if [ $a -gt $b ]
then
num=$a
den=$b
else
num=$b
den=$a
fi
r=`expr $num % $den`

while [ $r -ne 0 ]
do
num=$den
den=$r
r=`expr $num % $den`
done

gcd=$den

if [ $den -lt 0 ]
then
        echo "自然数ではありません"
        exit 0
else
        echo " The GCD of $a and $b is : $gcd"
        exit 1
fi

#動作確認
#error終了せずに誤った答えが出力されるケース。
#一方、または双方の数値がマイナスの場合:-4 10; 10 -4;-4 -10 
./saidai.sh 0 >~/kadai4/err || error_func "自然数ではありません"
 

#erro終了するケース。
#1 一方、または双方の数値が０の場合:0 0; 10 0; 0 10
#"expr: division by zero" "unary operator expected"
#2 一方、または双方の数値が整数でない場合、またはそもそも数値でない場合:1.5 10.5; 15 10.5; 1.5 10; 5_5 10-5
#"expr: non-integer argument" "integer expression expected" "unary operator expected"
