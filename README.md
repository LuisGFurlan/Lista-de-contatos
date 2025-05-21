# 📇 Projeto: Lista de Contatos

## 🎯 Objetivo Geral

Desenvolver um aplicativo de **Lista de Contatos** com foco em:

- Construção visual fiel ao layout do Figma
- Estruturação de formulários
- Navegação entre telas
- Interações visuais
- Validações básicas de dados

**Obs.:** O projeto não utiliza backend nem persistência de dados.

---

## 🖥️ Telas e Funcionalidades

### 🔐 Login
- Campos: **e-mail** e **senha**
- Validações:
  - E-mail no formato válido (`usuario@dominio.com`)
  - Senha com no mínimo 6 caracteres
- Botões:
  - **Entrar**: valida credenciais fixas
  - **Esqueci minha senha**: ilustrativo (sem funcionalidade)

### 📋 Lista de Contatos
- Lista visualmente organizada
- Cada item mostra **nome** e **avatar**
- Ao expandir um item:
  - Exibe **celular**, **telefone**, **anotações**
  - Ações disponíveis:
    - **Editar**
    - **Deletar**
    - **Ligar** (visual, sem funcionalidade)
- Botão flutuante para adicionar novo contato

### ✍️ Adicionar / Editar Contato
- Formulário com:
  - Nome (obrigatório)
  - Celular e Telefone (pelo menos um obrigatório, com máscaras)
  - Anotações (opcional)
- Botões:
  - **Salvar**: valida e salva se correto
  - **Cancelar**: retorna à lista sem salvar
- Mesma tela usada para adicionar e editar

---

## 🧾 Regras de Negócio
- Todos os formulários devem ter validações completas
- Login com e-mail e senha fixos
- Nome do contato é obrigatório
- Pelo menos **celular** ou **telefone** devem ser preenchidos
- Máscaras nos campos de número
- Reutilização de componentes personalizados sempre que possível

---

## 🗂️ Estrutura de Pastas

- /screens → Telas principais do app
- /widgets → Componentes reutilizáveis
- main.dart → Arquivo principal do app, define rotas e inicialização

**Exemplos:**
- `/screens/login_screen.dart`
- `/widgets/custom_input_field.dart`

---

## 🎨 Layout no Figma

[🔗 Acesse o Figma](https://www.figma.com/design/lJ1CiuwtJ1btgpAsp34GO4/projeto-lista-de-contatos?node-id=0-1&t=1GBiU2tuT5a7Tllz-1)

---

## ✅ Requisitos
- Flutter SDK
- Editor como VSCode ou Android Studio

---

> Este projeto serve como prática para Flutter UI, validações e organização modular.
