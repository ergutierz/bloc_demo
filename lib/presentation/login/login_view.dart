import 'package:alice/alice.dart';
import 'package:bloc_demo/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/component/atomic_text_component.dart';
import '../../di/dependency_registry.dart';
import '../../translations/locale_keys.g.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import 'login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginViewModel _viewModel;
  late final Alice _alice;

  @override
  initState() {
    super.initState();
    _viewModel = instance.get<LoginViewModel>();
    _alice = instance.get<Alice>();
  }

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
        actions: [
          IconButton(
            icon: Icon(
              Icons.language,
              color: ColorManager.blue,
            ),
            onPressed: () async {
              await _toggleLanguage();
            },
          ),
          Visibility(
            visible: kDebugMode,
            child: IconButton(
              onPressed: () async {
                _alice.showInspector();
              },
              icon: Icon(
                  Icons.show_chart_outlined,
                  color: ColorManager.blue,
              ),
            ),
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
              // Navigator.pushNamed(context, Routes.mainRoute);
              _viewModel.onIntent(FetchProducts());
            },
            child: const Text('SUBMIT'),
          ),
        ),
      ),
    );
  }
}
