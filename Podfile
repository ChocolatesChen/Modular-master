# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
platform :ios, '9.0'
use_frameworks!

target 'Modular-master' do
    pod 'SnapKit'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |configuration|
            configuration.build_settings['SWIFT_VERSION'] = "4.2"
        end
    end
end
