#!/bin/bash

# Gitのユーザー名を設定
git config --local user.name "takeshiemoto"
# Gitのメールアドレスを設定
git config --local user.email "private.takeshiemoto@gmail.com"
# 設定が正しく行われたか確認
git config --local --get user.name
git config --local --get user.email
