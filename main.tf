resource "null_resource" "provisioner" {
  count = "${signum(length(var.playbook)) == 1 ? 1 : 0}"

  depends_on = [ var.ansible_depends_on ]

  provisioner "local-exec" {
    command = "ansible-playbook ${var.dry_run ? "--check --diff" : ""} ${join(" ", compact(var.arguments))} ${length(compact(var.envs)) > 0 ? "-e" : ""} ${join(" -e ", compact(var.envs))} ${var.playbook}"
    when        = create
}

  lifecycle {
    create_before_destroy = true
  }
}
