use_frameworks!
workspace 'MyProject.xcworkspace'
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

def common_pods
    pod 'Swinject', '~> 1.1.0'
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