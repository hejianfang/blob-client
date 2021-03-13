#!/bin/bash

# 安装依赖
cnpm install

# 打包
npm run build

# 删除 ngnix 指向的文件夹下的文件
rm -rf /usr/my-blog/blob-serve/public/dist

# 将打包好的文件复制过去
mv /tmp/blob-client/client/dist/* /usr/my-blog/blob-serve/public/dist

# 删除 clone 的代码
rm -rf /tmp/blob-client/client