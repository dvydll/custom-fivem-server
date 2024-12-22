```bash
custom-fivem-server/
├── terraform/                # Configuración de Terraform
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
├── fivem-docker/             # Contenedor de Docker para el servidor FiveM
│   ├── Dockerfile
│   ├── docker-compose.yml
│   └── server/               # Archivos del servidor
│       ├── server-data/
│       │   ├── resources/
│       │   │   ├── [esx]
│       │   │   │   ├── es_extended/
│       │   │   │   └── mysql-async/
│       │   │   ├── [jobs]
│       │   │   │   ├── esx_policejob/
│       │   │   │   └── esx_mechanicjob/
│       │   │   ├── [clothing]
│       │   │   │   └── ropa_realista/
│       │   │   ├── [cars]
│       │   │   │   ├── bmw_m4/
│       │   │   │   └── audi_r8/
│       │   │   ├── [emotes]
│       │   │   │   ├── dpemotes/
│       │   │   └── [scripts]
│       │   │       ├── esx_marriage/
│       │   │       └── esx_society/
│       │   └── server.cfg
│       └── fxserver/         # Se descarga automáticamente
├── README.md 
├── terraform.sh 
└── up-server.sh 
```