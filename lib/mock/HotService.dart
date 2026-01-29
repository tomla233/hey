import 'package:hey/models/hot/SliderInfo.dart';

class HotService {
  HotService._();

  static final HotService _instance = HotService._();
  factory HotService() => _instance;

  //热点页的“全部”轮播图数据
  final List<SliderInfo> sliderList = [
    SliderInfo(
      communityId: '1',
      imageUrl: 'https://storage.moegirl.org.cn/moegirl/commons/6/60/%E8%95%BE%E5%A8%9C%C2%B7%E8%8E%89%E5%B8%8C%E7%89%B9%E5%A8%9C%E7%93%A6_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
      title: 'DLC正式上线，你还在等什么？一起加入吧！',
    ),
    SliderInfo(
      communityId: '2',
      imageUrl: 'https://i0.hdslb.com/bfs/new_dyn/3034073cc027d3314dddf39f30d3b06c626510519.jpg@1192w.avif',
      title: '挚爱，我的女主角',
    ),
    SliderInfo(
      communityId: '3',
      imageUrl: 'https://i0.hdslb.com/bfs/new_dyn/5fe72304a5b46efb51d27724a0065807626510519.jpg@1192w.avif',
      title: '千恋万花太好玩了，我想和你分享一下,千恋万花太好玩了，我想和你分享一下',
    ),
  ];
}