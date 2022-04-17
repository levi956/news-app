import 'package:flutter/material.dart';
import 'package:nuntium_news_app/utils/style/color_constant.dart';

class SettingListTile extends StatelessWidget {
  final String? label;
  final Widget? trailing;
  const SettingListTile({Key? key, this.trailing, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        tileColor: greyLighter,
        title: Text(
          label!,
          style: TextStyle(
              color: greyDarker, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        trailing: trailing,
      ),
    );
  }
}
