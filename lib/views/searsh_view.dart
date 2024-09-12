import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idea_box_app/controller/search_cubit/search_cubit.dart';
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
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return Column(
                  children: [
                    _getAppBar(context),
                    if (state is SearchInitial)
                      _intialAndNotFoundStateWidget(
                          context, 'Search for notes'),
                    if (state is SearchFailure)
                      _intialAndNotFoundStateWidget(context, state.message),
                    if (state is SearchSuccessWithNOItems)
                      _intialAndNotFoundStateWidget(context, state.message),
                    if (state is SearchSuccessInSubject)
                      _successStateWidget(state.notes),
                    if (state is SearchSuccessInDescription)
                      _successStateWidget(state.notes),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  _getAppBar(BuildContext context) {
    return SearchBar(
      controller: SearchCubit.searchController,
      onChanged: (value) {
        SearchCubit.get(context).search(value);
      },
      hintText: 'Search for notes',
      hintStyle:
          const WidgetStatePropertyAll(TextStyle(color: AppColors.yellow)),
      backgroundColor: WidgetStatePropertyAll(AppColors.gray.withOpacity(.7)),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            SearchCubit.searchController.clear();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.orange,
          )),
      trailing: [
       IconButton(
              icon: const Icon(
                Icons.clear,
                color: AppColors.orange,
              ),
              onPressed: () {
                 SearchCubit.searchController.clear();
              },
            ),
        DropdownButton<SubjectOrDescription>(
          value: SearchCubit.get(context).subjectOrDescription,
          onChanged: (value) {
            SearchCubit.get(context).updatSubjectOrDescription(value!);
          },
          items: const [
            DropdownMenuItem(
                value: SubjectOrDescription.subject, child: Text('IN Sub..')),
            DropdownMenuItem(
                value: SubjectOrDescription.description,
                child: Text('IN Desc..')),
          ],
          icon: const Icon(
            Icons.menu,
            color: AppColors.orange,
          ),
          style: const TextStyle(
            color: AppColors.orange,
          ),
          underline: Container(
            height: 2,
            color: AppColors.orange,
          ),
          dropdownColor: AppColors.black,
        ),
        const SizedBox(
          width: 12,
        )
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
                title: SearchCubit.get(context).subjectOrDescription ==
                        SubjectOrDescription.subject
                    ? notesList[index].title
                    : notesList[index].description,
                colorCode: notesList[index].colorCode,
                onTapOnItem: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.detailsView,
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
