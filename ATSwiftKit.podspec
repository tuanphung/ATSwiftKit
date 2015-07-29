#
#  Be sure to run `pod spec lint ATSwiftKit.podspec.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "ATSwiftKit"
  s.version      = "0.0.1"
  s.summary      = "A collection of components are written in Swift"

  s.description  = <<-DESC
                   A package of components help you create an app more quickly.
                   DESC

  s.homepage     = "https://github.com/tuanphung/ATSwiftKit"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "Tuan Phung" => "tuanphunglk@gmail.com" }
  s.social_media_url   = "https://twitter.com/tuanphunglk"

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/tuanphung/ATSwiftKit.git", :tag => "v0.0.1" }
  s.source_files  = "Source/**/*.swift"

  s.framework  = "Foundation", "UIKit"
  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

end
