@echo off
echo 开始部署网站更新...

REM 检查当前目录是否正确
if not exist "config.toml" (
    echo 错误：请确保在Hugo项目根目录运行此脚本！
    exit /b 1
)

REM 构建网站
echo 正在构建网站...
hugo --minify
if %errorlevel% neq 0 (
    echo 错误：Hugo构建失败！
    exit /b 1
)

REM 切换到public目录
cd public

REM 禁用Jekyll，否则会报错
echo 添加.nojekyll文件...
touch .nojekyll  

REM 检查是否是git仓库
if not exist ".git" (
    echo 错误：public目录不是git仓库！
    cd ..
    exit /b 1
)

REM 添加更改
git add .

REM 提交更改
set /p commit_msg="输入提交信息: "
git commit -m "%commit_msg%"

REM 推送到gh-pages分支
echo 正在推送到GitHub...
git push -f origin main:gh-pages
if %errorlevel% neq 0 (
    echo 警告：推送可能未成功完成，请检查上面的错误信息。
) else (
    echo 成功推送到gh-pages分支！
)

echo 网站更新完成!
cd ..

echo 是否也要提交源文件更改？(Y/N)
set /p commit_source=
if /i "%commit_source%"=="Y" (
    git add .
    set /p source_msg="输入源文件提交信息: "
    git commit -m "%source_msg%"
    git push origin main
    echo 源文件更改已提交并推送！
)