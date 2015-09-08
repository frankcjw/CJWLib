Pod::Spec.new do |s|
  s.name = 'CJWLib'
  s.version = '1.0'
  s.license = 'MIT'
  s.summary = 'CJW Library'
  s.homepage = 'https://github.com/frankcjw/CJWLib'
  s.social_media_url = 'http://www.cenjiawen.com'
  s.authors = { 'Frank => 'cjwdevelop@gmail.com' }
  s.source = { :git => 'https://github.com/frankcjw/CJWLib.git', :tag => s.version}

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'CJWLib/*.swift'

  s.requires_arc = true
end
