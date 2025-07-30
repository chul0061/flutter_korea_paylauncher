import 'package:url_launcher/url_launcher.dart';
import 'convert_url.dart';

/// 한국 결제 앱 실행을 위한 런처 클래스
class PaymentLauncher {
  /// 주어진 URL을 분석하고 적절한 앱을 실행합니다.
  ///
  /// [url] 실행할 결제 URL
  /// [fallbackToMarket] 앱이 설치되지 않은 경우 마켓으로 이동할지 여부 (기본값: true)
  ///
  /// 반환값:
  /// - true: 앱 실행 성공
  /// - false: 앱 실행 실패
  static Future<bool> launch(String url, {bool fallbackToMarket = true}) async {
    try {
      final convertUrl = ConvertUrl(url);
      final appLink = await convertUrl.getAppLink();

      if (appLink == null) {
        return false;
      }

      // 앱 링크로 실행 시도
      final uri = Uri.parse(appLink);
      final canLaunchApp = await canLaunchUrl(uri);

      if (canLaunchApp) {
        return await launchUrl(uri, mode: LaunchMode.externalApplication);
      }

      // 앱이 설치되지 않은 경우 마켓으로 이동
      if (fallbackToMarket) {
        final marketUrl = await convertUrl.getMarketUrl();
        if (marketUrl != null) {
          final marketUri = Uri.parse(marketUrl);
          return await launchUrl(marketUri, mode: LaunchMode.externalApplication);
        }
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  /// 특정 결제 앱이 설치되어 있는지 확인합니다.
  ///
  /// [url] 확인할 결제 URL
  ///
  /// 반환값:
  /// - true: 앱이 설치되어 있음
  /// - false: 앱이 설치되어 있지 않음
  static Future<bool> canLaunchPaymentApp(String url) async {
    try {
      final convertUrl = ConvertUrl(url);
      final appLink = await convertUrl.getAppLink();

      if (appLink == null) {
        return false;
      }

      final uri = Uri.parse(appLink);
      return await canLaunchUrl(uri);
    } catch (e) {
      return false;
    }
  }

  /// 마켓 URL을 가져옵니다.
  ///
  /// [url] 결제 URL
  ///
  /// 반환값: 마켓 URL 또는 null
  static Future<String?> getMarketUrl(String url) async {
    try {
      final convertUrl = ConvertUrl(url);
      return await convertUrl.getMarketUrl();
    } catch (e) {
      return null;
    }
  }

  /// 앱 링크를 가져옵니다.
  ///
  /// [url] 결제 URL
  ///
  /// 반환값: 앱 링크 또는 null
  static Future<String?> getAppLink(String url) async {
    try {
      final convertUrl = ConvertUrl(url);
      return await convertUrl.getAppLink();
    } catch (e) {
      return null;
    }
  }
}
