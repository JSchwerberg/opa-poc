# Requires additional approval on destroys.

package terraform

import input.tfplan as tfplan

array_contains(arr, elem) {
  arr[_] = elem
}

deny["Additional approval needed for resource destruction"] {
    resource := tfplan.resource_changes[_]
    array_contains(resource.change.actions, "delete")
}
