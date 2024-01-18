# Start with the OpenJDK 7 base image
FROM openjdk:7-jdk

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b

# Add Conda to PATH
ENV PATH="/root/miniconda3/bin:${PATH}"

# Install SNNS via Conda
# Add conda-forge to the Conda channels and install SNNS
RUN conda config --add channels conda-forge && \
    conda install -c bioconda snns=4.3

# Set the BATCHMAN_PATH environment variable
ENV BATCHMAN_PATH="/root/miniconda3/bin/batchman"

# Copy the clinod JAR file and launch script into the container
COPY bin/clinod-1.3.jar /app/bin/
COPY bin/nod /app/bin/

# Set the working directory to /app
WORKDIR /app/data

# Add /app/bin to the PATH
ENV PATH="/app/bin:${PATH}"

# Start a shell when the container runs
CMD ["/bin/bash"]
