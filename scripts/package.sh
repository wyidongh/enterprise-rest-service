#!/usr/bin/env bash

set -Eeuo pipefail

git config --global --add safe.directory /workspace

PROJECT_ROOT=$(cd "$(dirname "$0")/.." && pwd)


VERSION=$(cat ${PROJECT_ROOT}/version.txt)


PACKAGE_NAME="enterprise-service-${VERSION}"


PACKAGE_DIR=${PROJECT_ROOT}/packaging/${PACKAGE_NAME}


echo "Packaging ${PACKAGE_NAME}"


rm -rf ${PACKAGE_DIR}


mkdir -p ${PACKAGE_DIR}/bin
mkdir -p ${PACKAGE_DIR}/config
mkdir -p ${PACKAGE_DIR}/scripts


################################
# Binary
################################

cp \
${PROJECT_ROOT}/build/enterprise-service \
${PACKAGE_DIR}/bin/


################################
# Config
################################

cp \
${PROJECT_ROOT}/config/config.yaml \
${PACKAGE_DIR}/config/


################################
# Scripts
################################

cp \
${PROJECT_ROOT}/scripts/install.sh \
${PACKAGE_DIR}/scripts/


cp \
${PROJECT_ROOT}/scripts/uninstall.sh \
${PACKAGE_DIR}/scripts/


cp \
${PROJECT_ROOT}/scripts/health_check.sh \
${PACKAGE_DIR}/scripts/


################################
# Build Info
################################

GIT_COMMIT=$(git rev-parse HEAD)

GIT_BRANCH=$(git branch --show-current)


cat > ${PACKAGE_DIR}/build_info.json <<EOF
{
    "project":"enterprise-rest-service",
    "version":"${VERSION}",
    "git_commit":"${GIT_COMMIT}",
    "branch":"${GIT_BRANCH}",
    "build_time":"$(date)"
}
EOF

################################
# Tar
################################

cd ${PROJECT_ROOT}/packaging


tar czf \
${PACKAGE_NAME}.tar.gz \
${PACKAGE_NAME}


echo
echo "Package generated:"
echo

ls -lh ${PACKAGE_NAME}.tar.gz

ARTIFACT_DIR=${PROJECT_ROOT}/artifacts


mkdir -p ${ARTIFACT_DIR}


cp \
${PACKAGE_NAME}.tar.gz \
${ARTIFACT_DIR}/


echo

echo "Artifact uploaded:"
ls -lh ${ARTIFACT_DIR}/${PACKAGE_NAME}.tar.gz
