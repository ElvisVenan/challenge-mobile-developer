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
