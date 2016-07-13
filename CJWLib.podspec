Pod::Spec.new do |spec|
  spec.name         = 'CJWLib'
  spec.ios.deployment_target = '8.0'
  spec.platform = :ios
  spec.version      = '1.0'
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.summary      = 'An Objective-C client for the Pusher.com service'
  spec.homepage     = 'https://github.com/lukeredpath/libPusher'
  spec.author       = 'Frank C'
  spec.source       = { :git => 'git://github.com/frankcjw/CJWLib.git'}
  spec.source_files = 'CJWLib/Lib/*.h','CJWLib/Lib/*.m','CJWHeader.h'
  spec.dependency "SDWebImage"
  spec.framework = "UIKit"
  spec.requires_arc = true
  spec.public_header_files = "CJWHeader.h"
end
