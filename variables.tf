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

variable "service_account" {
  description = "The service account for exporting GSuite data. Needs domain-wide delegation and correct access scopes."
  type        = string
}

variable "project_id" {
  description = "The project to export GSuite data to."
  type        = string
}

variable "gsuite_admin" {
  description = "The GSuite Admin to delgate requests as"
  type        = string
}

variable "applications" {
    description = "Application logs that should be imported into stackdriver"
    default = ["admin", "calendar", "drive", "token", "saml", "gplus", "jamboard", "user_accounts", "groups_enterprise", "login", "mobile", "groups", "chat", "rules", "meet", "access_transparency", "gcp"] 
    type = "list"
}
