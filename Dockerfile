
#------------------------------------------------------------------------------------------
# This the the final jupyter spark dockerfile 


FROM --platform=linux/amd64 sonusukralia/jupyterd:3.5

USER root

RUN pip install --no-cache-dir pyspark==3.5.1 boto3

ENV SPARK_HOME=/usr/local/spark-3.5.0-bin-hadoop3
# overwrite PATH at container runtime, not through Jupyter
ENV PATH=/usr/local/spark-3.5.0-bin-hadoop3/bin:/usr/local/bin:/usr/bin:/bin:/opt/conda/bin

RUN apt-get update && apt-get install -y netcat && rm -rf /var/lib/apt/lists/*

# forget start-notebook.sh; run jupyter lab directly
ENTRYPOINT ["/bin/bash", "-c", \
  "export SPARK_HOME=/usr/local/spark-3.5.0-bin-hadoop3 && \
   export PATH=/usr/local/spark-3.5.0-bin-hadoop3/bin:/usr/local/bin:/usr/bin:/bin:/opt/conda/bin && \
   exec jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root"]


#--------------------------------------------------------------------------------------------














# FROM sonusukralia/jupyterd:3.5

# # --- Install PySpark matching your cluster ---
# RUN pip install pyspark==3.5.1 boto3 

# # --- Set correct Spark environment ---
# ENV SPARK_HOME=/usr/local/spark-3.5.0-bin-hadoop3
# ENV PATH=$SPARK_HOME/bin:$PATH

# # --- Optional: install netcat (for future debugging) ---
# RUN apt-get update && apt-get install -y netcat && rm -rf /var/lib/apt/lists/*

# # --- Default working directory ---
# WORKDIR /home/jovyan



# FROM --platform=linux/amd64 sonusukralia/jupyterd:3.5


# # FROM sonusukralia/jupyterd:3.5

# # --- Switch to root for system-level installs ---
# USER root

# # --- Install PySpark matching your cluster ---
# RUN pip install pyspark==3.5.1 boto3

# # # --- Set correct Spark environment ---
# ENV SPARK_HOME=/usr/local/spark-3.5.0-bin-hadoop3
# ENV PATH=$SPARK_HOME/bin:$PATH

# # --- Optional: install netcat (for future debugging) ---
# RUN apt-get update && apt-get install -y netcat && rm -rf /var/lib/apt/lists/*

# # --- Switch back to the default Jupyter user (important for file permissions) ---
# USER jovyan

# # --- Default working directory ---
# WORKDIR /home/jovyan





# # ===============================
# # ✅ Final Jupyter + Spark Dockerfile (Permanent Spark Fix)
# # ===============================

# FROM --platform=linux/amd64 sonusukralia/jupyterd:3.5

# # Switch to root to install dependencies
# USER root

# # --- Install PySpark and MinIO dependencies ---
# RUN pip install --no-cache-dir \
#     pyspark==3.5.1 \
#     boto3 \
#     hadoopcli

# # --- Set the correct Spark environment ---
# ENV SPARK_HOME=/usr/local/spark-3.5.0-bin-hadoop3
# # 🔥 Force the correct Spark path to take priority over /opt/conda/bin
# ENV PATH=$SPARK_HOME/bin:/usr/local/bin:/usr/bin:/bin:/opt/conda/bin

# # --- Persist environment for all future shells / Jupyter sessions ---
# RUN echo 'export SPARK_HOME=/usr/local/spark-3.5.0-bin-hadoop3' >> /etc/profile.d/spark.sh && \
#     echo 'export PATH=$SPARK_HOME/bin:/usr/local/bin:/usr/bin:/bin:/opt/conda/bin' >> /etc/profile.d/spark.sh

# # --- Optional: install useful debugging tools ---
# RUN apt-get update && apt-get install -y netcat && rm -rf /var/lib/apt/lists/*

# # --- Return to default user (for Jupyter permissions) ---
# USER jovyan
# WORKDIR /home/jovyan














# # ===============================
# # ✅ Final Jupyter + Spark Dockerfile (Permanent Spark Fix)
# # ===============================

# FROM --platform=linux/amd64 sonusukralia/jupyterd:3.5

# # Switch to root to install dependencies
# USER root

# # --- Install PySpark and MinIO dependencies ---
# RUN pip install --no-cache-dir \
#     pyspark==3.5.1 \
#     boto3

# # --- Set the correct Spark environment ---
# ENV SPARK_HOME=/usr/local/spark-3.5.0-bin-hadoop3
# # 🔥 Force the correct Spark path to take priority over /opt/conda/bin
# ENV PATH=$SPARK_HOME/bin:/usr/local/bin:/usr/bin:/bin:/opt/conda/bin

# # --- Persist environment for all future shells / Jupyter sessions ---
# RUN echo 'export SPARK_HOME=/usr/local/spark-3.5.0-bin-hadoop3' >> /etc/profile.d/spark.sh && \
#     echo 'export PATH=$SPARK_HOME/bin:/usr/local/bin:/usr/bin:/bin:/opt/conda/bin' >> /etc/profile.d/spark.sh

# # --- Optional: install useful debugging tools ---
# RUN apt-get update && apt-get install -y netcat && rm -rf /var/lib/apt/lists/*

# # --- Return to default user (for Jupyter permissions) ---
# USER jovyan
# WORKDIR /home/jovyan















# # ===============================
# # ✅ Final Jupyter + Spark Dockerfile (Persistent PATH Override)
# # ===============================

# FROM --platform=linux/amd64 sonusukralia/jupyterd:3.5

# USER root

# # --- Install PySpark and MinIO dependencies ---
# RUN pip install --no-cache-dir \
#     pyspark==3.5.1 \
#     boto3

# # --- Set Spark environment variables ---
# ENV SPARK_HOME=/usr/local/spark-3.5.0-bin-hadoop3
# ENV PATH=$SPARK_HOME/bin:$PATH

# # --- Persist environment variables for all future shells ---
# RUN echo 'export SPARK_HOME=/usr/local/spark-3.5.0-bin-hadoop3' >> /etc/profile.d/spark.sh && \
#     echo 'export PATH=$SPARK_HOME/bin:$PATH' >> /etc/profile.d/spark.sh

# # --- Enforce Spark path at container startup (fix for Conda override) ---
# RUN echo 'export PATH=/usr/local/spark-3.5.0-bin-hadoop3/bin:$PATH' >> /usr/local/bin/start-notebook.d/10-spark-path.sh && \
#     chmod +x /usr/local/bin/start-notebook.d/10-spark-path.sh

# # --- Install useful tools ---
# RUN apt-get update && apt-get install -y netcat && rm -rf /var/lib/apt/lists/*

# USER jovyan
# WORKDIR /home/jovyan





# FROM --platform=linux/amd64 sonusukralia/jupyterd:3.5

# USER root

# RUN pip install --no-cache-dir pyspark==3.5.1 boto3

# ENV SPARK_HOME=/usr/local/spark-3.5.0-bin-hadoop3
# # overwrite PATH at container runtime, not through Jupyter
# ENV PATH=/usr/local/spark-3.5.0-bin-hadoop3/bin:/usr/local/bin:/usr/bin:/bin:/opt/conda/bin

# RUN apt-get update && apt-get install -y netcat && rm -rf /var/lib/apt/lists/*

# # forget start-notebook.sh; run jupyter lab directly
# ENTRYPOINT ["/bin/bash", "-c", \
#   "export SPARK_HOME=/usr/local/spark-3.5.0-bin-hadoop3 && \
#    export PATH=/usr/local/spark-3.5.0-bin-hadoop3/bin:/usr/local/bin:/usr/bin:/bin:/opt/conda/bin && \
#    exec jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root"]

