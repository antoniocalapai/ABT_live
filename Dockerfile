# Use an NVIDIA L4T base image compatible with Jetson devices
FROM nvcr.io/nvidia/l4t-base:r32.4.4

# Install necessary packages
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-opencv \
    && rm -rf /var/lib/apt/lists/*

# Copy your repository contents into the image
COPY . /ABT_live

# Set the working directory to /ABT_live
WORKDIR /ABT_live

# Install any Python dependencies
# RUN pip3 install -r requirements.txt

# Command to run when the container starts
# Here it assumes you have a script named take_snapshot.py
# Adjust the command according to your project's needs
CMD ["bash"]
