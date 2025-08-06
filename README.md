# Flutter Korea PayLauncher

**v0.0.1** - 한국 결제 앱 실행을 위한 Flutter 라이브러리
결제 모듈 연동 시, 각 뱅킹 앱으로 이동 혹은 미설치 시, 스토어로 이동을 도와주는 라이브러리입니다.

> 🚧 **개발 중**: 이 라이브러리는 현재 활발히 개발 중이며, API가 변경될 수 있습니다.

## 📱 지원 앱

토스, KB국민, 신한, 카카오톡, 네이버, 페이코, 뱅크페이 등 주요 한국 결제 앱

## 🚀 기본 사용법

### 1. 의존성 추가

```yaml
dependencies:
  flutter_korea_paylauncher:
    git:
      url: https://github.com/chul0061/flutter_korea_paylauncher.git
```

### 2. 사용법

```dart
import 'package:flutter_korea_paylauncher/flutter_korea_paylauncher.dart';

// 결제 앱 실행
final success = await PaymentLauncher.launch('supertoss://');

// 앱 설치 확인
final isInstalled = await PaymentLauncher.canLaunchPaymentApp('supertoss://');
```

## ⚙️ 플랫폼별 설정

### iOS 설정

#### 1. Info.plist 설정

`ios/Runner/Info.plist` 파일에 다음 설정을 추가하세요:

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
    <!-- 신한 -->
    <string>shinhan-sr-ansimclick</string>
    <string>com.shcard.smartpay</string>
    <string>smshinhanansimclick</string>
    <string>com.shinhancard.smartshinhan</string>
    <string>shinhan-sr-ansimclick-lpay</string>
    <string>shinhan-sr-ansimclick-naverpay</string>
    <string>shinhan-sr-ansimclick-payco</string>
    <string>shinhan-sr-ansimclick_samsungpay</string>
    <string>shinhan-sr-ansimclick_lgpay</string>
    <!-- 삼성 -->
    <string>mpocket.online.ansimclick</string>
    <string>kr.co.samsungcard.mpocket</string>
    <string>mpocket.ansimclick.cert</string>
    <!-- KB -->
    <string>kb-acp</string>
    <string>com.kbcard.cxh.appcard</string>
    <string>kb-event</string>
    <string>kb-screen</string>
    <string>kb-card</string>
    <string>com.kbcard.kbkookmincard</string>
    <string>liivbank</string>
    <string>com.kbstar.liivbank</string>
    <string>com.kbstar.kbbank</string>
    <string>newliv</string>
    <string>com.kbstar.reboot</string>
    <!-- NH -->
    <string>nhallonepayansimclick</string>
    <string>nh.smart.nhallonepay</string>
    <string>nonghyupcardansimclick</string>
    <string>com.nh.cashcardapp</string>
    <!-- 롯데 -->
    <string>lotteappcard</string>
    <string>com.lcacApp</string>
    <string>lottesmartpay</string>
    <string>layapp</string>
    <string>lmslpay</string>
    <!-- BC -->
    <string>ispmobile</string>
    <string>kvp.jjy.MispAndroid320</string>
    <!-- 하나 -->
    <string>cloudpay</string>
    <string>com.hanaskcard.paycla</string>
    <string>hanaskcardmobileportal</string>
    <string>hanawalletmembers</string>
    <string>kr.co.hanamembers.hmscustomer</string>
    <string>hanamopmoasign</string>
    <string>com.hanaskcard.rocomo.potal</string>
    <!-- 씨티 -->
    <string>Citispay</string>
    <string>kr.co.citibank.citimobile</string>
    <string>Citimobileapp</string>
    <!-- 우리 -->
    <string>wooripay</string>
    <string>com.wooricard.wpay</string>
    <string>com.wooricard.wcard</string>
    <string>com.wooricard.smartapp</string>
    <string>NewSmartPib</string>
    <string>com.wooribank.smart.npib</string>
    <!-- 현대 -->
    <string>hdcardappcardansimclick</string>
    <string>com.hyundaicard.appcard</string>
    <!-- 보안 -->
    <string>appfree</string>
    <string>com.lumensoft.touchenappfree</string>
    <string>mvaccinestart</string>
    <string>com.TouchEn.mVaccine.webs</string>
    <string>mvaccinestartbg</string>
    <string>mvaccineexit</string>
    <string>mvaccinecheck</string>
    <!-- 백신 -->
    <string>vguardstart</string>
    <string>kr.co.shiftworks.vguardweb</string>
    <string>vguardcheck</string>
    <string>vguardend</string>
    <string>v3mobileplusweb</string>
    <string>com.ahnlab.v3mobileplus</string>
    <!-- 기타 -->
    <string>payco</string>
    <string>com.nhnent.payapp</string>
    <string>samsungpay</string>
    <string>com.samsung.android.spay</string>
    <string>com.samsung.android.spaylite</string>
    <string>callonlinepay</string>
    <string>com.lge.lgpay</string>
    <string>shinsegaeeasypayment</string>
    <string>com.ssg.serviceapp.android.egiftcertificate</string>
    <string>lpayapp</string>
    <string>com.lottemembers.android</string>
    <string>com.mysmilepay.app</string>
    <string>naversearchthirdlogin</string>
    <string>com.nhn.android.search</string>
    <string>nidlogin</string>
    <string>kakaotalk</string>
    <string>com.kakao.talk</string>
    <string>kftc-bankpay</string>
    <string>com.kftc.bankpay.android</string>
    <string>supertoss</string>
    <string>viva.republica.toss</string>
    <string>kr.co.kfcc.mobilebank</string>
    <string>com.knb.psb</string>
    <string>com.tmoney.inapp</string>
    <string>com.tmoney.nfc_pay</string>
    <string>uplus.membership</string>
    <string>com.sktelecom.tauth</string>
    <string>com.kt.ktauth</string>
    <string>com.lguplus.smartotp</string>
    <string>com.sktelecom.tauthlink</string>
    <string>com.kt.upluscorporation</string>
    <string>com.lguplus.upluscorporation</string>
    <string>tmoneypay</string>
    <string>com.lgt.tmoney</string>
