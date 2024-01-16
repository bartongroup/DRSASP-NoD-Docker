# Running NoD with Docker

This guide will show you how to run  `NoD` inside a Docker container and use Docker bind mounts to access input and output files on your host system.

## Step 1: Run the Docker container with a bind mount

You can specify a bind mount when running your Docker container using the `-v` or `--volume` option. The syntax is as follows:

```bash
docker run -v ./data/:/mnt -it drsaspnoddocker:latest
```

In this command:

- `-v ./data/:/mnt` specifies that the `data` directory within the current working directory on your host system should be mounted to `/mnt` inside the Docker container.
- `-it` runs the Docker container in interactive mode and attaches your terminal to the Docker container's terminal.

Once you've started your Docker container with this option, any changes you make to the files in `data` will be reflected in `/mnt` inside your Docker container, and vice versa.

## Step 2: Run nod

You can now run  `nod` and read/write files from/to the bind-mounted directory. For example, you can do something like this:

```bash
nod -h  # Print help message

# Run nod on the input file in the bind-mounted directory
nod -in=/mnt/Q13435.fa

# This time, write the output file to the bind-mounted directory
nod -in=/mnt/Q13435.fa -out=/mnt/Q13435.fa.nod
```
