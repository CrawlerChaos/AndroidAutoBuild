# 输出文件目录自行修改
OutPutFile=xxxxx
# MarketTool文件夹放入工程根目录下跟setting.gradle同级
cd $(dirname "$0")
ToolDir=$(dirname "$0")
ProjectDir=$(dirname "$PWD")
#上传小米市场用户名
XiaoMiUserName=xxxx
#上传小米市场密钥
XiaoMiPrivateKey=xxxx
#应用包名
Package=xxxx
#应用名称
AppName=xxxx
#小米上传jar包位于工程目录跟setting.gradle同级
XiaoMiPushTool=${ToolDir}/xiaomi_market_tool.jar
#模块名称
Module=xxxx
#生产环境渠道名
BuildTypeProduct=xxxx
#测试环境渠道名（跟生产环境名字不能一样）
BuildTypeTest=xxxx
ApkStoreDir=${ProjectDir}/${Module}/build/outputs/apk
XiaoMi=${ApkStoreDir}/${Module}-{小米渠道名}-release.apk
Product=${ApkStoreDir}/${Module}-${BuildTypeProduct}-release.apk
DogFood=${ApkStoreDir}/${Module}-${BuildTypeTest}-debug.apk