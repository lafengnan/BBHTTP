Pod::Spec.new do |s|
  s.name     = "BBHTTP"
  s.version  = "0.9.2"
  s.summary  = "A modern HTTP client framework for iOS/OSX built on top of libcurl."
  s.homepage = "https://github.com/brunodecarvalho/BBHotpotato"
  s.license  = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
  s.author   = { "Bruno de Carvalho" => "bruno@biasedbit.com" }
  s.source   = { :git => "https://github.com/brunodecarvalho/BBHotpotato.git", :commit => "5d6d7b9659" }

  s.requires_arc = true
  s.source_files = "BBHTTP/**/*.{h,m}"

  s.ios.deployment_target = "5.0"
  s.ios.frameworks = %w{ MobileCoreServices Security UIKit }
  s.ios.libraries = %w{ z curl.iOS.dev.a }
  s.ios.preserve_paths = "External/libcurl.iOS"
  s.ios.xcconfig = {
    "HEADER_SEARCH_PATHS" => '"${PODS_ROOT}/BBHTTP/External/libcurl.iOS"',
    "LIBRARY_SEARCH_PATHS" => '"${PODS_ROOT}/BBHTTP/External/libcurl.iOS"'
  }

  s.osx.deployment_target = "10.7"
  s.osx.frameworks = %w{ Security CoreServices AppKit }
  s.osx.libraries = %w{ z curl.OSX.a }
  s.osx.preserve_paths = "External/libcurl.OSX"
  s.osx.xcconfig = {
    "HEADER_SEARCH_PATHS" => '"${PODS_ROOT}/BBHTTP/External/libcurl.OSX"',
    "LIBRARY_SEARCH_PATHS" => '"${PODS_ROOT}/BBHTTP/External/libcurl.OSX"'
  }

  s.prefix_header_contents = <<-PREFIXHEADER
#import <Availability.h>

#if __IPHONE_OS_VERSION_MIN_REQUIRED
    #import <MobileCoreServices/MobileCoreServices.h>
#else
    #import <CoreServices/CoreServices.h>
#endif
PREFIXHEADER
end
