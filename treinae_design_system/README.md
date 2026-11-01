# Treinaê — Design System (arquitetura revisada)

**Aluno:** Marcelo Negrão  
**Professor:** Malfatti  
**Disciplina:** Mobile 2  
**Versão:** 2.0.0

Projeto reorganizado a partir da arquitetura do arquivo `design-system-flutter-main.zip` enviado como referência. A demonstração executa **diretamente na raiz**, por `lib/main.dart`. Não existe pasta `example`.

## Abrir no Android Studio

1. Extraia o ZIP inteiro em uma pasta nova.
2. Clique em **Open** e selecione a pasta `treinae_design_system`, que contém `pubspec.yaml`, `lib` e `android`.
3. Aguarde a indexação e execute `flutter pub get` no terminal.
4. Inicie um emulador Android, selecione o dispositivo e execute `lib/main.dart`.

Não abra apenas a pasta `android`. O ponto de entrada Flutter está na raiz, como no projeto antigo.

## Executar pelo terminal

Na pasta `treinae_design_system`:

```bash
flutter pub get
flutter run -d chrome
```

Para Android, com SDK e emulador configurados:

```bash
flutter devices
flutter run
```

Requisitos desta versão: Flutter 3.35 ou superior e Dart 3.9 ou superior. São requisitos mínimos; versões mais recentes também podem resolver o projeto. A primeira instalação de dependências requer internet.

## Organização reproduzida do projeto de referência

| Local | Responsabilidade |
| --- | --- |
| `lib/main.dart` | Inicia o aplicativo de demonstração e configura tema/localização. |
| `lib/common/constants` | Espaçamentos e raios comuns. |
| `lib/common/theme` | Cores, tipografia, temas claro/escuro e decoração compartilhada de campos. |
| `lib/components/<componente>` | Arquivos Component, Factory e ViewModel específicos daquele componente. |
| `lib/screens` | Catálogo e uma tela de demonstração para cada componente. |
| `test` | Verificações da estrutura, interações e layout. |
| `android`, `ios`, `web`, `windows`, `linux`, `macos` | Projetos de plataforma na raiz. |

Exemplo concreto:

```text
lib/components/action_button/action_button_component.dart
lib/components/action_button/action_button_factory.dart
lib/components/action_button/action_button_view_model.dart
lib/screens/sample_action_button_screen.dart
```

### Como as três classes se conectam

1. A tela chama a **Factory** com a variante e os dados desejados.
2. A Factory cria o **ViewModel** e o entrega ao **Component**.
3. O Component desenha o widget conforme a configuração recebida.
4. Eventos retornam à tela por callbacks; a tela mantém o estado da demonstração.

Os ViewModels são configurações imutáveis com campos `final` e construtores `const`, como no arquivo antigo. Não são um ViewModel global com `ChangeNotifier`. Controllers e callbacks ficam nos componentes/telas, não nos modelos de apresentação.

Um componente composto também usa as factories de seus elementos internos. Por exemplo, a meta mensal combina um card com uma barra de progresso.

## Componentes disponíveis

Todos os 22 grupos possuem seu trio de arquivos e uma tela própria em `screens`:

- Botão de ação: principal, secundário, texto, destrutivo, carregando e desabilitado.
- Campo de texto, campo de senha, busca e seleção.
- Cards, etiquetas, avatar, marca, estado vazio e título de seção.
- Progresso, meta mensal, checkbox, switch e slider.
- Cabeçalho com retorno e navegação inferior.
- Feedback, notificações, confirmação e painel inferior.
- Ficha de treino, item do histórico e registro de série.

As mensagens, confirmações e painéis são expostos pela `FeedbackFactory`. As demais demonstrações usam factories específicas por componente, sem uma factory geral para o aplicativo.

## O que mudou em relação à primeira entrega

| Antes | Agora |
| --- | --- |
| Demonstração em `example/lib/main.dart`. | Demonstração em `lib/main.dart`, na raiz. |
| Vários componentes agrupados em arquivos em `lib/src/components`. | Uma pasta por componente com Component + Factory + ViewModel. |
| Factory de botão separada e estado compartilhado da galeria. | Factories específicas por componente e estado local nas telas de demonstração. |
| Galeria separada do projeto principal. | Catálogo e samples em `lib/screens`, como na referência. |

As cores verde/sálvia, a tipografia Manrope e os temas do Treinaê foram preservados. As fontes são locais e sua licença está em `assets/fonts/OFL.txt`.

## Testar e compilar

```bash
flutter analyze
flutter test
flutter build web --no-tree-shake-icons
```

O último comando preserva integralmente as fontes de ícones. Ele evita uma falha de otimização de ícones observada no SDK usado na primeira entrega, sem alterar a arquitetura ou o funcionamento dos componentes.

Consulte `VALIDACAO.md` para os resultados desta versão. Os exemplos são locais e não fazem requisições à API; nenhuma autenticação real é realizada.
