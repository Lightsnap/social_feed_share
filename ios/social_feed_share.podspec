#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint social_feed_share.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'social_feed_share'
  s.version          = '1.0.0'
  s.summary          = 'Lightsnap - Share Instagram and Facebook feed posts'
  s.description      = <<-DESC
Lightsnap - Share Instagram and Facebook feed posts
                       DESC
  s.homepage         = 'https://lightsnap.app'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Lightsnap' => 'dev@lightsnap.app' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '10.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
