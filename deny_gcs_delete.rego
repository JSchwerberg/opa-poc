# Requires additional approval on destroys.

package terraform

import input.tfplan as tfplan

array_contains(arr, elem) {
  arr[_] = elem
}

deny[reason] {
    resource := tfplan.resource_changes[_]
    array_contains(resource.change.actions, "delete")
    resource.type = "google_storage_bucket"

    reason := sprintf("%-40s :: Must not delete GCS buckets",
      resource.address)
}
