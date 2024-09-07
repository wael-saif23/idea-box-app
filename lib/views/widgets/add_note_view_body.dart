import 'package:flutter/material.dart';
import 'package:idea_box_app/views/widgets/colors_wedget.dart';
import 'package:idea_box_app/views/widgets/custom_text_form_feild.dart';

class AddNoteViewBody extends StatelessWidget {
  const AddNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
          child: Column(
        children: [
          CustomTextFormFeild(
            lablelText: "Note Subject",
          ),
          SizedBox(height: 16),
          CustomTextFormFeild(
            maxLines: 10,
            lablelText: "Note description",
          ),
          SizedBox(height: 16),
          ColorsWedget(),
        ],
      )),
    );
  }
}
