<h1 align="center">:file_cabinet: Journal REST-API</h1>
 
<div style="overflow: auto;">
 
<div style="text-align: center"><table><tr>
  <td style="text-align: center, width: 150">
    
 ![gif-1-api](https://github.com/CaioReis29/journal-rest-api/assets/114621145/c77321c9-24dd-4040-a132-17b61bad3234)

  </td>
  <td style="text-align: center, width: 180">
    
  ![gif-2-api](https://github.com/CaioReis29/journal-rest-api/assets/114621145/6ef8ca46-2318-48d4-b302-b3704f09a7ae)

  </td>

  <td style="text-align: center, width: 180">
    
 ![gif-3-api](https://github.com/CaioReis29/journal-rest-api/assets/114621145/a6f88361-14fa-42fd-bd47-904f8093a859)


    
  </td>


</tr></table></div>
 
  
</div>
<div style="clear: both;"></div>

## :memo: Descrição:

<p>Eeste projeto é uma criação de API REST para um diário no qual o usuário vai poder criar, editar, ou excluir os cards do conteúdo do app através de requisições HTTP para se comunicar com um fake server (JSON server) </p>

## :wrench: Tecnologias utilizadas

![Dart](https://img.shields.io/badge/Dart-0D1117?style=for-the-badge&logo=dart&logoColor=0175C2)&nbsp;<br>
![Flutter](https://img.shields.io/badge/Flutter-0D1117?style=for-the-badge&logo=flutter&logoColor=0175C2)&nbsp;<br>
![Node.js](https://img.shields.io/badge/Node.js-43853D?style=for-the-badge&logo=node.js&logoColor=white)&nbsp;

## ⚠️ OBS:

 Para rodar aplicações flutter, certifique-se se sua máquina possui as seguintes tecnologias:
- DART SDK
- FLUTTER SDK
- Node.JS instalado na sua máquina 
- Servidor local (JSON server) ativo
- Um device físico (seu celular conectado por um USB) ou um emulador (como o android studio)

## Dependências do PUBSPEC: 
- cupertino_icons: ^1.0.2
- uuid: ^3.0.6
- http: ^0.13.3
- http_interceptor: ^1.0.2
- logger: ^1.1.0
- shared_preferences: ^2.0.15

## :rocket: Rodando o projeto

```bash
  # Clone o Repositório
  $ git clone https://github.com/CaioReis29/journal-rest-api.git
```
```bash
  # Entre na pasta clonada
  $ cd flutter_webapi_first_course-main
```

```bash
  # Instale as dependências necessárias para rodar o projeto usando este comando
  $ flutter pub get
```

```bash
  # Em um outro terminal, entre na pasta do servidor para ativá-lo
  $ cd server
```

```bash
  # Digite o comando que ativa o server JSON
  $ json-server-auth O_SEU_IP_AQUI db.json -r routes.json
```

```bash
  # Conecte o device com a IDE que você está usando (InteliJ, Android Studio ou VS Code)
```

```bash
  # Com todas as dependências nesserárias, basta voltar para o primeiro terminal e digitar o comando
  $ flutter run
```

## :handshake: Colaboradores
<table>
  <tr>
    <td align="center">
      <a href="http://github.com/CaioReis29">
        <img src="https://github.com/CaioReis29.png" width="100px;" alt="Caio Reis"/><br>
        <sub>
          <b>Caio Reis</b>
        </sub>
      </a>
    </td>
  </tr>
</table>
