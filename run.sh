#!/bin/sh


# ------------------------------------------------------------------
# [Author] Noel Lim
#          Use this file as a driver to orchestrate run and build repository.
# ------------------------------------------------------------------


USAGE () {
    echo "Please specify argument."
}

if [ $# = 0 ]
then
    USAGE
    exit 1;
fi

check_docker_exists () {
    echo "[check_docker_exists]"
    if ! command -v docker > /dev/null 2>&1
    then
        echo "FAIL: Docker could not be found."
        exit 1;
    elif ! docker stats --no-stream > /dev/null 2>&1
    then
        echo "FAIL: Docker daemon/engine is not running."
        exit 1;
    else
        echo "Docker found."
    fi
}

check_docker_exists

build_app () {

    echo "[build_app]"
    commit_hash=$(git log -1 --format="%H")
    ymds=$(date +%Y%m%d%s)
    image_name="vms-frontend-build-${commit_hash}-${ymds}"
    echo "[build_app] building container ${image_name}"
    docker build -f Dockerfile.build -t "${image_name}" .

    if [ "$(docker images -q ${image_name} 2> /dev/null)" = "" ]
    then
        echo "FAIL: [development] Image ${image_name} not found"
        exit 1;        
    else
        echo "[build_app] Image ${image_name} found"
        echo "[build_app] Running image ${image_name}"
        echo "[build_app] $(pwd)"
        echo "[build_app] $(pwd | ls)"
        docker run -v "$(pwd):/app" --rm ${image_name}
    fi
    exit 0;

}

DEVELOPMENT_ENV_FILE="./container.dev.env"

load_env_development () {
    echo "[development::load_env_development] from ${DEVELOPMENT_ENV_FILE}"
    set -a # automatically export all variables
    # shellcheck source=./container.dev.env
    . "${DEVELOPMENT_ENV_FILE}"
    set +a
    echo "[development::load_env_development] development port: ${DEVELOPMENT_PORT}"


}

development () {
    echo "[development]"
    load_env_development
    commit_hash=$(git log -1 --format="%H")
    ymds=$(date +%Y%m%d%s)
    image_name="vms-frontend-development-${commit_hash}-${ymds}"
    echo "[development] building container ${image_name}"
    docker build -f Dockerfile.dev -t "${image_name}" .

    if [ "$(docker images -q ${image_name} 2> /dev/null)" = "" ]
    then
        echo "FAIL: [development] Image ${image_name} not found"
        exit 1;        
    else
        echo "[development] Image ${image_name} found"
        echo "[development] Running image ${image_name}"
        docker run -it -v "$(pwd):/app" -e DEVELOPMENT_PORT="${DEVELOPMENT_PORT}" --rm -p "${DEVELOPMENT_PORT}":"${DEVELOPMENT_PORT}"/tcp "${image_name}"
    fi
    exit 0;

}


case "${1}" in
    build)
    build_app
    ;;
    dev)
    development
    ;;
esac