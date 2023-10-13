import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:cirestechnologies/app/utils/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingInPageViewModel extends ChangeNotifier {
  final NavigationService navigationService;

  SingInPageViewModel({
    required this.navigationService,
  });

  final ToastUtils toastUtils = ToastUtils();
  bool rememberMe = false;
  final formKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool passwordVisible = false;

  showHidePassword() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  void login(BuildContext context) {
    if (!formKey.currentState!.validate()) {
      return;
    }
    SharedPreferences.getInstance()
        .then((value) => value.setBool("auth", true));
    username.text == "muser" && password.text == "mpassw0rd"
        ? navigateToMainAppPage()
        : username.text == "muser02" && password.text == "mpassword"
            ? toastUtils.launchToast(
                context: context,
                title: "Ce compte est bloqué",
                icon: Icons.block_outlined,
                backgroundColor: Colors.red)
            : toastUtils.launchToast(
                context: context,
                title: "Erreur",
                icon: Icons.block_outlined,
                backgroundColor: Colors.deepOrange);
    ;
  }

  void navigateToMainAppPage() {
    navigationService.navigateToAndMakeRoot(routeName: Routes.mainApp);
  }

  void navigateToOnbroadingScreenPage() {
    navigationService.navigateToAndMakeRoot(routeName: Routes.onbroadingScreen);
  }
}
