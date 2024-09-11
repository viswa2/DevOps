terraform {
  cloud {
    organization = "viswanath"

    workspaces {
      name = "demo-workspace"
    }
  }
}