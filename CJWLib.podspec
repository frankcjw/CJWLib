Pod::Spec.new do |spec|
  spec.name         = 'CJWLib'
  spec.version      = '1.0'
  spec.license      = 'LICENSE'
  spec.summary      = 'An Objective-C client for the Pusher.com service'
  spec.homepage     = 'https://github.com/lukeredpath/libPusher'
  spec.author       = 'Frank C'
  spec.source       = { :git => 'git://github.com/frankcjw/CJWLib.git', :tag => '1.0' }
  spec.source_files = 'CJWLib/*'
  spec.framework = "UIKit"
  spec.requires_arc = true
  spec.dependency 'SocketRocket'
end
