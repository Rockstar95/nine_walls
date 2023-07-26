import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:nine_walls/views/common/components/modal_progress_hud.dart';
import '../../../utils/my_print.dart';
import '../../../utils/my_safe_state.dart';
import '../../common/components/MyCupertinoAlertDialogWidget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeScreen";

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin, MySafeState {
  bool isPageLoaded = false;

  Future<bool> onWillPop() async {
    bool? isLoggedOut = await showDialog(
      context: context,
      builder: (context) {
        return MyCupertinoAlertDialogWidget(
          title: "Exit",
          description: "Are you sure want to exit?",
          neagtiveText: "No",
          positiveText: "Yes",
          negativeCallback: () => Navigator.pop(context, false),
          positiviCallback: () async {
            Navigator.pop(context, true);
          },
        );
      },
    );

    if (isLoggedOut == true) {
      SystemNavigator.pop(animated: true);
      // exit(0);
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    super.pageBuild();

    return WillPopScope(
      onWillPop: onWillPop,
      child: ModalProgressHUD(
        inAsyncCall: false,
        opacity: 1,
        color: themeData.scaffoldBackgroundColor,
        child: Scaffold(
          body: SafeArea(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri("https://www.9wallsrealtors.com/")),
              onProgressChanged: (InAppWebViewController webViewController, int progress) {
                MyPrint.printOnConsole("onProgressChanged called with webViewController:$webViewController, progress:$progress");
                // this.webViewController = webViewController;

                if (!isPageLoaded && progress == 100) {
                  isPageLoaded = true;
                  mySetState();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
