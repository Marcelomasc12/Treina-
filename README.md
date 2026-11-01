# Treinaê — Design System

Design System Flutter do aplicativo de controle de treinos **Treinaê**, com 22 grupos de componentes e um aplicativo de demonstração (sample app).

**Aluno:** Marcelo Negrão  
**Professor:** Malfatti  
**Disciplina:** Mobile 2

## Branches

- **`design-system`**: componentes, temas, telas de demonstração e documentação.
- **`main`**: desenvolvimento do aplicativo principal.

## Executar

Requisitos: Flutter 3.35+ e Dart 3.9+. Para Android, configure o Android SDK e um emulador ou dispositivo.

```bash
git clone --branch design-system https://github.com/Marcelomasc12/Treina-.git
cd Treina-/treinae_design_system
flutter pub get
flutter run
```

Para executar no navegador:

```bash
flutter run -d chrome
```

No **Android Studio**, abra a pasta **`treinae_design_system`**, que contém `pubspec.yaml`, `lib` e `android`. Execute **`lib/main.dart`**. A demonstração funciona diretamente nessa pasta; não há pasta `example`.

## Organização

| Caminho dentro de `treinae_design_system/` | Responsabilidade |
| --- | --- |
| `lib/main.dart` | Inicia o sample app e configura tema e idioma. |
| `lib/common/constants/` | Espaçamentos e raios compartilhados. |
| `lib/common/theme/` | Cores, estilos de texto e temas claro/escuro. |
| `lib/components/` | Uma pasta por componente com Component, Factory e ViewModel. |
| `lib/screens/` | Catálogo e telas de demonstração dos componentes. |
| `test/` | Testes de arquitetura, interações e layout. |

Cada **Component** desenha o elemento visual. A **Factory** cria o componente com sua configuração. O **ViewModel** armazena essa configuração de forma imutável. As telas de demonstração mantêm seu próprio estado e recebem os eventos por callbacks.

## Temas e componentes

Os temas claro e escuro estão em `lib/common/theme/app_theme.dart`. As cores ficam em `app_colors.dart`, e a tipografia em `app_text_styles.dart`. As fontes Manrope estão incluídas nos assets, com licença.

O catálogo inclui botões, campos de texto e senha, busca, seleção, cards, etiquetas, avatar, marca, estado vazio, títulos, progresso, meta mensal, checkbox, switch, slider, cabeçalho, navegação, feedback e componentes de treino e histórico.

As demonstrações usam dados locais e não dependem de uma API.

## Validação

Na pasta `treinae_design_system`:

```bash
flutter analyze
flutter test
flutter build web --no-tree-shake-icons
```

A versão revisada foi validada com análise sem problemas, 50 testes aprovados e compilação web concluída. A execução em emulador Android não foi validada neste ambiente.

## Documentação

- [Documentação do projeto](treinae_design_system/README.md)
- [Arquitetura](treinae_design_system/ARQUITETURA.md)
- [Resultados da validação](treinae_design_system/VALIDACAO.md)

## Prévias

| Tema claro | Tema escuro |
| --- | --- |
| ![Catálogo no tema claro](treinae_design_system/docs/previas/catalogo-claro.png) | ![Catálogo no tema escuro](treinae_design_system/docs/previas/catalogo-escuro.png) |
