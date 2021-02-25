Pod::Spec.new do |spec|
    spec.name         = "UnitTestWithPod"
    spec.version = "1.2.3"
    spec.summary      = "A really short description of test_sic. Included some specific points"
    spec.description  = "Signer’s Interaction Component. Part of the eID App which is responsible for managing keys, interractins with SSA"
    spec.homepage     = "https://github.com/LLTemp/test_sic_zip"
    spec.license      = "MIT"
    spec.author       = { "SergeyBrazhnik" => "sergey.brazhnik@ledgerleopard.com" }
    spec.platform     = :ios, "14.0"
    #spec.source = { :http => "[REPLACE_ME]" }
    spec.source = { :http => "https://testbuildartefacts.s3.us-east-2.amazonaws.com/sic-sdk-ios/1.2.3/UnitTestWithPod.xcframework.zip", :type => "zip" }
    spec.vendored_framework = 'UnitTestWithPod.xcframework'
    spec.vendored_libraries = 'UnitTestWithPod.xcframework/lib'
    spec.header_mappings_dir = 'UnitTestWithPod.xcframework/openssl'
    spec.dependency 'KeychainSwift', '~> 19.0'
    spec.dependency 'gRPC-Swift', '1.0.0'
end
