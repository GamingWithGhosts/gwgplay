import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwgplay/themes/app_colour.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
      primarySwatch: MaterialColor(
        0xFFF5E0C3,
        <int, Color>{
          50: Color(0x1aF5E0C3),
          100: Color(0xa1F5E0C3),
          200: Color(0xaaF5E0C3),
          300: Color(0xafF5E0C3),
          400: Color(0xffF5E0C3),
          500: Color(0xffEDD5B3),
          600: Color(0xffDEC29B),
          700: Color(0xffC9A87C),
          800: Color(0xffB28E5E),
          900: Color(0xff936F3E)
        },
      ),
      primaryColor: LightColor.white,
      primaryColorBrightness: Brightness.light,
      primaryColorLight: Color(0x1aF5E0C3),
      primaryColorDark: LightColor.darkGrey,
      canvasColor: LightColor.white,
      accentColor: Color(0xff457BE0),
      accentColorBrightness: Brightness.light,
      scaffoldBackgroundColor: nearlyWhite,
      bottomAppBarColor: nearlyWhite,
      cardColor: LightColor.cardColor,
      dividerColor: Color(0x1f6D42CE),
      focusColor: Color(0x1aF5E0C3),
      hoverColor: Color(0xffDEC29B),
//      highlightColor: LightColor.lightPink,
      splashColor: Color(0xff457BE0),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
      selectedRowColor: Colors.grey,
      unselectedWidgetColor: Colors.grey.shade400,
      disabledColor: Colors.grey.shade200,
      buttonTheme: ButtonThemeData(
        //button themes
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        //toggle button theme
      ),
      buttonColor: Color(0xff936F3E),
      secondaryHeaderColor: AppColors.white,
      textSelectionColor: Color(0xffB5BFD3),
      cursorColor: Color(0xff936F3E),
      textSelectionHandleColor: Color(0xff936F3E),
      backgroundColor: nearlyWhite,
      dialogBackgroundColor: Colors.white,
      indicatorColor: Color(0xff457BE0),
      hintColor: Colors.grey,
      errorColor: Colors.red,
      toggleableActiveColor: CardColors.green,  //Color(0xff6D42CE)
      textTheme: TextTheme(
        //text themes that contrast with card and canvas
      ),
      primaryTextTheme: TextTheme(
        //text theme that contrast with primary color
      ),
      accentTextTheme: TextTheme(
        //text theme that contrast with accent Color
      ),
      inputDecorationTheme: InputDecorationTheme(
        // default values for InputDecorator, TextField, and TextFormField
      ),
      iconTheme: IconThemeData(
        //icon themes that contrast with card and canvas
      ),
      primaryIconTheme: IconThemeData(
        //icon themes that contrast primary color
      ),
