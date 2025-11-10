# # =====================================================
# # Makefile to rebuild (no cache), tag, and push all platform images as _asm_v1:1.0
# # =====================================================

# DOCKER_USER = sonusukralia

# # ---------- BUILD (no cache) ----------
# # This assumes you have Dockerfiles for each image in respective folders
# # e.g. ./airflow, ./spark, ./jupyter, etc.
# build:
# 	# Airflow
# 	docker build --no-cache -t $(DOCKER_USER)/airflow-spark_asm:2.7.1 ./airflow

# 	# Jupyter + Spark
# 	docker build --no-cache -t $(DOCKER_USER)/jupyter_spark_asm:3.5 ./jupyter

# 	# Spark (core)
# 	docker build --no-cache -t $(DOCKER_USER)/spark_asm:3.4.0 ./spark

# 	# Postgres
# 	docker build --no-cache -t $(DOCKER_USER)/postgres_asm:14.0 ./postgres

# 	# MinIO Server
# 	docker build --no-cache -t $(DOCKER_USER)/minio_asm:7.0 ./minio

# 	# MinIO Client
# 	docker build --no-cache -t $(DOCKER_USER)/minio-client_asm:7.0 ./minio-client

# 	# Dremio
# 	docker build --no-cache -t dremio/dremio-oss:latest ./dremio

# 	# Nessie
# 	docker build --no-cache -t projectnessie/nessie:0.67.0 ./nessie

# 	@echo "🧱 Rebuilt all images from scratch (no cache)"


# # ---------- TAG ----------
# tag:
# 	docker tag $(DOCKER_USER)/airflow-spark_asm:2.7.1 $(DOCKER_USER)/airflow-spark_asm_v1:1.0
# 	docker tag $(DOCKER_USER)/jupyter_spark_asm:3.5 $(DOCKER_USER)/jupyter_spark_asm_v1:1.0
# 	docker tag $(DOCKER_USER)/spark_asm:3.4.0 $(DOCKER_USER)/spark_asm_v1:1.0
# 	docker tag $(DOCKER_USER)/postgres_asm:14.0 $(DOCKER_USER)/postgres_asm_v1:1.0
# 	docker tag $(DOCKER_USER)/minio_asm:7.0 $(DOCKER_USER)/minio_asm_v1:1.0
# 	docker tag $(DOCKER_USER)/minio-client_asm:7.0 $(DOCKER_USER)/minio-client_asm_v1:1.0
# 	docker tag dremio/dremio-oss:latest $(DOCKER_USER)/dremio-oss_asm_v1:1.0
# 	docker tag projectnessie/nessie:0.67.0 $(DOCKER_USER)/nessie_asm_v1:1.0
# 	@echo "✅ Tagged all images with _asm_v1:1.0"


# # ---------- PUSH ----------
# push:
# 	docker push $(DOCKER_USER)/airflow-spark_asm_v1:1.0
# 	docker push $(DOCKER_USER)/jupyter_spark_asm_v1:1.0
# 	docker push $(DOCKER_USER)/spark_asm_v1:1.0
# 	docker push $(DOCKER_USER)/postgres_asm_v1:1.0
# 	docker push $(DOCKER_USER)/minio_asm_v1:1.0
# 	docker push $(DOCKER_USER)/minio-client_asm_v1:1.0
# 	docker push $(DOCKER_USER)/dremio-oss_asm_v1:1.0
# 	docker push $(DOCKER_USER)/nessie_asm_v1:1.0
# 	@echo "🚀 Pushed all rebuilt images to Docker Hub"


# # ---------- COMBINED ----------
# all: build tag push
# 	@echo "🎯 Rebuilt (no cache), tagged, and pushed all images as _asm_v1:1.0"







# =====================================================
# Makefile to tag and push all platform images with _v1:1.0
# =====================================================

DOCKER_USER = sonusukralia
TAG = _v1:1.0

# ---------- TAG ----------
tag:
	docker tag $(DOCKER_USER)/airflow-spark_asm:2.7.1 $(DOCKER_USER)/airflow-spark_asm$(TAG)
	docker tag $(DOCKER_USER)/jupyter_spark_asm:3.5 $(DOCKER_USER)/jupyter_spark_asm$(TAG)
	docker tag $(DOCKER_USER)/spark_asm:3.4.0 $(DOCKER_USER)/spark_asm$(TAG)
	docker tag $(DOCKER_USER)/postgres_asm:14.0 $(DOCKER_USER)/postgres_asm$(TAG)
	docker tag $(DOCKER_USER)/minio_asm:7.0 $(DOCKER_USER)/minio_asm$(TAG)
	docker tag $(DOCKER_USER)/minio-client_asm:7.0 $(DOCKER_USER)/minio-client_asm$(TAG)
	docker tag dremio/dremio-oss:latest $(DOCKER_USER)/dremio-oss$(TAG)
	docker tag projectnessie/nessie:0.67.0 $(DOCKER_USER)/nessie$(TAG)
	@echo "✅ Tagged all images with $(TAG)"


# ---------- PUSH ----------
push:
	docker push $(DOCKER_USER)/airflow-spark_asm$(TAG)
	docker push $(DOCKER_USER)/jupyter_spark_asm$(TAG)
	docker push $(DOCKER_USER)/spark_asm$(TAG)
	docker push $(DOCKER_USER)/postgres_asm$(TAG)
	docker push $(DOCKER_USER)/minio_asm$(TAG)
	docker push $(DOCKER_USER)/minio-client_asm$(TAG)
	docker push $(DOCKER_USER)/dremio-oss$(TAG)
	docker push $(DOCKER_USER)/nessie$(TAG)
	@echo "🚀 Pushed all images to Docker Hub with $(TAG)"


# ---------- COMBINED ----------
all: tag push
	@echo "🎯 All images tagged and pushed successfully as $(TAG)"
