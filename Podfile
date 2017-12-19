
source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!


def mytargets

# https://github.com/malcommac/SwiftRichString
pod 'SwiftRichString', '1.0.1'   # Swift 4.0
#pod 'SwiftRichString', '0.9.10'  # Swift 3

end


# Specify the pods that need to use Swift 4 or 3.2
#
# Reference:  https://github.com/CocoaPods/CocoaPods/issues/6791
# All pods not specified use setting set by Xcode/CocoaPods.
#
swift_32 = ['']
swift4 = ['SwiftRichString']

#swift_32 = ['SwiftRichString']
#swift4 = ['']

post_install do |installer|
    installer.pods_project.targets.each do |target|
        swift_version = nil
        
        if swift_32.include?(target.name)
            swift_version = '3.2'
        end
        
        if swift4.include?(target.name)
            swift_version = '4.0'
        end
        
        if swift_version
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = swift_version
            end
        end
    end
end
    

target 'SwiftRichString_MallocBug' do
    mytargets
end
