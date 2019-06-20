#!/bin/zsh

# todo: count how much space has been freed

#read yn

files[1]=()
files+=(/home/user/.config/sublime-text-3/Cache/)
files+=(/home/user/.config/VK/Cache/)
files+=(/home/user/.gradle/caches/)
files+=(/home/user/.gradle/daemon/)
files+=(~/Desktop)
files+=(~/.yjp)

for file in ~/Downloads/*
do
    file=${file%*/}      # remove the trailing "/"
    #echo ${file##*/}    # print everything after the final "/"

    if [ "${file##*/}" = "Telegram Desktop" ]; then
        if [ "$(ls -A ~/Downloads/Telegram\ Desktop/)" ]; then
            for telegramFile in ~/Downloads/Telegram\ Desktop/*
            do
                files+=(${telegramFile})
            done
        fi
    else
        files+=(${file})
    fi
done

for file in ${files}
do
    if [ -d ${file} ]; then
        echo "${file}"
        rm -r ${file}
    fi
done
