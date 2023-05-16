#
# Be sure to run `pod lib lint MFAuthAccess.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MFAuthAccess'
  s.version          = '1.1.5'
  s.summary          = 'simple to use.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'This is awesome library to use and enjoy it.'
                       DESC

  s.homepage         = 'https://github.com/akashbelekar2428/MFAuthAccess'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'akashbelekar2428' => 'akashbelekar108@gmail.com' }
  s.source           = { :git => 'https://github.com/akashbelekar2428/MFAuthAccess.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '16.2'
  s.swift_version = '5.0'
  s.source_files = 'Resource/**/*'
  
  # s.resource_bundles = {
  #   'MFAuthAccess' => ['MFAuthAccess/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end



Pod::Spec.new do |s|
  s.name             = 'MFAuthAccess_Network'
  s.version          = '2.2.1'
  s.summary          = 'simple to use.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'This is awesome library to use and enjoy it. change color on btn or label'
                       DESC

    s.homepage         = 'https://github.com/akashbelekar2428/MFAuthAccess'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'akashbelekar2428' => 'akashbelekar108@gmail.com' }
  s.source           = { :git => 'https://github.com/akashbelekar2428/MFAuthAccess.git', :tag => s.version.to_s }

  s.ios.deployment_target = '16.2'
  s.swift_version = '5.0'
  s.source_files = 'Network/**/*.swift'
  
  # s.resource_bundles = {
  #   'MFAuthAccess' => ['MFAuthAccess/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end


