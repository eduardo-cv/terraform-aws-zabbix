# Pré-requisitos - [Terraform - AWS - Zabbix v2]

1. Uma conta ativa da AWS.

2. AWS Command Line Interface (AWS CLI) instalada e configurada com as permissões necessárias. Para obter mais informações sobre isso, consulte <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html" rel="nofollow" _istranslated="1">esta documentação</a>.</li>

3. Terraform instalado e configurado. Para obter mais informações sobre isso, consulte <a href="https://learn.hashicorp.com/tutorials/terraform/install-cli" rel="nofollow" _istranslated="1">esta documentação</a>.

<h3>Colaboradores</h3>

- Eduardo C.
- Gerlucio Moura

<h3>Laboratório - Zabbix e RDS</h3>

1 - Criar um bucket na região da virginia Exemplo ""terraform-state-seu-projeto" e depois substituir no arquivo <b>"backend.tf"</b>

 - A criaçao do mesmo pode ser no painel ou via cli. O motivo da criação e gravar o estado da infra no bucket.

2 - No arquivo <b>"variaveis.tf"</b> agora existe um parâmetro com o nome <b>"criar_rds"</b>

 - Quando definido <b>true</b> ira criar o recurso normalmente. 
 - Caso contrario defina <b>false</b> para não criar o recurso de rds.
 
3 - No arquivo <b>"variaveis.tf"</b> agora existe um parâmetro com o nome <b>"Volume_Size"</b>

 - Este se refere ao tamanho do disco que será criado na instancia.
 
 
<h3>info Saídas</h3>


**NOTA**: os recursos criados podem gerar em custos em sua conta da AWS. Considere excluir os recursos criados assim que os testes forem concluídos. Para obter mais informações, consulte [Definição de preço da AWS](https://aws.amazon.com/pricing/).

terraform destroy --auto-approve
