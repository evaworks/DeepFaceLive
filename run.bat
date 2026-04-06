@echo off
cd /d %~dp0
set PATH=C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.8\bin;C:\Program Files\NVIDIA\CUDNN\v9.20\bin\12.9\x64;%PATH%
python main.py run DeepFaceLive --userdata-dir "%~dp0userdata"
pause