# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2024-present ROCKNIX (https://github.com/ROCKNIX)

PKG_NAME="RTL8852BE"
PKG_VERSION="8b893fe30c1aa01e13054eb045c94d2adfafb10b"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/lwfinger/rtw8852be"
PKG_URL="${PKG_SITE}.git"
PKG_LONGDESC="Realtek RTL8852BE WIFI Linux driver"
PKG_TOOLCHAIN="make"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=${TARGET_KERNEL_ARCH} \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=${TARGET_KERNEL_PREFIX} \
       CONFIG_RTW_DEBUG=n
}

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_module_dir)/kernel/drivers/net/wireless/
  cp *.ko ${INSTALL}/$(get_full_module_dir)/kernel/drivers/net/wireless/
}
