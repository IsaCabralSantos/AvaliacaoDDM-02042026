# Avaliação DDM — Projeto Flutter (Splash, Login, Cadastro e Home)

## 1) Identificação do grupo

- Disciplina: Desenvolvimento para Dispositivos Móveis (DDM)
- Atividade: Projeto Flutter com dados mockados em memória
- Integrantes:
  - 25001227 - Isadora Cabral dos Santos
  - 25000019 - João Augusto de Freitas
  - 25000795 - Kauan Leander Leandrini

## 2) Link de entrega

- Repositório público no GitHub: https://github.com/joaoaugusto-dev/AvaliacaoDDM-02042026

## 3) Objetivo do projeto

Aplicativo desenvolvido para demonstrar os conceitos da disciplina:

- organização arquitetural (views, viewmodels, models)
- navegação entre telas
- formulários com validação
- autenticação simulada
- uso de dados mockados em memória com Model + List

## 4) Arquitetura adotada

Estrutura atual utilizada no projeto:

```text
lib/
├── main.dart
├── app/
│   ├── app_widget.dart
│   ├── core/
│   └── routes/
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── user_mock_store.dart
│   │   │   └── user_repository.dart
│   │   ├── model/
│   │   │   └── user_model.dart
│   │   ├── view/
│   │   │   ├── splash_page.dart
│   │   │   ├── login_page.dart
│   │   │   └── register_page.dart
│   │   └── viewmodel/
│   │       ├── splash_viewmodel.dart
│   │       ├── login_viewmodel.dart
│   │       └── register_viewmodel.dart
│   └── home/
│       └── view/
│           └── home_page.dart
```

Resumo da organização:

- View: interface e widgets das telas
- ViewModel: validações e regras de fluxo
- Model: estrutura de dados do usuário
- Data: repositório e store mockado em memória

## 5) Fluxo da aplicação

1. App inicia na SplashScreen.
2. Splash aguarda alguns segundos e redireciona para Login.
3. Usuário pode entrar com credenciais válidas. (Se forem inválidas, retorna um feedback ao usuário por SnackBar)
4. Se não tiver conta, abre Cadastro.
5. Cadastro salva usuário em memória.
6. Usuário retorna ao Login.
7. Login correto abre Home.

## 6) Critérios obrigatórios (critério a critério)

### 6.1 Estrutura arquitetural


- Evidências:
  - Separação por camadas: view / viewmodel / model / data.
  - Lógica de autenticação/cadastro fora da interface.
  - Repositório dedicado para acesso aos dados mockados.
- Arquivos de referência:
  - lib/features/auth/view/
  - lib/features/auth/viewmodel/
  - lib/features/auth/model/user_model.dart
  - lib/features/auth/data/user_repository.dart

ESPAÇO PARA PRINT (arquitetura de pastas no VS Code):

[PRINT DA TELA]

---

### 6.2 Tela Splash


- Evidências:
  - É a primeira rota definida em `initialRoute`.
  - Usa widgets básicos e layout com Container, Column, Row, alinhamento e espaços.
  - Navega para Login após tempo de espera.
- Arquivos de referência:
  - lib/app/app_widget.dart
  - lib/features/auth/view/splash_page.dart
  - lib/features/auth/viewmodel/splash_viewmodel.dart

ESPAÇO PARA PRINT (splash exibida):

[PRINT DA TELA]

---

### 6.3 Tela de Login


- Evidências:
  - Campo de e-mail.
  - Campo de senha.
  - Botão Entrar.
  - Botão/texto para ir ao cadastro.
  - Validação básica dos campos.
  - Busca de usuário na estrutura mockada em memória.
  - Login só autorizado com credenciais corretas.
- Arquivos de referência:
  - lib/features/auth/view/login_page.dart
  - lib/features/auth/viewmodel/login_viewmodel.dart
  - lib/features/auth/data/user_repository.dart

ESPAÇO PARA PRINT (tela de login):

[PRINT DA TELA]

ESPAÇO PARA PRINT (validação/erro de login inválido):

[PRINT DA TELA]

---

### 6.4 Tela de Cadastro


- Evidências:
  - Campos para nome, e-mail, senha e confirmação.
  - Validação de formulário.
  - Botão para salvar cadastro.
  - Dados adicionados em lista mockada em memória com Model.
- Arquivos de referência:
  - lib/features/auth/view/register_page.dart
  - lib/features/auth/viewmodel/register_viewmodel.dart
  - lib/features/auth/data/user_mock_store.dart

ESPAÇO PARA PRINT (tela de cadastro):

[PRINT DA TELA]

ESPAÇO PARA PRINT (cadastro realizado com sucesso):

[PRINT DA TELA]

---

### 6.5 Uso de Model


- Evidências:
  - Model `UserModel` com os dados do usuário.
  - Campos: id, name, email, password.
- Arquivo de referência:
  - lib/features/auth/model/user_model.dart

ESPAÇO PARA PRINT (código do model):

[PRINT DA TELA]

---

### 6.6 Uso de dados mockados


