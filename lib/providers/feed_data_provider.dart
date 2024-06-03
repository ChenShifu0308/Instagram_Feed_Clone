import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/feed_item_model.dart';

import '../utils/asset_util.dart';

final feedProvider = FutureProvider<FeedItemList>((ref) async {
  final content = AssetUtil.loadJsonFromAssets('assets/data/mocked_feed.json')
      .then((value) => FeedItemList.fromJson(value));
  return content;
});
