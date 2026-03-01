FROM ghcr.io/sparfenyuk/mcp-proxy:latest

# Install the 'uv' package
RUN python3 -m ensurepip && pip install --no-cache-dir uv \
    && apk add --update --no-cache nodejs npm git \
    chromium \
    && rm -vrf /var/cache/apk/*

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

RUN cd /home \
    && git clone https://github.com/code-craka/puppeteer-mcp.git \
    && cd puppeteer-mcp \
    && npm install \
    && npm run build:local

ENV PATH="/usr/local/bin:$PATH" \
    UV_PYTHON_PREFERENCE=only-system

ENTRYPOINT [ "mcp-proxy" ]
