Pod::Spec.new do |s|
  s.name             = "DXSetting"
  s.version          = "0.0.1"
  s.summary          = "An easy setting"
  s.homepage         = "https://github.com/Jackdx/DXSetting"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Jackdx" => "1928292007@qq.com" }
  s.source           = { :git => "https://github.com/Jackdx/DXSetting.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'DXSetting/**/*.{h,m}'

end