- Evidências:
  - Armazenamento somente em memória.
  - Uso de `List<UserModel>` no store mockado.
  - Sem banco de dados, sem API externa e sem Firebase.
- Arquivo de referência:
  - lib/features/auth/data/user_mock_store.dart

ESPAÇO PARA PRINT (lista mockada de usuários):

[PRINT DA TELA]

---

### 6.7 Compartilhamento dos dados entre telas


- Evidências:
  - `UserMockStore` com instância singleton (`instance`).
  - Cadastro adiciona usuário no store.
  - Login consulta o mesmo store via repositório.
- Arquivos de referência:
  - lib/features/auth/data/user_mock_store.dart
  - lib/features/auth/data/user_repository.dart

ESPAÇO PARA PRINT (store/repositório compartilhado):

[PRINT DA TELA]

---

### 6.8 Tela Home


- Evidências:
  - Exibe ícone centralizado.
  - Exibe texto centralizado "Bem-vindo à Home".
  - Exibe saudação com nome do usuário.
- Arquivo de referência:
  - lib/features/home/view/home_page.dart

ESPAÇO PARA PRINT (home após login):

[PRINT DA TELA]

## 7) Requisitos técnicos esperados

### 7.1 Uso de StatelessWidget e/ou StatefulWidget


- Evidências:
  - Stateless: HomePage
  - Stateful: SplashPage, LoginPage, RegisterPage

ESPAÇO PARA PRINT:

[PRINT DA TELA]

### 7.2 Navegação por rotas


- Evidências:
  - Rotas nomeadas em AppRoutes.
  - Geração de páginas via AppPages.

ESPAÇO PARA PRINT:

[PRINT DA TELA]

### 7.3 Formulários com TextFormField


- Evidências:
  - Login e Cadastro usam TextFormField.

ESPAÇO PARA PRINT:

[PRINT DA TELA]

### 7.4 Validação de formulário


- Evidências:
  - Validações de e-mail, senha, nome e confirmação de senha.

ESPAÇO PARA PRINT:

[PRINT DA TELA]

### 7.5 Separação de responsabilidades


- Evidências:
  - Interface separada da lógica de negócio (ViewModel).
  - Persistência simulada isolada em camada data.

ESPAÇO PARA PRINT:

[PRINT DA TELA]

### 7.6 Uso de Model


- Evidências:
  - UserModel usado no cadastro, autenticação e store.

ESPAÇO PARA PRINT:

[PRINT DA TELA]

### 7.7 Uso de List ou Map


- Evidências:
  - Uso de List<UserModel> no armazenamento em memória.

ESPAÇO PARA PRINT:

[PRINT DA TELA]

### 7.8 Organização do projeto em pastas


- Evidências:
  - Estrutura por features e camadas.

ESPAÇO PARA PRINT:

[PRINT DA TELA]

### 7.9 Lógica de autenticação simulada


- Evidências:
  - Login compara credenciais com lista mockada.
  - Sessão simulada salva no store.

ESPAÇO PARA PRINT:

[PRINT DA TELA]

## 8) Regras da atividade (confirmação)

- [x] Sem Firebase
- [x] Sem banco de dados
- [x] Sem API externa
- [x] Foco em arquitetura, lógica, navegação, formulários e dados em memória
- [X] Todos os integrantes participaram do desenvolvimento

ESPAÇO PARA PRINT (execução funcionando):

[PRINT DA TELA]

## 9) Entrega e demonstração prática

### 9.1 Itens da entrega

- [X] Link público do código-fonte no GitHub
- [X] Apresentação prática funcionando (Vídeo)
- [x] Explicação breve da arquitetura (neste README)

### 9.2 Demonstração do fluxo solicitado

- [x] Splash
- [x] Login
- [x] Cadastro
- [x] Retorno ao login
- [x] Autenticação correta
- [x] Navegação para home

ESPAÇO PARA PRINT (fluxo completo em sequência):

[PRINT DA TELA]

## 10) Diferenciais adicionais/opcionais

### 10.1 Mensagem de erro ao login inválido

- Status: [x] Implementado
- Evidência: SnackBar quando credenciais são inválidas.

ESPAÇO PARA PRINT:

[PRINT DA TELA]

### 10.2 Mensagem de sucesso ao cadastrar

- Status: [x] Implementado
- Evidência: retorno de mensagem após cadastro e exibição no login.

ESPAÇO PARA PRINT:

[PRINT DA TELA]

### 10.3 Melhoria visual na Home

- Status: [x] Implementado
- Evidência: layout centralizado com card, ícone, textos e ação de sair.

ESPAÇO PARA PRINT:

[PRINT DA TELA]

### 10.4 Uso organizado de singleton/store mockada

- Status: [x] Implementado
- Evidência: UserMockStore com instância singleton e repositório dedicado.

ESPAÇO PARA PRINT:

[PRINT DA TELA]

## 12) Credenciais para teste rápido

Usuários mockados já existentes:

- Email: marcelo.almeida@unifeob.pro.br
- Senha: unifeob@123

- Email: teste@teste
- Senha: teste@teste

Também é possível criar um novo usuário pela tela de cadastro.

