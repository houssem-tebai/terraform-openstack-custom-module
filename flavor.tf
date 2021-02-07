resource "openstack_compute_flavor_v2" "test-flavor" {
  name  = "custom.large"
  ram   = "8096"
  vcpus = "2"
  disk  = "20"
}