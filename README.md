# Case Mobi7
[![NPM](https://img.shields.io/npm/l/react)](https://github.com/rodsillva/case-mobi7/blob/main/LICENSE)

# Sobre o case

O case consiste em extrair dados de uma tabela denomidada **_trip_**, de um banco de dados em PostgreSQL contido em um arquivo Docker previamente disponibilizado, de acordo com os requisitos funcionais obrigatórios, e consolidá-los mensalmente por veículo nos campos:
- Total de viagens realizadas
- Total de quilômetros percorridos
- Total de tempo em movimento 
- Total tempo parado

Estes dados devem ser salvos em uma ou mais tabelas, a serem criadas pelo próprio usuário. Após isto, os dados consolidados devem ser exportados para um arquivo CSV, chamado **_resultados.csv_**.

# Tecnologias utilizadas
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [DBeaver Communit](https://dbeaver.io/download/)
- [Power BI Desktop](https://powerbi.microsoft.com/pt-br/desktop/)

# Como executar o projeto
Pré-requisitos: Instalar o Docker Desktop, DBeaver e Power BI antes de executar os comandos abaixo.

```bash
# clonar o repositório
git clone https://github.com/rodsillva/case-mobi7.git

# acessar a pasta do projeto
abrir um terminal na pasta do projeto (no Windows pode ser o PowerShell)

# baixar a imagem Docker localmente
docker build -t mobi7_postgres_code_test_image .

# executar a imagem baixada
docker run --name mobi7_postgres_code_test -p 5432:5432 mobi7_postgres_code_test_image
```
**Obs.:** O processo de execução da imagem deve levar alguns minutos, dependendo do desempenho da máquina. Para ter certeza de que o container está pronto para uso, o log abaixo deve ser apresentado:

![image](https://user-images.githubusercontent.com/62675395/185068746-a41fe990-af21-49e2-8102-15901597a769.png)

## Credenciais para acesso ao banco de dados através do DBeaver
```bash
URL: jdbc:postgresql://localhost:5432/mobi7_code_interview
User: postgres
Password: postgres
```
## Criando uma nova tabela
No DBeaver, execute a Query SQL contida no arquivo [query_create_table_resultado](https://github.com/rodsillva/case-mobi7/blob/main/query_create_table_resultado.sql)

## Inserindo os dados extraídos da tabela "trip", na nova tabela
No DBeaver, execute a Query SQL contida no arquivo [query_insert_into_table_resultado](https://github.com/rodsillva/case-mobi7/blob/main/query_insert_into_table_resultado.sql)
 
## Exibindo os dados da tabela "resultado"
```sql
SELECT * FROM resultado r;
```
![image](https://user-images.githubusercontent.com/62675395/185073624-164b6811-fec7-430a-97a5-b5ef7731c2c1.png)

## Exportando os dados para um arquivo CSV
Utilize o recurso **Export Data** do DBeaver para exportar os dados da tabela *resultado* para um arquivo CSV chamado **_resultados.csv_**.

![image](https://user-images.githubusercontent.com/62675395/185074139-559ab86d-555e-4dbb-8431-2b29548795df.png)

## Acessando o Dashboard no Power BI
Ao abrir o Power BI Desktop, procure pelo arquivo **_dashboard_powerbi_case_mobi7.pbix_** na pasta onde os arquivos do projeto estão salvos.
Para visualizar os dados de maneira correta, será preciso configurar a fonte de dados PostgreSQL, através do menu:

**Obter Dados -> Banco de Dados -> Banco de Dados PostgreSQL**

Após isto, clique em *Continuar* para realizar a conexão.

```bash
#Servidor
localhost:5432

#Banco de Dados
mobi7_code_interview

#Modo de Conectividade
Importar

#User
postgres

#Password
postgres
```
Selecione as tabelas *resultado* e *trip* e clique em *Carregar*.

Após o carregamento das tabelas, verifique se existe um relacionamento entre o campo **id_veiculo** da tabela *resultado*, com o campo **vehicle_id** da tabela *trip*. Caso o relacionamento do tipo **_Muitos para Um (*:1)_** entre estes campos não exista, será preciso criá-lo.

Feito isto, você será capaz de visualizar os dados contidos no relatório sem maiores problemas. Para fins informativos, os dados deverão ser exibidos conforme o arquivo em PDF [dashboard_powerbi_case_mobi7](https://github.com/rodsillva/case-mobi7/blob/main/dashboard_powerbi_case_mobi7.pdf).

# Autor
Rodolfo Silva

https://www.linkedin.com/in/rodsillva
