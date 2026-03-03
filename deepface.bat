@echo off
setlocal enabledelayedexpansion

cd /D "%~dp0"

REM 1) venv
if not exist ".venv\" (
  py -3.8 -m venv .venv
)

call ".venv\Scripts\activate.bat"

REM 2) pip base
python -m pip install --upgrade pip setuptools wheel

REM 3) deps
python -m pip install numpy==1.21.6 h5py numexpr protobuf==3.20.1
python -m pip install opencv-python==4.8.0.74 opencv-contrib-python==4.8.0.74
python -m pip install pyqt6==6.5.1 onnx==1.14.0

REM 4) вибір бекенду: CUDA або DirectML
REM Якщо хочеш DirectML: розкоментуй 2 рядки нижче і закоментуй CUDA-блок
REM python -m pip install onnxruntime-directml==1.15.1
REM goto RUNAPP

REM CUDA (NVIDIA)
python -m pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 -f https://download.pytorch.org/whl/torch_stable.html
python -m pip install onnxruntime-gpu==1.15.1

:RUNAPP
REM папка для юзерданих
if not exist "userdata\" mkdir userdata
if not exist "userdata\dfm_models\" mkdir userdata\dfm_models

REM 5) запуск додатка
python launcher.py

pause
endlocal