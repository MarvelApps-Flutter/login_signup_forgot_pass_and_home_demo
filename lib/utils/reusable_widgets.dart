import 'package:flutter/material.dart';
import 'app_text_styles.dart';

Container buildButtonWidget(
    BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.white;
            }
            return const Color(0xFF0165ff);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)))),
    ),
  );
}

Container buildGoogleButtonWidget(
    BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
    child: ElevatedButton.icon(
       icon: ImageIcon(

         AssetImage("assets/images/google.png"),
          color: Colors.red,
       ),

      onPressed: () {
        onTap();
      },

      label: Text(
        title,
        style: const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.white;
            }
            return const Color(0xFFf1f6f7);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)))),
    ),
  );
}

Widget buildSizedBoxWidget(double definedHeight) {
  return SizedBox(
    height: definedHeight,
  );
}

Widget navigationTextWidget(BuildContext context, String initialText,
    Widget screenName, String laterText) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        initialText,
        style: AppTextStyles.lightTextStyle,
      ),
      InkWell(
        onTap: () {
          if (laterText == "Login") {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => screenName));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => screenName));
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
          child: Text(
            laterText,
            style: AppTextStyles.boldColoredTextStyle,
          ),
        ),
      )
    ],
  );
}
