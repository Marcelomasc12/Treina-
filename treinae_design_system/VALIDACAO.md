# Validação da entrega

Data: 30/10/2026. Ambiente: Flutter 3.35.5 e Dart 3.9.2, Linux.

| Verificação | Resultado |
| --- | --- |
| `flutter analyze --no-pub` na raiz, incluindo example | Aprovado, sem problemas encontrados |
| `flutter test --no-pub` na raiz | 6 testes aprovados |
| `flutter test --no-pub` em example | 15 testes aprovados |
| `flutter build web --no-pub --no-tree-shake-icons` em example | Compilação de produção aprovada |
| Renderização das prévias | Conferida: galeria, botões, login, início claro e escuro |

As prévias estão em `docs/previas`. Para recriá-las, execute em `example`:

```powershell
flutter test tool/export_previews.dart
```

Os 15 testes do sample incluem o fluxo de entrada e busca, além de cada uma das 7 categorias em largura de 320 px, nos dois temas. Não substituem uma avaliação completa de acessibilidade nem testes em todos os aparelhos.

O projeto Android foi gerado pelo Flutter e está incluído. **Não foi compilado em APK nem executado em emulador Android nesta entrega**; isso requer Android SDK configurado. A compilação web foi feita, mas não foi publicada.

O Design System não depende da API. O login e as telas compostas são demonstrações locais; o app completo e o servidor mock serão desenvolvidos separadamente.

Nesta instalação do SDK, a otimização de fontes de ícones apresentou erro interno `ConstFinder`. A compilação foi realizada com a opção oficial `--no-tree-shake-icons`, que preserva as fontes completas; isso aumenta o tamanho dos assets de ícones, sem remover funcionalidades.
