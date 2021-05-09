FROM ghcr.io/chia-network/chia:latest as chia

#RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get upgrade -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata neovim

WORKDIR /chia-blockchain 

RUN /bin/bash -c '      source ./activate && \
                        pip install --force-reinstall git+https://github.com/ericaltendorf/plotman@main && \
                        chia init'

RUN /bin/bash -c '      curl -s https://api.github.com/repos/hairyhenderson/gomplate/releases/latest \
                        | grep -e "browser_download_url.*gomplate_linux-amd64" \
                        | cut -d : -f 2,3 \
                        | tr -d \" \
                        | wget -qi - \
                        && chmod +x gomplate_linux-amd64 && mv gomplate_linux-amd64 gomplate'

COPY plotman.tmpl.yaml .
COPY entrypoint.sh .

ENTRYPOINT ["/chia-blockchain/entrypoint.sh"]
