#
# Be sure to run `pod lib lint dotLottieR.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'dotLottieR'
  s.version          = '0.1.0'
  s.summary          = 'An iOS library to natively render .lottie files with the help of rLottie Library https://dotlottie.io/'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
dotLottieR is an open-source file format that aggregates one or more Lottie files and their associated resources into a single file. They are ZIP archives compressed with the Deflate compression method and carry the file extension of .lottie.
                       DESC

  s.homepage         = 'https://github.com/dotlottie/dotLottieR-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'eharrison' => 'evandro.hoffmann@gmail.com' }
  s.source           = { :git => 'https://github.com/dotlottie/dotLottieR-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
  s.swift_version = '5.0'
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '6.0'

  s.source_files = 'Sources/**/*'
  
  # s.resource_bundles = {
  #   'dotLottieR' => ['dotLottieR/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'dotLottieLoader', '~> 0.1.0'
  s.dependency 'SDWebImageLottieCoder', '~> 0.1.0'
end
