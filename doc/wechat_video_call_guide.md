# 微信视频换脸配置指南

## 概述

通过 DeepFaceLive + OBS + VBCable 实现微信视频通话实时换脸。

## 所需软件

### 1. VBCable (虚拟音频驱动)
- 作用：创建虚拟音频线，将麦克风声音转发到虚拟设备
- 下载：https://github.com/iperov/DeepFaceLive/releases/download/VBCABLE/VBCABLE_Driver_Pack43.zip
- 安装：运行 `VBCABLE_Setup_x64.exe`
- 状态：已安装 ✅

### 2. AudioRepeater (音频同步)
- 作用：同步音频延迟，与视频保持同步
- 下载：https://github.com/iperov/DeepFaceLive/releases/download/AUDIOREPEATER/audiorepeater.exe
- 位置：`C:\Local\DeepFaceLive\audiorepeater.exe`
- 状态：已下载 ✅

### 3. OBS Studio
- 作用：窗口捕获 + 虚拟摄像头
- 下载：https://obsproject.com
- 状态：需用户手动安装 ⚠️

## 配置步骤

### 第一步：安装 OBS Studio
1. 访问 https://obsproject.com 下载安装包
2. 安装并启动 OBS

### 第二步：配置 AudioRepeater
1. 运行 `audiorepeater.exe`
2. Wave In：选择你的麦克风
3. Wave Out：选择 **CABLE Input (VB-Audio)**
4. Total buffer(ms)：设为 **500**（与 DeepFaceLive 的 Target Delay 一致）
5. 点击 Start

### 第三步：运行 DeepFaceLive
1. 运行 `run.bat`
2. 在 Stream Output 中设置 **Target Delay = 500ms**
3. 配置换脸参数（参考下文最佳设置）

### 第四步：配置 OBS
1. 来源 → 点击 **"+"**
2. 选择 **"窗口捕获"**
3. 窗口选择 **"DeepFaceLive output"**
4. 调整画面大小适应窗口
5. 右下角点击 **"启动虚拟摄像头"**

### 第五步：微信设置
1. 打开微信视频通话
2. 摄像头选择 **OBS Virtual Camera**
3. 麦克风选择 **CABLE Output (VB-Audio)**

---

## DeepFaceLive 最佳设置

| 模块 | 参数 | 值 |
|------|------|-----|
| **Face Detector** | Detector | YOLOV5 |
| | Device | CUDA |
| | Threshold | 0.5 |
| | Max faces | 1 |
| | Face coverage | 2.2 |
| **Face Aligner** | Face scale | 1.5 |
| **Face Marker** | Type | 2D 106 |
| **Face Merger** | Face blur | 0 |
| | Face sharpen | 0.3 |
| | Color transfer | None |

### Face Swap (Insight) 图片放置
- 路径：`userdata\animatables\`
- 将单人脸图片放入该目录，点击 "Update Faces" 刷新

---

## 常见问题

### 微信视频画面黑框
1. 确保 DeepFaceLive 正在运行
2. 在 OBS 中重新添加窗口捕获
3. 尝试使用"屏幕捕获"替代"窗口捕获"

### 声音不同步
1. 确保 AudioRepeater 的 Buffer 与 DeepFaceLive 的 Target Delay 相同
2. 建议设置为 500ms

---

## 文件位置

| 文件 | 路径 |
|------|------|
| VBCable | 系统已安装 |
| AudioRepeater | `C:\Local\DeepFaceLive\audiorepeater.exe` |
| DeepFaceLive | `C:\Local\DeepFaceLive\` |
| 用户数据 | `C:\Local\DeepFaceLive\userdata\` |