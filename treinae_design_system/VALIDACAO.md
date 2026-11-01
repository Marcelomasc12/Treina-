# Verificação da versão 2.0

Ambiente usado: Flutter 3.35.5 / Dart 3.9.2, Linux.

| Verificação | Resultado |
| --- | --- |
| Análise estática | Sem problemas encontrados. |
| `flutter test --no-pub` na raiz | 50 testes aprovados. |
| Abertura pelo `lib/main.dart` da raiz | Validada em teste de widgets. |
| Estrutura por componente | 22 pastas, cada uma com Component + Factory + ViewModel. |
| Layout dos samples | 22 telas testadas em 320 px nos temas claro e escuro. |
| Revisão visual | Catálogo claro, catálogo escuro e botões renderizados e conferidos. |
| `flutter build web --no-pub --no-tree-shake-icons` | Compilação concluída. |

Os testes também verificam bloqueio de toques, visibilidade de senha, composição pela Factory, preservação da contagem acima da meta e ausência de dependência da pasta `example`.

O teste de abertura usa a classe do `lib/main.dart`, sem criar ou executar um aplicativo em uma subpasta. Os dados e interações dos samples são locais.

As prévias estão em `docs/previas`. Para recriar, execute na raiz:

```bash
flutter test tool/export_previews.dart
```

As configurações de plataforma foram trazidas da referência e ajustadas para o Treinaê. Android, iOS e desktops **não foram compilados nem executados em dispositivo nesta entrega**. A execução nessas plataformas depende dos SDKs correspondentes instalados no computador. Nenhum APK foi gerado.

No Android, o Gradle 8.14 e os plugins foram mantidos alinhados à configuração do projeto antigo; os scripts de inicialização e o wrapper também estão incluídos no ZIP.
