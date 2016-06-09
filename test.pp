alias_function("fqdn_rand", "digest")
notify { "Example":
  message => fqdn_rand(50),
}
