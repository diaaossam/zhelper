import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbib_toast/tbib_toast.dart';
import 'package:zhelper/main_layout/cubit/main_cubit.dart';
import 'package:zhelper/shared/helper/mangers/colors.dart';
import 'package:zhelper/shared/helper/methods.dart';
import 'package:zhelper/ui/widgets/app_text.dart';
import 'package:zhelper/ui/widgets/custom_text_form_field.dart';
import '../../../../shared/helper/mangers/size_config.dart';
import '../../../../ui/widgets/custom_choose_gender.dart';

class RequestHelpThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        if(state is ReuestHelperLoading){
          showCustomProgressIndicator(context);
        }
        else if(state is ReuestHelperSuccess){
          Navigator.pop(context);
          Toast.show(state.message, context,duration: 3);
          if(state.message == "Request Help Added"){
            MainCubit.get(context).boardController2.nextPage(
                duration: const Duration(
                  milliseconds: 750,
                ),
                curve: Curves.fastLinearToSlowEaseIn);
          }
        }
        else if(state is ReuestHelperError){
          Navigator.pop(context);
          Toast.show(state.message, context,duration: 3,backgroundColor: Colors.red);
        }
      },
      builder: (context, state) {
        MainCubit cubit = MainCubit.get(context);
        return SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/user.png'),
                      SizedBox(
                        width: getProportionateScreenHeight(8),
                      ),
                      AppText(
                        text: '???????????? ??????????????',
                        color: ColorsManger.darkPrimary,
                        textSize: 24,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  CustomTextFormField(
                    controller: cubit.helperEducationReq,
                    hintText: "????????????",
                    type: TextInputType.text,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "?????? ?????????? ????????????";
                      }
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  CustomTextFormField(
                    controller:cubit.helperExpYearsReq,
                    hintText: "?????????? ????????????",
                    type: TextInputType.number,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "?????? ?????????? ?????????? ????????????";
                      }
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  CustomTextFormField(
                    controller: cubit.helperLocationReq,
                    hintText: "????????????????",
                    type: TextInputType.text,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "?????? ?????????? ????????????????";
                      }
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  CustomTextFormField(
                    controller: cubit.helperHoursReq,
                    hintText: "?????????? ??????????",
                    type: TextInputType.number,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "?????? ?????????? ?????????? ??????????";
                      }
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  CustomTextFormField(
                    controller: cubit.helperAgeReq,
                    hintText: "??????????",
                    type: TextInputType.number,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "?????? ?????????? ??????????";
                      }
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomRadioListTileNumber<bool>(
                        value: true,
                        groupValue: cubit.isMaleReq,
                        text: '??????',
                        onChanged: (value) {
                          cubit.chooseGender(value!);
                        },
                      ),
                      SizedBox(
                        width: getProportionateScreenHeight(20.0),
                      ),
                      CustomRadioListTileNumber<bool>(
                        value: false,
                        groupValue: cubit.isMaleReq,
                        text: '????????',
                        onChanged: (value) {
                          cubit.chooseGender(value!);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
