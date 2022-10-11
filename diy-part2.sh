#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Intel XMM 7650 LTE-A Pro modem.
#svn co https://github.com/Haris131/xmm-modem/trunk package/xmm-modem

# Modemfeed
sed -i '$a src-git modemfeed https://github.com/koshev-msk/modemfeed.git' feeds.conf.default

# Clone community packages to package/community
mkdir package/community
pushd package/community
# Add OpenClash
git clone --depth=1 -b dev https://github.com/vernesong/OpenClash
popd
