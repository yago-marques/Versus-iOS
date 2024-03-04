# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'

workspace 'Versus'

target 'Versus-iOS' do
  # Comment the next line if you don't want to use dynamic frameworks
  workspace 'Versus'
  use_frameworks!

  # Pods for Versus-iOS

  target 'Versus-iOSTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'DesignSystem' do
  workspace 'Versus'
  project 'DesignSystem/DesignSystem.xcodeproj'
  use_frameworks!
  
  # Pods for DesignSystem
  
  target 'DesignSystemTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
end

target 'Core' do
  workspace 'Versus'
  project 'Core/Core.xcodeproj'
  use_frameworks!
  
  # Pods for Core
  
  target 'CoreTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
end

target 'NetworkLayer' do
  workspace 'Versus'
  project 'NetworkLayer/NetworkLayer.xcodeproj'
  use_frameworks!
  
  # Pods for Core
  
  target 'NetworkLayerTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
end
