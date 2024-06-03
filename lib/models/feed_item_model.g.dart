// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedItemModel _$FeedItemModelFromJson(Map<String, dynamic> json) =>
    FeedItemModel(
      id: json['id'] as String?,
      username: json['username'] as String?,
      userImage: json['userImage'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      caption: json['caption'] as String?,
      likes: (json['likes'] as num?)?.toInt(),
      comments: (json['comments'] as num?)?.toInt(),
      shares: (json['shares'] as num?)?.toInt(),
      isLiked: json['isLiked'] as bool?,
      isSaved: json['isSaved'] as bool?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$FeedItemModelToJson(FeedItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'userImage': instance.userImage,
      'images': instance.images,
      'likes': instance.likes,
      'comments': instance.comments,
      'shares': instance.shares,
      'isLiked': instance.isLiked,
      'isSaved': instance.isSaved,
      'caption': instance.caption,
      'createdAt': instance.createdAt,
      'description': instance.description,
    };

FeedItemList _$FeedItemListFromJson(Map<String, dynamic> json) => FeedItemList(
      feedItems: (json['feedItems'] as List<dynamic>?)
          ?.map((e) => FeedItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      size: (json['size'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FeedItemListToJson(FeedItemList instance) =>
    <String, dynamic>{
      'feedItems': instance.feedItems,
      'size': instance.size,
      'total': instance.total,
      'page': instance.page,
    };
