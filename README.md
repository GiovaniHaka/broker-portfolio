# Stock Market Broker (pt_BR)

Este aplicativo contém 2 telas:

a. Portfolio - exibe uma breve lista de ativos.

b. Detalhes do ativo - exibe os detalhes do ativo selecionado, exibindo a rentabilidade no período, lista de preços, rentabilidades e gráfico de variação de preços.

---
## Arquitetura

O projeto foi desenvolvido utilizando a arquitetura em camadas, sendo inspirada no livro Clean Architecture, Robert Cecil Martin. Esta arquitetura permite o realizar um desenvolvimento baseado em testes, com criação de contratos e interfaces para classes, seguindo pricípios de responsabilidade única. São as camadas:

- domain: camada que contém os modelos e casos de uso de cada feature.

- data: contendo geralmente duas pastas, sendo elas "repositories" que conecta a camada de domain à fo external, realizando também a função de adapters, e a pasta "sources" que realiza conexão externa com os dados.

- presentation: esta camada contém a interface do aplicativo, e realiza a interação direta com o usuário.

 Nas camadas de apresentação, foi utilizado o padrão MVC (Model, View Controller), o que facilita na integração da interface com as camadas de domínio e modelos. 
 
 Também foi utilizado programação funcional, que facilita a propagação de informação através das camadas, bem como o tratamento e exibição de erros ao usuário. 
 
 Por fim, foi desenvolvido um gerencimento de estados, que permite alterar o estado da interface, através da interação do usuário com o aplicativo.

---
## Executando Aplicação

Para executar este aplicativo é necessário realizar a instalação prévia de Dart e Flutter em sua máquina. É possível realizar a instalação a partir da documentação oficial, encontrada [aqui](https://docs.flutter.dev/get-started/install). Este projeto foi desenvolvido em Flutter (3.3.7) e Dart (2.18.4), sendo assim, será necessária a instalação de versões semelhantes ou posteriores ao sdk utilizado. 

O projeto não possui dependências específicas para cada sistema operacional, portanto a execução do aplicativo será semelhante para Andorid e IOS. 

Inicie clonando o repositório em sua máquina.


<details><summary>iOS</summary><p>

1. Certifique-se que está executando o programa em um sitema Mac.

2. Certifique-se que a versão utilizada do XCode esteja atualizada.

3. Execute o Simulator (emulador iOS) em sua máquina, com sistema iOS igual ou superior a versão 14.0. Recomendado utilizar "iPhone 14 Pro".

4. No diretório do projeto (o mesmo diretório que se encontra o arquivo pubspec.yaml) execute o comando:
```
flutter pub get
```

5. Em seguida, ainda no mesmo diretório, para executar o programa no Simulator, execute o comando:
```
flutter run
```

Obs: na ocorrência de alguma falha, execute o comando ```flutter doctor``` para verificar qualquer problema de sdk ou instalações no framework.

</p></details>


<details><summary>Android</summary><p>

1. Certifique-se que possua Android Studio instalado, bem como as dependências e sdks do Android.

2. Execute o Android Emulator (emulador Android) em sua máquina, com sistema Adnroid igual ou superior ao sdk 30.0 (Android 11).

3. No diretório do projeto (o mesmo diretório que se encontra o arquivo pubspec.yaml) execute o comando:
```
flutter pub get
```

4. Em seguida, ainda no mesmo diretório, para executar o programa no emulador, execute o comando:
```
flutter run
```

Obs: na ocorrência de alguma falha, execute o comando ```flutter doctor``` para verificar qualquer problema de sdk ou instalações no framework.

</p></details>

---
## Pacotes

### ```dio``` (^4.0.6)

Pacote utilizado para utilização de protocolos Http, utilizado para comunicação entre o aplicativo e apis externas, como por exemplo https://query2.finance.yahoo.com/v8/finance/chart. Escolhido pela simplicidade em sua utilização.

### ```dartz``` (^0.10.1)

Este pacote foi utilizado com intuito de facilitar a programação funcional, mais especfificamente utilizando a classe Either, mantendo assim maior confiabilidade de código e tratamento de erros.

### ```GetX``` (^1.1.0)

Este pacote foi utilizado para desenvolver o gerencimento de estado da aplicação e navegação. Basicamente este pacote simplifica a utilização do ValueNotifier, sendo uma reatividade nativa do Flutter.
  
### ```intl``` (^0.17.0)

Pacote utilizado para converter e formatar uma data (DateTime) em um texto (String).
