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

# HelmiWrt MactoIface
mkdir package/community
pushd package/community
git clone --depth=1 https://github.com/helmiau/helmiwrt-packages
popd

# Add luci-app-openclash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/openwrt-openclash
pushd package/openwrt-openclash/tools/po2lmo && make && sudo make install 2>/dev/null && popd

svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-ramfree package/luci-app-ramfree
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-zerotier package/luci-app-zerotier
