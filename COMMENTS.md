# Decisão da Arquitetura Utilizada

Como arquiteto, é crucial avaliar o escopo do projeto e tomar decisões que melhor se alinhem às suas necessidades. No caso deste projeto, optei por utilizar a arquitetura MVC (Model-View-Controller) com o conceito de "store" utilizando MobX no Controller. A escolha dessa arquitetura foi baseada na simplicidade e na compreensibilidade do projeto. Dada a natureza pequena do projeto, evitar complexidades desnecessárias torna o código mais claro e acessível para qualquer desenvolvedor.

O padrão MVC separa as preocupações relacionadas aos dados, à apresentação e à lógica de controle. A utilização do MobX no Controller oferece um gerenciamento de estado eficiente, mantendo o código coeso e fácil de entender.

## Lista de Bibliotecas de Terceiros Utilizadas

- **flutter_modular:** 
- **flutter_mobx:**
- **shared_preferences:**
- **http:**
- **dartz:**
- **google_fonts:**
- **mocktail:**
- **flutter_launcher_icons:**

# O que Você Melhoraria se Tivesse Mais Tempo

Se dispusesse de mais tempo para aprimorar o projeto, focaria em melhorias significativas na abstração e na gestão de dados. Consideraria a introdução do SQFlite para armazenar dados localmente, permitindo que o aplicativo funcione offline. A ideia seria sincronizar esses dados com a API quando uma conexão estiver disponível, mantendo a lista atualizada.

Além disso, buscaria remover o acoplamento do HTTP nas classes de serviço, promovendo uma maior flexibilidade e facilidade de manutenção do código.

Uma prática que também adotaria seria a implementação de mais testes unitários antes de construir cada parte do projeto. Seguir o padrão TDD (Desenvolvimento Orientado a Testes) permitiria uma abordagem mais robusta, onde o desenvolvimento de cada funcionalidade é precedido pela criação de testes correspondentes. Isso contribuiria para um código mais confiável e facilitaria a manutenção contínua do projeto.

# Quais Requisitos Obrigatórios que Não Foram Entregues

Todos os requisitos obrigatórios foram entregues com sucesso. O projeto está alinhado com as expectativas e cumpre todas as especificações estabelecidas durante o processo de desenvolvimento.


# Documentação do Projeto Flutter

## Introdução
Este documento descreve as normas e práticas adotadas no projeto Flutter, abrangendo a estrutura do código, padrões de estilo, organização de arquivos e o uso de arquitetura MVC com o gerenciamento de estado usando MobX.

## Boas Práticas

### 1. **Organização de Imports**
- **Separados por Categoria:**
    - **Imports do Dart:**
      ```dart
      import 'dart:async';
      import 'dart:convert';
      // Outros imports do Dart
      ```

    - **Imports do Flutter:**
      ```dart
      import 'package:flutter/material.dart';
      import 'package:flutter/services.dart';
      // Outros imports do Flutter
      ```

    - **Imports das Constantes e Utils:**
      ```dart
      import 'const/app_colors.dart';
      import 'const/app_dimens.dart';
      import 'const/app_drawables.dart';
      import 'const/app_strings.dart';
      import 'const/app_text_styles.dart';

      import 'utils/helper.dart';
      // Outros imports de constantes e utilitários
      ```

    - **Outros Imports:**
      ```dart
      import 'controller/my_controller.store.dart';
      import 'model/my_model.dart';
      import 'service/api_service.dart';
      // Outros imports específicos do projeto
      ```

### 2. **Padrão de Commits**
- **Seguir o Padrão:**
    - Os commits devem seguir o seguinte padrão:
        - `refactor`: Refatoração do código.
        - `feature`: Adição de algo novo.
        - `build`: Alteração de dependências.
        - `test`: Commits relacionados a testes.
        - `fix`: Correção de erros.

    - **Formato do Commit:**
        - `refactor(NomeDaClasse): Descrição do Commit`
        - `feature(NomeDaClasse): Descrição do Commit`
        - `build(NomeDaClasse): Descrição do Commit`
        - `test(NomeDaClasse): Descrição do Commit`
        - `fix(NomeDaClasse): Descrição do Commit`

