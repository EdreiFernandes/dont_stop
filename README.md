# Don't Stop
  App em Flutter do jogo Don't Stop

## Fluxo do git

Existem 3 projetos dentro deste repositorio (game, design, config) cada um reponsável por uma part da aplicação. Cada projeto deve ter sua branch.
Todos os projetos devem estar atualizados e atualizarem a branch dev.
Cada issue deve gerar uma branch temporaria a partir da branch ao qual pertence.

### Esquema

![fluxo](https://user-images.githubusercontent.com/34636871/136649445-2dabc989-0266-48d9-a701-cc73255fd9e7.png)

## Comandos para build do app

- Limpar diretorios gerados pela flutter: Flutter clean
- Baixar itens do pubspec: Flutter pub get
- Gerar icone personalizado: flutter pub run flutter_launcher_icons:main
- Gerar splash screen: flutter pub run flutter_native_splash:create
