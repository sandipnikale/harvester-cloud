variable "prefix" {
  description = "Specifies the prefix added to the names of all resources. Default is 'do-tf'."
  type        = string
  default     = "do-tf"
}

variable "do_token" {
  description = "DigitalOcean API token used to deploy the infrastructure. Default is 'null'."
  type        = string
  default     = null
}

variable "os_image_id" {
  description = "Specifies the custom openSUSE image uploaded to the DigitalOcean account. Default is 'null'."
  type        = string
  default     = null
}

variable "region" {
  description = "Specifies the DigitalOcean region used for all resources. Default is 'fra1'."
  type        = string
  default     = "fra1"
  validation {
    condition = contains([
      "nyc1",
      "nyc2",
      "nyc3",
      "ams3",
      "sfo2",
      "sfo3",
      "sgp1",
      "lon1",
      "fra1",
      "tor1",
      "blr1",
      "syd1"
    ], var.region)
    error_message = "Invalid Region specified."
  }
}

variable "create_ssh_key_pair" {
  description = "Specifies whether a new SSH key pair needs to be created for the instances. Default is 'true'."
  type        = bool
  default     = true
}

variable "ssh_private_key_path" {
  description = "Specifies the full path where the pre-generated SSH PRIVATE key is located (not generated by Terraform). Default is 'null'."
  type        = string
  default     = null
}

variable "ssh_public_key_path" {
  description = "Specifies the full path where the pre-generated SSH PUBLIC key is located (not generated by Terraform). Default is 'null'."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "Specifies the name of the DigitalOcean Droplet type. Default is 'g-16vcpu-64gb'."
  type        = string
  default     = "g-16vcpu-64gb"
}

variable "data_disk_count" {
  description = "Specifies the number of additional data disks to create (1 or 3). Default is '1'."
  type        = number
  default     = 1
  validation {
    condition     = contains([1, 3], var.data_disk_count)
    error_message = "The number of data disks must be 1 or 3."
  }
}

variable "data_disk_size" {
  description = "Specifies the size of each additional data disk attached to the Droplet, in GB. Default is '350'."
  type        = number
  default     = 350
}

variable "startup_script" {
  description = "Specifies a custom startup script to run when the Droplets start. Default is 'null'."
  type        = string
  default     = null
}

variable "harvester_version" {
  description = "Specifies the Harvester version. Default is 'v1.4.2'."
  type        = string
  default     = "v1.4.2"
  validation {
    condition     = can(regex("^v.*$", var.harvester_version))
    error_message = "The Harvester version must start with 'v' (e.g., v1.4.1, v1.4.2-rc2, v1.5.0-dev-20250217)."
  }
}

variable "harvester_node_count" {
  description = "Specifies the number of Harvester nodes to create (1 or 3). Default is '1'."
  type        = number
  default     = 1
  validation {
    condition     = contains([1, 3], var.harvester_node_count)
    error_message = "The number of data disks must be 1 or 3."
  }
}

variable "harvester_first_node_token" {
  description = "Specifies the token used to join additional nodes to the Harvester cluster (HA setup). Default is 'SecretToken.123'."
  type        = string
  default     = "SecretToken.123"
}

variable "harvester_password" {
  description = "Specifies the password used to access the Harvester nodes. Default is 'SecretPassword.123'."
  type        = string
  default     = "SecretPassword.123"
}

variable "harvester_cluster_size" {
  description = "Specifies the size of the Harvester cluster. Allowed values are 'small' (8 CPUs, 32 GB RAM) and 'medium' (16 CPUs, 64 GB RAM). Default is 'small'."
  type        = string
  default     = "small"
  validation {
    condition     = contains(["small", "medium"], var.harvester_cluster_size)
    error_message = "Invalid value for harvester_cluster_size. Allowed values are 'small' or 'medium'."
  }
}

variable "rancher_api_url" {
  description = "Specifies the Rancher API endpoint used to manage the Harvester cluster. Default is empty."
  type        = string
  default     = ""
}

variable "rancher_access_key" {
  description = "Specifies the Rancher access key for authentication. Default is empty."
  type        = string
  default     = ""
  sensitive   = true
}

variable "rancher_secret_key" {
  description = "Specifies the Rancher secret key for authentication. Default is empty."
  type        = string
  default     = ""
  sensitive   = true
}

variable "rancher_insecure" {
  description = "Specifies whether to allow insecure connections to the Rancher API. Default is 'false'."
  type        = bool
  default     = false
}
