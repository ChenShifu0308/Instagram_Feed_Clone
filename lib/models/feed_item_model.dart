import 'package:json_annotation/json_annotation.dart';

part 'feed_item_model.g.dart';

/// Json Model Generation: run `dart run build_runner build --delete-conflicting-outputs`
@JsonSerializable()
class FeedItemModel {
  final String? id;
  final String? username;
  final String? userImage;
  final List<String>? images;
  final int? likes;
  final int? comments;
  final int? shares;
  final bool? isLiked;
  final bool? isSaved;
  final String? caption;
  final String? createdAt;


  FeedItemModel({
    this.id,
    this.username,
    this.userImage,
    this.images,
    this.caption,
    this.likes,
    this.comments,
    this.shares,
    this.isLiked,
    this.isSaved,
    this.createdAt,
  });

  factory FeedItemModel.fromJson(Map<String, dynamic> json) =>
      _$FeedItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedItemModelToJson(this);
}

@JsonSerializable()
class FeedItemList {
  final List<FeedItemModel>? feedItems;
  final int? size;
  final int? total;
  final int? page;

  FeedItemList({this.feedItems, this.size, this.total, this.page});

  factory FeedItemList.fromJson(Map<String, dynamic> json) =>
      _$FeedItemListFromJson(json);

  Map<String, dynamic> toJson() => _$FeedItemListToJson(this);
}
