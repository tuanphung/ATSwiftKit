Pod::Spec.new do |s|
  s.name         = "ATSwiftKit"
  s.version      = "0.0.2"
  s.summary      = "Set of extensions and Custom classes are written in Swift"

  s.description  = <<-DESC
                   Set of Swift extensions and Custom classes that help you create an app more quickly.
                   DESC

  s.homepage     = "https://github.com/tuanphung/ATSwiftKit"

  s.license      = "MIT"

  s.author             = { "Tuan Phung" => "tuanphunglk@gmail.com" }
  s.social_media_url   = "https://twitter.com/tuanphunglk"

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/tuanphung/ATSwiftKit.git", :tag => s.version }
  s.source_files  = "Source/**/*.swift", "Source/**/**/*.swift"

  s.framework  = "Foundation", "UIKit"
  s.requires_arc = true

end
