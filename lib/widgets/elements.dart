import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gwgplay/themes/app_colour.dart';
import 'package:gwgplay/themes/app_theme.dart';

class TileView extends StatelessWidget {
  const TileView({
    this.child,
    this.color,
    this.splashColor,
    this.onTap,
  });
  final Widget child;
  final Color color;
  final Color splashColor;
  final Function() onTap;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Material(
        color: color,
        elevation: 10.0,
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: shadowColor(context),
        child: InkWell(
          child: child,
          splashColor: splashColor,
          borderRadius: BorderRadius.circular(15.0),
          onTap: onTap != null
              ? () => onTap()
              : () {
            debugPrint('Not set yet');
          },
        ),
      ),
    );
  }
}

class TitleStylesDefault {
  static const white = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    color: AppColors.white,
  );
  static const black = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    color: AppColors.black,
  );
  static const primary = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    color: AppColors.primary,
  );
}

class BodyStylesDefault {
  static const white = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static const black = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  static const primary = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );
}

class HeadingStylesDefault {
  static const white = TextStyle(
    fontFamily: 'Pontano Sans',
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static const black = TextStyle(
    fontFamily: 'Pontano Sans',
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static const accent = TextStyle(
    fontFamily: 'Pontano Sans',
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: AppColors.dark,
  );
}

class HeadingStylesMaterial {
  static const light = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 30.0,
    fontWeight: FontWeight.w700,
    color: AppColors.light,
  );
  static const dark = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 30.0,
    fontWeight: FontWeight.w700,
    color: AppColors.dark,
  );
  static const primary = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 30.0,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );
}

class SubHeadingStylesMaterial {
  static const light = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: AppColors.light,
  );
  static const dark = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: AppColors.dark,
  );
  static const primary = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );
}

class HeadingStylesGradient {
  static const white = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static const black = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );
  static const primary = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );
}

class SubHeadingStylesGradient {
  static const white = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static const black = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static const primary = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
}

class LabelStyles {
  static const white = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static const black = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );
  static const primary = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );
}

bool isIOS(BuildContext context) {
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    return true;
  } else {
    return false;
  }
} // check if android or ios

bool isThemeCurrentlyDark(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.dark) {
    return true;
  } else {
    return false;
  }
} //returns current theme status

Color invertColorsTheme(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return AppColors.primary;
  } else {
    return AppColors.accent;
  }
} //returns appropriate theme colors for ui elements

Color invertInvertColorsTheme(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return AppColors.accent;
  } else {
    return AppColors.primary;
  }
} //keeps the same colors lol

Color invertColorsMild(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return AppColors.light;
  } else {
    return AppColors.dark;
  }
} //returns appropriate mild colors for text visibility

Color invertInvertColorsMild(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return AppColors.dark;
  } else {
    return AppColors.light;
  }
} //keeps the same colors lol

Color invertColorsStrong(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return AppColors.white;
  } else {
    return AppColors.black;
  }
} //returns appropriate strong colors for text visibility

Color invertInvertColorsStrong(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return AppColors.black;
  } else {
    return AppColors.white;
  }
} //keeps the same colors lol

Color invertColorsMaterial(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return MaterialColors.orange;
  } else {
    return MaterialColors.yellow;
  }
} //returns appropriate material colors

Color invertInvertColorsMaterial(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return MaterialColors.yellow;
  } else {
    return MaterialColors.orange;
  }
} //keeps the same colors lol

Color shadowColor(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return ShadowColors.dark;
  } else {
    return ShadowColors.light;
  }
} //returns appropriate colors for raised element shadows

// Alert Dialog to Prompt Application Exit
Widget exitPrompt(BuildContext context) {
  return new AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    title: new Text("Close the App?", style: AppTheme.title),
    content: new Text("Do you want to exit the App?", style: AppTheme.body1),
    actions: <Widget>[
      FlatButton(
        onPressed: () => Navigator.of(context).pop(false),
        child: Text(
          "NO",
          style: TextStyle(fontSize: 16.0, color: Colors.red),
        ),
      ),
      FlatButton(
        onPressed: () =>
            SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop'),
        child: Text(
          "YES",
          style: TextStyle(fontSize: 16.0, color: Colors.blue),
        ),
      ),
    ],
  );
}

// Deactivated Network Prompt
Widget deactivatedNetworkPrompt(BuildContext context, String serviceName) {
  return new AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    title: new Text(
      "Network Currently Deactivated",
      style: AppTheme.title,
    ),
    content: new Text(
        "Please Activate the Network to Access $serviceName Services",
        style: AppTheme.body1),
    actions: <Widget>[
      FlatButton(
        onPressed: () => Navigator.of(context).pop(false),
        child: Text(
          "OKAY",
          style: TextStyle(fontSize: 16.0, color: Colors.red),
        ),
      )
    ],
  );
}

// Confirmation Prompt
Widget confirmationPrompt(BuildContext context, String confirmationTitle,
    String confirmationContent) {
  return new AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    title: new Text(
      confirmationTitle,
      style: AppTheme.title,
    ),
    content: new Text(confirmationContent, style: AppTheme.body1),
    actions: <Widget>[
      FlatButton(
        onPressed: () => Navigator.of(context).pop(false),
        child: Text(
          "NO, THANKS",
          style: TextStyle(fontSize: 16.0, color: Colors.red),
        ),
      ),
      FlatButton(
        onPressed: () => Navigator.of(context).pop(true),
        child: Text(
          "SURE",
          style: TextStyle(fontSize: 16.0, color: Colors.blue),
        ),
      ),
    ],
  );
}

// Display DialogBox
Widget displayDialog(BuildContext context, String dialogTitle,
    String dialogContent, String dialogAction) {
  return new AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    title: new Text(
      dialogTitle,
      style: AppTheme.title,
    ),
    content: new Text(dialogContent, style: AppTheme.body1),
    actions: <Widget>[
      FlatButton(
        onPressed: () => Navigator.of(context).pop(true),
        child: Text(
          dialogAction,
          style: TextStyle(fontSize: 16.0, color: Colors.blue),
        ),
      ),
    ],
  );
}

// Tile Builder
Widget buildTile(Widget child, {Function() onTap}) {
  return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: ShadowColors.dark,
      child: InkWell(
        // Do onTap() if it isn't null, otherwise do print()
          onTap: onTap != null
              ? () => onTap()
              : () {
            debugPrint('Not set yet');
          },
          child: child));
}

// SnackBar to Show Error and Ask for Retry
void displaySnackBar(BuildContext context, String _snackBarContent,
    int duration, String labelContent) {
  final _snackBar = SnackBar(
      content: Text("$_snackBarContent"),
      duration: new Duration(seconds: duration),
      action: SnackBarAction(
        label: labelContent,
        onPressed: () => debugPrint("SnackBar Pressed"),
      ));

  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(_snackBar);
}