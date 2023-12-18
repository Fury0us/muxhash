#!/bin/bash
intro() {
if [ /usr/bin/openssl ]
then
echo
echo $'\e[1;36mopenssl is installed\e[0m'
else
pkg install openssl &&
apt install openssl &&
pkg install openssl-tool &&
apt install openssl-tool
echo
fi
echo
if [ /usr/bin/figlet ]
then
figlet MUXHASH
else
pkg install figlet -yy
clear
figlet muxhash
fi
}
main_menu() {
PS3=("#main:")
mainm=("Base" "Ssl" "Decrypt" "exit")
select m in "${mainm[@]}"; do
case $m in
"Base")
echo
base
;;
"Ssl")
echo
ssl
;;
"Decrypt")
echo
dcrip
;;
"exit")
echo
exit
;;
esac
done
}
dcrip() {
PS3=("#dcrip: ")
dcripn=("Base" "Ssl" "Main Menu")
select dcr in "${dcripn[@]}"; do
case $dcr in
"Base")
echo
read -p $'\e[1;31m 64, 32, 32hex, 21sbf or 16?: \e[0m' bn
echo
read -p $'\e[1;31mInfile?: \e[0m' infl
echo
read -p $'\e[1;31mSave to File?: \e[0m' contin
if [ $contin = "yes" ] || [ $contin = "y" ]
then
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
basenc $infl -d --base$bn > $outf
echo
else
basenc $infl -d --base$bn
fi
echo
dcrip
;;
"Ssl")
echo
read -p $'\e[1;31mInfile?: \e[0m' infl
echo
read -p $'\e[1;31mCipher?: \e[0m' ciphr
echo
read -p $'\e[1;31mSave to File?: \e[0m' contin
echo
if [ $contin = "yes" ] || [ $contin = "y" ]
then
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
openssl enc -d $ciphr -in $infl > $outf
echo
else
echo
openssl enc -d $ciphr -in $infl
echo
fi
echo
dcrip
;;
"Main Menu")
echo
main_menu
;;
esac
done
}
base() {
PS3=("#base: ")
bas=("String to String" "String to File" "File to File" "File to String" "Main Menu" "Exit")
select ba in "${bas[@]}"; do
case $ba in
"String to String")
echo
sts
;;
"String to File")
echo
stf
;;
"File to File")
echo
ftf
;;
"File to String")
echo
fts
;;
"Main Menu")
echo
main_menu
;;
"Exit")
echo
exit
;;
esac
done
}
ssl() {
PS3=("#ssl: ")
ohpen=("AES" "ARIA" "CAMELLIA" "DES" "Main Menu" "Exit")
select ohp in "${ohpen[@]}"; do
case $ohp in
"AES")
echo
0aes
;;
"ARIA")
echo
aria
;;
"CAMELLIA")
echo
0camellia
;;
"DES")
echo
0des
;;
"Main Menu")
echo
main_menu
;;
"Exit")
echo
exit
;;
esac
done
}
0aes() {
PS3=("#aes: ")
kaes=("aes256" "aes192" "aes128" "aes (CUSTOM)" "Previous Menu" "Main Menu" "Exit")
select ka in "${kaes[@]}"; do
case $ka in
"aes256")
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aes256 -k $pass > $outf
echo
0aes
;;
"aes192")
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aes192 -k $pass > $outf
0aes
;;
"aes128")
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aes128 -k $pass > $outf
echo
0aes
;;
"aes (CUSTOM)")
echo
aescust
;;
"Previous Menu")
echo
ssl
;;
"Main Menu")
echo
main_menu
;;
"Exit")
echo
exit
;;
esac
done
}
aescust() {
PS3=("#aesc: ")
aecustom=("cbc" "cfb" "cfb1" "ctr" "ecb" "ofb" "cfb1" "cfb8" "Previous Menu" "SSL" "Exit")
select aec in "${aecustom[@]}"; do
case $aec in
"cbc")
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aes-$btn-cbc -k $pass > $outf
echo
aescust
;;
"cfb1")
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aes-$btn-cfb1 -k $pass > $outf
echo
aescust
;;
"ctr")
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aes-$btn-ctr -k $pass > $outf
echo
aescust
;;
"ecb")
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aes-$btn-ecb -k $pass > $outf
echo
aescust
;;
"ofb")
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aes-$btn-ofb -k $pass > $outf
echo
aescust
;;
"cfb1")
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aes-$btn-cfb1 -k $pass > $outf
echo
aescust
;;
"cfb8")
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aes-$btn-cfb8 -k $pass > $outf
echo
aescust
;;
"Previous Menu")
echo
0aes
;;
"SSL")
echo
ssl
;;
"Exit")
echo
exit
;;
esac
done
}
aria() {
PS3=("#aria: ")
ariaenc=("ariacustom" "aria256" "aria192" "aria128" "Previous Menu")
select ari in "${ariaenc[@]}"; do
case $ari in
"ariacustom")
echo
ariacust
;;
"aria256")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aria256 -k $pass > $outf
echo
aria
;;
"aria192")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aria192 -k $pass > $outf
echo
aria
;;
"aria128")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aria128 -k $pass > $outf
echo
aria
;;
"Previous Menu")
echo
ssl
;;
esac
done
}
ariacust() {
PS3=("#ariac: ")
ariacusto=("cbc" "cfb" "cfb1" "cfb8" "ctr" "ecb" "ofb" "SSL" "Previous Menu")
select ar in "${ariacusto[@]}"; do
case $ar in
"cbc")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aria-$btn-cbc -k $pass > $outf
echo
aria
;;
"cfb")
echo
read -p $'\e[1;31mMEssage?: \e[0m' encmsg
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aria-$btn-cfb -k $pass > $outf
echo
aria
;;
"cfb1")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aria-$btn-cfb1 -k $pass > $outf
echo
aria
;;
"cfb8")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aria-$btn-cfb8 -k $pass > $outf
echo
aria
;;
"ctr")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aria-$btn-ctr -k $pass > $outf
echo
aria
;;
"ecb")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aria-$btn-ecb -k $pass > $outf
echo
aria
;;
"ofb")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -aria-$btn-ofb -k $pass > $outf
echo
aria
;;
"SSL")
echo
ssl
;;
"Previous Menu")
echo
aria
;;
esac
done
}
0camellia() {
PS3=("camellia: ")
camell=("cbc" "cfb" "cfb1" "cfb8" "ctr" "ecb" "ofb" "Previous Menu" "Exit")
select cam in "${camell[@]}"; do
case $cam in
"cbc")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -camellia-$btn-cbc -k $pass > $outf
echo
ssl
;;
"cfb")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31m128, 192, 256?: \e[0mm' btn
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -camellia-$btn-cfb -k $pass > $outf
echo
ssl
;;
"cfb1")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -camellia-$btn-cfb1 -k $pass > $outf
echo
ssl
;;
"cfb8")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -camellia-$btn-cfb8 -k $pass > $outf
echo
ssl
;;
"ctr")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -camellia-$btn-ctr -k $pass > $outf
echo
ssl
;;
"ecb")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -camellia-$btn-ecb -k $pass > $outf
echo
ssl
;;
"ofb")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31m128, 192, 256?: \e[0m' btn
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -camellia-$btn-ofb -k $pass > $outf
echo
ssl
;;
"Previous Menu")
echo
ssl
;;
"Exit")
echo
exit
;;
esac
done
}
0des() {
PS3=("#des: ")
desenc=("des3" "des-ede3" "des(custom)" "Previous Menu" "Exit")
select dese in "${desenc[@]}"; do
case $dese in
"des3")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -des3 -k $pass > $outf
echo
ssl
;;
"des-ede3")
echo
desede
;;
"des(custom)")
echo
descust
;;
"Previous Menu")
echo
ssl
;;
"Exit")
echo
exit
;;
esac
done
}
desede() {
PS3=("#dede3: ")
desed=("cbc" "cfb" "cfb1" "cfb8" "ecb" "ofb" "Previous Menu" "Exit")
select dese in "${desed[@]}"; do
case $dese in
"cbc")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -des-ede3-cbc -k $pass > $outf
echo
ssl
;;
"cfb")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -des-ede3-cfb -k $pass > $outf
echo
ssl
;;
"cfb1")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -des-ede3-cfb1 -k $pass > $outf
echo
ssl
;;
"cfb8")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mOutfile? \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -des-ede3-cfb8 -k $pass > $outf
echo
ssl
;;
"ecb")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssll enc -c -des-ede3-ecb -k $pass > $outf
echo
ssl
;;
"ofb")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -des-ede3-ofb -k $pass > $outf
echo
ssl
;;
"Previous Menu")
echo
0des
;;
"Exit")
echo
exit
;;
esac
done
}
descust() {
PS3=("#desc:")
descustommenc=("cbc" "cfb" "cfb1" "cfb8" "ecb" "ede" "ofb" "Previous Menu" "Exit")
select descu in "${descustommenc[@]}"; do
case $descu in
"cbc")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -des-cbc -k $pass > $outf
echo
descust
;;
"cfb")
echo
read -p $'\e[1;31Message?: \e[0m' encmsg
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -des-cfb -k $pass > $outf
echo
descust
;;
"cfb1")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -des-cfb1 -k $pass > $outf
echo
descust
;;
"cfb8")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -des-cfb8 -k $pass > $outf
echo
descust
;;
"ecb")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -des-ecb -k $pass > $outf
echo
descust
;;
"ede")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -des-ede -k $pass > $outf
echo
descust
;;
"ofb")
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31mPassword?: \e[0m' pass
echo
echo $encmsg | openssl enc -e -des-ofb -k $pass > $outf
echo
descust
;;
"Previous Menu")
echo
ssl
;;
"Exit")
echo
exit
;;
esac
done
}
sts() {
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31m64, 32, 32hex, 21sbf, or 16?: \e[0m' bn
echo
echo $encmsg | basenc --base$bn
echo
base
}
stf() {
echo
read -p $'\e[1;31mMessage?: \e[0m' encmsg
echo
read -p $'\e[1;31m64, 32, 32hex, 21sbf, or 16?: \e[0m' bn
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
echo $encmsg | basenc --base$bn > $outf
echo
base
}
ftf() {
echo
read -p $'\e[1;31mInfile?: \e[0m' infl
echo
read -p $'\e[1;31mOutfile?: \e[0m' outf
echo
read -p $'\e[1;31m64, 32, 32hex, 21sbf, or 16?: \e[0m' bn
echo
basenc $infl --base$bn > $outf
echo
base
}
fts() {
echo
read -p $'\e[1;31mInfile?: \e[0m' infl
echo
read -p $'\e[1;31m 64 32 32hex 21sbf or 16?: \e[0m' basn
echo
basenc $infl --base$basn
echo
base
}
intro
main_menu
