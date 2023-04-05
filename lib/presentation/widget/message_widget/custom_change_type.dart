import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/message_bloc/message_bloc.dart';
import '../../../core/constant/color_app.dart';
import 'custom_item_in_container.dart';

class CustomChangeType extends StatelessWidget {
  final String type;

  const CustomChangeType({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.only(bottom: 17.0,top: 21.0,right: 4.0,left: 4.0),
      height: 48.0,
      decoration: BoxDecoration(
          color: AppColor.darkGreen,
          borderRadius: BorderRadius.circular(30.0)
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                BlocProvider.of<MessageBloc>(context).add(const ChangeTypeEvent('1'));
                BlocProvider.of<MessageBloc>(context).add(GetWaitingConsultation());
              },
              child:CustomItemInContainer(
                title: 'انتظار',
                type: type,
                int: '1',
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                BlocProvider.of<MessageBloc>(context).add(const ChangeTypeEvent('2'));
                BlocProvider.of<MessageBloc>(context).add(GetRoomViewEvent());
              },
              child: CustomItemInContainer(
                title: 'قيد المعالجة',
                type: type,
                int: '2',
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                BlocProvider.of<MessageBloc>(context).add(const ChangeTypeEvent('3'));
                BlocProvider.of<MessageBloc>(context).add(GetFinishConsultation());
              },
              child: CustomItemInContainer(
                title: 'منتهية',
                type: type,
                int: '3',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
