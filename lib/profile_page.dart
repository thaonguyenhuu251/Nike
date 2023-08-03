import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike/common/app_dimens.dart';
import 'package:nike/home_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 120),
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileUser(),
                Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 30, top: 15, bottom: 15),
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFFF),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ItemProfile(context, 'assets/images/ic_profile_user.svg',
                          'Profile', true, HomePage()),
                      ItemProfile(context, 'assets/images/ic_profile_cart.svg',
                          'My Cart', true, HomePage()),
                      ItemProfile(
                          context,
                          'assets/images/ic_profile_favorite.svg',
                          'Favorite',
                          true,
                          HomePage()),
                      ItemProfile(
                          context,
                          'assets/images/ic_profile_orders.svg',
                          'Orders',
                          true,
                          HomePage()),
                      ItemProfile(
                          context,
                          'assets/images/ic_profile_notifications.svg',
                          'Notifications',
                          true,
                          HomePage()),
                      ItemProfile(
                          context,
                          'assets/images/ic_profile_setting.svg',
                          'Settings',
                          true,
                          HomePage()),
                      ItemProfile(
                          context,
                          'assets/images/ic_profile_sign_out.svg',
                          'Sign Out',
                          true,
                          HomePage()),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class ProfileUser extends StatelessWidget {
  const ProfileUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius:
                BorderRadius.circular(AppDimens.widthChangeAvtar(context)),
            child: Image.network(
              'https://www.geog.ucl.ac.uk/study/graduate-taught/msc-social-and-geographic-data-science/images/Network-large.jpg',
              alignment: Alignment.center,
              width: AppDimens.widthChangeAvtar(context),
              height: AppDimens.widthChangeAvtar(context),
              fit: BoxFit.cover,
            )),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: null,
          child: const Text('Disabled'),
        ),
      ],
    );
  }
}

Widget ItemProfile(BuildContext context, String iconItem, String textContent,
    bool iconMore, StatelessWidget transitionTo) {
  return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  width: 28,
                  height: 28,
                  margin: EdgeInsets.only(right: 20, top: 8, bottom: 8),
                  child: SvgPicture.asset(
                    iconItem,
                    alignment: Alignment.center,
                    width: 28,
                    height: 28,
                    fit: BoxFit.fill,
                    colorFilter:
                        ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  )),
              Text(
                textContent,
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          SvgPicture.asset(
            'assets/images/ic_direction_left.svg',
            alignment: Alignment.center,
            width: 18,
            height: 18,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
        ],
      ));
}
