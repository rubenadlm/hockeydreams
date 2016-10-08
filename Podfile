# Uncomment this line to define a global platform for your project
platform :ios, '10.0'

target 'hockeydreams' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for hockeydreams
  pod 'Alamofire',  '~> 4.0'
  pod 'RxSwift',    '3.0.0-beta.2'
  pod 'RxCocoa',    '3.0.0-beta.2'

  target 'hockeydreamsTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RxBlocking', '3.0.0-beta.2'
    pod 'RxTests',    '3.0.0-beta.2'
  end

  target 'hockeydreamsUITests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RxBlocking', '3.0.0-beta.2'
    pod 'RxTests',    '3.0.0-beta.2'
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
