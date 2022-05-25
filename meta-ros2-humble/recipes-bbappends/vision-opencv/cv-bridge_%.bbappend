# Copyright (c) 2020 LG Electronics, Inc.
# Copyright (c) 2022 Acceleration Robotics S.L. <contact@accelerationrobotics.com>

ROS_BUILD_DEPENDS:remove = "python-numpy"
ROS_BUILD_DEPENDS:remove = "python3-numpy"

ROS_BUILDTOOL_DEPENDS += " \
    ${PYTHON_PN}-numpy-native \
"

# ERROR: QA Issue: image-geometry: Files/directories were installed but not shipped in any package:
#
do_install:append:class-target() {
    mkdir -p ${D}/usr/lib/python3.9/site-packages/
    mv ${D}${STAGING_DIR_NATIVE}/usr/lib/python3.9/site-packages/${ROS_BPN}* ${D}/usr/lib/python3.9/site-packages/
    rm -r ${D}/home
}