variable "environments" {
  default = [
    {
      name   = "dev"
      branch = "develop"
    },
    {
      name   = "hml"
      branch = "homolog"
    },
    {
      name   = "prod"
      branch = "main"
    }
  ]
}
