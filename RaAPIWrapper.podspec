# pod lib lint --verbose --allow-warnings RaAPIWrapper.podspec
# pod trunk push --verbose --allow-warnings RaAPIWrapper.podspec

Pod::Spec.new do |s|
  
  s.name             = 'RaAPIWrapper'
  
  s.version          = '0.8.2'
  
  s.summary          = 'Wrappers for requesting api.'
  
  s.description      = 'Provide the necessary data for the requesting api in a more aggregated form.'
  
  s.homepage         = 'https://github.com/rakuyoMo/RaAPIWrapper'
  
  s.license          = 'MIT'
  
  s.author           = { 'Rakuyo' => 'rakuyo.mo@gmail.com' }
  
  s.source           = { :git => 'https://github.com/rakuyoMo/RaAPIWrapper.git', :tag => s.version.to_s }
  
  s.requires_arc     = true

  s.platform         = :ios, '10.0'
  
  s.swift_version    = '5.0'
  
  s.module_name      = 'APIWrapper'
  
  s.source_files     = 'Sources/*/*'

  s.dependency 'Alamofire'
  
end
