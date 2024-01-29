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
rm -rf feeds/luci/applications/luci-app-openclash
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-alist
rm -rf feeds/luci/applications/luci-app-ddns-go
rm -rf feeds/luci/themes/luci-theme-argon
sed -i 's/192.168.1.1/192.168.3.2/g' package/base-files/files/bin/config_generate
git clone --depth=1 https://github.com/fw876/helloworld.git#master package/helloworld
git clone https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone https://github.com/sbwml/luci-app-alist package/luci-app-alist
git clone https://github.com/zxl78585/luci-app-filetransfer.git package/luci-app-filetransfer
git clone https://github.com/xiaorouji/openwrt-passwall2 package/luci-app-passwall2
git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/luci-app-ddns-go
