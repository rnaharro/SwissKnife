Pod::Spec.new do |s|
  s.name             = 'SwissKnife'
  s.version          = '0.1.0'
  s.summary          = 'Utilities and extensions for swift projects.'
  s.description      = <<-DESC
Utilities and extensions for swift projects.
                       DESC

  s.homepage         = 'https://github.com/rnaharro/SwissKnife'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ricardo N.' => 'rnaharro@icloud.com' }
  s.source           = { :git => 'https://github.com/rnaharro/SwissKnife.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/AppDelegate'

  s.ios.deployment_target = '13.0'

  s.source_files = 'Sources/**/*'
end
