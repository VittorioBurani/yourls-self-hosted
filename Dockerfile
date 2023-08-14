# Use official pre-built YOURLS image:
FROM yourls

# Expect USE_LINKLIST argument:
ARG USE_LINKLIST

# Install dependencies:
RUN apt update \
    && apt -y install \
        wget \
        xz-utils

# Run plugin installer script:
COPY ./plugin_installer.sh .
RUN ./plugin_installer.sh ${USE_LINKLIST} \
    && rm ./plugin_installer.sh

# Remove not anymore needed dependencies:
RUN apt -y remove \
        wget \
        xz-utils \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
