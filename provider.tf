provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  password    = "password"
  auth_url    = "http://localhost:5000/v2.0"
}

terraform {
  backend "swift" {
    container = "demo-remote-state"
  }
}

resource "openstack_objectstorage_container_v1" "container" {
  name           = "remote-tfstate"
}