#!/usr/bin/env bash

set -e

APP_NAME=enterprise-service

INSTALL_DIR=/opt/${APP_NAME}


echo "Installing ${APP_NAME}"


mkdir -p ${INSTALL_DIR}


cp bin/${APP_NAME} ${INSTALL_DIR}/


echo "Install finished"
