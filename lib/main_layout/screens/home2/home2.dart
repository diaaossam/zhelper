import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zhelper/main_layout/cubit/main_cubit.dart';
import 'package:zhelper/main_layout/screens/home/components/articles_item_design.dart';
import 'package:zhelper/main_layout/screens/home/components/custom_card.dart';
import 'package:zhelper/shared/helper/mangers/colors.dart';
import 'package:zhelper/shared/helper/mangers/size_config.dart';
import 'package:zhelper/shared/helper/methods.dart';
import 'package:zhelper/ui/screens/login_screen/login_screen.dart';
import 'package:zhelper/ui/screens/register/register.dart';
import 'package:zhelper/ui/widgets/app_text.dart';
import 'package:zhelper/ui/widgets/custom_button.dart';

class Home2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()..getAllArticles(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenHeight(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                          height: getProportionateScreenHeight(30)),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                            height: SizeConfigManger.bodyHeight * .25,
                            decoration: BoxDecoration(
                              color: ColorsManger.lightGrey,
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenHeight(20)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: getProportionateScreenHeight(10)),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenHeight(20)),
                                  child: Row(
                                    children: [
                                      AppText(
                                        text: "???? ?????????? ???????? ??",
                                        textSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      SizedBox(
                                          width:
                                              getProportionateScreenHeight(15)),
                                      CustomButton(
                                        width:
                                            SizeConfigManger.screenWidth * .4,
                                        press: () {
                                          navigateToAndFinish(
                                              context, LoginScreen());
                                        },
                                        text: "?????????? ????????????",
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenHeight(20)),
                                  child: Row(
                                    children: [
                                      AppText(
                                        text: "???? ?????????? ?????????????? ??",
                                        textSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      SizedBox(
                                          width:
                                              getProportionateScreenHeight(15)),
                                      CustomButton(
                                        width:
                                            SizeConfigManger.screenWidth * .4,
                                        press: () {
                                          navigateToAndFinish(
                                              context, RegisterScreen());
                                        },
                                        text: "?????????? ????????",
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      Container(
                          color: Colors.blue,
                          height: SizeConfigManger.bodyHeight * .25,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image:
                                          AssetImage('assets/images/home.png'),
                                    ),
                                  ),
                                  width: SizeConfigManger.screenWidth * .3,
                                  height: SizeConfigManger.bodyHeight * .28,
                                ),
                                Spacer(),
                                Expanded(
                                  child: Container(
                                    child: AppText(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        maxLines: 5,
                                        text:
                                            '?????? ???????????? ???????????? ?????????? ???????????????? ?????????????? ???? ???? ???? ?????? ?????? ????????????????'),
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: getProportionateScreenHeight(25),
                      ),
                      AppText(
                          text: '????????????',
                          color: ColorsManger.darkPrimary,
                          fontWeight: FontWeight.bold),
                      Container(
                        width: double.infinity,
                        height: SizeConfigManger.bodyHeight * .15,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => SizedBox(
                                  width: getProportionateScreenHeight(20)),
                              separatorBuilder: (context, index) =>
                                  ArticlesItemDesign(
                                      press: () {},
                                      image: "assets/images/board2.png"),
                              itemCount: 5),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(25),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomCardHome(text: '???????? ??????????????'),
                          CustomCardHome(text: '???????? ??????????'),
                        ],
                      ),
                      Center(child: CustomCardHome(text: '??????????')),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
