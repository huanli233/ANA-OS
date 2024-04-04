# ANA-OS
A Magisk module that uses Gradle to build compressed packages for different devices

# 目录说明
lib/template - 每个机型都共用的模块结构
lib/file/{model} - 不同机型不同的一些文件
lib/prop/{mode} - 不同机型不同的system.prop内容

# Build
为指定机型构建模块zip
```
gradlew module -Ptarget={model}
```
为所有机型构建模块zip
```
gradlew moduleAll
```
创建指定机型特定的目录结构(file,prop)
```
gradlew createModel -Ptarget={model}
```
删除指定机型特定的目录结构(file,prop)
```
gradlew deleteModel -Ptarget={model}
```
删除构建结果文件夹(build文件夹)
```
gradlew clean
```