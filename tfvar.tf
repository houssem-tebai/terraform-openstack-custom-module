vm_specs.image_name = "CentOS 6 x86_64"
vm_specs.flavor_name = "custom.small"
vm_specs.security_groups = "ITzGeek_Security"
network = "Internal_Network"
volume_size = 10
lb_specs.protocol = "HTTP"
lb_specs.lb_method = "ROUND_ROBIN"
lb_specs.type = "APP_COOKIE"
