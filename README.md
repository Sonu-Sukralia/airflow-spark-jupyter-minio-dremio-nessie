# Airflow + Spark + Jupyter + MinIO + Dremio + Nessie

![Build](https://github.com/Sonu-Sukralia/airflow-spark-jupyter-minio-dremio-nessie/actions/workflows/ci.yml/badge.svg)
![Last Commit](https://img.shields.io/github/last-commit/Sonu-Sukralia/airflow-spark-jupyter-minio-dremio-nessie)
![Issues](https://img.shields.io/github/issues/Sonu-Sukralia/airflow-spark-jupyter-minio-dremio-nessie)
![License](https://img.shields.io/github/license/Sonu-Sukralia/airflow-spark-jupyter-minio-dremio-nessie)

Lightweight local stack for data engineering experiments and demos: Apache Airflow orchestrating Spark jobs and Jupyter notebooks, with MinIO as object storage, Dremio as query engine, and Nessie for data versioning. The repo uses Docker / docker-compose to run the services together.

## Why this project

- Reproducible local environment for building and testing ETL, data pipelines, and analytics.
- Useful for demos, teaching, and rapid prototyping with a realistic stack.

## Quick visual summary

```mermaid
flowchart LR
  subgraph LocalDocker
    direction TB
    Airflow[Airflow (Scheduler + Webserver)] -->|orchestrates| Spark[Spark Jobs]
    Airflow -->|runs| Notebooks[Jupyter Notebooks]
    Spark -->|reads/writes| MinIO[MinIO (S3 API)]
    Notebooks -->|read/write| MinIO
    MinIO -->|storage| Dremio[Dremio (Query Engine)]
    Dremio -->|query| Users[Analysts / BI]
    Spark -->|versioned data| Nessie[Nessie (Git-like lake catalog)]
    Postgres[(Postgres metadata / Airflow DB)]
    Airflow --> Postgres
  end
```

This diagram is renderable on GitHub (Mermaid is supported in Markdown). Use it to show architecture at a glance.

## Quickstart (local)

1. Prerequisites
   - Docker & Docker Compose installed
   - At least ~8GB free memory to run services comfortably

2. Start the stack

```bash
# from the project root
docker-compose up -d
# if you need environment variables, the repo provides `airflow.env` — load or copy it as needed
```

3. Open the service UIs (verify ports in `docker-compose.yml`):
- Airflow web UI — commonly http://localhost:8080
- Jupyter — commonly http://localhost:8888
- MinIO console — commonly http://localhost:9000
- Dremio — commonly http://localhost:9047

Check logs:

```bash
docker-compose logs -f airflow
docker-compose logs -f minio
```

## What to show in the README to make it visual & attractive

Tips to make your repo immediately more engaging for visitors:

- Hero image / banner: a single PNG/SVG at the top (e.g., `docs/assets/banner.png`) showing architecture or a screenshot of the Airflow DAG graph.
- Badges: build status, last commit, license, open issues, Docker image pulls. Use shields.io with your repo path.
- Animated GIF demo: record a short (5–10s) GIF that shows starting the stack and opening the Airflow DAG UI or a notebook running. Place under `docs/assets/gifs/` and embed with `![demo](docs/assets/gifs/demo.gif)`.
- Screenshots: Airflow DAG, Task Instance logs, Jupyter notebook outputs, Dremio dataset preview. Put in `docs/assets/screenshots/` and reference them.
- Architecture diagram (Mermaid or SVG): Mermaid diagrams render in GitHub README. For polished visuals prefer an SVG exported from draw.io or diagrams.net.
- Notebook thumbnails: export important notebook outputs (plots, tables) as PNGs and show next to a short example.
- Quick examples: small code snippets and a “Try it” section with one or two commands that run a sample DAG or notebook.

## How to capture visuals

- GIFs: use Peek (Linux) or by recording with `asciinema` for terminal demos and convert with `svg-term-cli` or `gifine`/`byzanz`/`ffmpeg`.
- Screenshots: use your OS screenshot tool or `scrot` on Linux. Save at `docs/assets/screenshots/`.
- Diagrams: use draw.io / diagrams.net and export to SVG or PNG (SVG is crisp on GitHub).

## Example README snippets for embedding assets

Add a hero image:

```md
![Project banner](docs/assets/banner.png)
```

Add a GIF demo:

```md
![Quick demo of Airflow DAG running](docs/assets/gifs/airflow-demo.gif)
```

Add a screenshot grid:

```md
### Screenshots

| Airflow DAG | Jupyter Notebook | MinIO Console |
|---|---|---|
| ![airflow](docs/assets/screenshots/airflow.png) | ![notebook](docs/assets/screenshots/notebook.png) | ![minio](docs/assets/screenshots/minio.png) |
```

## Folder layout (short)

```
project-root/
  ├─ dags/                # Airflow DAGs
  ├─ jobs/                # helper scripts and sample jobs
  ├─ docker-compose.yml   # starts the stack
  ├─ Dockerfile           # custom images
  ├─ notebooks/           # example notebooks
  └─ docs/assets/         # screenshots, gifs, diagrams (create this)
```

## Contributing & next steps

- Add `docs/assets/` and commit screenshots/GIFs
- Add a `CONTRIBUTING.md` with how to run and how to add new DAGs
- Add GitHub Actions workflow to test builds and run linting (CI badge in README)
- Consider publishing docs to GitHub Pages or MkDocs for a richer, browsable site

## License

Add a `LICENSE` file at the repo root or replace this section with your license of choice.

---

If you'd like, I can:

1. Create the `docs/assets/` directories and add placeholder files.
2. Commit a hero banner template and an example GIF placeholder.
3. Add a short GitHub Actions CI example (workflow) and include the resultant badge in README.

Tell me which of these you'd like me to do next and I will proceed.
