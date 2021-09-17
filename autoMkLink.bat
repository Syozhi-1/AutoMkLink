@echo off
::后续命令使用的是：UTF-8编码
chcp 65001
::启用 "延缓环境变量扩充"
setlocal EnableDelayedExpansion

set path=%cd%
set dir_num=0
set now_i=0

set /p "destPath=输入需要创建目录链接的路径: "
if defined destPath (
	for /d %%i in (*) do (
		IF NOT EXIST %destPath%\%%i (
			set /a dir_num+=1
		)
	)
	for /d %%i in (*) do (
		IF NOT EXIST %destPath%\%%i (
			set src_path=%path%\%%i
			set "commend=mklink /j %destPath%\%%i !src_path!"
			!commend!
			IF EXIST %destPath%\%%i (
				set /a now_i+=1
			)
		)
	)
	if !dir_num!==0 (
		echo 没有可以创建目录链接的文件夹！
	) else (
		echo 完成 !now_i!/!dir_num!
	)
)else echo 路径为空！
pause