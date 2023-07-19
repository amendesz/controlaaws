#!/bin/bash

# Função para listar todas as instâncias em uma região
listar_instancias() {
    local regiao="$1"
    aws ec2 describe-instances --region "$regiao" \
        --query 'Reservations[].Instances[].[InstanceId, State.Name, Placement.AvailabilityZone, Tags[?Key==`Name`].Value | [0]]' \
        --output text
}

# Função para ligar a instância
ligar_instancia() {
    local instance_id="$1"
    aws ec2 start-instances --instance-ids "$instance_id"
}

# Função para reiniciar a instância
reiniciar_instancia() {
    local instance_id="$1"
    aws ec2 reboot-instances --instance-ids "$instance_id"
}

# Função para desligar a instância
desligar_instancia() {
    local instance_id="$1"
    aws ec2 stop-instances --instance-ids "$instance_id"
}

# Lista todas as instâncias em São Paulo (sa-east-1)
echo "Instâncias em São Paulo (sa-east-1):"
lista_sp=$(listar_instancias "sa-east-1")

# Mostra a lista completa com numeração e região
contador=1
while read -r instance_id state availability_zone name; do
    regiao=$(echo "$availability_zone" | sed 's/[a-c]$//') 
# Obtém a região removendo a última letra da zona de disponibilidade
    echo "$contador. $instance_id | $state | $name (Região: $regiao)"
    ((contador++))
done <<< "$lista_sp"

# Lista todas as instâncias em Ohio (us-east-2)
echo -e "\nInstâncias em Ohio (us-east-2):"
lista_ohio=$(listar_instancias "us-east-2")

# Mostra a lista completa com numeração e região
while read -r instance_id state availability_zone name; do
    regiao=$(echo "$availability_zone" | sed 's/[a-c]$//') 
# Obtém a região removendo a última letra da zona de disponibilidade
    echo "$contador. $instance_id | $state | $name (Região: $regiao)"
    ((contador++))
done <<< "$lista_ohio"

# Concatena as listas
lista_completa="${lista_sp}\n${lista_ohio}"

# Solicita ao usuário o número da instância para operar
read -p "Digite o número da instância que deseja operar: " numero_instancia

# Obtém o Instance ID da instância selecionada pelo número
instance_id=$(echo -e "$lista_completa" | awk -v numero="$numero_instancia" 'NR == numero {print $1}')

# Menu de opções
echo "Escolha uma ação para a instância $instance_id:"
echo "1. Desligar a instância"
echo "2. Reiniciar a instância"
echo "3. Ligar a instância"
read -p "Opção: " opcao

# Executa a ação escolhida
case "$opcao" in
    1) desligar_instancia "$instance_id" ;;
    2) reiniciar_instancia "$instance_id" ;;
    3) ligar_instancia "$instance_id" ;;
    *) echo "Opção inválida"; exit 1 ;;
esac
