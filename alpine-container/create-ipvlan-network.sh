#!/usr/bin/env bash

# create-ipvlan.sh — create a Docker IPvLAN L2 network

# use sudo chmod +x create-ipvlan-network.sh before executing this script

set -euo pipefail

# ─────────────────────────────────────────────────────────────────────────────
# Configuration variables
# ─────────────────────────────────────────────────────────────────────────────

# Name of the Docker network to create
NETWORK_NAME="ipvlan-net"

# Parent network interface on the host
# (the physical NIC or bridge to attach IPvLAN to)
# learn by ip link show
PARENT_INTERFACE="enp0s31f6"

# IPvLAN mode: "l2" = layer-2 bridge mode, "l3" = gateway mode
IPVLAN_MODE="l2"

# CIDR subnet for the new Docker network
SUBNET="192.168.1.0/24"

# GATEWAY for the network

GATEWAY="192.168.1.1"

# ─────────────────────────────────────────────────────────────────────────────
# Main
# ─────────────────────────────────────────────────────────────────────────────

echo "Creating Docker IPvLAN network '${NETWORK_NAME}'"
echo "  parent interface : ${PARENT_INTERFACE}"
echo "  mode             : ${IPVLAN_MODE}"
echo "  subnet           : ${SUBNET}"
echo "  subnet           : ${GATEWAY}"
echo

docker network create \
  -d ipvlan \
  --opt ipvlan_mode="${IPVLAN_MODE}" \
  --opt parent="${PARENT_INTERFACE}" \
  --subnet="${SUBNET}" \
  --gateway"${GATEWAY}" \
  "${NETWORK_NAME}"

echo "✅ Network '${NETWORK_NAME}' created."
