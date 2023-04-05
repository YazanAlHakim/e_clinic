import 'package:e_clinic/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../bloc/post_question_bloc/post_question_bloc.dart';
import '../../bloc/primary_home_bloc/primary_home_bloc.dart';
import '../../core/constant/color_app.dart';
import '../../core/constant/routes_app.dart';
import '../widget/primary_screen_widget/custom_appbar_title.dart';
import '../widget/primary_screen_widget/custom_circular_image.dart';
import '../widget/primary_screen_widget/custom_bottom_bar.dart';
import '../widget/primary_screen_widget/custom_fab_button.dart';

class PrimaryScreen extends StatelessWidget {
  const PrimaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrimaryHomeBloc, PrimaryHomeState>(
        builder: (context, state) {
          if (state is ChangePageState) {
            return Scaffold(
              backgroundColor: BlocProvider.of<PrimaryHomeBloc>(context).currentPage == 3 || BlocProvider.of<PrimaryHomeBloc>(context).currentPage == 1 ? AppColor.lightGreen : null,
              appBar: BlocProvider.of<PrimaryHomeBloc>(context).currentPage == 4
                  ? null
                  : BlocProvider.of<PrimaryHomeBloc>(context).currentPage == 3
                  ? null
                  : BlocProvider.of<PrimaryHomeBloc>(context).currentPage == 1
                  ? null
                  : AppBar(
                      backgroundColor: AppColor.lightGreen,
                      leading:  CustomCircularImage(image: prefs.getString('image')!),
                      leadingWidth: 54.0,
                      title: const CustomAppbarTitle(),
                      //centerTitle: true,
                      toolbarHeight: 8.h,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(24.0)),
                      ),
                    ),
              floatingActionButton:
                  BlocProvider.of<PrimaryHomeBloc>(context).currentPage == 3
                      ? BlocBuilder<PostQuestionBloc, PostQuestionState>(
                          builder: (context, state) {
                          if (state is GetQuestionDoneState) {
                            return CustomFabButton(
                              title: 'اضافة سؤال',
                              onTab: () {
                                Navigator.pushNamed(context, AppRoutes.addQuestionScreen);
                              },
                            );
                          } else {
                            return const SizedBox();
                          }
                        })
                      : null,
              bottomNavigationBar: BottomAppBar(
                color: const Color(0xffD9D9D9),
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...List.generate(
                          5,
                          (index) => CustomBottomBar(
                                onTab: () {
                                  BlocProvider.of<PrimaryHomeBloc>(context)
                                      .add(ChangePageEvent(index));
                                },
                                icon: BlocProvider.of<PrimaryHomeBloc>(context)
                                    .iconBottomBar[index],
                                active: state.indexPage == index ? true : false,
                              ))
                    ],
                  ),
                ),
              ),
              body: Padding(
                padding:
                    BlocProvider.of<PrimaryHomeBloc>(context).currentPage == 4 || BlocProvider.of<PrimaryHomeBloc>(context).currentPage == 3 || BlocProvider.of<PrimaryHomeBloc>(context).currentPage == 1
                        ? const EdgeInsets.all(0.0)
                        : const EdgeInsets.all(14.0),
                child: BlocProvider.of<PrimaryHomeBloc>(context)
                    .listPage
                    .elementAt(
                        BlocProvider.of<PrimaryHomeBloc>(context).currentPage!),
              ),
            );
          } else {
            return BlocBuilder<PrimaryHomeBloc, PrimaryHomeState>(
                builder:  (context, state){
                  return const Scaffold(body:SizedBox());
                }
            );
          }
        },
    );
  }
}