</array>
```

#### 2. AppDelegate 설정

`ios/Runner/AppDelegate.swift` 파일에 다음 메서드를 추가하세요:

```swift
override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    var applicationResult = false

    // Handle URLs coming from other apps
    if (!applicationResult) {
        applicationResult = super.application(app, open: url, options: options)
    }

    return applicationResult
}
```

### Android 설정

`android/app/src/main/AndroidManifest.xml` 파일의 `<manifest>` 태그 내에 다음 설정을 추가하세요:

```xml
<queries>
    <!-- 신한 -->
    <package android:name="com.shcard.smartpay" />
    <package android:name="com.shinhancard.smartshinhan" />
    <!-- 삼성 -->
    <package android:name="kr.co.samsungcard.mpocket" />
    <!-- KB -->
    <package android:name="com.kbcard.cxh.appcard" />
    <package android:name="com.kbcard.kbkookmincard" />
    <package android:name="com.kbstar.liivbank" />
    <package android:name="com.kbstar.kbbank" />
    <package android:name="com.kbstar.reboot" />
    <!-- NH -->
    <package android:name="nh.smart.nhallonepay" />
    <package android:name="com.nh.cashcardapp" />
    <!-- 롯데 -->
    <package android:name="com.lcacApp" />
    <!-- BC -->
    <package android:name="kvp.jjy.MispAndroid320" />
    <!-- 하나 -->
    <package android:name="com.hanaskcard.paycla" />
    <package android:name="kr.co.hanamembers.hmscustomer" />
    <package android:name="com.hanaskcard.rocomo.potal" />
    <!-- 씨티 -->
    <package android:name="kr.co.citibank.citimobile" />
    <!-- 우리 -->
    <package android:name="com.wooricard.wpay" />
    <package android:name="com.wooricard.smartapp" />
    <package android:name="com.wooribank.smart.npib" />
    <!-- 현대 -->
    <package android:name="com.hyundaicard.appcard" />
    <!-- 보안 -->
    <package android:name="com.lumensoft.touchenappfree" />
    <package android:name="com.TouchEn.mVaccine.webs" />
    <!-- 백신 -->
    <package android:name="kr.co.shiftworks.vguardweb" />
    <package android:name="com.ahnlab.v3mobileplus" />
    <!-- 기타 -->
    <package android:name="com.nhnent.payapp" />
    <package android:name="com.samsung.android.spay" />
    <package android:name="com.samsung.android.spaylite" />
    <package android:name="com.lge.lgpay" />
    <package android:name="com.ssg.serviceapp.android.egiftcertificate" />
    <package android:name="com.lottemembers.android" />
    <package android:name="com.mysmilepay.app" />
    <package android:name="com.nhn.android.search" />
    <package android:name="com.kakao.talk" />
    <package android:name="com.kftc.bankpay.android" />
    <package android:name="viva.republica.toss" />
    <package android:name="kr.co.kfcc.mobilebank" />
    <package android:name="com.knb.psb" />
    <package android:name="com.tmoney.inapp" />
    <package android:name="com.tmoney.nfc_pay" />
    <package android:name="uplus.membership" />
    <package android:name="com.sktelecom.tauth" />
    <package android:name="com.kt.ktauth" />
    <package android:name="com.lguplus.smartotp" />
    <package android:name="com.sktelecom.tauthlink" />
    <package android:name="com.kt.upluscorporation" />
    <package android:name="com.lguplus.upluscorporation" />
    <package android:name="com.lgt.tmoney" />
</queries>
```

## 📋 요구사항

- Flutter 3.3.0+
- Dart 2.17.0+

## 🙏 크레딧

이 라이브러리는 [tosspayments_widget_sdk_flutter](https://pub.dev/packages/tosspayments_widget_sdk_flutter)의 코드를 참고하여 개발되었습니다.

## 📄 라이선스

MIT License
