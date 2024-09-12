import 'package:flutter/material.dart';


class SearshView extends StatelessWidget {
  const SearshView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        appBar: _getAppBar(),
        child: Padding(
          padding: EdgeInsets.only(top: 32, left: 16, right: 16),
         
        ),
      ),
    );
  }
_getAppBar() {
  return AppBar(
    title: const Text('Search'),
  );
}

}

