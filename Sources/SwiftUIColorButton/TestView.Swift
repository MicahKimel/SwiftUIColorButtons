// TestView.swift (Main framework file)

import SwiftUI
import UIKit

@objc public class SwiftUIHostViewController: UIViewController {

    private var hostingController: UIHostingController<AnyView>?

    @objc public init(swiftUIView: Any) {
        super.init(nibName: nil, bundle: nil)

        // Ensure the provided view is actually a View
        guard let view = swiftUIView as? any View else {
            fatalError("Provided object is not a SwiftUI View")
        }

        let anyView = AnyView(view) // Type erase to AnyView

        self.hostingController = UIHostingController(rootView: anyView)
        guard let hostingController = self.hostingController else { return }

        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)

        // Constraints for the SwiftUI view to fill the UIViewController
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        self.view = UIView()
    }
}

// Example SwiftUI View within the framework
public struct MySwiftUIView: View {
    let message: String

    public init(message: String) {
        self.message = message
    }

    public var body: some View {
        Text(message)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

// Objective-C Header for Bridging (MySwiftUIFramework-Bridging-Header.h)
// This is automatically created when you add an Objective-C file to your Swift framework
#import <UIKit/UIKit.h>
#import <MySwiftUIFramework/MySwiftUIFramework-Swift.h> // Import generated Swift header

// Example Objective-C Wrapper (MySwiftUIWrapper.h/.m)

// MySwiftUIWrapper.h
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MySwiftUIFramework/MySwiftUIFramework-Swift.h>

@interface MySwiftUIWrapper : NSObject

+ (UIViewController *)viewControllerForSwiftUIViewWithMessage:(NSString *)message;

@end

// MySwiftUIWrapper.m
#import "MySwiftUIWrapper.h"

@implementation MySwiftUIWrapper

+ (UIViewController *)viewControllerForSwiftUIViewWithMessage:(NSString *)message {
    MySwiftUIView *swiftUIView = [[MySwiftUIView alloc] initWithMessage:message];
    return [[SwiftUIHostViewController alloc] initWithSwiftUIView:swiftUIView];
}

@end