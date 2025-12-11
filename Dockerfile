FROM ubuntu:24.04

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    # --- Qt6 / PySide6 System Dependencies ---
    libegl1 \
    libopengl0 \
    libgl1 \
    libglib2.0-0 \
    libdbus-1-3 \
    libxkbcommon-x11-0 \
    # --- XCB Plugins (Required for Qt GUI) ---
    libxcb-cursor0 \
    libxcb-icccm4 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-shape0 \
    libxcb-xinerama0 \
    libxcb-image0 \
    libxcb-render-util0 \
    libx11-xcb1 


COPY . /ros2_calib

WORKDIR /ros2_calib

# Create venv and install
RUN python3 -m venv .venv && \
    .venv/bin/python -m pip install .

# Add venv to PATH
ENV PATH="/ros2_calib/.venv/bin:$PATH"

CMD ["ros2_calib"]