- **Exemplo Prático:**
    - `feature(TelaLogin): Adiciona botão de login`
    - `fix(APIUtils): Corrige bug na classe de utilitários da API`
    - `test(TesteIntegracao): Adiciona teste de integração para a nova funcionalidade`

### 3. **Boas Práticas de Código Limpo**
- **Nomes Descritivos:**
    - Utilize nomes de variáveis, funções e classes descritivos e que reflitam claramente sua funcionalidade.

- **Funções Curtas e Específicas:**
    - Mantenha funções curtas, específicas e com apenas uma responsabilidade.

- **Evite Comentários Óbvios:**
    - Evite comentários que explicam o óbvio; busque escrever código autoexplicativo.

- **Consistência de Estilo:**
    - Mantenha um estilo de codificação consistente em todo o projeto.

- **Evite Código Duplicado:**
    - Refatore ou abstraia para evitar duplicação de código.

- **Testes Unitários:**
    - Escreva testes unitários para garantir a robustez do código.

## Estrutura do Projeto

### 1. **const**
- **Descrição:** O diretório `const` contém as constantes do projeto, como cores, tamanhos, margens, caminhos de imagem, textos e estilos de texto.
- **Conteúdo:**
    - `app_colors.dart`: Define as cores utilizadas no projeto.
    - `app_dimens.dart`: Define tamanhos, margens e dimensões utilizadas no projeto.
    - `app_drawables.dart`: Armazena os caminhos para as imagens utilizadas no aplicativo.
    - `app_strings.dart`: Contém os textos utilizados no aplicativo.
    - `app_text_styles.dart`: Define estilos de texto padronizados.

### 2. **controller**
- **Descrição:** O diretório `controller` abriga os arquivos responsáveis por gerenciar o estado do aplicativo usando MobX.
- **Conteúdo:**
    - `*.store.dart`: Arquivos de controle de estado (store) usando MobX.

### 3. **model**
- **Descrição:** O diretório `model` contém os modelos de dados do aplicativo, bem como as conversões de e para JSON.
- **Conteúdo:**
    - `*.dart`: Arquivos que definem modelos de dados do aplicativo.
    - `serialization.dart`: Funções para conversão de dados de/para JSON.

### 4. **pages**
- **Descrição:** O diretório `pages` contém as diferentes páginas do aplicativo.
- **Conteúdo:**
    - `*.dart`: Arquivos que implementam as páginas do aplicativo.

### 5. **components**
- **Descrição:** O diretório `components` contém widgets reutilizáveis que são específicos para determinadas páginas.
- **Conteúdo:**
    - `*.dart`: Widgets reutilizáveis usados nas páginas do aplicativo.

### 6. **service**
- **Descrição:** O diretório `service` abriga os arquivos responsáveis por fazer chamadas à API.
- **Conteúdo:**
    - `api_service.dart`: Implementação de serviços para interagir com a API.

### 7. **utils**
- **Descrição:** O diretório `utils` contém classes que podem ser utilizadas em todo o projeto.
- **Conteúdo:**
    - `helper.dart`: Funções utilitárias e helpers que podem ser reutilizadas em várias partes do projeto.

### 8. **widgets**
- **Descrição:** O diretório `widgets` contém widgets genéricos que podem ser compartilhados em todo o projeto.
- **Conteúdo:**
    - `*.dart`: Widgets reutilizáveis em diversas partes do aplicativo.

### 9. **app_module**
- **Descrição:** O diretório `app_module` possui configurações relacionadas à injeção de dependência e rotas da aplicação.
- **Conteúdo:**
    - `dependency_injection.dart`: Configurações de injeção de dependência.
    - `app_routes
