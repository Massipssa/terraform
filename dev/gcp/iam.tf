/*
resource "google_project_iam_member" "user" {
  project = var.project
  role    = "roles/editor"
  member  = "user:user@example.com"  # Replace user@example.com with the email address of the new user
}
*/

resource "google_project_iam_custom_role" "my-custom-role" {
  role_id     = "myCustomRole"
  title       = "My Custom Role"
  description = "A description"
  permissions = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"]
  stage = "BETA"
}

resource "google_service_account" "bqowner" {
  account_id = "bqowner"
}

resource "google_service_account" "airflow-user" {
  account_id = "airflowowner"
}
