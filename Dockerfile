FROM alphine:latest

LABEL "version"="0.0.1"
LABEL "com.github.actions.name"="Debug APK Publisher"
LABEL "com.github.actions.description"="Build & Publish Debug APK on Github for testing purposes"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/ShaunLWM/action-release-debugapk"
LABEL "maintainer"="ShaunLWM"

RUN apt-get update \
    && apt-get install software-properties-common -y --no-install-recommends \
    && add-apt-repository ppa:cpick/hub \
    && apt-get update \
    && apt-get install hub -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]