# Use an NVIDIA L4T base image compatible with Jetson devices
FROM nvcr.io/nvidia/l4t-base:r32.4.4

# Avoid prompts from packages asking for geographic area
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages including tzdata
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-opencv \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# Set the timezone to Berlin
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && dpkg-reconfigure --frontend noninteractive tzdata

# Copy your repository contents into the image
COPY . /ABT_live

# Set the working directory to /ABT_live
WORKDIR /ABT_live

# Install any Python dependencies
# RUN pip3 install -r requirements.txt

# Reset DEBIAN_FRONTEND
ENV DEBIAN_FRONTEND=dialog

# Command to run when the container starts
CMD ["bash"]
