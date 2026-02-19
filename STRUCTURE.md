# Estrutura do projeto (Java + Spring Boot)

Estrutura em camadas para manter o código organizado e escalável.

## `src/main/java/nl2query/elasticsearch/qwen/`

```
qwen/
├── QwenApplication.java          # Entrada da aplicação
├── config/                       # Configurações (beans, WebMvc, segurança)
├── controller/                   # REST controllers (camada API)
├── service/                      # Regras de negócio
├── repository/                   # Acesso a dados (JPA, Elasticsearch, etc.)
├── model/
│   ├── entity/                   # Entidades de domínio / JPA
│   ├── dto/                      # DTOs (uso interno)
│   ├── request/                  # Payloads de entrada da API
│   └── response/                 # Payloads de saída da API
├── exception/                    # Exceções e @ControllerAdvice
└── client/                       # Clientes de APIs externas (ES, LLM)
```

## Responsabilidade das camadas

| Pacote      | Uso |
|------------|-----|
| **controller** | Recebe HTTP, valida entrada, chama service, devolve resposta. |
| **service**    | Lógica de negócio, orquestração, transações. |
| **repository** | Persistência e leitura (JPA, Elasticsearch, etc.). |
| **model/entity** | Entidades de domínio mapeadas para banco/índice. |
| **model/dto**   | Objetos de transferência entre camadas. |
| **model/request**  | Objetos que representam o body/query da API. |
| **model/response** | Objetos que representam o JSON de resposta. |
| **exception**   | Tratamento global de erros (ex.: RFC 7807). |
| **config**      | Beans, propriedades, segurança, WebMvc. |
| **client**      | Chamadas a serviços externos (REST, SDKs). |

## `src/test/java/`

Espelhe os pacotes de `main` para testes unitários e de integração:

- `controller/` — testes de API (`@WebMvcTest`, MockMvc)
- `service/` — testes de serviços (mocks de repository)
- `repository/` — testes de repositórios (ex.: @DataJpaTest)
- Raiz do pacote — testes de contexto (`@SpringBootTest`)

## Convenções

- Um controller por recurso (ex.: `Nl2QueryController`).
- Services com interface em `service` e implementação em `service.impl` (opcional).
- Request/Response em pacotes separados para versionamento e clareza da API.
