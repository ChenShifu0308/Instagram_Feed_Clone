import 'package:flutter/widgets.dart';

typedef ItemHeightCallback = double Function(int index);

class PagingScrollPhysics extends ScrollPhysics {
  // A map from index to item height.
  final Map<int, double> _itemHeightMap = <int, double>{};
  final ItemHeightCallback getItemHeight;

  PagingScrollPhysics({ScrollPhysics? parent, required this.getItemHeight})
      : super(parent: parent);

  @override
  PagingScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return PagingScrollPhysics(
        parent: buildParent(ancestor), getItemHeight: getItemHeight);
  }

  // Return the current page index.
  double _getPage(ScrollMetrics position) {
    // By position.pixels and each item height, to calculate the page index.
    int index = 0;
    double heightSum = 0;
    while (true) {
      double? itemHeight = _itemHeightMap[index];
      if (itemHeight == null) {
        itemHeight = getItemHeight(index);
        if (itemHeight < 0) {
          break;
        }
        _itemHeightMap[index] = itemHeight;
      }
      heightSum += itemHeight;
      debugPrint(
          'position:${position.pixels}, index: $index, heightSum: $heightSum, itemHeight: $itemHeight');
      if (position.pixels < heightSum) {
        break;
      }
      index++;
    }
    return index.toDouble();
  }

  /// Calculate the total height of the items before the page.
  double _getPixels(double page) {
    double heightSum = 0;
    for (int i = 0; i < page; i++) {
      double? itemHeight = _itemHeightMap[i];
      if (itemHeight == null) {
        itemHeight = getItemHeight(i);
        if (itemHeight < 0) {
          break;
        }
        _itemHeightMap[i] = itemHeight;
      }
      heightSum += itemHeight;
    }
    return heightSum;
  }

  double _getTargetPixels(
      ScrollMetrics position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity > tolerance.velocity) {
      page += 1;
    }
    if (page < 0) {
      page = 0;
    }
    return _getPixels(page);
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels) {
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    }
    return null;
  }
}
