version = "v1"

policy "deny_delete" {
  enabled           = true
  enforcement_level = "advisory"
}

policy "deny_gcs_delete" {
  enabled           = true
  enforcement_level = "hard-mandatory"
}
