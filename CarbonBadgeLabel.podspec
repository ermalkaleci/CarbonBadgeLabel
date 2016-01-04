#
# Be sure to run `pod lib lint CarbonBadgeLabel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "CarbonBadgeLabel"
  s.version          = "0.1.0"
  s.summary          = "CarbonBadgeLabel - iOS badge label (Obj-C & Swift)"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = "CarbonBadgeLabel is an open source iOS library for badge label"

  s.homepage         = "https://github.com/ermalkaleci/CarbonBadgeLabel"
  # s.screenshots      = "https://github.com/ermalkaleci/CarbonBadgeLabel/blob/master/Screenshots/screenshot_2.png"
  s.license          = 'MIT'
  s.author           = { "Ermal Kaleci" => "ermalkaleci@gmail.com" }
  s.source           = { :git => "https://github.com/ermalkaleci/CarbonBadgeLabel.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/KaleciErmal'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Sources/*.{h,m}'

  s.public_header_files = 'Sources/*.h'
  s.frameworks = 'UIKit'
end
