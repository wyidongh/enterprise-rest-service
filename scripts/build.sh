#!/usr/bin/env bash

set -Eeuo pipefail


PROJECT_ROOT=$(cd "$(dirname "$0")/.." && pwd)

BUILD_DIR="${PROJECT_ROOT}/build"


BUILD_TYPE=${1:-Release}


echo "================================"
echo "Project : EnterpriseRestService"
echo "Build   : ${BUILD_TYPE}"
echo "================================"


mkdir -p "${BUILD_DIR}"


cmake \
    -S "${PROJECT_ROOT}" \
    -B "${BUILD_DIR}" \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE}


cmake \
    --build "${BUILD_DIR}" \
    -j$(nproc)



echo
echo "Build finished."

echo

ls -lh "${BUILD_DIR}/enterprise-service"

echo
echo "Running unit tests..."

cd "${BUILD_DIR}"

ctest --output-on-failure
