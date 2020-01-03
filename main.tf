/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

module "gsuite_export" {
  source  = "terraform-google-modules/gsuite-export/google"
  version = "1.0.0"

  project_id          = var.project_id
  admin_user          = var.gsuite_admin
  api                 = "reports_v1"
  applications        = var.applications
  machine_name        = "gsuite-exporter-vm-${random_string.suffix.result}"
  service_account     = var.service_account
}

module "gsuite_log_export" {
  source                 = "terraform-google-modules/log-export/google"
  version                = "3.2.0"
  destination_uri        = module.bigquery.destination_uri
  filter                 = module.gsuite_export.filter
  log_sink_name          = "gsuite_export_bq"
  parent_resource_id     = var.project_id
  parent_resource_type   = "project"
  unique_writer_identity = false
}

module "bigquery" {
  source                   = "terraform-google-modules/log-export/google//modules/bigquery"
  version                  = "3.2.0"
  project_id               = var.project_id
  dataset_name             = "gsuite_audit_${random_string.suffix.result}"
  log_sink_writer_identity = module.gsuite_log_export.writer_identity
}

