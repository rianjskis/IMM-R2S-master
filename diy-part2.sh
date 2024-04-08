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
sed -i "s/set system.@system\[-1\].timezone='UTC'/set system.@system[-1].timezone='CST-8'/g; /set system.@system\[-1\].timezone='CST-8'/a set system.@system[-1].zonename='Asia/Shanghai'" package/base-files/files/bin/config_generate
# 插件
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-openclash
git clone https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
