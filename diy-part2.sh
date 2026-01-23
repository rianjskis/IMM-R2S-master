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
sed -i "/set system.@system\[-1\].timezone='UTC'/{
s/set system.@system\[-1\].timezone='UTC'/set system.@system\[-1\].timezone='CST-8'/
a\                set system.@system[-1].zonename='Asia/Shanghai'
}" package/base-files/files/bin/config_generate
# 插件
rm -rf package/feeds/luci/applications/luci-app-passwall
rm -rf package/feeds/luci/applications/luci-app-openclash
rm -rf package/feeds/luci/applications/luci-app-mwan3
rm -rf package/feeds/luci/applications/luci-app-syncdial
rm -rf package/feeds/packages/mwan3
git clone https://github.com/xiaorouji/openwrt-passwall2 package/luci-app-passwall2
sed -i '$a /root' package/base-files/files/etc/sysupgrade.conf    # 编译时默认插入root目录,升级时root目录不清空
sed -i '$a /etc/init.d/pwm-fan' package/base-files/files/etc/sysupgrade.conf

cd
git clone -b openwrt-25.12 --filter=blob:none --no-checkout https://github.com/immortalwrt/packages.git
cd packages
git sparse-checkout init --cone
git sparse-checkout set net/mwan3
git checkout
cd
mv packages/net/mwan3 openwrt/package/


git clone -b openwrt-25.12 --filter=blob:none --no-checkout https://github.com/immortalwrt/luci.git
cd luci
git sparse-checkout init --cone
git sparse-checkout set \
  applications/luci-app-mwan3 \
  applications/luci-app-syncdial
git checkout
cd
mv \
  luci/applications/luci-app-mwan3 \
  luci/applications/luci-app-syncdial \
  openwrt/package/
