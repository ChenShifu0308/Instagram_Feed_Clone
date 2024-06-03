import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/providers/feed_data_provider.dart';
import 'package:instagram_clone/widgets/action_bar.dart';
import 'package:instagram_clone/widgets/post_list_item.dart';

import 'models/feed_item_model.dart';
import 'utils/paging_scroll_physics.dart';

/// This widget is used to display the Instagram home screen.
class InstagramHome extends ConsumerStatefulWidget {
  const InstagramHome({super.key});

  @override
  ConsumerState<InstagramHome> createState() => _InstagramHomeState();
}

class _InstagramHomeState extends ConsumerState<InstagramHome> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<FeedItemList> feedItemList = ref.watch(feedProvider);
    return Scaffold(
        appBar: AppBar(
          title: const ActionBar(),
          toolbarHeight: 64,
        ),
        body: Builder(builder: (BuildContext context) {
          switch (feedItemList) {
            case AsyncLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case AsyncError():
              return const Center(
                child: Text('Error loading feed'),
              );
            case AsyncData(:final value):
              return ListView.builder(
                // This is not a good practice to use PageScrollPhysics here.
                // Personally, I would not apply a physics here, just keep it default.
                physics: PagingScrollPhysics(getItemHeight: (int index) {
                  if(index >= value.feedItems!.length){
                    return -1;
                  }
                  return _calculateItemHeight(value.feedItems![index]);
                }),
                itemCount: value.feedItems!.length,
                itemBuilder: (BuildContext context, int index) {
                  FeedItemModel feedItem = value.feedItems![index];
                  return PostListItem(feedItem: feedItem);
                },
              );
          }
          return const SizedBox();
        }),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          selectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 40),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 40),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined, size: 40),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie_creation_outlined, size: 40),
              label: 'Likes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, size: 40),
              label: 'Profile',
            ),
          ],
        ));
  }

  /// This is a simple implementation to calculate the height of the item to verify the `PagingScrollPhysics`.
  /// Actually, we need to get the exact height of each feed item and save it as a state.
  double _calculateItemHeight(FeedItemModel feedItem) {
    final double width = MediaQuery.of(context).size.width;
    double height = width;
    String? firstImageUrl = feedItem.images![0];
    List<String> pathSegments = Uri.parse(firstImageUrl).pathSegments;
    int imageWidth = int.parse(pathSegments[pathSegments.length - 2]);
    int imageHeight = int.parse(pathSegments[pathSegments.length - 1]);
    double aspectRatio = imageWidth / imageHeight;
    height = width / aspectRatio;
    return height+255;
  }
}
