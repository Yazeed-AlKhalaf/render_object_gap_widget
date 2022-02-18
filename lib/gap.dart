import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Gap extends LeafRenderObjectWidget {
  final double gap;

  const Gap(this.gap, {Key? key}) : super(key: key);

  @override
  RenderGap createRenderObject(BuildContext context) {
    return RenderGap(
      gap: gap,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderGap renderObject) {
    renderObject.gap = gap;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty("gap", gap));
  }
}

class RenderGap extends RenderBox {
  double _gap;
  double get gap => _gap;
  set gap(double value) {
    if (value != _gap) {
      _gap = value;
      markNeedsLayout();
    }
  }

  RenderGap({
    required double gap,
  }) : _gap = gap;

  @override
  void performLayout() {
    final AbstractNode? parent = this.parent;

    if (parent is RenderFlex) {
      switch (parent.direction) {
        case Axis.horizontal:
          size = Size(_gap, 0);
          break;
        case Axis.vertical:
          size = Size(0, _gap);
          break;
      }

      return;
    }

    throw FlutterError("Use a correct parent!");
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty("gap", _gap));
  }
}
