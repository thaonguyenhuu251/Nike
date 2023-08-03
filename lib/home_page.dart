import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
        child: SingleChildScrollView(
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TopBar(),
            Padding(padding: EdgeInsets.symmetric(vertical: 16)),
            HomeSearch(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: GridView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
                children: [
                  Image.network('https://picsum.photos/250?image=1'),
                  Image.network('https://picsum.photos/250?image=2'),
                  Image.network('https://picsum.photos/250?image=3'),
                  Image.network('https://picsum.photos/250?image=4'),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
            enableFeedback: false,
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/ic_hamburger.svg',
              alignment: Alignment.bottomLeft,
              width: 16,
              height: 16,
              fit: BoxFit.cover,
            )),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/images/ic_expolore.svg',
              alignment: Alignment.topCenter,
              width: 18,
              height: 18,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                "Explore",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Stack(
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100)),
              ),
              child: IconButton(
                  splashColor: Colors.transparent,
                  enableFeedback: false,
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/ic_bag_white.svg',
                    alignment: Alignment.center,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: const Color(0xffFD1600),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                  ),
                ))
          ],
        )
      ],
    );
  }
}

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 52,
          padding: EdgeInsets.only(left: 20, right: 30),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(
                'assets/images/ic_search_new.svg',
                alignment: Alignment.center,
                width: 38,
                height: 38,
                fit: BoxFit.cover,
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              Text(
                "Looking for shoes",
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
        Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            color: Color(0xff0D6EFD),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                topRight: Radius.circular(100),
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100)),
          ),
          child: IconButton(
              splashColor: Colors.transparent,
              enableFeedback: false,
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/ic_sliders.svg',
                alignment: Alignment.center,
                width: 28,
                height: 28,
                fit: BoxFit.cover,
              )),
        ),
      ],
    );
  }
}
