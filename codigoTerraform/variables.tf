variable "location" {
  type = string
  default = "Brazil South"
}

variable "tags" {
  type = map
  default = {
      "Ambiente" = "Desenvolvimento"
      "Companhia" = "Aula Devops"
      "Area" = "Infraestrutura"
      "Responsavel" = "David Medina"
    }
}
