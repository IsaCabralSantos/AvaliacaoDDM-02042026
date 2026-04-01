# Atividade Avaliativa - Flutter

Projeto Flutter com arquitetura MVVM, contendo fluxo de Splash, Login,
Cadastro e Home com dados mockados em memória.

## Estrutura essencial

lib/

- main.dart
- app/
  - app_widget.dart
  - routes/
    - app_routes.dart
    - app_pages.dart
  - core/
    - constants/app_constants.dart
    - models/operation_result.dart
    - theme/app_theme.dart
    - widgets/app_background.dart
    - widgets/glass_card.dart
- features/
  - auth/
    - model/user_model.dart
    - data/user_mock_store.dart
    - data/user_repository.dart
    - viewmodel/splash_viewmodel.dart
    - viewmodel/login_viewmodel.dart
    - viewmodel/register_viewmodel.dart
    - view/splash_page.dart
    - view/login_page.dart
    - view/register_page.dart
  - home/
    - view/home_page.dart

## Arquitetura

- view: interface e interação
- viewmodel: regras e estado de apresentação
- model: entidade de domínio
- data: repositório e fonte mockada

## Comandos

1. flutter pub get
2. flutter run
3. flutter test
