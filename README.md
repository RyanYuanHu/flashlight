# flashlight (v0.1.1)

A flutter plugin project for controlling flash light.

## Notice
Remember to add lines in bold into ***{your project}/ios/Podfile***

---

*target 'Runner' do*  
&nbsp;&nbsp;***use_frameworks!***  
......  
*post_install do |installer|*  
&nbsp;&nbsp;*installer.pods_project.targets.each do |target|*  
&nbsp;&nbsp;&nbsp;&nbsp;*target.build_configurations.each do |config|*  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***config.build_settings['SWIFT_VERSION'] = '4.1'***  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*config.build_settings['ENABLE_BITCODE'] = 'NO'*  
&nbsp;&nbsp;&nbsp;&nbsp;*end*  
&nbsp;&nbsp;*end*  
*end*  

***pre_install do |installer|***  
&nbsp;&nbsp;***installer.analysis_result.specifications.each do |s|***  
&nbsp;&nbsp;&nbsp;&nbsp;***s.swift_version = '4.1' unless s.swift_version***  
&nbsp;&nbsp;***end***  
***end***  

---