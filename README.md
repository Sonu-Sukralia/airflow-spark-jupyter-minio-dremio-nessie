# 🧠 Airflow + Spark + Jupyter + MinIO + Dremio + Nessie

![Build](https://github.com/Sonu-Sukralia/airflow-spark-jupyter-minio-dremio-nessie/actions/workflows/ci.yml/badge.svg)
![Last Commit](https://img.shields.io/github/last-commit/Sonu-Sukralia/airflow-spark-jupyter-minio-dremio-nessie)
![Issues](https://img.shields.io/github/issues/Sonu-Sukralia/airflow-spark-jupyter-minio-dremio-nessie)
![License](https://img.shields.io/github/license/Sonu-Sukralia/airflow-spark-jupyter-minio-dremio-nessie)

A fully containerized **end-to-end data platform** built with Docker Compose — integrating **Apache Airflow**, **Apache Spark**, **MinIO**, **Dremio**, **Project Nessie**, and **JupyterLab** into one cohesive stack.  

This environment provides a **local data lakehouse**, capable of **ETL orchestration**, **distributed computation**, **object storage**, and **SQL-based analytics**.

---

## 🧩 Tech Stack Badges

| Component | Badge |
|------------|--------|
| **Apache Airflow** | ![Airflow](https://img.shields.io/badge/Airflow-2.7.1-blue?logo=apacheairflow&logoColor=white) |
| **Apache Spark** | ![Spark](https://img.shields.io/badge/Spark-3.4.0-orange?logo=apachespark&logoColor=white) |
| **JupyterLab** | ![Jupyter](https://img.shields.io/badge/JupyterLab-3.5-orange?logo=jupyter&logoColor=white) |
| **MinIO** | ![MinIO](https://img.shields.io/badge/MinIO-7.0-ff69b4?logo=minio&logoColor=white) |
| **Dremio** | ![Dremio](https://img.shields.io/badge/Dremio-Lakehouse-blue?logo=dremio&logoColor=white) |
| **Project Nessie** | ![Nessie](https://img.shields.io/badge/Nessie-0.67.0-9cf) |
| **PostgreSQL** | ![Postgres](https://img.shields.io/badge/PostgreSQL-14.0-316192?logo=postgresql&logoColor=white) |

---

## 🧱 Architecture

```
              ┌────────────────────────┐
              │        Airflow          │
              │ (Scheduler & Web UI)    │
              └──────────┬──────────────┘
                         │
       ┌─────────────────┴──────────────────┐
       │          Spark Cluster             │
       │ (Master, Worker, History Server)   │
       └─────────────────┬──────────────────┘
                         │
                ┌────────┴────────┐
                │      MinIO      │ ───► Object Storage (S3)
                └────────┬────────┘
                         │
                ┌────────┴────────┐
                │      Nessie     │ ───► Versioned Data Catalog
                └────────┬────────┘
                         │
                ┌────────┴────────┐
                │     Dremio      │ ───► SQL, BI, and Data Exploration
                └─────────────────┘
```

All services are connected via the `data-platform-network`.

---

## 🚀 Quick Start

```bash
git clone https://github.com/Sonu-Sukralia/airflow-spark-jupyter-minio-dremio-nessie.git
cd airflow-spark-jupyter-minio-dremio-nessie
docker compose up -d
```

---

## 🌐 Access Services

| Service | URL |
|----------|-----|
| **Airflow UI** | [http://localhost:8080](http://localhost:8080) |
| **Spark Master UI** | [http://localhost:9090](http://localhost:9090) |
| **Spark History Server** | [http://localhost:18080](http://localhost:18080) |
| **JupyterLab** | [http://localhost:8888](http://localhost:8888) |
| **MinIO Console** | [http://localhost:9001](http://localhost:9001) |
| **Dremio UI** | [http://localhost:9047](http://localhost:9047) |
| **Nessie UI** | [http://localhost:19120/api/v1/ui/](http://localhost:19120/api/v1/ui/) |

---

### 🔑 Retrieve Jupyter Token

```bash
docker logs jupyter-spark | grep token=
```

Or open directly in browser:

```bash
echo "http://localhost:8888/?token=$(docker exec jupyter-spark jupyter notebook list | grep -oP '(?<=token=)[a-f0-9]+')"
```

---

## 🔐 Default Credentials

| Service | Username | Password |
|----------|-----------|-----------|
| Airflow | `admin` | `admin` |
| MinIO | `admin` | `password` |
| Postgres | `airflow` | `airflow` |

---

## 🧩 Components Overview

| Service | Image | Ports | Description |
|----------|--------|--------|-------------|
| **Airflow Webserver** | `sonusukralia/airflow-spark_asm_v1:1.0` | `8080` | UI for orchestrating Spark and data pipelines |
| **Airflow Scheduler** | `sonusukralia/airflow-spark_asm_v1:1.0` | `—` | Executes and schedules DAGs |
| **Spark Master** | `sonusukralia/spark_asm_v1:1.0` | `7077 , 9090` | Central Spark cluster coordinator |
| **Spark Worker** | `sonusukralia/spark_asm_v1:1.0` | `—` | Executes Spark jobs from the master |
| **Spark History Server** | `sonusukralia/spark_asm_v1:1.0` | `18080` | Job logs and execution history |
| **JupyterLab** | `sonusukralia/jupyter_spark_asm_v1:1.0` | `8888 , 4040 , 4041 , 4042` | Interactive notebooks connected to Spark |
| **MinIO** | `sonusukralia/minio_asm_v1:1.0` | `9000 , 9001` | S3-compatible object storage |
| **MinIO Client (mc)** | `sonusukralia/minio-client_asm_v1:1.0` | `—` | Initializes MinIO buckets and policies |
| **Postgres** | `sonusukralia/postgres_asm_v1:1.0` | `5432` | Airflow metadata database |
| **Dremio** | `sonusukralia/dremio-oss_asm_v1:1.0` | `9047 , 31010 , 32010` | Data lakehouse query engine and UI |
| **Nessie** | `sonusukralia/nessie_asm_v1:1.0` | `19120` | Git-like version control for data tables |

---

## 📂 Directory Structure

```
project-root/
├── dags/                # Airflow DAG definitions
├── jobs/                # PySpark job scripts
├── notebooks/           # Jupyter notebooks
├── docker-compose.yml   # Core Docker stack
├── airflow.env          # Airflow environment config
├── spark-events/        # Spark event logs
├── logs/                # Airflow + Spark logs
├── minio/               # MinIO data persistence
├── dremio/              # Dremio metadata and storage
├── nessie/              # Nessie catalog data
├── postgres/            # PostgreSQL Airflow metadata DB
└── README.md
```

---

## ⚙️ Permission Fix (Airflow / Dremio / MinIO)

If you see:

```
PermissionError: [Errno 13] Permission denied: '/opt/airflow/logs/...'
```

Run this:

```bash
sudo chown -R 50000:50000 /home/sonu/data/project-root/logs
sudo chmod -R 775 /home/sonu/data/project-root/logs
sudo mkdir -p logs dremio minio postgres
sudo chown -R 50000:50000 logs
sudo chown -R 1000:1000 dremio
sudo chmod -R 775 logs dremio minio postgres
```

Or fix all recursively:

```bash
sudo chown -R 50000:50000 /home/sonu/data/project-root
sudo chown -R 1000:1000 /home/sonu/data/project-root
sudo chmod -R 775 /home/sonu/data/project-root
```

---

## 🧹 Management Commands

| Command | Description |
|----------|-------------|
| `docker compose down` | Stop all services |
| `docker compose down -v` | Remove volumes, logs, and events |
| `docker compose restart` | Restart all services |
| `docker ps` | View container status |

---

## 📊 Container Status Snapshot (Example)

| Container Name | Image | Status | Ports |
|----------------|--------|--------|--------|
| `airflow-webserver` | `sonusukralia/airflow-spark_asm_v1:1.0` | 🟢 Up (healthy) | `8080->8080/tcp` |
| `airflow-scheduler` | `sonusukralia/airflow-spark_asm_v1:1.0` | 🟢 Up | — |
| `spark-master` | `sonusukralia/spark_asm_v1:1.0` | 🟢 Up | `7077->7077`, `9090->8080` |
| `spark-worker` | `sonusukralia/spark_asm_v1:1.0` | 🟢 Up | — |
| `spark-history-server` | `sonusukralia/spark_asm_v1:1.0` | 🟢 Up | `18080->18080` |
| `jupyter-spark` | `sonusukralia/jupyter_spark_asm_v1:1.0` | 🟡 Unhealthy | `8888->8888`, `4040` |
| `minio` | `sonusukralia/minio_asm_v1:1.0` | 🟢 Up | `9000-9001` |
| `minio-mc` | `sonusukralia/minio-client_asm_v1:1.0` | 🟢 Up | — |
| `postgres` | `sonusukralia/postgres_asm_v1:1.0` | 🟢 Up | `5432` |
| `nessie` | `sonusukralia/nessie_asm_v1:1.0` | 🟢 Up | `19120` |
| `dremio` | `sonusukralia/dremio-oss_asm_v1:1.0` | 🟢 Up | `9047, 31010, 32010` |

---

## 🔮 Future Enhancements

- Integration with **Apache Iceberg** for advanced table formats  
- Add **Superset / Metabase** for BI visualization  
- **CI/CD with GitHub Actions** for automatic DAG sync  
- **Kubernetes / Helm** deployment for scaling  

---

## ✅ Run the Project

```bash
docker compose -p data_platform up -d
```

Stop the entire project:

```bash
docker compose -p data_platform down
```
