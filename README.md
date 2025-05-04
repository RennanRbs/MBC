# 🚀 MyBCRBS - Crypto Market App

MyBCRBS é um aplicativo iOS desenvolvido em Swift que exibe uma lista de criptomoedas em tempo real, consumindo dados da CoinMarketCap API. Criado com arquitetura limpa (VIPER), usando ViewCode, sem Storyboards e com foco em testabilidade.

---

## 📱 Preview

> Exibe uma lista de criptomoedas com nome, símbolo e valor de mercado, além de uma tela de detalhes com informações adicionais.

---

## 🧠 Arquitetura

O projeto segue o padrão **VIPER**, separando responsabilidades da seguinte forma:

- **V**iew: Interface e interação com o usuário.
- **I**nteractor: Lógica de negócio.
- **P**resenter: Comunicação entre View e Interactor.
- **E**ntity: Modelos de dados.
- **R**outer: Navegação entre telas (futuramente).

---

## 🔧 Tecnologias e Conceitos Utilizados

1. ✅ **VIPER Architecture**
2. 🧱 **ViewCode (Sem Storyboard)**
3. 🌐 **Requisição HTTP com URLSession**
4. 🧪 **Testes Unitários com XCTest**
5. 👨‍🔬 **Testes de UI com XCUIApplication**
6. 🔐 **Uso de API Key com CoinMarketCap**
7. 📦 **Injeção de Dependência no Interactor e Presenter**
8. 🧩 **Protocols e Abstrações para maior modularidade**
9. 🕸️ **Codable para parse de JSON**
10. 🧠 **Uso de DispatchQueue para atualizar UI na Main Thread**
11. ❗ **Tratamento de Erros com Result Type**
12. 🔎 **Acessibilidade com `accessibilityIdentifier` para testes**
13. 🧼 **Separação de responsabilidades e SRP**
14. 🛠️ **Mocks customizados para testes**
15. 🖥️ **SceneDelegate com inicialização programática**

---

## ⚙️ Como rodar o projeto

1. Clone o repositório:
```bash
git clone https://github.com/seuusuario/MyBCRBS.git
