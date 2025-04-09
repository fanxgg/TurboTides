@echo off
echo 开始部署网站更新...

REM 构建网站
hugo --minify

REM 切换到public目录
cd public

REM 添加更改
git add .

REM 提交更改
set /p commit_msg="输入提交信息: "
git commit -m "%commit_msg%"

REM 推送到gh-pages分支
git push origin main:gh-pages

echo 网站更新完成!
cd ..