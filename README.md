# AppStoreInfo
## Introduction
AppStoreInfo is a simple command-line tool that retrieves the bundle identifier (package name) of an iOS app on the Apple App Store using its App Store ID.
## 简介
AppStoreInfo是一个简单的命令行工具，通过应用在苹果App Store上的App Store ID，获取iOS应用的Bundle Identifier（包名）。
## Installation
### Prerequisites
- Swift installed on your machine
### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/fengyunyongjie/AppStoreInfo.git
   ```
2. Navigate to the project directory:
   ```bash
   cd AppStoreInfo
   ```
3. Build the executable:
   ```bash
   make build
   ```
4. Install the tool:
   ```bash
   sudo make install
   ```
Now, you should be able to use `appstoreinfo` from the command line.
## 安装
### 先决条件
- 在您的计算机上安装了Swift
### 步骤
1. 克隆仓库：
   ```bash
   git clone https://github.com/fengyunyongjie/AppStoreInfo.git
   ```
2. 进入项目目录：
   ```bash
   cd AppStoreInfo
   ```
3. 构建可执行文件：
   ```bash
   make build
   ```
4. 安装工具：
   ```bash
   sudo make install
   ```
   现在，您应该能够在命令行中使用`appstoreinfo`。
## Usage
### Syntax
   ```bash
   appstoreinfo <app-store-id>
   ```
Replace <app-store-id> with the actual App Store ID of the iOS app.
## 使用方法
### 语法
   ```bash
   appstoreinfo <app-store-id>
   ```
将 <app-store-id> 替换为iOS应用的实际App Store ID。
