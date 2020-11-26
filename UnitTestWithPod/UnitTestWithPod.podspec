
Pod::Spec.new do |spec|
    spec.name         = "UnitTestWithPod"
    spec.version      = "1.0.54"
    spec.summary      = "A really short description of test_sic. Included some specific points"
    spec.description  = "Signer’s Interaction Component. Part of the eID App which is responsible for managing keys, interractins with SSA"
    spec.homepage     = "https://github.com/LLTemp/test_sic_zip"
    spec.license      = "MIT"
    spec.author       = { "SergeyBrazhnik" => "sergey.brazhnik@ledgerleopard.com" }
    spec.platform     = :ios, "14.0"

    spec.source       = { :http => "https://github.com/LLTemp/test_sic_zip/raw/main/UnitTestWithPod.framework.zip" }
    spec.vendored_frameworks = 'UnitTestWithPod.framework'
    spec.vendored_libraries = 'UnitTestWithPod.framework/OpenSSL/lib'
    spec.header_mappings_dir = 'UnitTestWithPod.framework/OpenSSL/include'
    
    spec.dependency 'KeychainSwift', '~> 19.0'
end
