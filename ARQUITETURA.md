# Correspondência com o projeto antigo

O projeto de referência é uma aplicação Flutter executável na raiz. Dentro dela há um catálogo de demonstrações e os componentes reutilizáveis. Cada componente reúne sua Factory e seu ViewModel na mesma pasta.

Essa organização foi reproduzida nesta versão do Treinaê. A mudança não consiste apenas em mover a antiga pasta `example`.

| Referência recebida | Treinaê revisado |
| --- | --- |
| `lib/main.dart` → `DesignSystemApp` | `lib/main.dart` → `TreinaeDesignSystemApp` |
| `lib/screens/sample_screen.dart` | Mesmo local; lista os componentes do Treinaê. |
| `lib/screens/sample_action_button_screen.dart` | Mesmo local; testa variantes do botão. |
| `lib/components/action_button/action_button_component.dart` | Mesmo local; recebe `ActionButtonViewModel`. |
| `lib/components/action_button/action_button_factory.dart` | Mesmo local; monta componente e modelo. |
| `lib/components/action_button/action_button_view_model.dart` | Mesmo local; configuração imutável do botão. |
| `lib/common/theme/app_colors.dart` | Mesmo local; cores do Treinaê e resolução por tema. |
| `lib/common/theme/app_text_styles.dart` | Mesmo local; tipografia Manrope. |
| `lib/common/theme/app_theme.dart` | Mesmo local; `AppTheme.theme`, `light` e `dark`. |
| `lib/common/constants/app_spacing.dart` | Mesmo local; escala de espaçamento e compatibilidade de nomes. |

O papel arquitetural do ViewModel é o mesmo da referência: valores de apresentação. As factories recebem callbacks para repassá-los aos componentes. As telas de sample usam `setState` quando a demonstração precisa responder à interação.

Diferenças intencionais de funcionalidades: o Treinaê oferece seus próprios grupos, incluindo meta mensal, registro de série e ficha de treino. Componentes de chat ou OTP do exemplo antigo não foram acrescentados porque não fazem parte do escopo definido para o Treinaê. Isso não altera o padrão Component + Factory + ViewModel.

O projeto não contém nem depende de `example/`, `lib/src/`, `SampleAppFactory` ou `SampleViewModel` global.
