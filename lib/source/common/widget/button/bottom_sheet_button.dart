import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/core/app/res/padding.dart';
import 'package:Y99/core/app/res/text.dart';
import 'package:Y99/source/common/widget/box/custom_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    super.key,
    required this.listButtons,
    this.title,
  });

  final List<BottomSheetItem> listButtons;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return CustomBox(
      child: Wrap(
        children: [
          title != null
              ? DecoratedBox(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: ResColor.lightGrey,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(ResPadding.p10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: const Icon(
                            Icons.close,
                            size: 20,
                            color: ResColor.placeholderColor,
                          ),
                        ),
                        Text(title ?? "", style: ResTypography.titleStyleBold),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: SizedBox(
                    width: 50,
                    child: Divider(
                      color: ResColor.lightGrey,
                      thickness: 2,
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(ResPadding.p8),
            child: ListView.builder(
              itemCount: listButtons.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                BottomSheetItem item = listButtons[index];
                return _BuildButton(
                  item: item,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildButton extends StatelessWidget {
  final BottomSheetItem item;

  const _BuildButton({required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: item.iconWidget ??
          (item.icon != null
              ? SvgPicture.asset(
                  item.icon!,
                  width: 24,
                  height: 24,
                )
              : null),
      title: Text(
        item.title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: ResColor.titleBoldColor,
        ),
      ),
      onTap: () {
        // Close the bottom sheet
        Get.back();
        item.onTap();
      },
    );
  }
}

class BottomSheetItem {
  final String title;
  final String? icon;
  final Widget? iconWidget;
  final Function() onTap;

  BottomSheetItem({
    required this.title,
    this.icon,
    required this.onTap,
    this.iconWidget,
  });
}
