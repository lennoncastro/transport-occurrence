# Transport occurrences
Projeto para o "Desafio Técnico - Ocorrência de Transporte (Offline → Sync)".

---
### Pré-requisitos
- Flutter 3.32.7 
- Git

### Instalação
1. Clone o repositório:
```bash
git clone https://github.com/lennoncastro/transport-occurrence
cd transport_occurrence
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Execute a geração de código:
```bash
./scripts/code_generation.sh
```
ou
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Executando o projeto
- Para executar em modo debug:
```bash
flutter run
```

- Para executar testes de integração:
```bash
flutter test integration_test/app_test.dart
```

### Estrutura do projeto
```
lib/
├── app/              # Configuração inicial da aplicação
├── core/             # Funcionalidades compartilhadas
│   ├── background_task/  # Provider de tarefas em background
│   ├── camera/          # Provider de câmera
│   ├── db/              # Banco de dados local (Drift)
│   ├── ds/              # Design System
│   ├── extensions/      # Extensions
│   ├── navigation/      # Navegação
│   ├── network/         # Network
│   └── signature/       # Provider de assinatura
├── data/             # Camada de dados
│   ├── models/          # Modelos de dados
│   ├── repositories/    # Implementação de repositórios
│   └── services/        # Serviços de API
└── features/         # Módulos de funcionalidades
    ├── checklist/       # Feature de checklist
    └── ocurrences/      # Feature de ocorrências
```

## Arquitetura
---
### Padrão arquitetural
O projeto segue uma arquitetura modular baseada em **MVVM** (Model-View-ViewModel), utilizando **Flutter Modular** para injeção de dependências e gerenciamento de rotas.

### Camadas

#### App Layer (`lib/app/`)
- Responsável pela inicialização da aplicação
- Configuração do MaterialApp e roteamento principal
- Módulo raiz que importa todos os outros módulos

#### Core Layer (`lib/core/`)
- Funcionalidades compartilhadas entre todas as features
- Serviços base: navegação, câmera, assinatura, rede, banco de dados
- Design System: componentes reutilizáveis, temas, cores, dimensões
- Extensions: utilitários para tipos nativos
- Background tasks: componente que permite a execução de tarefas em segundo plano

#### Data Layer (`lib/data/`)
- Repositórios: abstração para acesso a dados
- Services: comunicação com APIs externas
- Models: modelos de dados
- Mappers: conversão entre modelos e tables

#### Features Layer (`lib/features/`)
- Cada feature é um módulo independente
- Estrutura por feature:
  - `pages/`: Telas da feature
  - `stores/`: Gerenciamento de estado (MobX)
  - `viewmodels/`: Lógica de apresentação
  - `components/`: Componentes específicos da feature
  - `*_module.dart`: Configuração do módulo (rotas e dependências)

### Fluxo de dados
1. **View** (Page) → chama métodos do **ViewModel**
2. **ViewModel** → utiliza **Store** (MobX) para gerenciar estado
3. **ViewModel** → utiliza **Repository** para buscar dados
4. **Repository** → utiliza **Service** (API) ou **DAO** (banco local)
5. **Store** atualiza o estado → **View** reage automaticamente

### Gerenciamento de estado
- **MobX**: Utilizado para gerenciamento reativo de estado
- **Stores**: Classes observáveis que contêm o estado da feature
- **ViewModels**: Coordenam a interação entre View e Store/Repository

### Injeção de dependências
- **Flutter Modular**: Gerencia a injeção de dependências e rotas
- Cada módulo declara suas dependências via `binds()`
- Dependências são injetadas automaticamente via construtor

### Relação entre módulos
A hierarquia de módulos segue uma estrutura em camadas, onde módulos superiores dependem de módulos inferiores. A ideia é evitar dependência circular e permitir que qualquer feature tenha acesso aos dados e recursos necessários para funcionar.

```
AppModule (raiz)
├── Importa: CoreModule
└── Rotas:
    ├── ChecklistModule (rota '/')
    │   └── Rotas: OcurrencesModule (rota '/ocurrence')
    └── OcurrencesModule (rota '/ocurrence')
        └── Importa: DataModule

CoreModule
├── Importa: DbModule
└── Binds:
    ├── NavigationService
    ├── CameraProvider
    ├── SignatureProvider
    └── HttpClient

DbModule
└── Binds:
    ├── DatabaseConnection
    └── OcurrenceDao

DataModule
├── Importa: CoreModule
└── Binds:
    ├── OcurrenceRepository (usa OcurrenceDao do CoreModule)
    └── OcurrenceService (usa HttpClient do CoreModule)
