# 基础镜像：选择稳定的 Python 3.11 轻量版
FROM python:3.11-bullseye

# 设置环境变量：避免 Python 缓冲输出，Streamlit 禁用自动更新
ENV PYTHONUNBUFFERED=1
ENV STREAMLIT_SERVER_HEADLESS=true
ENV STREAMLIT_SERVER_PORT=8501
ENV STREAMLIT_SERVER_ADDRESS=0.0.0.0

# 设置工作目录
WORKDIR /app

# 复制依赖文件并安装（国内源加速）
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

# 确保 requirements.txt 里包含 streamlit（如果没有，手动加一行 streamlit>=1.30.0）
RUN pip install --no-cache-dir streamlit -i https://pypi.tuna.tsinghua.edu.cn/simple

# 复制整个项目代码
COPY . .

# 暴露 Streamlit 默认端口 8501（必须）
EXPOSE 8501

# 启动命令：适配你的 Streamlit 启动方式
CMD ["streamlit", "run", "app.py"]