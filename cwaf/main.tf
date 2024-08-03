provider "imperva" {
  api_id  = var.imperva_api_id
  api_key = var.imperva_api_key
}

resource "imperva_cloudwaf_site" "new_site" {
  site_name             = var.site_name
  site_ip               = var.site_ip
  custom_certificate    = var.custom_certificate
  custom_certificate_key = var.custom_certificate_key
  status                = "Active"
  
  dns {
    cname = var.cname
  }

  security {
    profile = "high"
  }

  advanced_settings {
    https_redirect = true
  }
}

variable "imperva_api_id" {
  description = "API ID for Imperva Cloud WAF"
  type        = string
}

variable "imperva_api_key" {
  description = "API Key for Imperva Cloud WAF"
  type        = string
}

variable "site_name" {
  description = "The name of the site to be added"
  type        = string
}

variable "site_ip" {
  description = "The IP address of the site"
  type        = string
}

variable "custom_certificate" {
  description = "Custom SSL certificate for the site"
  type        = string
  default     = null
}

variable "custom_certificate_key" {
  description = "Key for the custom SSL certificate"
  type        = string
  default     = null
}

variable "cname" {
  description = "CNAME record for the site"
  type        = string
}