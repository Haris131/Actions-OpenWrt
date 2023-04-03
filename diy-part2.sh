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

# Modemfeed
svn co https://github.com/koshev-msk/modemfeed/trunk/luci package/luci
svn co https://github.com/koshev-msk/modemfeed/trunk/packages package/packages

# Add luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic

# Add luci-app-openclash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash

# Add luci-app-diskman
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-diskman package/luci-app-diskman

# Add luci-app-adguardhome
git clone --depth=1 https://github.com/yang229/luci-app-adguardhome package/luci-app-adguardhome

# Add luci-app-openclash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash

# Add luci-app-temp-status
git clone --depth=1 https://github.com/gSpotx2f/luci-app-temp-status package/luci-app-temp-status

# HelmiWrt packages
git clone --depth=1 https://github.com/Haris131/helmiwrt-packages package/helmiwrt-packages

#-----------------------------------------------------------------------------
#   Start of @helmiau terminal scripts additionals menu
#-----------------------------------------------------------------------------
HWOSDIR="package/base-files/files"
rawgit="https://raw.githubusercontent.com"
[ ! -d $HWOSDIR/usr/bin ] && mkdir -p $HWOSDIR/usr/bin

# Add ram checker from wegare123
# run "ram" using terminal to check ram usage
wget --no-check-certificate -qO $HWOSDIR/bin/ram "$rawgit/wegare123/ram/main/ram.sh"

# Add ocmetawss: "OpenClash Websocket Mod Core" script downloader
# run "ocmetawss" using terminal to check ram usage
wget --no-check-certificate -qO $HWOSDIR/bin/ocmetawss "$rawgit/helmiau/openwrt-config/main/others/ocmetawss"

# Add fix download file.php for xderm and libernet
# run "fixphp" using terminal for use
wget --no-check-certificate -qO $HWOSDIR/bin/fixphp "$rawgit/helmiau/openwrt-config/main/fix-xderm-libernet-gui"
