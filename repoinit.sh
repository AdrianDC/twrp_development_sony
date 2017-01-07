#!/bin/sh
set -e

# Usage
if [ "${1}" = '--help' ]; then
  echo ''
  echo " Usage: ${0} [light/shallow] [6.0/9.0/...] (repo init for TWRP)"
  echo ''
  return
fi

# Variables
params="${1}"
version="${2}"
depth=''

# Repo shallow
if [ "${params}" = 'shallow' ]; then
  depth='--depth 1'
elif [ "${params}" = 'light' ]; then
  depth="--depth ${ANDROID_REPO_INIT_LIGHT:-100}"
fi

# Repo configurations
repo_manifest=$(grep "Manifest: '" ./.repo/local_manifests/roomservice.xml | sed "s/.* '\(.*\)' .*/\1/")
if [ ! -z "${version}" ]; then
  repo_branch="twrp-${version}"
else
  repo_branch=${version:-$(grep "Branch: '" ./.repo/local_manifests/roomservice.xml | sed "s/.* '\(.*\)' .*/\1/")}
fi

# Repo init
init_command="repo init -u ${repo_manifest} -b ${repo_branch} ${depth}"

# Output init command
echo ''
printf " \e[1;33mrepoinit: \e[0m${init_command}"
echo ''

# Launch init command
if ! ${init_command} 2>&1 | grep -v '^ * ' || [ ! -d .repo/manifests ]; then

  # Exit on repo init failure
  echo ''
  printf " \e[1;33mrepoinit: \e[1;31mFailed for ${repo_branch}\e[0m"
  echo ''
  echo ''
  return

fi

# Unneeded branches cleanup
cd ./.repo/manifests/
git tag | grep -v "${repo_branch}" | xargs -n1 git tag -d >/dev/null
echo ''
printf " \e[1;33mrepoinit: \e[1;32mInit done for ${repo_branch}\e[0m"
echo ''
echo ''
cd ../../

# Launch repo sync
if [ -e ./.repo/manifest.xml ]; then
  repo sync -j"$(grep -c ^processor /proc/cpuinfo)" --current-branch --detach --force-sync --no-clone-bundle --no-tags
  echo ''
  printf " \e[1;33mrepoinit: \e[1;32mSync done for ${repo_branch}\e[0m"
  echo ''
  echo ''
fi
