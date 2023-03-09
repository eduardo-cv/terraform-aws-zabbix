# Pré-requisitos - [Terraform - AWS - Zabbix v6]

<h3> Obs: O arquivo <b>"variaveis-config.tf"</b> e o lugar para vc configurar o que deseja para sua infra.<h3>

1. Uma conta ativa da AWS.

2. AWS Command Line Interface (AWS CLI) instalada e configurada com as permissões necessárias. Para obter mais informações sobre isso, consulte <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html" rel="nofollow" _istranslated="1">esta documentação</a>.</li>

3. Terraform instalado e configurado. Para obter mais informações sobre isso, consulte <a href="https://learn.hashicorp.com/tutorials/terraform/install-cli" rel="nofollow" _istranslated="1">esta documentação</a>.

<h3>Colaboradores</h3>

- Eduardo C.
- Gerlucio Moura

<h3>Laboratório - Zabbix e RDS | Grafana</h3>

1 - Criar um bucket na região da virginia Exemplo <b>"terraform-state-seu-projeto"</b> e depois substituir no arquivo <b>"main.tf"</b>

 - A criaçao do mesmo pode ser no painel ou via cli. O motivo da criação e gravar o estado da infra no bucket.
 
![image](https://user-images.githubusercontent.com/82802634/224085637-42529fb2-54ae-4ec0-88c1-1ba0ba3b062b.png)

2 - No arquivo <b>"variaveis-config.tf"</b>

  ![image](https://user-images.githubusercontent.com/82802634/224080016-c96b4174-9f6e-4092-a490-3d538a359c52.png)
 
 
  ![image](https://user-images.githubusercontent.com/82802634/224079488-81c24d33-dc7f-4670-925b-2f575d6822a5.png)

    zabbix_number  =  Quant de instancias deseja criar.
    web_number     =  Quant de instancias deseja criar.
    grafana_number =  Quant de instancias deseja criar.
 
  ![image](https://user-images.githubusercontent.com/82802634/224080868-5b1ef003-1f62-4ab3-90aa-8cbc314fe163.png)

  ![image](https://user-images.githubusercontent.com/82802634/224081786-d3fb54d1-6566-43b9-a8f7-251bbb420d19.png)
 
3 - No arquivo <b>"variaveis-config.tf"</b> em cada recurso existe um parâmetro com o nome <b>"volume_size"</b>

 - Este se refere ao tamanho do disco que será criado na instancia.
 
 ![image](https://user-images.githubusercontent.com/82802634/224083295-cfce0c7a-b951-4fc0-9870-ac49b76a46e1.png)

<h3>Espero que tenha ajudado a entender o modelo que serve como base para criar sua infra.</h3>

**NOTA**: Os recursos criados podem gerar em custos em sua conta da AWS. Considere excluir os recursos criados assim que os testes forem concluídos. Para obter mais informações, consulte [Definição de preço da AWS](https://aws.amazon.com/pricing/).

<h3>Verifique se sua conta ainda se encontra no free-tier (Nível gratuito da AWS) </h3>

terraform destroy --auto-approve
