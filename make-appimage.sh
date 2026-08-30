#!/bin/sh

set -eu

ARCH=$(uname -m)
export ARCH
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=https://gitlab.com/sonicdcer/DNZHRecomp/-/raw/main/icons/512.png?ref_type=heads
export DESKTOP=https://gitlab.com/sonicdcer/DNZHRecomp/-/raw/main/.github/linux/DNZHRecompiled.desktop?ref_type=heads
export STARTUPWMCLASS=DNZHRecompiled
export DEPLOY_VULKAN=1

# Deploy dependencies
quick-sharun ./AppDir/bin/DNZHRecompiled
echo 'SHARUN_WORKING_DIR=${SHARUN_DIR}/bin' >> ./AppDir/.env

# Turn AppDir into AppImage
quick-sharun --make-appimage
