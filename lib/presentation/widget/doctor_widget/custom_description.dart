import 'package:flutter/cupertino.dart';

class CustomDescription extends StatelessWidget {
  final String description;
  const CustomDescription({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsetsDirectional.only(top: 2.0,bottom: 14.0),
      child: Text(
        description,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
