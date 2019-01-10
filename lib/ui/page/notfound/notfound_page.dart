import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mcerebrum_main_flutter/ui/widgets/common_scaffold.dart';
import 'package:mcerebrum_main_flutter/ui/widgets/profile_tile.dart';

class NotFoundPage extends StatelessWidget {
  final appTitle;
  final title;
  final message;
  final IconData icon;
  final String image;
  final iconColor;

  NotFoundPage(
      {this.appTitle = "Coming Soon",
      this.title = "Coming Soon",
      this.message = "Under development",
      this.icon = FontAwesomeIcons.solidSmile,
      this.image,
      this.iconColor = Colors.green});

  Widget bodyData() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 100.0,
              color: iconColor,
            ),
            SizedBox(
              height: 20.0,
            ),
            ProfileTile(
              title: title,
              subtitle: message,
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appTitle: appTitle,
      bodyData: bodyData(),
      showDrawer: false,
      showFAB: false,
    );
  }
}
