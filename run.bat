@echo off
cd /d %~dp0
set PATH=C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.8\bin;C:\Program Files\NVIDIA\CUDNN\v9.20\bin\12.9\x64;C:\Users\Administrator\AppData\Local\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-8.1-full_build\bin;%PATH%
set SSL_CERT_FILE=%~dp0venv\Lib\site-packages\certifi\cacert.pem
set CUDA_MODULE_LOADING=LAZY
set OMP_NUM_THREADS=4
call "%~dp0venv\Scripts\activate.bat"
python main.py run DeepFaceLive --userdata-dir "%~dp0userdata"
pause