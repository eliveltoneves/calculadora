# Calculadora Flutter

Este é um projeto simples de uma calculadora desenvolvido em Flutter. A calculadora possui funcionalidades básicas de operações matemáticas e apresenta uma interface amigável.

## Funcionalidades

1. **Operações Básicas:** Adição, subtração, multiplicação e divisão.
2. **Números Decimais:** Suporte para números decimais em todas as operações.
3. **Botão de Igual:** Calcula e exibe o resultado da expressão matemática inserida.
4. **Botão de Limpeza:** Permite limpar a entrada ou a expressão completa.
5. **Botão de Limpeza Parcial (CE):** Remove o último caractere da expressão.
6. **Exibição Responsiva:** Layout responsivo para diferentes tamanhos de tela.

## Estrutura do Projeto

O projeto está estruturado em várias classes e widgets. Aqui estão as principais:

- **`MainApp`:** Ponto de entrada do aplicativo.
- **`CalcPage`:** Página principal que contém a interface da calculadora.
- **`CalcController`:** Controlador responsável por gerenciar o estado e a lógica da calculadora.
- **`ButtonHub`:** Widget que exibe os botões da calculadora.
- **`Display`:** Widget que exibe a entrada e o resultado.

## Tecnologias Utilizadas

1. **Flutter:** Framework de desenvolvimento de aplicativos móveis.
2. **Dart:** Linguagem de programação utilizada pelo Flutter.
3. **Math_Expressions:** Biblioteca para avaliação de expressões matemáticas.

## Funcionalidades Específicas

- **Zero à Esquerda:** Quando o usuário começa com um ponto decimal, é automaticamente adicionado um zero à esquerda.
- **Controle de Pontos Decimais:** Evita a inserção de múltiplos pontos decimais em um número.
- **Exibição Limpa:** A exibição do resultado evita casas decimais desnecessárias em números inteiros.

## Como Executar o Projeto

1. Certifique-se de ter o Flutter instalado em sua máquina.
2. Clone o repositório: `git clone https://seu-repositorio/calculadora-flutter.git`
3. Navegue até o diretório do projeto: `cd calculadora-flutter`
4. Execute o aplicativo: `flutter run`

## Demonstração

![Calculadora](assets\image\Calculadora.png)

Designer de Kevin Lozano

---

Sinta-se à vontade para substituir `url_da_sua_imagem.jpg` com a URL da imagem da sua calculadora. Isso permitirá que você exiba uma captura de tela ou imagem do seu aplicativo na seção de demonstração.
