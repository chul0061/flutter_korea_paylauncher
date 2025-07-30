# Flutter Korea PayLauncher

**v0.0.1** - 한국 결제 앱 실행을 위한 Flutter 라이브러리

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

## 📋 요구사항

- Flutter 3.3.0+
- Dart 2.17.0+

## 🙏 크레딧

이 라이브러리는 [tosspayments_widget_sdk_flutter](https://pub.dev/packages/tosspayments_widget_sdk_flutter)의 코드를 참고하여 개발되었습니다.

## 📄 라이선스

MIT License
