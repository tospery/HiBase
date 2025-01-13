Pod::Spec.new do |s|
  s.name             = 'HiBase'
  s.version          = '1.0.2'
  s.summary          = 'Base layer.'
  s.description      = <<-DESC
						Base layer using Swift.
                       DESC
  s.homepage         = 'https://github.com/tospery/HiBase'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'YangJianxiang' => 'tospery@gmail.com' }
  s.source           = { :git => 'https://github.com/tospery/HiBase.git', :tag => s.version.to_s }

  s.requires_arc = true
  s.swift_version = '5.3'
  s.ios.deployment_target = '13.0'
  s.frameworks = 'Foundation'
  
  s.source_files = 'HiBase/**/*'
  s.dependency 'ObjectMapper', '~> 4.0'
  s.dependency 'SwifterSwift/SwiftStdlib', '~> 6.0'
  s.dependency 'SwifterSwift/Foundation', '~> 6.0'
  
end
