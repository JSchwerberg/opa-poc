# Requires additional approval on destroys.

package terraform

import input.tfplan as tfplan

array_contains(arr, elem) {
  arr[_] = elem
}

deny["Approval required to destroy Google Storage Buckets"] {
    resource := tfplan.resource_changes[_]
    array_contains(resource.change.actions, "delete")
    resource.type = "google_storage_bucket"
}
