resource "google_project_iam_custom_role" "my-custom-role" {
  project_id  = var.project_id
  role_id     = "myCustomRole"
  title       = "My Custom Role"
  description = "A description"
  permissions = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"]
}