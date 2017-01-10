#! /bin/bash

addr=(
/Users/yujianing/Documents/shell/switchhost
/Users/yujianing/PycharmProjects/python3_learn/actualOutput
/Users/yujianing/Documents/shell/
/Users/yujianing/PycharmProjects/python2_learn/aiml
)

for i in ${addr[@]}
do
    cat $i/*.* | sed -n '/^###=/p'
done

