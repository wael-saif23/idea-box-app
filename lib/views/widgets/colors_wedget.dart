import 'package:flutter/material.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';

class ColorsWedget extends StatefulWidget {
  const ColorsWedget({super.key});

  @override
  State<ColorsWedget> createState() => _ColorsWedgetState();
}

class _ColorsWedgetState extends State<ColorsWedget> {
  int colorIndex = -1;
  final List<int> _colorsCode = const [
    0xff000000,
    0xff9E9E9E,
    0xff795548,
    0xff607D8B,
    0xffFF5722,
    0xffE91E63,
    0xff9C27B0,
    0xff673AB7,
    0xff3F51B5,
    0xff03A9F4,
    0xff00BCD4,
    0xff009688,
    0xff4CAF50,
    0xffCDDC39,
    0xffFFC107,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (itemBuilder, index) {
          return _getColorsItem(_colorsCode[index], index);
        },
        separatorBuilder: (separatorBuilder, index) => const VerticalDivider(
          color: AppColors.yellow,
          endIndent: 7,
          indent: 7,
        ),
        itemCount: _colorsCode.length,
      ),
    );
  }

  Widget? _getColorsItem(int colorCode, int index) {
    bool isSelected = index == colorIndex;

    return InkWell(
      onTap: () {
        colorIndex = index;
        setState(() {});
      },
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: Color(colorCode),
          borderRadius: BorderRadius.circular(8),
        ),
        child: isSelected
            ? const Icon(
                Icons.check,
                color: AppColors.white,
              )
            : null,
      ),
    );
  }
}
