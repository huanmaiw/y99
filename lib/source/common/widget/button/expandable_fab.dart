import 'dart:math' as math;
import 'package:Y99/core/app/res/insert.dart';
import 'package:flutter/material.dart';

@immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    super.key,
    this.initialOpen = false,
    required this.distance,
    required this.children,
    this.duration = const Duration(milliseconds: 300),
    this.fanAngle = 90,
    this.direction = ExpandableDirection.up,
    this.type = ExpandableFabType.fan,
    this.mainButtonBuilder,
    this.closeButtonBuilder,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation = 6.0,
    this.overlayColor,
    this.heroTag = 'expandable_fab',
    this.childrenPadding = const EdgeInsets.all(4.0),
  });

  final bool initialOpen;
  final double distance;
  final List<ExpandableFabChild> children;
  final Duration duration;
  final double fanAngle;
  final ExpandableDirection direction;
  final ExpandableFabType type;
  final Widget Function(
          BuildContext context, VoidCallback onPressed, bool isOpen)?
      mainButtonBuilder;
  final Widget Function(BuildContext context, VoidCallback onPressed)?
      closeButtonBuilder;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double elevation;
  final Color? overlayColor;
  final Object heroTag;
  final EdgeInsets childrenPadding;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: widget.duration,
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          // Add modal barrier that only appears when open
          if (_open)
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggle,
                behavior: HitTestBehavior.opaque,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          _buildMainButton(),
          ..._buildExpandableButtons(),
        ],
      ),
    );
  }

  Widget _buildMainButton() {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return widget.mainButtonBuilder != null
        ? widget.mainButtonBuilder!(context, _toggle, _open)
        : FloatingActionButton(
            heroTag: widget.heroTag,
            onPressed: _toggle,
            backgroundColor:
                widget.backgroundColor ?? colorScheme.primaryContainer,
            foregroundColor:
                widget.foregroundColor ?? colorScheme.onPrimaryContainer,
            elevation: widget.elevation,
            child: AnimatedRotation(
              turns: _open ? 1 : 0.0, // 135 degrees when open
              duration: widget.duration,
              child: Icon(_open ? Icons.close : Icons.add),
            ),
          );
  }

  List<Widget> _buildExpandableButtons() {
    final List<Widget> children = <Widget>[];
    final int count = widget.children.length;
    final double step = widget.type == ExpandableFabType.fan
        ? widget.fanAngle / (count - 1)
        : 0;

    for (int i = 0; i < count; i++) {
      final ExpandableFabChild child = widget.children[i];

      children.add(
        AnimatedBuilder(
          animation: _expandAnimation,
          builder: (BuildContext context, Widget? child) {
            final double offset = i * step;
            return Positioned(
              right: _calculateX(widget.distance, offset, i),
              bottom: _calculateY(widget.distance, offset, i),
              child: Transform.scale(
                scale: _expandAnimation.value,
                child: Opacity(
                  opacity: _expandAnimation.value,
                  child: child,
                ),
              ),
            );
          },
          child: FadeTransition(
            opacity: _expandAnimation,
            child: Padding(
              padding: widget.childrenPadding,
              child: Row(
                children: [
                  if (child.title != null)
                    Text(
                      child.title!,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  if (child.title != null) ResInset.g20,
                  FloatingActionButton.small(
                    heroTag: '${widget.heroTag}_item_$i',
                    onPressed: () {
                      if (child.closeOnPressed) {
                        _toggle();
                      }
                      child.onPressed();
                    },
                    tooltip: child.tooltip,
                    backgroundColor: child.backgroundColor,
                    foregroundColor: child.foregroundColor,
                    child: child.child,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return children;
  }

  double _calculateX(double distance, double angle, int index) {
    switch (widget.direction) {
      case ExpandableDirection.left:
        return distance * _expandAnimation.value;
      case ExpandableDirection.right:
        return 0;
      case ExpandableDirection.up:
      case ExpandableDirection.down:
        return 0;
      case ExpandableDirection.fan:
        return distance *
            math.cos(_degToRad(angle + 270)) *
            _expandAnimation.value;
    }
  }

  double _calculateY(double distance, double angle, int index) {
    switch (widget.direction) {
      case ExpandableDirection.up:
        return distance * (index + 1) * _expandAnimation.value;
      case ExpandableDirection.down:
        return -distance * (index + 1) * _expandAnimation.value;
      case ExpandableDirection.left:
      case ExpandableDirection.right:
        return 0;
      case ExpandableDirection.fan:
        return distance *
            math.sin(_degToRad(angle + 270)) *
            _expandAnimation.value;
    }
  }

  double _degToRad(double deg) => deg * (math.pi / 180);
}

@immutable
class ExpandableFabChild {
  const ExpandableFabChild({
    required this.onPressed,
    required this.child,
    this.tooltip,
    this.backgroundColor,
    this.foregroundColor,
    this.closeOnPressed = true,
    this.title,
  });

  final VoidCallback onPressed;
  final Widget child;
  final String? tooltip;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool closeOnPressed;
  final String? title;
}

enum ExpandableDirection {
  up,
  down,
  left,
  right,
  fan,
}

enum ExpandableFabType {
  linear,
  fan,
}
