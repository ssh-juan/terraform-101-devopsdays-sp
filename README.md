# terraform-101-devopsdays-sp

Laboratório criado para a talk **“Infra as Code: do init à eficiência com agilidade e escala”** no Esquenta(Meetup) DevOpsDays SP (Oracle, 28/10/2025).

Este repositório serve como apoio prático para a apresentação, com exemplos progressivos de uso do Terraform: desde casos simples até módulos mais elaborados.

---

## 📂 Estrutura do repositório

| Pasta / arquivo | Descrição |
|------------------|------------|
| `1.simple_bucket` | Exemplo básico para provisionar um bucket como recurso simples |
| `2.simple_instance` | Adição de instância (VM) junto com outros recursos auxiliares |
| `3.module_instance` | Refatoração usando módulos — organizar recursos reutilizáveis |
| `4.module_instance_lab` | Versão final do laboratório com melhores práticas de módulos, variáveis e outputs |
| `.gitignore` | Arquivos que devem ser ignorados no versionamento (estado, credenciais, etc) |

---

## 🛠️ Como usar (setup local)

1. Clone este repositório:  
```sh
git clone https://github.com/ssh-juan/terraform-101-devopsdays-sp.git

cd terraform-101-devopsdays-sp
```

2. Instale o Terraform (versão compatível com os exemplos).

3. Em cada pasta de exemplo:
- Execute `terraform init`
- Ajuste variáveis se necessário (via `terraform.tfvars` ou `-var`)
- Execute `terraform plan`
- Execute `terraform apply`

4. Para limpar os recursos:
```
terraform destroy
```

---


---

## 🎯 Objetivos didáticos

- Demonstrar a evolução de código Terraform: do exemplo simples até uso de módulos.  
- Mostrar boas práticas de organização (variáveis, outputs, módulos).  
- Ilustrar conceitos de **Infraestrutura como Código (IaC)** aplicados na prática.  
- Servir como base de laboratório para quem quiser aplicar os conceitos apresentados na palestra.

---

## 🧩 Dicas & boas práticas

- Use **versionamento de estado remoto** (ex: backend S3, Azure Storage) em projetos reais.  
- Separe ambientes (dev, staging, prod) com workspaces ou repositórios distintos.  
- Use **linters** e ferramentas de segurança (ex: `tflint`, `tfsec`) para validar código.  
- Documente seus módulos e suas entradas/saídas para facilitar a manutenção.  
- Não comite arquivos de estado ou credenciais sensíveis.

---

## 📜 Licença e créditos

Este conteúdo está disponível sob a licença **[MIT License](LICENSE)**.  
Créditos por essa base ao autor da apresentação e à comunidade Terraform.