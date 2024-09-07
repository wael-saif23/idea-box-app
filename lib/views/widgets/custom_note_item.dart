import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';
import 'package:idea_box_app/core/utils/styles/app_fonts.dart';

class CustomNoteItem extends StatefulWidget {
  const CustomNoteItem({
    super.key,
    required this.colorCode,
    required this.title,
    this.onPressedToDatailsView,
    this.onPressedToDeleteItem,
  });
  final int colorCode;
  final String title;
  final VoidCallback? onPressedToDatailsView;
  final VoidCallback? onPressedToDeleteItem;

  @override
  State<CustomNoteItem> createState() => _CustomNoteItemState();
}

class _CustomNoteItemState extends State<CustomNoteItem>
    with SingleTickerProviderStateMixin {
  late final SlidableController slidableController = SlidableController(this);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _getOnTapOnItem(slidableController);
      },
      child: Container(
        decoration: _getBoxDecoration(),
        padding: const EdgeInsets.all(12),
        child: Slidable(
          controller: slidableController,
          key: UniqueKey(),
          endActionPane: ActionPane(
            dismissible: DismissiblePane(
              onDismissed: () {
                // Remove this Slidable from the widget tree.
              },
            ),
            motion: const ScrollMotion(),
            children: _getSlidableActions,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: AppFonts.NunitoRegular25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> get _getSlidableActions {
    return [
            SlidableAction(
                borderRadius: BorderRadius.circular(24),
                onPressed: (context) {
                  widget.onPressedToDatailsView?.call();
                },
                backgroundColor: AppColors.gray,
                foregroundColor: AppColors.orange,
                icon: Icons.open_with_rounded),
            const SizedBox(width: 8),
            SlidableAction(
              borderRadius: BorderRadius.circular(24),
              onPressed: (context) {
                widget.onPressedToDeleteItem?.call();
              },
              backgroundColor: AppColors.black,
              foregroundColor: AppColors.orange,
              icon: Icons.delete,
            ),
          ];
  }

  BoxDecoration _getBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(widget.colorCode),
      );
  }

  void _getOnTapOnItem(SlidableController slidableController) {
    final isColosed =
        slidableController.actionPaneType.value == ActionPaneType.none;
    if (isColosed) {
      slidableController.openEndActionPane();
    } else {
      slidableController.close();
    }
  }
}
