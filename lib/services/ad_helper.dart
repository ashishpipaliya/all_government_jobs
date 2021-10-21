import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class AdHelper {
  static final box = GetStorage();

  static Future<void> setInitialData() async {
    FirebaseFirestore.instance
        .collection('ad')
        .doc('data')
        .get()
        .then((value) async {
      var single = value.data()!;
      await box.write('enableAds', single['enableAds']);
      await box.write('bannerAdUnitId', single['bannerAdUnitId']);
      await box.write('nativeAdUnitId', single['nativeAdUnitId']);
      await box.write('appOpenAdUnitId', single['appOpenAdUnitId']);
      await box.write('interstitialAdUnitId', single['interstitialAdUnitId']);
      await box.write('rewardedAdUnitId', single['rewardedAdUnitId']);
      await box.write(
          'interestitialAdInterval', single['interestitialAdInterval']);
      await box.write('websiteUrl', single['websiteUrl']);
    });
  }

  static String get websiteUrl => box.read('websiteUrl');

  static bool get enableAds => box.read('enableAds') ?? false;

  static String? get bannerAdUnitId => box.read('bannerAdUnitId') ?? '';

  static String? get nativeAdUnitId => box.read('nativeAdUnitId') ?? '';

  static String? get appOpenAdUnitId => box.read('appOpenAdUnitId') ?? '';

  static String? get interstitialAdUnitId =>
      box.read('interstitialAdUnitId') ?? '';

  static String? get rewardedAdUnitId => box.read('rewardedAdUnitId') ?? '';

  static int get interestitialAdInterval =>
      box.read('interestitialAdInterval') ?? 60;
}
