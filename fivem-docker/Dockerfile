# Usar una imagen base de Ubuntu
FROM ubuntu:20.04

# Configurar el entorno
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /fivem

# Instalar dependencias
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    mariadb-client \
    screen

# Descargar la última build de FiveM
RUN curl -O https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/latest.tar.xz && \
    mkdir fxserver && \
    tar -xvf latest.tar.xz -C fxserver && \
    rm latest.tar.xz

# Copiar archivos de configuración al contenedor
COPY server-data /fivem/server-data

# Exponer los puertos necesarios
EXPOSE 30120/udp 30120/tcp 40120

# Comando de inicio del servidor
CMD ["./fxserver/run.sh", "+exec", "/fivem/server-data/server.cfg"]
