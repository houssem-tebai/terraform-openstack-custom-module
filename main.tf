resource "openstack_compute_keypair_v2" "my-cloud-key" {
  name       = "my-key"
  public_key = "ssh-rsa AAAAB3Nz..."
}
resource "openstack_compute_instance_v2" "my-instance" {
  name            = "vm"
  image_name      = var.vm_specs.image_name
  flavor_name     = var.vm_specs.flavor_name
  key_pair        = "${openstack_compute_keypair_v2.my-cloud-key.name}"
  security_groups = var.vm_specs.security_groups
  count           = 2

  network {
    name = var.network
  }
}
resource "openstack_blockstorage_volume_v2" "myvol" {
  name = "myvol"
  size = var.volume_size
}
resource "openstack_compute_volume_attach_v2" "attached" {
  instance_id = "${openstack_compute_instance_v2.myinstance.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.myvol.id}"
}
resource "openstack_lb_pool_v2" "pool_1" {
  protocol    = "HTTP"
  lb_method   = "ROUND_ROBIN"
  listener_id = "${openstack_compute_instance_v2.myinstance.id}"

  persistence {
    type        = "APP_COOKIE"
    cookie_name = "testCookie"
  }
}