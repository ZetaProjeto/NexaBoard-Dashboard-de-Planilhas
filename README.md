# NexaBoard — Dashboard de Planilhas

Dashboard responsivo para importar planilhas Excel, visualizar indicadores, editar linhas e colunas e baixar uma planilha atualizada. Feito em HTML, CSS e JavaScript, sem build ou servidor próprio.

## Subir no GitHub Pages

1. Crie um repositório público ou privado no GitHub (observe as condições do seu plano para Pages).
2. Envie os arquivos `index.html`, `styles.css`, `app.js`, `README.md` e `supabase.sql` para a **raiz** do repositório.
3. Em **Settings → Pages**, escolha **Deploy from a branch**, selecione `main` e a pasta `/(root)` e salve.
4. Acesse o endereço Pages disponibilizado pelo GitHub.

## Como usar

- Clique em **Importar Excel** e escolha `.xlsx`, `.xls` ou `.csv`.
- Confirme a substituição dos dados anteriores.
- Use **Editar planilha** para pesquisar, alterar células, criar linhas e colunas e excluir linhas. As mudanças são salvas automaticamente no `localStorage` do navegador.
- Use **Exportar Excel** para gerar um `.xlsx` atualizado com as abas importadas.

O painel inicial é demonstrativo. **Os dados salvos neste navegador não são automaticamente visíveis em outros dispositivos.** Não limpe os dados do site sem exportar uma cópia ou sincronizar.

## Opcional: salvar entre dispositivos usando Supabase

1. Crie um projeto no [Supabase](https://supabase.com/).
2. No **SQL Editor**, execute o conteúdo do arquivo `supabase.sql`.
3. Em **Authentication → URL Configuration**, cadastre o endereço completo do seu GitHub Pages em **Redirect URLs**. Configure o e-mail (magic link) conforme a documentação do Supabase.
4. Abra **Sincronização** no dashboard, informe a URL do projeto e **somente** a chave publicável (`sb_publishable_...`) ou chave pública `anon` (legada). **Nunca use `service_role` ou `sb_secret_` no site**.
5. Clique em **Conectar Supabase**, digite seu e-mail, peça o link e acesse-o. Em seguida, clique em **Enviar dados para nuvem** para subir seu primeiro conjunto de dados.
6. Em outro dispositivo, configure a mesma URL e chave, entre com a mesma conta e clique em **Carregar dados da nuvem**. Depois de autenticado, edições passam a ser sincronizadas automaticamente (se houver internet).

**Atenção:** não há resolução de conflitos de edição simultânea: a última gravação vence. Antes de importar outra planilha ou substituir dados do banco, exporte um backup. Evite trabalhar em dois dispositivos ao mesmo tempo.

## Limitações importantes

- A importação usa a primeira linha de cada aba como cabeçalho e importa as células como valores exibidos (texto); **fórmulas, formatação, macros, gráficos nativos e recursos avançados do arquivo original não são preservados**. O arquivo exportado é um novo Excel tabular.
- Os indicadores e o gráfico são genéricos; após receber uma planilha real, podem ser adaptados a colunas específicas (ex. valores, validade, estoque, metas).
- O exemplo inicial serve apenas para visualizar o layout; não são dados reais.
- O navegador possui limite de armazenamento local; planilhas muito grandes podem excedê-lo. Para arquivos muito grandes, use um backend apropriado.
- O SQL cria isolamento por conta via Row Level Security. Se cadastrar múltiplos e-mails, cada usuário terá dados separados.
- As bibliotecas SheetJS e Supabase são carregadas pela internet. Uma conexão ativa é necessária para importar/exportar Excel e para conectar a nuvem.

## Tecnologias

- GitHub Pages: hospedagem estática.
- SheetJS CE 0.20.3: importação e exportação de Excel (CDN oficial).
- Supabase JS v2: login e sincronização opcionais.
- HTML5 Canvas: gráfico simples, sem dependência adicional.
