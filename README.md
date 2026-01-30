# hey（仿小黑盒app）

## 其他仓库地址
- [github](https://github.com/tomla233/hey)
- [gitee](https://gitee.com/TomLa/hey)

## 项目依赖介绍
- flutter版本：[3.38.5](https://docs.flutter.cn/install/archive/)

- 消息提示插件： [oktoast](https://pub.dev/packages/oktoast)
    - utils包下的MsgUtil.dart是基于此插件封装的消息提示类

- 路由管理插件：[go_router](https://pub.dev/packages/go_router)
  - 本项目的路由配置文件：lib/routers/index.dart

- 本地存储插件：[shared_preferences](https://pub.dev/packages/shared_preferences)

- 轮播图插件：[carousel_slider](https://pub.dev/packages/carousel_slider)

- 状态管理框架：[Mobx](https://mobx.netlify.app/getting-started)
    - 修改每个store文件后执行：`flutter pub run build_runner build`
    - 自动监听并构建*.g.dart文件：`flutter pub run build_runner watch`

## lib目录结构说明
+ assets 存放静态资源文件
+ components 存放可复用的组件
+ constants 存放常量类
+ mock 存放模拟数据，例如帖子列表、关注列表等
+ models 存放数据模型类
+ pages 存放各个主页面
+ routes 路由管理
    + index.dart 路由入口文件
+ stores 存放状态管理类，使用Mobx进行状态管理
+ utils 存放工具类
+ main.dart 应用入口文件

## 打包为apk
- 项目已设置好gradle的maven仓库镜像地址，无需配置
- 项目已设置设置gradle的国内镜像源，无需配置             
- 确保已将android sdk路径添加到环境变量中
- 确保已设置证书 `flutter doctor --android-licenses`
- 执行打包命令
```
flutter build apk --target-platform android-arm64 --split-per-abi
```

## 一起贡献
- 欢迎提交pr，请详细描述修改内容


    