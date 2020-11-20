
Pod::Spec.new do |spec|


  spec.name         = "UnitTestWithPod"
  spec.version      = "0.0.2"
  spec.summary      = "A really short description of test_sic. Included some specific points"
  spec.description  = "Signer’s Interaction Component. Part of the eID App which is responsible for managing keys, interractins with SSA"
  spec.homepage     = "https://github.com/LLTemp/test_sic_zip"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  spec.license      = "MIT"
  spec.author             = { "SergeyBrazhnik" => "sergey.brazhnik@ledgerleopard.com" }  
  spec.platform     = :ios, "14.0"
  
  spec.source       = { :http => "https://github.com/LLTemp/test_sic_zip/raw/main/UnitTestWithPod.framework.zip" }
  spec.vendored_frameworks = 'UnitTestWithPod.framework'
  spec.header_mappings_dir = 'UnitTestWithPod.framework/Headers'

  
  #spec.source       = { :path => '.' }
  #spec.exclude_files = "test_sic/*.swift"
  #spec.source_files  = "test_sic/*.swift"
  #spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  #spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"


  spec.dependency 'KeychainSwift', '~> 19.0'
  # spec.dependency 'Firebase/Messaging'
  # spec.dependency 'gRPC-Swift', '1.0.0-alpha.17'
  # spec.dependency 'gRPC-Swift-Plugins', '1.0.0-alpha.17'
end
