# Usar una imagen base de Ubuntu
FROM ubuntu:20.04

# Configurar el entorno
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /fivem

# Instalar dependencias
RUN apt-get update && apt-get install -y \
    xz-utils \
    curl \
    git \
    unzip \
    mariadb-client \
    screen \
    tar

# Descargar la última build de FiveM desde la nueva URL
RUN curl -O https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/12092-c9700385dfad9008c8b7888a61d3901451c4dc29/fx.tar.xz && \
    if [ ! -f fx.tar.xz ]; then \
        echo "Failed to download FiveM artifact"; \
        exit 1; \
    fi && \
    mkdir fxserver && \
    tar -xvf fx.tar.xz -C fxserver && \
    rm fx.tar.xz

# Copiar archivos de configuración al contenedor
COPY ./fivem/server-data /fivem/server-data

# Exponer los puertos necesarios
EXPOSE 30120/udp 30120/tcp 40120

# Comando de inicio del servidor
CMD ["./fxserver/run.sh", "+exec", "/fivem/server-data/server.cfg"]
