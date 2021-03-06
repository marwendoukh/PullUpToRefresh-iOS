Pod::Spec.new do |s|

s.name         = "PullUpToRefresh"
s.version      = "0.6.4"
s.summary      = "PullUpToRefresh in tableview bottom"

s.description  = <<-DESC
PullUpToRefresh adds pull from bottom of tableview
DESC

s.homepage     = "https://github.com/marwendoukh/PullUpToRefresh-iOS"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "Marwen Doukh" => "marwen.doukh@protonmail.com" }
s.platform     = :ios, "12.0"
s.source       = { :git => "https://github.com/marwendoukh/PullUpToRefresh-iOS.git", :tag => "#{s.version}" }
s.source_files  = "PullUpToRefresh/Source/**/*.{swift}"
s.exclude_files = "Classes/Exclude"
s.swift_version = "5.0"
end
