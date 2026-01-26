# hey（仿小黑盒app）

## 其他仓库地址
- [github](https://github.com/tomla233/hey)
- [gitee](https://gitee.com/TomLa/hey)

## 项目依赖介绍
- 项目用的flutter版本：3.38.5

- 状态管理框架：[Mobx](https://mobx.netlify.app/getting-started)
    - 修改每个store文件后：`flutter pub run build_runner build`
    - 自动监听并构建*.g.dart文件：`flutter pub run build_runner watch`

- 消息提示插件： [oktoast](https://pub.dev/packages/oktoast)
    - utils包下的MsgUtil.dart是基于此插件封装的提示类


## 打包为apk
```
flutter build apk --target-platform android-arm64 --split-per-abi
```
## 一起贡献
- 欢迎提交issue，请详细描述问题，并附上复现步骤
- 欢迎提交pr，请详细描述修改内容


    