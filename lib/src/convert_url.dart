import 'dart:io';

// Based on code from [https://pub.dev/packages/tosspayments_widget_sdk_flutter]
// Copyright 2023 yj
// Licensed under the MIT License.
/// URL을 앱 링크와 마켓 URL로 변환하는 클래스
class ConvertUrl {
  late String url;
  String? appScheme;
  String? appLink;
  String? package;

  /// ConvertUrl 객체를 생성합니다.
  /// [getUrl]은 변환할 URL입니다.
  ConvertUrl(String getUrl) {
    url = getUrl;

    List<String> splitUrl = url.replaceFirst(RegExp(r'://'), ' ').split(' ');
    appScheme = splitUrl[0];

    if (Platform.isAndroid) {
      if (isAppLink()) {
        if (appScheme!.contains('intent')) {
          List<String> intentUrl = splitUrl[1].split('#Intent;');
          String host = intentUrl[0];
          if (host.contains(':')) {
            host = host.replaceAll(RegExp(r':'), '%3A');
          }
          List<String> arguments = intentUrl[1].split(';');

          if (appScheme! != 'intent') {
            appScheme = appScheme!.split(':')[1];
            appLink = '${appScheme!}://$host';
          }
          for (var s in arguments) {
            if (s.startsWith('package')) {
              String package = s.split('=')[1];
              this.package = package;
            } else if (s.startsWith('scheme')) {
              String scheme = s.split('=')[1];
              appLink = '$scheme://$host';
              appScheme = scheme;
            }
          }
        } else {
          appLink = url;
        }
      } else {
        appLink = url;
      }
    } else if (Platform.isIOS) {
      appLink = appScheme == 'itmss' ? 'https://${splitUrl[1]}' : url;
    } else {
      // 테스트 환경이나 다른 플랫폼의 경우 기본 처리
      appLink = url;
    }
  }

  /// URL이 앱 링크인지 확인합니다.
  bool isAppLink() {
    return appScheme != 'http' && appScheme != 'https';
  }

  /// 변환 후 애플리케이션 링크를 반환합니다.
  /// WebView에 적합한 형식의 링크입니다.
  Future<String?> getAppLink() async {
    return appLink;
  }

  /// 플랫폼(Android 또는 iOS)과 특정 애플리케이션 스킴에 따른
  /// 앱 마켓 URL을 반환합니다.
  Future<String?> getMarketUrl() async {
    if (Platform.isAndroid) {
      return 'market://details?id=${package!}';
    } else if (Platform.isIOS) {
      return _getIOSMarketUrl();
    } else {
      // 테스트 환경에서는 iOS 마켓 URL을 반환
      return _getIOSMarketUrl();
    }
  }

  String? _getIOSMarketUrl() {
    switch (appScheme) {
      case 'supertoss': // 토스
        return 'https://apps.apple.com/app/id839333328';
      case 'ispmobile': // ISP
        return 'https://apps.apple.com/app/id369125087';
      case 'kb-acp': // KB국민
        return 'https://apps.apple.com/app/id695436326';
      case 'newliiv': // 리브 next
        return 'https://apps.apple.com/app/id1573528126';
      case 'kbbank': // KB 스타뱅크
        return 'https://apps.apple.com/app/id373742138';
      case 'mpocket.online.ansimclick': // 삼성
        return 'https://apps.apple.com/app/id535125356';
      case 'lottesmartpay': // 롯데 모바일
        return 'https://apps.apple.com/app/id668497947';
      case 'lotteappcard': // 롯데
        return 'https://apps.apple.com/app/id688047200';
      case 'lpayapp': // L.pay
        return 'https://apps.apple.com/app/id1036098908';
      case 'lmslpay': // 엘포인트
        return 'https://apps.apple.com/app/id473250588';
      case 'cloudpay': // 1Q페이
        return 'https://apps.apple.com/app/id847268987';
      case 'hanawalletmembers': // 하나머니
        return 'https://apps.apple.com/app/id1038288833';
      case 'hdcardappcardansimclick': // 현대
        return 'https://apps.apple.com/app/id702653088';
      case 'shinhan-sr-ansimclick': // 신한
        return 'https://apps.apple.com/app/id572462317';
      case 'wooripay': // 우리
        return 'https://apps.apple.com/app/id1201113419';
      case 'com.wooricard.wcard': // 우리WON
        return 'https://apps.apple.com/app/id1499598869';
      case 'newsmartpib': // 우리WON뱅킹
        return 'https://apps.apple.com/app/id1470181651';
      case 'nhallonepayansimclick': // NH
        return 'https://apps.apple.com/app/id1177889176';
      case 'citimobileapp': // 시티은행
        return 'https://apps.apple.com/app/id1179759666';
      case 'shinsegaeeasypayment': // SSGPAY
        return 'https://apps.apple.com/app/id666237916';
      case 'naversearchthirdlogin': // 네이버앱
        return 'https://apps.apple.com/app/id393499958';
      case 'payco': // 페이코
        return 'https://apps.apple.com/app/id924292102';
      case 'kakaotalk': // 카카오톡
        return 'https://apps.apple.com/app/id362057947';
      case 'kftc-bankpay': // 뱅크페이
        return 'https://apps.apple.com/app/id398456030';
      default:
        return url;
    }
  }
}
