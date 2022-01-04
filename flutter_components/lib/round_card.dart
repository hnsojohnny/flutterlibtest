import 'package:flutter/material.dart';

/// Description:
/// @author hanshuo

class RoundCard extends StatelessWidget {
  final int color;
  final double radius;
  final Widget? child;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;

  const RoundCard(
      {Key? key,
      required this.color,
      required this.radius,
      this.child,
      this.alignment,
      this.margin,
      this.padding,
      this.boxShadow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: setMargin(),
      padding: setPadding(),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(color),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          boxShadow: boxShadow),
      child: setChild(),
    );
  }

  EdgeInsetsGeometry setMargin() {
    if (margin == null) {
      return const EdgeInsets.all(0);
    }
    return margin!;
  }

  EdgeInsetsGeometry setPadding() {
    if (padding == null) {
      return const EdgeInsets.all(0);
    }
    return padding!;
  }

  Widget setChild() {
    Widget? current = child;
    if (child == null) {
      current = LimitedBox(
        maxWidth: 0.0,
        maxHeight: 0.0,
        child: ConstrainedBox(constraints: const BoxConstraints.expand()),
      );
    }
    if (alignment != null) {
      current = Align(alignment: alignment!, child: current);
    }
    return current!;
  }
}
