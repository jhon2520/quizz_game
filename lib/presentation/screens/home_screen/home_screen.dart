import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/core/utils/enums/index.dart';
import 'package:trivia_app/presentation/services/index.dart';
import 'package:trivia_app/presentation/state/home_screen_bloc/home_screen_bloc.dart';

import 'widgets/button_category_option.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        lazy: false,
        create: (context) => getIt<HomeScreenBloc>()..add(GetQuizzExampleEvent()),
        child: Builder(
          builder: (context) {
            return const _BodyHomeScreen();
          }
        ),
      ),
    );
  }
}

class _BodyHomeScreen extends StatelessWidget {
  const _BodyHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [

          Flexible(
            child: ListView.builder(
              itemCount: CategoriesEnum.values.length,
              itemBuilder: (context, index) {
              return ButtonCategoryOptionWidget();
            },),
          )

        ],
      ),
    );
  }
}