//      accentIconTheme: IconThemeData(
//        //icon themes that contrast accent color
//      ),
      sliderTheme: SliderThemeData(
        // slider themes
      ),
      tabBarTheme: TabBarTheme(
        // tab bat theme
      ),
      tooltipTheme: TooltipThemeData(
        // tool tip theme
      ),
      cardTheme: CardTheme(
        // card theme
      ),
      chipTheme: ChipThemeData(
          backgroundColor: nearlyWhite,
          disabledColor: Color(0xaaF5E0C3),
          shape: StadiumBorder(),
          brightness: Brightness.light,
          labelPadding: EdgeInsets.all(8),
          labelStyle: TextStyle(),
          padding: EdgeInsets.all(8),
          secondaryLabelStyle: TextStyle(),
          secondarySelectedColor: Colors.white38,
          selectedColor: Colors.white
        // chip theme
      ),
      platform: TargetPlatform.android,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      applyElevationOverlayColor: true,
      pageTransitionsTheme: PageTransitionsTheme(
        //page transition theme
      ),
      appBarTheme: AppBarTheme(
        //app bar theme
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        // bottom app bar theme
      ),
      colorScheme: ColorScheme(
          primary: AppColors.dark,
          primaryVariant: Color(0x1aF5E0C3),
          secondary: Color(0xffC9A87C),
          secondaryVariant: Color(0xaaC9A87C),
          brightness: Brightness.light,
          background: LightColor.background,
          error: Colors.red,
          onBackground: AppColors.light,    //            Color(0xffB5BFD3),
          onError: Colors.red,
          onPrimary: Color(0xffEDD5B3),
          onSecondary: Color(0xffC9A87C),
          onSurface: Color(0xff457BE0),
          surface: Color(0xff457BE0)),
      snackBarTheme: SnackBarThemeData(
        // snack bar theme
      ),
      dialogTheme: DialogTheme(
        // dialog theme
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        // floating action button theme
      ),
      navigationRailTheme: NavigationRailThemeData(
        // navigation rail theme
      ),
      typography: Typography.material2018(),
      cupertinoOverrideTheme: CupertinoThemeData(
        //cupertino theme
      ),
      bottomSheetTheme: BottomSheetThemeData(
        //bottom sheet theme
      ),
      popupMenuTheme: PopupMenuThemeData(
        //pop menu theme
      ),
      bannerTheme: MaterialBannerThemeData(
        // material banner theme
      ),
      dividerTheme: DividerThemeData(
        //divider, vertical divider theme
      ),
      buttonBarTheme: ButtonBarThemeData(
        // button bar theme
      ),
      fontFamily: 'RobotoMono',
      splashFactory: InkSplash.splashFactory
  );

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
      primarySwatch: MaterialColor(
        0xFFF5E0C3,
        <int, Color>{
          50: Color(0x1a5D4524),
          100: Color(0xa15D4524),
          200: Color(0xaa5D4524),
          300: Color(0xaf5D4524),
          400: Color(0x1a483112),
          500: Color(0xa1483112),
          600: Color(0xaa483112),
          700: Color(0xff483112),
          800: Color(0xaf2F1E06),
          900: Color(0xff2F1E06)
        },
      ),
      primaryColor: AppColors.dark,
      primaryColorBrightness: Brightness.dark,
      primaryColorLight: AppColors.light,
      primaryColorDark: AppColors.dark,
      canvasColor: AppColors.dark,
      accentColor: Color(0xff457BE0),
      accentColorBrightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xffB5BFD3),
      bottomAppBarColor: Color(0xff6D42CE),
      cardColor: Color(0xaa311F06),
      dividerColor: Color(0x1f6D42CE),
      focusColor: Color(0x1a311F06),
      hoverColor: Color(0xa15D4524),
//      highlightColor: Color(0xaf2F1E06),
      splashColor: Color(0xff457BE0),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
      selectedRowColor: Colors.grey,
      unselectedWidgetColor: Colors.grey.shade400,
      disabledColor: Colors.grey.shade200,
      buttonTheme: ButtonThemeData(
//button themes
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
//toggle button theme
      ),
      buttonColor: Color(0xff483112),
      secondaryHeaderColor: Colors.grey,
      textSelectionColor: AppColors.white,
      cursorColor: Color(0xff483112),
      textSelectionHandleColor: AppColors.light,
      backgroundColor: LightColor.background,
      dialogBackgroundColor: Colors.white,
      indicatorColor: Color(0xff457BE0),
      hintColor: Colors.grey,
      errorColor: Colors.red,
      toggleableActiveColor: Color(0xff6D42CE),
      textTheme: TextTheme(
//text themes that contrast with card and canvas
      ),
      primaryTextTheme: TextTheme(
//text theme that contrast with primary color
      ),
      accentTextTheme: TextTheme(
//text theme that contrast with accent Color
      ),
      inputDecorationTheme: InputDecorationTheme(
// default values for InputDecorator, TextField, and TextFormField
      ),
      iconTheme: IconThemeData(
//icon themes that contrast with card and canvas
      ),
      primaryIconTheme: IconThemeData(
//icon themes that contrast primary color
      ),
