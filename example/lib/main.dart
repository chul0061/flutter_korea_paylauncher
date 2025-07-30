import 'package:flutter/material.dart';
import 'package:flutter_korea_paylauncher/flutter_korea_paylauncher.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Korea PayLauncher Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const PaymentExample(),
    );
  }
}

class PaymentExample extends StatefulWidget {
  const PaymentExample({super.key});

  @override
  State<PaymentExample> createState() => _PaymentExampleState();
}

class _PaymentExampleState extends State<PaymentExample> {
  final TextEditingController _urlController = TextEditingController();
  String _result = '';

  @override
  void initState() {
    super.initState();
    // 예제 URL
    _urlController.text = 'supertoss://';
  }

  Future<void> _launchPaymentApp() async {
    final url = _urlController.text.trim();
    if (url.isEmpty) {
      setState(() {
        _result = 'URL을 입력해주세요.';
      });
      return;
    }

    try {
      final success = await PaymentLauncher.launch(url);
      setState(() {
        _result = success ? '앱 실행 성공!' : '앱 실행 실패';
      });
    } catch (e) {
      setState(() {
        _result = '오류: $e';
      });
    }
  }

  Future<void> _checkAppAvailability() async {
    final url = _urlController.text.trim();
    if (url.isEmpty) {
      setState(() {
        _result = 'URL을 입력해주세요.';
      });
      return;
    }

    try {
      final canLaunch = await PaymentLauncher.canLaunchPaymentApp(url);
      setState(() {
        _result = canLaunch ? '앱이 설치되어 있습니다.' : '앱이 설치되어 있지 않습니다.';
      });
    } catch (e) {
      setState(() {
        _result = '오류: $e';
      });
    }
  }

  Future<void> _getAppLink() async {
    final url = _urlController.text.trim();
    if (url.isEmpty) {
      setState(() {
        _result = 'URL을 입력해주세요.';
      });
      return;
    }

    try {
      final appLink = await PaymentLauncher.getAppLink(url);
      setState(() {
        _result = '앱 링크: ${appLink ?? '없음'}';
      });
    } catch (e) {
      setState(() {
        _result = '오류: $e';
      });
    }
  }

  Future<void> _getMarketUrl() async {
    final url = _urlController.text.trim();
    if (url.isEmpty) {
      setState(() {
        _result = 'URL을 입력해주세요.';
      });
      return;
    }

    try {
      final marketUrl = await PaymentLauncher.getMarketUrl(url);
      setState(() {
        _result = '마켓 URL: ${marketUrl ?? '없음'}';
      });
    } catch (e) {
      setState(() {
        _result = '오류: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Korea PayLauncher 예제'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: '결제 URL',
                hintText: 'supertoss://, kb-acp://, etc.',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _launchPaymentApp,
              child: const Text('결제 앱 실행'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _checkAppAvailability,
              child: const Text('앱 설치 여부 확인'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _getAppLink,
              child: const Text('앱 링크 가져오기'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _getMarketUrl,
              child: const Text('마켓 URL 가져오기'),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _result.isEmpty ? '결과가 여기에 표시됩니다.' : _result,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '주요 지원 앱:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '• 토스 (supertoss://)\n'
              '• KB국민 (kb-acp://)\n'
              '• 신한 (shinhan-sr-ansimclick://)\n'
              '• 카카오톡 (kakaotalk://)\n'
              '• 네이버 (naversearchthirdlogin://)\n'
              '• 페이코 (payco://)\n'
              '• 뱅크페이 (kftc-bankpay://)',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }
}
