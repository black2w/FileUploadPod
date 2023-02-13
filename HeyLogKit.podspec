#
# Be sure to run `pod lib lint HeyLogKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HeyLogKit'
  s.version          = '0.1.0'
  s.summary          = 'A short description of HeyLogKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/black2w/HeyLogKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wangwei' => 'black2w@126.com' }
  s.source           = { :git => 'https://github.com/black2w/HeyLogKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
  
  
  s.subspec 'iOS' do |i|
      i.ios.deployment_target = '13.0'
      i.ios.framework  = 'UIKit'
      i.source_files = 'HeyLogKit/Classes/iOS/*'
      
      i.dependency 'AFNetworking'
      i.dependency 'JSONModel'
      i.dependency 'SwiftHTTP'
      i.dependency 'HandyJSON'
      i.dependency 'SnapKit'
      
      i.resource_bundles = {
        'HeyLogKit' => [
                           'HeyLogKit/Assets/iOS/*.png',
                           'HeyLogKit/Assets/iOS/*.gif',
                       ]
      }
      
   end

   s.subspec 'OSX' do |o|
       o.osx.deployment_target = '11.0'
       o.osx.framework  = 'AppKit', 'Cocoa'
       o.source_files = 'HeyLogKit/Classes/OSX/*'
       
       o.dependency 'AFNetworking'
       o.dependency 'JSONModel'
       o.dependency 'SwiftHTTP'
       o.dependency 'HandyJSON'
       o.dependency 'SnapKit'
       
       o.resource_bundles = {
         'HeyLogKit' => [
                            'HeyLogKit/Assets/OSX/*.xcassets',
                            'HeyLogKit/Assets/OSX/*.gif',
                        ]
       }
   end
   
   

#  s.ios.deployment_target = '13.0'
#  s.osx.deployment_target = '11.0'
#  s.ios.framework  = 'UIKit'
#  s.osx.framework  = 'AppKit', 'Cocoa'
#
#  coreSource = 'HeyLogKit/Classes/common/*.swift'
#  iOSSource = 'HeyLogKit/Classes/iOS/*'
#  macOSSource = 'HeyLogKit/Classes/OSX/*'
#
#
##  s.source_files = coreSource
#s.ios.source_files = coreSource, iOSSource
#s.osx.source_files = coreSource, macOSSource
  
#  s.source_files = 'HeyLogKit/Classes/**/*'

#   s.resource_bundles = {
#     'HeyLogKit' => [
#                        'HeyLogKit/Assets/*.png',
#                        'HeyLogKit/Assets/*.gif',
#                    ]
#   }
   
#   s.resources = 'AssetsDemo/{Assets,Classes}/**/*.{xcassets,png,xib}'


  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'AFNetworking'
   s.dependency 'JSONModel'
   s.dependency 'SwiftHTTP'
   s.dependency 'HandyJSON'
   s.dependency 'SnapKit'
end
