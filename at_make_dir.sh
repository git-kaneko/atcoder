#!/bin/bash

# 入力を促すメッセージを表示
echo "コンテストナンバーを入力してください："
read -r number
# 数字かどうかチェック
if [[ "$number" =~ ^[0-9]+$ ]]; then
    # ABC+数字の形式でディレクトリ名を作成
    dir_name="ABC$number"
    
    # メインディレクトリを作成
    mkdir -p "$dir_name"
    
    # A～Gのサブディレクトリを作成
    for letter in {A..G}; do
        mkdir -p "$dir_name/$letter"
    done
    
    echo "ディレクトリ $dir_name とその中のA～Gディレクトリを作成しました"
else
    echo "エラー: '$number' は数字ではありません" >&2
fi
