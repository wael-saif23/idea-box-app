import 'package:flutter/material.dart';
import 'package:idea_box_app/controller/write_note_cubit/write_note_cubit_cubit.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';

class ColorsWedget extends StatelessWidget {
  const ColorsWedget({super.key, required this.activeColorCode});
  final int activeColorCode ;
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
          return _getColorsItem(index , context);
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

  Widget? _getColorsItem(int index,BuildContext context) {
    bool isSelected = _colorsCode[index] == activeColorCode;

    return InkWell(
      onTap: () {
       WriteNoteCubitCubit.get(context).updateNoteColor(_colorsCode[index]);
        
      },
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: Color(_colorsCode[index]),
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
