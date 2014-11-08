Pod::Spec.new do |s|
  s.name         = "AQSUserCredentialStoreService"
  s.version      = "0.1.0"
  s.summary      = "[iOS] AQSUserCredentialStoreService"
  s.homepage     = "https://github.com/AquaSupport/AQSUserCredentialStoreService"
  s.license      = "MIT"
  s.author       = { "kaiinui" => "lied.der.optik@gmail.com" }
  s.source       = { :git => "https://github.com/AquaSupport/AQSUserCredentialStoreService.git", :tag => "v0.1.0" }
  s.source_files  = "AQSUserCredentialStoreService/Classes/**/*.{h,m}"
  s.requires_arc = true
  s.platform = "ios", '7.0'

  s.dependency "AQMSecureRandom"
  s.dependency "LUKeychainAccess"
end
