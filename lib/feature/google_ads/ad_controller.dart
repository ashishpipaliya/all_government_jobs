import 'package:get/get.dart';
import 'package:all_govt_jobs/services/ad_helper.dart';
// import 'package:native_admob_flutter/native_admob_flutter.dart';

class AdController extends GetxController {
  bool showAds = AdHelper.enableAds;

  // final bannerController = BannerAdController();

  // final nativeController = NativeAdController(unitId: AdHelper.nativeAdUnitId);
  // final nativeController2 = NativeAdController(unitId: AdHelper.nativeAdUnitId);
  // final nativeController3 = NativeAdController(unitId: AdHelper.nativeAdUnitId);
  // final nativeController4 = NativeAdController(unitId: AdHelper.nativeAdUnitId);
  // final nativeController5 = NativeAdController(unitId: AdHelper.nativeAdUnitId);

  // final interstitialAd = InterstitialAd(unitId: AdHelper.interstitialAdUnitId)
  //   ..load(unitId: AdHelper.interstitialAdUnitId);

  // final interstitialVideoAd = InterstitialAd()..load(unitId: AdHelper.interstitialAdUnitId);

  // final rewardedAd = RewardedAd(unitId: AdHelper.rewardedAdUnitId)
  //   ..load(unitId: AdHelper.rewardedAdUnitId);

  // final AppOpenAd appOpenAd = AppOpenAd(unitId: AdHelper.appOpenAdUnitId);

  @override
  void onInit() {
    // banner ad
    // bannerController.load();

    // native
    // nativeController.load(unitId: AdHelper.nativeAdUnitId);
    // nativeController2.load(unitId: AdHelper.nativeAdUnitId);
    // nativeController3.load(unitId: AdHelper.nativeAdUnitId);
    // nativeController4.load(unitId: AdHelper.nativeAdUnitId);
    // nativeController5.load(unitId: AdHelper.nativeAdUnitId);

    //interstitialAd

    //   if (AdHelper.enableAds) {
    //     loadAppOpenAd();
    //     Timer.periodic(Duration(seconds: AdHelper.interestitialAdInterval),
    //         (timer) {
    //       loadInterstitialAd();
    //     });
    //   }
    super.onInit();
  }

  // loadInterstitialAd() async {
  // if (!interstitialAd.isAvailable)
  //   await interstitialAd.load(unitId: AdHelper.interstitialAdUnitId);
  // if (interstitialAd.isAvailable) {
  //   await interstitialAd.show();

  // interstitialAd.onEvent.listen((e) {
  // final event = e.keys.first;
  // switch (event) {
  // case FullScreenAdEvent.closed:
  // interstitialAd.load();
  // break;
  // default:
  // break;
  // }
  // });
  //   }
  // }

  // loadAppOpenAd() async {
  // if (!appOpenAd.isAvailable)
  //     await appOpenAd.load(unitId: AdHelper.appOpenAdUnitId);
  //   if (appOpenAd.isAvailable) {
  //     await appOpenAd.show();
  //     appOpenAd.load(unitId: AdHelper.appOpenAdUnitId);
  //   }
  //   appOpenAd.onEvent.listen((e) {});
  // }

  // loadRewardedAd() async {
  //   if (rewardedAd.isAvailable) {
  //     await rewardedAd.show();
  //     rewardedAd.load(unitId: AdHelper.rewardedAdUnitId);
  //   }
  //   rewardedAd.onEvent.listen((e) {
  //     final event = e.keys.first;
  //     switch (event) {
  //       case RewardedAdEvent.closed:
  //         break;
  //       default:
  //         break;
  //     }
  //   });
  // }

  // @override
  // void onClose() {
  //   nativeController.dispose();
  //   nativeController2.dispose();
  //   nativeController3.dispose();
  //   nativeController4.dispose();
  //   nativeController5.dispose();
  //   rewardedAd.dispose();
  //   interstitialAd.dispose();
  //   appOpenAd.dispose();
  //   super.onClose();
  // }
}
