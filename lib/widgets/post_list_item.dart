import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/feed_item_model.dart';

class PostListItem extends StatelessWidget {
  final FeedItemModel feedItem;

  const PostListItem({super.key, required this.feedItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(feedItem.userImage!),
          ),
          title: Text(feedItem.username!),
          subtitle: Text(feedItem.caption!),
        ),
        CachedNetworkImage(
          imageUrl: feedItem.images![0],
          placeholder: (context, url) => const SizedBox(
            height: 600,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}
