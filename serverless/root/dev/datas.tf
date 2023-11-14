data "archive_file" "create" {
  type        = "zip"
  output_path = "${path.root}/zip/${var.create_zip}"
  source_dir  = "../src/create/"
}

data "archive_file" "delete" {
  type        = "zip"
  output_path = "${path.root}/zip/${var.delete_zip}"
  source_dir  = "../src/delete/"
}

data "archive_file" "read" {
  type        = "zip"
  output_path = "${path.root}/zip/${var.read_zip}"
  source_dir  = "../src/read/"
}

data "archive_file" "update" {
  type        = "zip"
  output_path = "${path.root}/zip/${var.update_zip}"
  source_dir  = "../src/update/"
}