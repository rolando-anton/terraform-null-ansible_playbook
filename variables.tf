variable "arguments" {
  default = []
  type    = "list"
  description = "Arguments"
}

variable "envs" {
  default = []
  type    = "list"
  description = "Environment variables"
}

variable "playbook" {
  default = ""
  description = "Playbook to run"
}

variable "dry_run" {
  default = true
  description = "Do dry run"
}

variable "ansible_depends_on" {
  description = "Add any external depend on module here like ansible_depends_on = [module.fw_core01.firewall]."
  type        = any
  default     = null
}