```

#### Hierarquia de dependências
1. **DbModule** (base)
   - Módulo mais baixo na hierarquia
   - Fornece acesso ao banco de dados local
   - Não depende de outros módulos

2. **CoreModule**
   - Importa `DbModule` para ter acesso ao banco de dados
   - Fornece serviços compartilhados (navegação, câmera, assinatura, rede)
   - Base para todas as outras camadas

3. **DataModule**
   - Importa `CoreModule` para acessar `HttpClient` e `OcurrenceDao`
   - Fornece repositórios e serviços de API
   - Abstrai o acesso a dados (local e remoto)

4. **Features Modules** (ChecklistModule, OcurrencesModule)
   - Importam `DataModule` para acessar repositórios
   - Podem acessar serviços do `CoreModule` diretamente
   - Cada feature é independente e pode ser desenvolvida separadamente

5. **AppModule** (raiz)
   - Importa `CoreModule` para disponibilizar serviços base
   - Configura as rotas principais da aplicação
   - Ponto de entrada da arquitetura modular

#### Fluxo de acesso
- **Features** → acessam `DataModule` para obter dados
- **DataModule** → acessa `CoreModule` para serviços de rede e banco
- **CoreModule** → acessa `DbModule` para operações de banco de dados
- Todos os módulos podem acessar serviços do `CoreModule` diretamente

## Padrões e convenções
---
### Padrões de código
O projeto segue as regras do `flutter_lints` com configurações adicionais no `analysis_options.yaml`:

- **Sempre declarar tipos de retorno**: `always_declare_return_types: true`
- **Usar imports de pacote**: `always_use_package_imports: true`
- **Ordenação de diretivas**: `directives_ordering: true`
- **Nomenclatura de pacotes**: `package_names: true` e `package_prefixed_library_names: true`
- **Remoção de código desnecessário**: várias regras para evitar código redundante

### Convenções de nomenclatura
- **Módulos**: `*_module.dart` (ex: `app_module.dart`, `core_module.dart`)
- **Stores**: `*_store.dart` (ex: `ocurrence_store.dart`)
- **ViewModels**: `*_viewmodel.dart` (ex: `ocurrence_plate_viewmodel.dart`)
- **Pages**: `*_page.dart` (ex: `checklist_page.dart`)
- **Providers**: `*_provider.dart` (ex: `camera_provider.dart`)
- **Services**: `*_service.dart` (ex: `ocurrence_service.dart`)
- **Repositories**: `*_repository.dart` (ex: `ocurrence_repository.dart`)


## Decisões técnicas
---
O que?
 - Usar freezed
Por quê?
 - Facilita a criação de models, dtos e etc
 - Contém vários métodos utilitários (copyWith e toString por exemplo)  
 - Reduz a quantidade de erros na criação de models e dtos
 - Padroniza a criação desse tipo de classe no projeto
Trade-offs:
 - Requer geração de código (build_runner), aumentando tempo de build
 - Curva de aprendizado inicial para desenvolvedores não familiarizados
 - Alternativas consideradas: classes manuais (mais verbosas) ou json_serializable (menos recursos)

O que?
 - Usar drift
Por quê?
 - Facilita a criação e manutenção de banco de dados local
 - Boa documentação
 - Type-safe queries
 - Migrations automáticas
Trade-offs:
 - Requer geração de código, similar ao freezed
 - Alternativas consideradas: sqflite (mais manual, menos type-safe) ou hive (mais simples mas menos recursos para queries complexas)

O que?
 - Flutter SVG
Por quê?
 - Viabiliza a utilização de assets em formato .svg
 - Ícones/Imagens sem perda de qualidade

O que?
 - Flutter Gen
Por quê?
 - Facilita a utilização de assets no projeto
 - Type-safe access a assets
 - Evita erros de digitação em paths

O que?
 - i69n
Por quê?
 - Facilita a geração de strings no projeto, facilitando a internacionalização e localização do mesmo. 
 - Type-safe labels
 - Suporte a pluralização

O que?
 - mask_text_input_formatter
Por quê?
 - Facilita a criação e aplicação de máscaras nos componentes de input de texto 
 - Validação automática de formato

O que?
 - signature
Por quê?
 - Facilita a criação e recuperação de imagens de assinaturas no projeto.

O que?
 - flutter modular
Por quê?
 - Permite modularizar aplicações frontend seguindo boas práticas de mercado
 - Requisito obrigatório
 - Injeção de dependências integrada
 - Gerenciamento de rotas modular
Trade-offs:
 - Adiciona complexidade inicial na configuração dos módulos
 - Alternativas consideradas: get_it (apenas DI, sem rotas) ou provider (mais simples mas menos recursos para modularização)

O que?
 - flutter mobx
Por quê?
 - Permite criar store para gerenciar estado das páginas e componentes da aplicação
 - Requisito obrigatório
Trade-offs:
 - Requer geração de código para observables
 - Alternativas consideradas: Provider (mais simples mas mais boilerplate), Riverpod (mais moderno mas não era requisito), Bloc (mais verboso)

O que?
 - image_picker
Por quê?
 - Permite acessar a camera do device através de uma api simples 
 - Requisito obrigatório
 - Suporte multiplataforma

O que?
 - workmanager
Por quê?
 - Permite a execução de tarefas em background
 - Cuida de boa parte da comunicação com o nativo
 - Viabiliza a sincronização automática de ocorrências
Trade-offs:
 - Limitações de execução em background variam por plataforma (iOS mais restritivo)
 - Alternativas consideradas: flutter_background_service (mais controle mas mais complexo) ou implementação nativa manual (mais trabalho)

O que?
 - mocktail
Por quê?
 - Permite a criação de mocks que poderão ser usados durante os testes
 - Facilita testes unitários e de integração

O que?
 - integration test
Por quê?
 - Viabiliza a criação de testes de integração
 - Testes end-to-end da aplicação

