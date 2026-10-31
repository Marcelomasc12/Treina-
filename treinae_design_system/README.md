# Treinaê - Design System Flutter

**Aluno:** Marcelo Negrão  
**Professor:** Malfatti  
**Disciplina:** Mobile 2

Pacote de componentes Flutter e sample app baseado no projeto exportado do Figma Make. O código React/TypeScript original foi usado como referência visual; estes componentes foram implementados em Dart.

## Comece por aqui

1. Extraia **todo** o ZIP. Não execute arquivos dentro do ZIP.
2. Abra a pasta `treinae_design_system` no VS Code.
3. Confirme que o Flutter está instalado com `flutter --version`.
4. Abra o terminal do VS Code e execute:

```powershell
cd example
flutter pub get
flutter run -d chrome
```

O projeto inclui as plataformas **web e Android**. Para executar no Android, com Android SDK e emulador já configurados, permaneça em `example`:

```powershell
flutter devices
flutter run
```

Para verificar sua instalação, use `flutter doctor`. O VS Code deve abrir a pasta extraída inteira; o sample depende do pacote que está na pasta acima dele.

**Requisitos:** Flutter 3.35 ou superior, Dart 3.9 ou superior. A fonte Manrope é incluída com licença OFL e funciona sem baixar fontes durante o uso. A primeira resolução de dependências requer internet.

## O que apresentar ao professor

- A tela inicial do sample apresenta as categorias de componentes.
- Alterne entre tema claro e escuro pelo ícone no cabeçalho.
- Em **Botões**, demonstre variantes, desabilitado e carregamento.
- Em **Campos**, envie o formulário vazio e depois preencha corretamente.
- Em **Controles**, altere checkbox, switch, slider e observe as metas.
- Em **Navegação e feedback**, teste abas, confirmação, painel inferior e notificação.
- Em **Componentes de treino**, edite uma série e abra o menu da ficha.
- Em **Ver telas de exemplo**, demonstre a composição de login, início, fichas, execução, histórico, detalhes e perfil. Entre com qualquer e-mail de formato válido e senha de pelo menos 8 caracteres: é apenas validação local de demonstração.

O Design System e o sample app são entregas próprias. As telas compostas demonstram como reutilizar os componentes; não são o app completo, não autenticam contas, não fazem chamadas HTTP e não salvam dados entre reinicializações.

## Estrutura e responsabilidades

```text
treinae_design_system/
  lib/
    treinae_design_system.dart        API pública do pacote
    src/
      foundations/                  Cores, tipografia, espaçamento e temas
      components/                   Widgets reutilizáveis e feedback
      factories/                    Criação padronizada de variantes de botão
  assets/fonts/                     Manrope e licença OFL
  test/                             Testes do pacote
  example/
    lib/
      main.dart                     Ponto de entrada
      factories/                    Montagem do sample e criação do ViewModel
      viewmodels/                   Estado observável das demonstrações
      samples/                      Galeria e composições visuais
    test/                           Fluxo da galeria e layout em 320 px
    web/                            Inicialização da versão web
    android/                        Projeto Android gerado pelo Flutter
```

Os componentes recebem valores e callbacks. Não conhecem autenticação, rede, banco ou regras do treino. O ViewModel usa `ChangeNotifier` para expor estado às demonstrações; a Factory monta as dependências. A visibilidade da senha permanece como estado visual interno do campo. Controllers e estado temporário de formulário são descartados pela tela que os criou.

Esta estrutura segue as categorias `components`, `factories`, `viewmodels` e `samples` discutidas no projeto anterior. Sem o código de referência da disciplina, não é possível afirmar equivalência exata com todas as convenções do professor; os nomes e assinaturas podem ser ajustados ao material de aula.

## Componentes disponíveis

