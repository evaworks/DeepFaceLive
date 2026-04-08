@echo off
echo Installing PyInstaller...
call "%~dp0venv\Scripts\pip install pyinstaller"

echo.
echo Building executable...
call "%~dp0venv\Scripts\pyinstaller" main.py ^
    --name DeepFaceLive ^
    --onefile ^
    --console ^
    --add-data "apps;apps" ^
    --add-data "xlib;xlib" ^
    --add-data "modelhub;modelhub" ^
    --add-data "resources;resources" ^
    --add-data "doc;doc" ^
    --hidden-import=PyQt6 ^
    --hidden-import=PyQt6.Qt6 ^
    --hidden-import=PyQt6_sip ^
    --hidden-import=cv2 ^
    --hidden-import=torch ^
    --hidden-import=torchvision ^
    --hidden-import=onnx ^
    --hidden-import=onnxruntime ^
    --hidden-import=onnxruntime_gpu ^
    --hidden-import=numpy ^
    --hidden-import=sklearn ^
    --hidden-import=scipy ^
    --collect-all PyQt6 ^
    --collect-all torch ^
    --collect-all onnxruntime ^
    --clean

echo.
echo Build complete! Executable is in dist folder.
pause
