# Airflow + Spark + Jupyter + MinIO + Dremio + Nessie

![Build](https://github.com/Sonu-Sukralia/airflow-spark-jupyter-minio-dremio-nessie/actions/workflows/ci.yml/badge.svg)
![Last Commit](https://img.shields.io/github/last-commit/Sonu-Sukralia/airflow-spark-jupyter-minio-dremio-nessie)
![Issues](https://img.shields.io/github/issues/Sonu-Sukralia/airflow-spark-jupyter-minio-dremio-nessie)
![License](https://img.shields.io/github/license/Sonu-Sukralia/airflow-spark-jupyter-minio-dremio-nessie)

Airflow + Spark + Jupyter + MinIO + Dremio + Nessie
Build Last Commit Issues License

You can copy-paste this directly into your repository’s README.md.

A fully containerized end-to-end data platform built with Docker Compose — integrating Apache Airflow, Apache Spark, MinIO, Dremio, Project Nessie, and JupyterLab into one cohesive stack.

This environment provides a local data lakehouse, capable of ETL orchestration, distributed computation, object storage, and SQL-based analytics.

🧩 Components Overview
Service	Image	Ports	Description
Airflow Webserver	sonusukralia/airflow-spark_asm:2.7.1	8080	UI for orchestrating Spark and data pipelines
Airflow Scheduler	sonusukralia/airflow-spark_asm:2.7.1	—	Executes and schedules DAGs
Spark Master	sonusukralia/spark_asm:3.4.0	7077, 9090	Central Spark cluster coordinator
Spark Worker	sonusukralia/spark_asm:3.4.0	—	Executes Spark jobs from the master
Spark History Server	sonusukralia/spark_asm:3.4.0	18080	Job logs and execution history
JupyterLab	sonusukralia/jupyter_spark_asm:3.5	8888, 4040	Interactive notebooks connected to Spark
MinIO	sonusukralia/minio_asm:7.0	9000, 9001	S3-compatible object storage
MinIO Client (mc)	sonusukralia/minio-client_asm:7.0	—	Initializes MinIO buckets and policies
Postgres	sonusukralia/postgres_asm:14.0	5432	Airflow metadata database
Dremio	dremio/dremio-oss:latest	9047, 31010, 32010	Data lakehouse query engine and UI
Nessie	projectnessie/nessie:0.67.0	19120	Git-like version control for data tables
🧱 Architecture
          ┌────────────────────────┐
          │       Airflow           │
          │ (Scheduler & Web UI)    │
          └──────────┬──────────────┘
                     │
   ┌─────────────────┴──────────────────┐
   │         Spark Cluster              │
   │  (Master, Worker, History Server)  │
   └─────────────────┬──────────────────┘
                     │
            ┌────────┴────────┐
            │     MinIO       │───► Object Storage (S3)
            └────────┬────────┘
                     │
            ┌────────┴────────┐
            │     Nessie      │───► Versioned Data Catalog
            └────────┬────────┘
                     │
            ┌────────┴────────┐
            │     Dremio      │───► SQL, BI, and Data Exploration
            └─────────────────┘
All services are connected via the data-platform-network.

🧠 Live Container Status
Below is the live snapshot from your running setup (docker ps output):

CONTAINER ID IMAGE STATUS PORTS 7870a97dd4e2 sonusukralia/airflow-spark_asm:2.7.1 Up (healthy) 0.0.0.0:8080->8080/tcp airflow-webserver 24142fd8984b sonusukralia/jupyter_spark_asm:3.5 Up (unhealthy) 0.0.0.0:8888->8888/tcp, 4040/tcp jupyter-spark 7f6d000284b4 sonusukralia/airflow-spark_asm:2.7.1 Up 8080/tcp airflow-scheduler 50ddbbd5e545 dremio/dremio-oss:latest Up 9047, 31010, 32010/tcp dremio 0bbb21599492 sonusukralia/minio-client_asm:7.0 Up — minio-mc 940864c427b2 sonusukralia/spark_asm:3.4.0 Up — spark-worker 848a933e2b0c sonusukralia/spark_asm:3.4.0 Up 18080/tcp spark-history-server b55d55df9781 projectnessie/nessie:0.67.0 Up 19120/tcp nessie 08a2fdc6838d sonusukralia/postgres_asm:14.0 Up 5432/tcp postgres 3988ee3e37d8 sonusukralia/spark_asm:3.4.0 Up 7077, 9090/tcp spark-master 867e625cd8d9 sonusukralia/minio_asm:7.0 Up 9000-9001/tcp minio

🚀 Quick Start
Clone and start:

git clone https://github.com/Sonu-Sukralia/airflow-spark-jupyter-minio-dremio-nessie.git
cd airflow-spark-jupyter-minio-dremio-nessie
docker-compose up -d


Access services in your browser:

Service	URL
Airflow UI	http://localhost:8080

Spark Master UI	http://localhost:9090

Spark History Server	http://localhost:18080

JupyterLab	http://localhost:8888
For token :- docker logs jupyter-spark | grep token=
and :- echo "http://localhost:8888/?token=$(docker exec jupyter-spark jupyter notebook list | grep -oP '(?<=token=)[a-f0-9]+')"

MinIO Console	http://localhost:9001

Dremio UI	http://localhost:9047

Nessie UI	http://localhost:19120/api/v1/ui/
🧰 Default Credentials
Service	Username	Password
Airflow	admin	admin
MinIO	admin	password
Postgres	airflow	airflow
🧩 Directory Structure
project-root/
├── dags/                # Airflow DAG definitions
├── jobs/                # PySpark job scripts
├── notebooks/           # Jupyter notebooks
├── docker-compose.yml   # Core Docker stack
├── airflow.env          # Airflow environment config
├── Dockerfile           # Custom image build (optional)
├── Makefile             # Helper commands
└── docs/assets/         # Documentation or diagrams

Inside Directory 
/home/sonu/data/project-root/
├── airflow.env                    # Airflow environment configuration file
│
├── dags/                          # Airflow DAGs directory
│   ├── spark_submit_example.py
│   └── other_dag.py
│
├── jobs/                          # PySpark or ETL jobs executed by Airflow/Spark
│   ├── sample_job.py
│   └── transform_data.py
│
├── logs/                          # Airflow logs (scheduler, task, webserver)
│   ├── scheduler/
│   ├── webserver/
│   ├── task_logs/
│   └── ...
│
├── spark-events/                  # Spark event logs (used by Spark History Server)
│   └── (generated automatically)
│
├── notebooks/                     # Jupyter notebooks (persistent storage)
│   ├── data_exploration.ipynb
│   ├── analysis.ipynb
│   └── test_spark.ipynb
│
├── minio/                         # MinIO data persistence
│   ├── warehouse/                 # Created automatically by MinIO client (mc)
│   │   ├── datasets/
│   │   └── checkpoints/
│   └── .minio.sys/                # internal MinIO metadata folder (auto-created)
│
├── dremio/                        # Dremio metadata (users, reflections, sources)
│   ├── db/
│   ├── log/
│   ├── spill/
│   ├── scratch/
│   └── config/
│
├── nessie/                        # Nessie catalog persistence (metadata version store)
│   └── (auto-generated content)
│
├── postgres/                      # PostgreSQL data directory (Airflow metadata DB)
│   ├── base/
│   ├── global/
│   ├── pg_wal/
│   └── postgresql.conf
│
├── docker-compose.yaml            # Your main Docker Compose configuration file
│
└── README.md                      # Optional — notes/documentation for setup


🧹 Management Commands

Stop services:

docker-compose down


Clean everything (volumes, logs, events):

docker-compose down -v


View running containers:

docker ps


Restart services:

docker-compose restart

🔮 Future Enhancements

Integration with Apache Iceberg for table format support

Add Superset / Metabase for BI visualization

CI/CD with GitHub Actions for automatic DAG sync

Kubernetes-based scaling using Helm or Docker Swarm


Error details in airflow and dremio or minio

PermissionError: [Errno 13] Permission denied: '/opt/airflow/logs/scheduler/2025-11-10'
Let’s dissect and fix it properly — because this is a very common error when you mount a local folder (host path) into Airflow’s /opt/airflow/logs.

⚠️ Why this happens
When Airflow starts, it tries to create:

swift
Copy code
/opt/airflow/logs/scheduler/YYYY-MM-DD
But the host-mounted folder (/home/sonu/data/project-root/logs) is owned by root, while Airflow inside the container runs as user airflow (UID 50000).
Since it can’t write logs there, it crashes while initializing the logging handler.

✅ Fix Step-by-Step
🧩 Step 1 — Identify your log volume in docker-compose.yml
You probably have this in your airflow-webserver and airflow-scheduler sections:

yaml
Copy code
volumes:
  - /home/sonu/data/project-root/logs:/opt/airflow/logs
That’s correct — but the directory needs the right permissions.

🧩 Step 2 — Fix permissions on host
Run these commands on your host (not inside container):

bash
Copy code
sudo chown -R 50000:50000 /home/sonu/data/project-root/logs
sudo chmod -R 775 /home/sonu/data/project-root/logs
sudo mkdir -p logs dremio minio postgres
sudo chown -R 50000:50000 logs
sudo chown -R 1000:1000 dremio
sudo chmod -R 775 logs dremio minio postgres
or else 
sudo chown -R 50000:50000 /home/sonu/data/project-root
sudo chown -R 1000:1000 /home/sonu/data/project-root


✅ To run the project :- 

docker compose -p data_platform up -d
docker compose -p data_platform down