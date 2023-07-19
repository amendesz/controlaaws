<h1 align="center">AWS Instance Control Script</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Shell%20Script-blue">
  <img src="https://img.shields.io/badge/AWS%20CLI-blue">
</p>

<p align="center">
  <strong>Controle suas instâncias da AWS de forma simples e rápida!</strong>
</p>

## Requisitos

Antes de usar o script, certifique-se de que os seguintes requisitos foram atendidos:

1. Ter o AWS CLI instalado e configurado com as credenciais apropriadas. Você pode seguir as instruções de instalação e configuração na documentação oficial da AWS: [AWS CLI - Guia de Instalação e Configuração](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html).

2. Ter permissões adequadas para acessar e gerenciar as instâncias EC2 na sua conta da AWS.

## Como Usar

1. Clone o repositório para o seu ambiente local:

```bash
git clone https://github.com/seu-usuario/aws-instance-control.git
cd aws-instance-control
```

2. Dê permissão de execução ao script:

```bash
chmod +x aws_instance_control.sh
```
3. Execute o script:

```bash
./aws_instance_control.sh
```

## Instruções

O script irá listar todas as instâncias disponíveis nas regiões "São Paulo (sa-east-1)" e "Ohio (us-east-2)".

Digite o número da instância que deseja operar e pressione "Enter".

Escolha a ação que deseja realizar na instância selecionada:

Digite "1" para desligar a instância.
Digite "2" para reiniciar a instância.
Digite "3" para ligar a instância.

O script executará a ação na instância selecionada.

## Observações

As instâncias são numeradas a partir de 1 na listagem.
O nome da região será exibido corretamente na listagem das instâncias, por exemplo, "sa-east-1" para São Paulo e "us-east-2" para Ohio.
Certifique-se de ter permissões adequadas para executar ações nas instâncias na sua conta da AWS.

## Contribuindo

Se você quiser contribuir para este projeto, sinta-se à vontade para abrir um Pull Request com as suas melhorias ou correções.

## Licença

Este projeto está sob a Licença MIT - veja o arquivo LICENSE para detalhes.

