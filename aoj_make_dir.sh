#!/bin/bash

# 入力を促すメッセージを表示
echo "問題名を入力してください："
read -r name
mkdir -p "AOJ/$name"
cd "AOJ/$name" && touch "$name.hs"
echo "DONE."