| Grupo | Componentes / estados |
| --- | --- |
| Identidade | `TreinaeBrand`, tokens de cores, tipografia, espaçamento, raios |
| Temas | `TreinaeTheme.light`, `TreinaeTheme.dark`, `TreinaeColors` com `ThemeExtension` |
| Botões | `TreinaeButton`, quatro variantes, ícone, compacto, desabilitado e carregamento |
| Factory | `TreinaeButtonFactory.primary/secondary/ghost/danger` |
| Entrada | `TreinaeTextField`, `TreinaePasswordField`, `TreinaeSearchField`, `TreinaeSelect<T>` |
| Validação | Integração com `Form`, `validator`, erro externo, ajuda, leitura e desabilitado |
| Superfícies | `TreinaeCard`, `TreinaeSectionTitle`, `TreinaeEmptyState` |
| Identificação | `TreinaeAvatar` com iniciais/fallback de imagem; `TreinaeBadge` |
| Controles | `TreinaeCheckbox`, `TreinaeSwitch`, `TreinaeSlider` |
| Progresso | `TreinaeProgress`, `TreinaeGoalCard`, tratamento de meta zero e acima de 100% |
| Navegação | `TreinaeAppBar` com retorno e `TreinaeBottomNavigation` com três abas |
| Feedback | `TreinaeMessage`, `TreinaeFeedback.toast/confirm/sheet` |
| Treino | `TreinaeWorkoutCard`, `TreinaeSessionTile`, `TreinaeSetRow` |

## Usar no aplicativo final

Ao lado da pasta do app, mantenha a pasta do Design System. No `pubspec.yaml` do **app**:

```yaml
dependencies:
  flutter:
    sdk: flutter
  treinae_design_system:
    path: ../treinae_design_system
```

Depois de `flutter pub get`, importe:

```dart
import 'package:treinae_design_system/treinae_design_system.dart';
```

No `MaterialApp`, configure os temas:

```dart
MaterialApp(
  theme: TreinaeTheme.light,
  darkTheme: TreinaeTheme.dark,
  themeMode: ThemeMode.system,
  home: const MinhaTela(),
);
```

Exemplo de composição:

```dart
TreinaeButtonFactory.primary(
  label: 'Iniciar treino',
  icon: Icons.play_arrow_outlined,
  onPressed: iniciarTreino,
);

TreinaeGoalCard(completed: 12, goal: 16);

TreinaePasswordField(
  controller: senhaController,
  validator: (value) => (value?.length ?? 0) < 8
      ? 'Use pelo menos 8 caracteres.'
      : null,
);
```

O exemplo de campo precisa estar em um `Form` para `validate()` executar a validação. O controller deve ser descartado pela tela que o criou.

## Decisões visuais

- Cores copiadas dos tokens do CSS recebido: principal `#28584A`, fundo `#F7F8F5`, sálvia `#E4EBE5`, texto `#202723` e erro `#A84848`.
- Tema escuro acompanha os tokens exportados.
- Tipografia Manrope incluída localmente.
- Campos/botões com raio 14 px, cards com 18 px, diálogos com 22 px.
- Legendas pequenas do protótipo web foram ampliadas para pelo menos 12 px; controles interativos usam área mínima próxima de 48 px.
- Textos maiores podem quebrar linha, e telas usam rolagem. Não há uma moldura de iPhone embutida no app.
- Contagem de treino e percentuais continuam sendo reais; a barra é limitada ao intervalo de 0 a 100%.

## Verificação

Na raiz do pacote:

```powershell
flutter pub get
flutter analyze
flutter test
cd example
flutter pub get
flutter analyze
flutter test
flutter build web --no-tree-shake-icons
```

Os testes verificam bloqueio de toques no carregamento, visibilidade de senha, seleção, confirmações, contraste das cores, limites do progresso, validação e navegação do sample e layouts estreitos em ambos os temas. Consulte `VALIDACAO.md` para o resultado executado nesta entrega.

## Próxima etapa

Integrar esses componentes nas telas definitivas do Treinaê. O servidor mock será um projeto separado, implementado de acordo com o PDF do contrato da API. O sample não altera esse contrato.