//      accentIconTheme: IconThemeData(
////icon themes that contrast accent color
//      ),
      sliderTheme: SliderThemeData(
        // slider themes
      ),
      tabBarTheme: TabBarTheme(
        // tab bat theme
      ),
      tooltipTheme: TooltipThemeData(
        // tool tip theme
      ),
      cardTheme: CardTheme(
        // card theme
      ),
      chipTheme: ChipThemeData(
          backgroundColor: Color(0xff2F1E06),
          disabledColor: Color(0xa15D4524),
          shape: StadiumBorder(),
          brightness: Brightness.dark,
          labelPadding: EdgeInsets.all(8),
          labelStyle: TextStyle(),
          padding: EdgeInsets.all(8),
          secondaryLabelStyle: TextStyle(),
          secondarySelectedColor: Colors.white38,
          selectedColor: Colors.white
        // chip theme
      ),
      platform: TargetPlatform.android,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      applyElevationOverlayColor: true,
      pageTransitionsTheme: PageTransitionsTheme(
        //page transition theme
      ),
      appBarTheme: AppBarTheme(
        //app bar theme
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        // bottom app bar theme
      ),
      colorScheme: ColorScheme(
          primary: Color(0xff5D4524),
          primaryVariant: Color(0x1a311F06),
          secondary: Color(0xff457BE0),
          secondaryVariant: Color(0xaa457BE0),
          brightness: Brightness.dark,
          background: AppColors.light,        // Color(0xffB5BFD3),
          error: Colors.red,
          onBackground: AppColors.light,      // Color(0xffB5BFD3),
          onError: Colors.red,
          onPrimary: Color(0xff5D4524),
          onSecondary: Color(0xff457BE0),
          onSurface: Color(0xff457BE0),
          surface: Color(0xff457BE0)),
      snackBarTheme: SnackBarThemeData(
        // snack bar theme
      ),
      dialogTheme: DialogTheme(
        // dialog theme
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        // floating action button theme
      ),
      navigationRailTheme: NavigationRailThemeData(
        // navigation rail theme
      ),
      typography: Typography.material2018(),
      cupertinoOverrideTheme: CupertinoThemeData(
        //cupertino theme
      ),
      bottomSheetTheme: BottomSheetThemeData(
        //bottom sheet theme
      ),
      popupMenuTheme: PopupMenuThemeData(
        //pop menu theme
      ),
      bannerTheme: MaterialBannerThemeData(
        // material banner theme
      ),
      dividerTheme: DividerThemeData(
        //divider, vertical divider theme
      ),
      buttonBarTheme: ButtonBarThemeData(
        // button bar theme
      ),
      fontFamily: 'WorkSans',
      splashFactory: InkSplash.splashFactory
  );

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);

  static TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static TextStyle display1 = TextStyle(fontWeight: FontWeight.bold, fontSize: 36, letterSpacing: 0.4, height: 0.9);
  static TextStyle headline = TextStyle(fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 0.27);
  static TextStyle title = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 0.18);
  static TextStyle subtitle = TextStyle(fontWeight: FontWeight.w400, fontSize: 14, letterSpacing: -0.04);

  static TextStyle body2 = TextStyle(fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: 0.1);
  static TextStyle body1 = TextStyle(fontWeight: FontWeight.w400, fontSize: 20, letterSpacing: -0.05);
  static TextStyle caption = TextStyle(fontWeight: FontWeight.w400, fontSize: 20, letterSpacing: 0.2);

  static TextStyle titleStyle = TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  static TextStyle subTitleStyle = TextStyle(fontSize: 18);
  static TextStyle drawerStyle = TextStyle(fontSize: 20);

  static TextStyle h1Style = TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  static TextStyle h2Style = TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
  static TextStyle h3Style = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h4Style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static TextStyle h5Style = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static TextStyle h6Style = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
}