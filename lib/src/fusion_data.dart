import 'package:p5_fusion_dart/p5_fusion.dart';
import 'utils/list_extensions.dart';
import 'dart:math';

/// Stores Fusions' source [Persona]s and [Persona]s that are being fused.
class Fusion with Comparable {
  final List<Persona> source;
  final Persona target;
  final int cost;

  Fusion({required this.source, required this.target})
      : assert(source.containsDuplicate() == false,
            'Source list contains duplicates'),
        assert(!source.contains(target), 'Source list contains target'),
        cost = source.fold(
            0,
            (previousValue, element) => (previousValue +
                    (pow(element.level, 2) * 27 + 126 * element.level + 2147))
                .toInt());

  @override
  String toString() {
    return 'Fusion{source: $source, target: $target, cost: $cost}';
  }

  @override
  int compareTo(other) {
    return cost.compareTo(other.cost);
  }
}
