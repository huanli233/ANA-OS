#安装自定义 by 白杳
SKIPMOUNT=false
#自动关闭
PROPFILE=true
#system.prop文件
POSTFSDATA=false
#post-fs-data脚本
LATESTARTSERVICE=false
#service.sh脚本
   ui_print "#####################################################"
   ui_print "         - 永远相信美好的事情即将发生 -         "
   ui_print "         -       正 在 刷 入       -   "
   ui_print "#####################################################"
ver="`grep_prop version $TMPDIR/module.prop`"
code="`grep_prop versionCode $TMPDIR/module.prop`"
id="`grep_prop id $TMPDIR/module.prop`"
B="`grep_prop author $TMPDIR/module.prop`"
model="`grep_prop ro.product.innermodel`"
os_ver="`grep_prop ro.product.careme.version`"
imoo_ver="`grep_prop ro.product.current.softversion`"
produce="`grep_prop ro.product.manufacturer`"
  if $BOOTMODE; then
    ui_print "- 检查安装环境中..."
  else
    ui_print "*********************************************************"
    ui_print "! 不支持从Twrp(recovery)安装"
    ui_print "! 进行安装最终会导致模块无法工作甚至变砖"
    ui_print "! 请使用magsik23.0及以上安装"
    abort "*********************************************************"
  fi
  if [ "$produce" -ne XTC ]; then
    abort "! 非小天才机型（？"
  fi
  if [ "$API" -ne 27 ]; then
    ui_print "! sdk版本错误: $API"
    abort "! 设备sdk应为27 (Android 8.1)"
  else
    ui_print "- 设备 sdk: $API"
  fi
  if [ "$MAGISK_VER_CODE" -lt 23000 ];then
    ui_print "!  Magisk版本低于23.0: $MAGISK_VER_CODE" 
    abort "!  Magisk版本低于23.0" 
  else
    ui_print "- Magisk版本: $MAGISK_VER ( $MAGISK_VER_CODE )"
  fi
   ui_print "- 手表版本: $imoo_ver"
   ui_print "- 模块版本: $ver ( $code ) "
   ui_print "- 模块名称: $MODNAME "
   ui_print "- 模块作者: $B"
   ui_print "- 安装位置: /data/adb/modules/$id"
   ui_print "######################################################"
#安装应用，白杳维护编写
install_apk(){
  cp -af $TMPDIR/apks /sdcard/Android/temp/
  #移动到暂存区
  chmod 777 /sdcard/Android/temp/apks
  #挂全权限
  pm install -r /sdcard/Android/temp/apks/toolkit.apk
  pm install -r /sdcard/Android/temp/apks/barkbox.apk
  pm install -r /sdcard/Android/temp/apks/via.apk
  pm install -r /sdcard/Android/temp/apks/fuckeebbk_encrypt.apk
  pm install -r /sdcard/Android/temp/apks/appsettings.apk
  pm install -r /sdcard/Android/temp/mt.apk
  #安装应用
  rm -r /sdcard/Android/temp
  #清理暂存区缓存
}
install_apk
#释放文件
on_install() {
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
}

set_permissions() {

  set_perm_recursive  $MODPATH  0  0  0755  0644
  chmod 751 $MODDIR/system/bin/Anaos
  #设置权限
}

ui_print "- よし はい！"
ui_print "歡迎來到白杳与新初创极光的XTC模块"