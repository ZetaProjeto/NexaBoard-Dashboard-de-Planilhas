# EstoquePro — Dashboard de Controle de Estoque

Projeto estático pronto para GitHub Pages, personalizado a partir do arquivo **Controle de Estoque.xlsm** fornecido pelo usuário.

## Publicação

1. Extraia o ZIP.
2. Envie `index.html`, `app.js`, `styles.css`, `starter.js`, `supabase.sql` e `README.md` para a raiz do repositório GitHub.
3. Em **Settings > Pages**, selecione **Deploy from a branch**, branch `main`, pasta `/(root)`.
4. Abra o link disponibilizado pelo GitHub Pages.

Você pode executar localmente usando um servidor HTTP local (por exemplo `python -m http.server 8000`), mas para importação/exportação de Excel deve estar conectado à internet para carregar a biblioteca SheetJS.

## Funcionalidades

- Painel com dados iniciais reais extraídos das abas **PRODUÇÃO**, **ESTOQUE** e **Planilha1**.
- Cards de quantidade em estoque, sabores, reposição e vencimentos.
- Alertas de itens vencidos, próximos do vencimento e sem estoque.
- Editar células, adicionar registros, adicionar colunas e pesquisar.
- Importar `.xlsx`, `.xls`, `.xlsm` e `.csv`. Nas abas ESTOQUE e PRODUÇÃO, localiza a linha dos cabeçalhos a partir de SABOR.
- Exportar os dados editados em um **novo arquivo `.xlsx`**.
- **Backup do projeto** `.json`: exporta todo o estado, todas as abas e seus dados. **Restaurar projeto** importa o JSON e substitui o estado do painel.
- Salvamento local no navegador e sincronização opcional por Supabase com login.

## Muito importante sobre o Excel com macros

O arquivo `Controle de Estoque - ORIGINAL.xlsm` está incluído apenas como backup do arquivo original. O aplicativo **não mantém nem exporta as macros VBA, as fórmulas originais, a formatação avançada ou as tabelas estruturadas do XLSM**. A exportação é uma nova planilha `.xlsx` de valores editáveis, com alguns campos derivados recalculados pelo JavaScript. Nunca substitua seu original `.xlsm` por esse arquivo esperando que as macros funcionem.

Os cálculos implementados para ESTOQUE são: estoque atual = quantidade fabricada - saída; validade final = fabricação + prazo em dias; dias restantes = validade final - data de hoje. Para PRODUÇÃO: estoque seguro para quantidade > 1, esgotado para <= 0 e baixo para o restante; dias restantes = validade - hoje. Confira se essas regras correspondem às regras do seu negócio. **Os indicadores não atestam segurança sanitária ou conformidade legal; confira a validade indicada pelo fabricante ou responsável técnico.** Datas em colunas derivadas são expressas como números de série do Excel na tabela.

## Armazenamento

Os dados são salvos em `localStorage` **somente neste navegador e neste dispositivo**; limpar dados do navegador pode apagar alterações. Exporte periodicamente **Backup do projeto** (`.json`). No Supabase, execute o SQL de `supabase.sql`, configure URL + chave pública no painel e use login por e-mail. Não insira credenciais `service_role` ou `sb_secret_` no código ou formulário.

**Atenção:** o site publicado no GitHub Pages é público, inclusive os dados iniciais embutidos em `starter.js`; não publique o repositório/Pages com informações sigilosas. Para arquivos empresariais sensíveis, remova os dados de exemplo antes de publicar e utilize um backend autenticado.
