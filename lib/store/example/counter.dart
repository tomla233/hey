import 'package:mobx/mobx.dart';

part 'counter.g.dart';
// 创建一个全局的 counter 对象
final Counter counter = Counter();
//Mobx 需要借助 builder_runner 这个库生成对应的 _$Counter 类的代码
class Counter = CounterBase with _$Counter;

abstract class CounterBase with Store {
  //@observable用于将对象value标记为可观察对象
  @observable
  int value = 0;

  //@action用于将increment方法标记为一个操作
  @action
  void increment() {
    value++;
  }

  CounterBase() {
    reaction(
      (_) => value, // 监听 value 的变化
      (int newValue) {
        print('计数变为：$newValue');
      },
    );
  }
}
