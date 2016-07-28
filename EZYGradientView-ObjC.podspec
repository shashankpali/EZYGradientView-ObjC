Pod::Spec.new do |s|

  s.name              = 'EZYGradientView-ObjC'
  s.version           = '1.1.1'
  s.platform          = :ios, '8.0'
  s.license           = { :type => 'MIT' }
  s.homepage          = 'https://github.com/shashankpali/EZYGradientView-ObjC'
  s.authors           = { 'Shashank Pali' => 'shank.pali@gmail.com' }
  s.summary           = 'Create gradients and blur gradients without a single line of code'
  s.source            = { :git => 'https://github.com/shashankpali/EZYGradientView-ObjC.git', :tag => s.version }
  s.source_files      = 'EZYGradientView/*.{h,m}'
  s.requires_arc      = true
end