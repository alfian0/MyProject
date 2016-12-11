use_frameworks!
workspace 'MyProject.xcworkspace'
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

def common_pods
    pod 'Swinject', '~> 1.1.0'
    pod 'Alamofire', '~> 3.4.1'
    pod 'ObjectMapper', '~> 1.3.0'
    pod 'AlamofireObjectMapper', '~> 3.0'
    pod 'R.swift', '~> 0.13.0'
    pod 'SlideOutMenu'
    pod 'ParallaxHeaderView'
end

def common_test_pods
    
end

target 'MyProject' do
    project "MyProject/MyProject.xcodeproj"
    common_pods
end

target 'MyProjectTests' do
    project "MyProject/MyProject.xcodeproj"
    common_pods
    common_test_pods
end

target 'MyProjectUITests' do
    project "MyProject/MyProject.xcodeproj"
    common_pods
    common_test_pods
end