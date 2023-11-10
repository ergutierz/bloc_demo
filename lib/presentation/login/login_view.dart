import 'package:bloc_demo/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/component/atomic_text_component.dart';
import '../../translations/locale_keys.g.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  _toggleLanguage() {
    var locale = context.locale;
    if (locale == const Locale('en', 'US')) {
      context.setLocale(const Locale('es', 'ES'));
    } else {
      context.setLocale(const Locale('en', 'US'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'login_button'.tr(),
          style: TextStyle(
            color: ColorManager.black,
          ),
        ),
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.language,
              color: ColorManager.black,
            ),
            onPressed: () async {
              await _toggleLanguage();
            },
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        // Your scrollable content here
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BaseText(LocaleKeys.login_button),
              BaseText(LocaleKeys.already_have_account),
              BaseText(LocaleKeys.about),
              BaseText(LocaleKeys.conflict_error),
              BaseText(LocaleKeys.details),
              BaseText(LocaleKeys.error_occurred),
              // More widgets here
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s16),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.mainRoute);
            },
            child: const Text('SUBMIT'),
          ),
        ),
      ),
    );
  }
}
