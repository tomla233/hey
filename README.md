# hey（仿小黑盒app）
## 项目介绍
- 项目用的flutter版本：3.38.5

- 状态管理框架：[Mobx](https://mobx.netlify.app/getting-started)
    - 修改每个store文件后：`flutter pub run build_runner build`
    - 自动监听并构建*.g.dart文件：`flutter pub run build_runner watch`


## 打包为apk
```
flutter build apk --target-platform android-arm64 --split-per-abi
```



    