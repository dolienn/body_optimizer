import 'package:body_optimizer/screens/mainpage.dart';
import 'package:flutter/material.dart';

class MySelectionItem extends StatelessWidget {
  final String? title;
  final bool isForList;

  const MySelectionItem({Key? key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: isForList
          ? Padding(
        padding: const EdgeInsets.all(10.0),
        child: _buildItem(context),
      )
          : Card(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          children: <Widget>[
            _buildItem(context),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context) {
    return Container(
      width: 70,
      alignment: Alignment.center,
      child: FittedBox(
        child: Row(
          children: [
            Text(
              title!,
              style: PublicVariables().normalText,
            ),
            const Padding(padding: EdgeInsets.all(5)),
            const Icon(
              Icons.arrow_drop_down_outlined,
            ),
          ],
        ),
      ),
    );
  }
}