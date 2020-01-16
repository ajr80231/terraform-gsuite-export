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

output "gsuite_export" {
  description = "GSuite Export Module"
  value       = module.gsuite_export
}

output "gsuite_log_export" {
  description = "Log Export Module"
  value       = module.gsuite_log_export
}

output "bigquery" {
  description = "Log Export: BigQuery destination submodule"
  value       = module.bigquery
}

output "gsuite_vpc" {
  description = "VPC Network Created"
  value = module.gsuite_vpc
}
