#
# Be sure to run `pod lib lint BLAMPayment.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BLAMPayment'
  s.version          = '0.0.2'
  s.summary          = 'A Collection View based interface for selecting enrollment options.  To implement simply subclass a UIView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A configurable subscription selection interface to enable a user to view the features and to select to which product they would like to subscribe.  An Apple Pay amd Other Pay button use delegation to inform the calling UIView the amount and currency the user has selected.  Designed for iPad.
                       DESC

  s.homepage         = 'https://github.com/petetodd/BLAMPayment'
  # s.screenshots     = 'http://www.brightbluecircle.com/img/BLAM1.png', 'http://www.brightbluecircle.com/img/BLAM2.png', 'http://www.brightbluecircle.com/img/BLAM3.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Peter Todd' => 'peter@petertodd.com' }
  s.source           = { :git => 'https://github.com/petetodd/BLAMPayment.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/PeteTodd'

  s.ios.deployment_target = '9.3'

  s.source_files = 'BLAMPayment/Classes/**/*'
    s.resource_bundles = {
'BLAMPayment' => ['BLAMPayment/Classes/**/*.{storyboard,xib}']
}

  # s.resource_bundles = {
  #   'BLAMPayment' => ['BLAMPayment/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'FontAwesome.swift'
end
