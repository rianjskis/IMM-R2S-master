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

# Modify default IP跟时区
sed -i 's/192.168.1.1/192.168.3.2/g' package/base-files/files/bin/config_generate
# 插件
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-openclash
#rm -rf feeds/luci/applications/luci-app-homeproxy
#git clone -b dev https://github.com/immortalwrt/homeproxy.git package/luci-app-homeproxy
