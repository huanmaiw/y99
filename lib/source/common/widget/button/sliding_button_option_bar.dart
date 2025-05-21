import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/core/app/res/padding.dart';
import 'package:Y99/core/app/res/radius.dart';
import 'package:Y99/core/app/res/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class SlidingButtonOptionBar extends StatefulWidget {
  final int selectedIndex;
  final List<String>? titles;
  final List<Widget>? children;
  final Function(int) onTabSelected;
  final Color? indicatorColor;
  final double height;
  final Color? unselectedColor;
  final Color? selectedColor;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final bool elevated;
  final Duration animationDuration;

  const SlidingButtonOptionBar({
    super.key,
    required this.selectedIndex,
    this.titles,
    this.children,
    required this.onTabSelected,
    this.indicatorColor,
    this.height = 38,
    this.radius,
    this.padding,
    this.unselectedColor,
    this.selectedColor,
    this.elevated = true,
    this.animationDuration = const Duration(milliseconds: 250),
  }) : assert(titles != null || children != null,
            'Either titles or children must be provided');

  @override
  State<SlidingButtonOptionBar> createState() => _SlidingButtonOptionBarState();
}

class _SlidingButtonOptionBarState extends State<SlidingButtonOptionBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _animation = Tween<double>(
      begin: widget.selectedIndex.toDouble(),
      end: widget.selectedIndex.toDouble(),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCirc,
    ));
  }

  @override
  void didUpdateWidget(SlidingButtonOptionBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _animation = Tween<double>(
        begin: _animation.value,
        end: widget.selectedIndex.toDouble(),
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCirc,
      ));
      _controller.forward(from: 0.0);
    }

    if (oldWidget.animationDuration != widget.animationDuration) {
      _controller.duration = widget.animationDuration;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int get itemCount => widget.titles?.length ?? widget.children!.length;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = theme.scaffoldBackgroundColor.withOpacity(0.9);

    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(
              horizontal: ResPadding.p4, vertical: ResPadding.p4),
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(widget.radius ?? ResRadius.r10),
          boxShadow: widget.elevated
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.radius ?? ResRadius.r10),
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return CustomPaint(
                    size: Size.infinite,
                    painter: _IndicatorPainter(
                      position: _animation.value,
                      itemCount: itemCount,
                      color: widget.indicatorColor ?? ResColor.blue,
                      radius: widget.radius ?? ResRadius.r10,
                    ),
                  );
                },
              ),
              _buildTabs(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Row(
      children: List.generate(
        itemCount,
        (index) => Expanded(
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius:
                  BorderRadius.circular(widget.radius ?? ResRadius.r10),
              splashColor: Colors.white.withOpacity(0.1),
              highlightColor: Colors.transparent,
              onTap: () => widget.onTabSelected(index),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: TextStyle(
                      color: widget.selectedIndex == index
                          ? widget.selectedColor ?? Colors.white
                          : widget.unselectedColor ?? ResColor.placeholderColor,
                      fontWeight: widget.selectedIndex == index
                          ? ResTypography.semiBold
                          : FontWeight.normal,
                      fontSize: ResTypography.h7,
                    ),
                    child: widget.children != null
                        ? widget.children![index]
                        : AutoSizeText(
                            widget.titles![index],
                            maxFontSize: ResTypography.h7,
                            minFontSize: 8,
                            maxLines: 1,
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _IndicatorPainter extends CustomPainter {
  final double position;
  final int itemCount;
  final Color color;
  final double radius;

  _IndicatorPainter({
    required this.position,
    required this.itemCount,
    required this.color,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final itemWidth = size.width / itemCount;
    final centerX = position * itemWidth + (itemWidth / 2);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.5);

    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(position * itemWidth, 0, itemWidth, size.height),
      Radius.circular(radius),
    );

    // Draw main indicator
    canvas.drawRRect(rect, paint);

    // Draw subtle highlight on top edge
    final highlightPaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final Path path = Path()
      ..moveTo(position * itemWidth + radius, 1)
      ..lineTo((position + 1) * itemWidth - radius, 1);

    canvas.drawPath(path, highlightPaint);
  }

  @override
  bool shouldRepaint(_IndicatorPainter oldDelegate) {
    return position != oldDelegate.position ||
        color != oldDelegate.color ||
        itemCount != oldDelegate.itemCount ||
        radius != oldDelegate.radius;
  }
}
