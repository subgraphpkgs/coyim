#!/bin/sh
GIT_VERSION=$(git -C $GBP_GIT_DIR rev-parse HEAD)
TAG_VERSION=$(git -C $GBP_GIT_DIR tag -l --contains $GIT_VERSION)
LOCAL_TAG=$(basename $GBP_BUILD_DIR)
LOCAL_TAG=${LOCAL_TAG##*-}

$GBP_BUILD_DIR/gen_version_file.sh $LOCAL_TAG $TAG_VERSION

cp $GBP_BUILD_DIR/data/coyim.gschema.override $GBP_BUILD_DIR/gui/settings/definitions/
make -C $GBP_BUILD_DIR/gui/settings/definitions generate
