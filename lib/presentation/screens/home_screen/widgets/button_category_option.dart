import 'package:flutter/material.dart';
import 'package:trivia_app/core/index.dart';

class ButtonCategoryOptionWidget extends StatelessWidget {
  const ButtonCategoryOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppLayout.bigMargin),
      padding: EdgeInsets.all(AppLayout.smallPadding),
      width: double.infinity,
      alignment: Alignment.center,
      height: 80,
      decoration: _decoration(),
      child: _InnetContainer(),
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      color: Colors.red,
      border: Border.all(

      ),
      borderRadius: BorderRadius.circular(AppLayout.regularRadius)
    );
  }
}

class _InnetContainer extends StatelessWidget {
  const _InnetContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: double.infinity,
      width:  double.infinity,
      decoration: _innerDecoration(),
      child: Text("Button"),
    );
  }

  BoxDecoration _innerDecoration() => BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(AppLayout.regularRadius)

  );
}