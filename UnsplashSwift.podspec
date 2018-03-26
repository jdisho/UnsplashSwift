
Pod::Spec.new do |spec|
  spec.name         = 'UnsplashSwift'
  spec.version      = '0.1.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/jdisho/UnsplashSwift'
  spec.authors      = { 'Joan Disho' => 'dishojoan@gmail.com' }
  spec.summary      = 'A Swift wrapper for the Unsplash API'
  spec.source       = { :git => 'https://github.com/jdisho/UnsplashSwift.git', :tag => spec.version }
  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.10'
  spec.watchos.deployment_target = '2.0'
  spec.tvos.deployment_target = '9.0'
  spec.default_subspec = 'Core'

   spec.subspec 'Core' do |ss|
    ss.source_files = 'UnsplashSwift/Sources/*.swift'
    ss.framework  = 'Foundation'
    ss.dependency 'Alamofire', '~> 4.7'
  end
end