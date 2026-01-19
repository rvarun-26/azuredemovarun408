variable "location"             { type = string }
variable "rg_name"              { type = string }
variable "storage_account_name" { type = string }
variable "container_name"       { type = string }

variable "tags" { 
  type    = string      # Changed from map(string) to string
  default = "dev" 
}