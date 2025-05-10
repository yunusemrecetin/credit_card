import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AdaptyService implements AdaptyUIObserver {
  static final AdaptyService instance = AdaptyService._internal();

  factory AdaptyService() => instance;

  AdaptyService._internal();

  AdaptyPaywall? _paywall;
  AdaptyUIView? _view;

  BuildContext? _context;

  static AdaptyProfile? _profile;

  String get apiKey => "enter_api_key";

  bool get premiumStatus => isPremium();

  init() async {
    if (apiKey.isEmpty || apiKey == "enter_api_key") {
      throw Exception("apiKey is empty");
    }

    try {
      await Adapty().activate(
          configuration: AdaptyConfiguration(apiKey: apiKey)
            ..withLogLevel(AdaptyLogLevel.debug));
      await log(AdaptyLogger.logLevel);
    } on AdaptyError catch (adaptyError) {
      print("adaptyError 0 ${adaptyError}");
    } catch (e) {
      print("adaptyError e0 ${e}");
    }

    try {
      await AdaptyUI().activate(observer: this);
    } catch (e) {
      print("adaptyError e1 ${e}");
    }

    try {
      await getProfile();
    } catch (e) {
      print("adaptyError e1 ${e}");
    }

    try {
      final builder = AdaptyProfileParameters();

      await Adapty().updateProfile(builder);
    } catch (e) {
      print("adaptyError e0 ${e}");
    }
  }

  log(AdaptyLogLevel value) async {
    await Adapty().setLogLevel(value);
  }

  String getLanguage() {
    return "en";
  }

  open(String placementId) async {
    // TODO: Implement open (loading dialog)

    try {
      _paywall = await Adapty().getPaywall(
        locale: getLanguage(),
        placementId: placementId,
      );
      // the requested paywall
    } on AdaptyError catch (adaptyError) {
      print("adaptyError ${adaptyError}");
      // handle the error
    } catch (e) {
      print("adaptyError e ${e}");
    }

    if (null == _paywall) {
      // TODO: Implement close (loading dialog)
      return;
    }

    try {
      _view = await AdaptyUI().createPaywallView(paywall: _paywall!);
    } on AdaptyError catch (e) {
      print("adaptyError 1 ${e}");
      // handle the error
    } catch (e) {
      print("adaptyError e1 ${e}");
      // handle the error
    }

    try {
      await _view?.present();
    } on AdaptyError catch (e) {
      print("adaptyError 2 ${e}");
      // handle the error
    } catch (e) {
      print("adaptyError e2 ${e}");
      // handle the error
    }
  }

  Future<void> restore() async {
    try {
      final profile = await Adapty().restorePurchases();
      print("profile restore ${profile.accessLevels}");
      print("profile restore 1 ${profile.toString()}");

      dialog(
        title: "title",
        content: "content",
        possitive: "ok",
        possitiveCallback: (context) {
          if (null == context) return;
          Navigator.pop(context);
          open("restore");
        },
      );
    } on AdaptyError catch (adaptyError) {
      print("profile restore $adaptyError");
    } catch (e) {}
  }

  Future<AdaptyProfile?> getProfile() async {
    try {
      AdaptyProfile profile = await Adapty().getProfile();
      print("profile ${profile.toString()}");
      print("profile 1 : ${profile.accessLevels}");

      _profile = profile;

      return profile;
    } catch (e) {
      print("adapty profile error ${e.toString()}");
      return null;
    }
  }

  bool isPremium() {
    bool premiumStatus = false;

    _profile?.subscriptions.forEach((data, adaptySubscription) {
      if (!adaptySubscription.isRefund &&
          (adaptySubscription.isActive || adaptySubscription.isInGracePeriod)) {
        premiumStatus = true;
      }
    });

    return premiumStatus;
  }

  Future<AdaptyPaywallProduct?> getProductInfoOfPaywall(
    String placementId,
  ) async {
    var paywall = await Adapty().getPaywall(
      locale: getLanguage(),
      placementId: placementId,
    );

    List<AdaptyPaywallProduct> products =
        await Adapty().getPaywallProducts(paywall: paywall);

    try {
      return products.first;
    } catch (e) {
      return null;
    }
  }

  Future<AdaptyPurchaseResult> purchase(AdaptyPaywallProduct product) async {
    return await Adapty().makePurchase(product: product);
  }

  List<String> getActiveProducts() {
    List<String> list = [];
    /*
        AdaptyProfile profile = await Adapty().getProfile();
    profile.subscriptions.forEach((key, value) {
      print("getActiveProducts key $key - value $value");
    });
    */
    return list;
  }

  void paywallViewDidPerformAction(AdaptyUIView view, AdaptyUIAction action) {
    switch (action) {
      case const CloseAction():
      case const AndroidSystemBackAction():
        view.dismiss();
        break;
      case OpenUrlAction(url: final url):
        final Uri uri = Uri.parse(url);
        launchUrl(uri, mode: LaunchMode.inAppBrowserView);
        break;
      default:
        break;
    }
  }

  @override
  void paywallViewDidFailRendering(AdaptyUIView view, AdaptyError error) {
    print("Adapty paywallViewDidFailRendering : view $view - error $error");
  }

  @override
  void paywallViewDidFinishRestore(
      AdaptyUIView view, AdaptyProfile profile) async {
    _profile = profile;
    print("Adapty paywallViewDidFinishRestore : view $view - profile $profile");

    await getProfile();

    // TODO: Implement paywallViewDidFinishRestore
  }

  void paywallViewDidFinishPurchase(AdaptyUIView view,
      AdaptyPaywallProduct product, AdaptyPurchaseResult purchaseResult) async {
    print(
        "Adapty paywallViewDidFinishPurchase : view $view - product $product");
    switch (purchaseResult) {
      case AdaptyPurchaseResultSuccess(profile: final profile):
        await getProfile();
        view.dismiss();
        // TODO: Implement paywallViewDidFinishPurchase
        break;
      case AdaptyPurchaseResultPending():
        // purchase is pending
        break;
      case AdaptyPurchaseResultUserCancelled():
        // user cancelled the purchase
        break;
      default:
        break;
    }
  }

  void paywallViewDidFailPurchase(
      AdaptyUIView view, AdaptyPaywallProduct product, AdaptyError error) {
    print("Adapty paywallViewDidFailPurchase : view $view - error $error");
  }

  void paywallViewDidFailRestore(AdaptyUIView view, AdaptyError error) {
    print("Adapty paywallViewDidFailRestore : view $view - error $error");
  }

  @override
  void paywallViewDidFailLoadingProducts(AdaptyUIView view, AdaptyError error) {
    print(
        "Adapty paywallViewDidFailLoadingProducts : view $view - error $error");
  }

  @override
  void paywallViewDidSelectProduct(AdaptyUIView view, String productId) {
    print(
        "Adapty paywallViewDidSelectProduct : view $view - productId $productId");
  }

  @override
  void paywallViewDidStartPurchase(
      AdaptyUIView view, AdaptyPaywallProduct product) {
    print("Adapty paywallViewDidStartPurchase : view $view - product $product");
  }

  @override
  void paywallViewDidStartRestore(AdaptyUIView view) {
    print("Adapty paywallViewDidStartRestore : view $view");
  }
}
