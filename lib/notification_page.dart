import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dropdown_country_box.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String dropdownValue = "VietNam";

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
                DropdownCountryBox(dropdownValue,
                    callBack: (value) => {
                          setState(() {
                            dropdownValue = value;
                          })
                        })
              ],
            ),
          ),
        ));
  }
}

class DropDownItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isFirstItem;
  final bool isLastItem;
  ValueSetter<String> callBack;

  DropDownItem(
      {required this.text,
      this.isSelected = false,
      this.isFirstItem = false,
      this.isLastItem = false,
      required this.callBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //return value
        callBack(text);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          gradient: isSelected
              ? LinearGradient(
                  colors: [Colors.purple, Colors.blue],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                )
              : const LinearGradient(colors: [Colors.white, Colors.white]),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey, fontSize: 14),
          ),
        ),
      ),
    );
  }
}

class DropDown extends StatelessWidget {
  final double itemHeight;
  final String selectedItem;
  ValueSetter<String> callBack;
  List<String> dropCountryData = <String>[
    'VietNam',
    'ThaiLan',
    'Campuchia',
    'Indo',
    'Sing'
  ];

  DropDown(
      {Key? key,
      required this.itemHeight,
      required this.selectedItem,
      required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 5,
        ),
        Material(
          color: Colors.transparent,
          child: Container(
            height: dropCountryData.length * itemHeight + 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 0.1,
                    offset: const Offset(0, 0.1)),
              ],
            ),
            child: Column(
              children: <Widget>[
                DropDownItem(
                    text: dropCountryData[0],
                    isSelected: selectedItem == dropCountryData[0],
                    callBack: callBack,
                    isFirstItem: true),
                DropDownItem(
                  text: dropCountryData[1],
                  isSelected: selectedItem == dropCountryData[1],
                  callBack: callBack,
                ),
                DropDownItem(
                  text: dropCountryData[2],
                  isSelected: selectedItem == dropCountryData[2],
                  callBack: callBack,
                ),
                DropDownItem(
                  text: dropCountryData[3],
                  isSelected: selectedItem == dropCountryData[3],
                  callBack: callBack,
                ),
                DropDownItem(
                    text: dropCountryData[4],
                    isSelected: selectedItem == dropCountryData[4],
                    callBack: callBack,
                    isLastItem: true),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
