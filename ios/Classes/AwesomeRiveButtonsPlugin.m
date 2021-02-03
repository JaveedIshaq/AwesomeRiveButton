#import "AwesomeRiveButtonsPlugin.h"
#if __has_include(<awesome_rive_buttons/awesome_rive_buttons-Swift.h>)
#import <awesome_rive_buttons/awesome_rive_buttons-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "awesome_rive_buttons-Swift.h"
#endif

@implementation AwesomeRiveButtonsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAwesomeRiveButtonsPlugin registerWithRegistrar:registrar];
}
@end
