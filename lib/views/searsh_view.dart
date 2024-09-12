import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idea_box_app/core/helper_functions/app_routes.dart';
import 'package:idea_box_app/core/helper_functions/loading_widget.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';
import 'package:idea_box_app/core/utils/styles/app_images.dart';
import 'package:idea_box_app/model/note_model.dart';
import 'package:idea_box_app/views/widgets/custom_note_item.dart';

class SearshView extends StatelessWidget {
  const SearshView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
          child: Column(
            children: [
              _getAppBar(context),
              _intialAndNotFoundStateWidget(
                  context, 'Please , write what you want to search for'),
            ],
          ),
        ),
      ),
    );
  }

  _getAppBar(BuildContext context) {
    return SearchBar(
      onChanged: (value) {},
      hintText: 'Search for notes',
      hintStyle:
          const WidgetStatePropertyAll(TextStyle(color: AppColors.yellow)),
      backgroundColor: WidgetStatePropertyAll(AppColors.gray.withOpacity(.7)),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.orange,
          )),
      trailing: [
        IconButton(
            onPressed: () {},
            icon: IconButton(
              icon: const Icon(
                Icons.clear,
                color: AppColors.orange,
              ),
              onPressed: () {},
            )),
        IconButton(
            onPressed: () {
              DropdownButton(
                items: List<DropdownMenuItem<items>>.generate(
                    items.values.length,
                    (index) => DropdownMenuItem<items>(
                          child: Text(items.values[index].toString()),
                          onTap: () {},
                        )),
                onChanged: (value) {},
              );
            },
            icon: const Icon(
              Icons.arrow_downward,
              color: AppColors.orange,
            )),
      ],
    );
  }

  _intialAndNotFoundStateWidget(BuildContext context, String message) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: width * 0.75,
              child: SvgPicture.asset(
                AppImages.imagesNotFoundImageSvg,
                width: width * 0.75,
              )),
          Text(
            message,
            style: const TextStyle(
              color: AppColors.orange,
            ),
          )
        ],
      ),
    );
  }

  _loadingStateWidget() {
    return const LoadingWidget();
  }

  _successStateWidget(List<NoteModel> notesList) {
    return Expanded(
      child: ListView.builder(
        itemCount: notesList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Expanded(
              child: CustomNoteItem(
                title: notesList[index].title,
                colorCode: notesList[index].colorCode,
                onTapOnItem: () {
                  Navigator.pushNamed(context, AppRoutes.detailsView,
                      arguments: notesList[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

enum items {
  subject,
  description,
}
