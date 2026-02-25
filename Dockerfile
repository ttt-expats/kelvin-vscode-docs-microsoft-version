FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    curl \
    libatomic1 \
    ca-certificates \
    python3 \
    python3-pip \
    gh \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' \
    --output /tmp/vscode.tar.gz && \
    tar -xf /tmp/vscode.tar.gz -C /usr/local/bin && \
    rm /tmp/vscode.tar.gz

RUN pip3 install --break-system-packages kelvin-sdk
RUN pip3 install --break-system-packages \
    "markdown>=3.8" \
    "mkdocs==1.6.1" \
    "mkdocs-material>=9.7.0" \
    "mkdocs-material-extensions>=1.3.1" \
    "pymdown-extensions>=10.15" \
    "pygments>=2.19.1" \
    "mike>=2.1.3" \
    "mkdocs-rss-plugin>=1.17.1" \
    "mkdocs-glightbox>=0.4.0" \
    "mkdocs-git-revision-date-localized-plugin>=1.4.5" \
    "robotframework==7.4.1" \
    "robotframework-browser==19.12.5" \
    "Pillow==12.1.1" \
    "python-dotenv==1.0.0"

RUN python3 -m Browser.entry init chromium

RUN useradd -m -s /bin/bash abc

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /home/abc
EXPOSE 23888
ENTRYPOINT ["/entrypoint.sh"]
