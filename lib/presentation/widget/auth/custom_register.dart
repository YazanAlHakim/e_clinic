import 'package:e_clinic/bloc/auth_bloc/auth_bloc.dart';
import 'package:e_clinic/model/cities_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/constant/color_app.dart';
import '../../../core/constant/image_app.dart';
import 'custom_auth_text_field.dart';
import 'custom_subtitle_auth.dart';

class CustomRegister extends StatelessWidget {

  final List<CitiesModel> cities;
  const CustomRegister({Key? key, required this.cities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      //padding: const EdgeInsets.all(16.0),
      //shrinkWrap: true,
      children:  [
        Image.asset(
          AppImage.login,
        ),
        const SizedBox(height: 18.0,),
        ListView(
          shrinkWrap: true,
          physics:  const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          children: [
            const CustomSubTitleAuth(
              title: 'اهلا وسهلا بك',
            ),
             CustomAuthTextField(
              textFieldController: BlocProvider.of<AuthBloc>(context).email,
              hint: 'البريد الالكتروني',
              keyboardType: TextInputType.emailAddress,
              icon: Icons.email_outlined,
              password: false,
            ),
             CustomAuthTextField(
              textFieldController: BlocProvider.of<AuthBloc>(context).password,
              hint: 'كلمة السر',
              keyboardType: TextInputType.visiblePassword,
              icon: Iconsax.lock,
              password: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: DropdownButtonFormField(
                items: cities.map((e) => DropdownMenuItem(
                    value: e.name!,
                    child: Text(
                      e.name!,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.start,
                    )
                ),
                ).toList(),
                onChanged:(value)
                {
                  for (var element in BlocProvider.of<AuthBloc>(context).citiesValue){
                    if(element.name == value){
                      BlocProvider.of<AuthBloc>(context).selectedCityId = element.id.toString();
                    }
                  }
                 // controller.city=value.toString();
                },
                hint: const Text(
                    'اختر مدينتك'
                ),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_city_outlined
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 4.0),

                ),
                validator: (value)
                {
                },
              ),
            ),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 14.0),
        //   child: InkWell(
        //     onTap: () {
        //       BlocProvider.of<AuthBloc>(context).add(UploadImage());
        //     },
        //     child: const CircleAvatar(
        //       backgroundColor: AppColor.lightGreen,
        //       radius: 26.0,
        //       child: Icon(
        //         Icons.add_a_photo_outlined,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
