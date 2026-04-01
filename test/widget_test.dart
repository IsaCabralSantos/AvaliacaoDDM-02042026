import 'package:avaliacao02042026/app/app_widget.dart';
import 'package:avaliacao02042026/app/core/constants/app_constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders splash and navigates to login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const AppWidget());

    expect(find.text(AppConstants.appName), findsOneWidget);
    expect(find.text('Carregando aplicativo...'), findsOneWidget);

    await tester.pump(
      const Duration(seconds: AppConstants.splashDelaySeconds + 1),
    );
    await tester.pumpAndSettle();

    expect(find.text('Acesse sua conta'), findsOneWidget);
  });
}
