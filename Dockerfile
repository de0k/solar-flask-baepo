FROM python:3.10.7

# 컨테이너 내부에 코드를 복사할 디렉토리를 생성합니다.
WORKDIR /usr/src/app

# requirements.txt 파일을 먼저 복사해서 이미지 빌드 시에 패키지를 설치합니다.
COPY requirements.txt ./

# requirements.txt에 명시된 패키지들을 설치합니다.
RUN pip install --no-cache-dir -r requirements.txt

# 현재 디렉토리에 있는 모든 파일을 컨테이너 내 WORKDIR로 복사합니다.
COPY . .

# Flask 서버가 외부에서 접근 가능하도록 포트를 설정합니다.
EXPOSE 5000

# 컨테이너를 실행할 때 Flask 애플리케이션을 시작하는 커맨드를 설정합니다.
CMD ["python", "./flask_semi_project.py"]