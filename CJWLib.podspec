Pod::Spec.new do |spec|
  spec.name         = 'CJWLib'
  spec.ios.deployment_target = '8.0'
  spec.platform = :ios
  spec.version      = '1.0'
  spec.license      = 'LICENSE'
  spec.summary      = 'An Objective-C client for the Pusher.com service'
  spec.homepage     = 'https://github.com/lukeredpath/libPusher'
  spec.author       = 'Frank C'
  spec.source       = { :git => 'git://github.com/frankcjw/CJWLib.git'}
  spec.source_files = 'CJWLib/Source/*.swift'
  spec.framework = "UIKit"
  spec.requires_arc = true
end
