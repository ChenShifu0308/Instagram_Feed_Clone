import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/feed_item_model.dart';
import 'package:instagram_clone/utils/date_time_util.dart';

class PostListItem extends StatelessWidget {
  final FeedItemModel feedItem;

  const PostListItem({super.key, required this.feedItem});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    double height = width;
    String? firstImageUrl = feedItem.images![0];
    List<String> pathSegments = Uri.parse(firstImageUrl).pathSegments;
    int imageWidth = int.parse(pathSegments[pathSegments.length - 2]);
    int imageHeight = int.parse(pathSegments[pathSegments.length - 1]);
    double aspectRatio = imageWidth / imageHeight;
    height = width / aspectRatio;

    return Column(
      children: <Widget>[
        // Header Section
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(feedItem.userImage!),
                  ),
                  const SizedBox(width: 10),
                  Text(feedItem.username!),
                ],
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),

        // Images Section
        SizedBox(
          height: height,
          width: width,
          child: PageView.builder(
            itemCount: feedItem.images!.length,
            itemBuilder: (BuildContext context, int index) {
              return CachedNetworkImage(
                imageUrl: feedItem.images![index],
                placeholder: (context, url) => SizedBox(
                  height: height,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          ),
        ),

        // Footer Section
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.favorite_border),
                  SizedBox(width: 10),
                  Icon(Icons.chat_bubble_outline),
                  SizedBox(width: 10),
                  Icon(Icons.send),
                ],
              ),
              Icon(Icons.bookmark_border),
            ],
          ),
        ),

        // Likes count
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.centerLeft,
          child: Text('${feedItem.likes} likes',
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color)),
        ),

        // Description Section, max 2 lines
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            feedItem.description ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        // comments count
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.centerLeft,
          child: Text('View all ${feedItem.comments} comments'),
        ),

        // Add a comment, input field
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(feedItem.userImage!),
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Add a comment...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            )),

        // Time Section
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          alignment: Alignment.centerLeft,
          child:
              Text(feedItem.createdAt!.parseToDateTime().format('dd MMM yyyy')),
        ),
      ],
    );
  }
}
