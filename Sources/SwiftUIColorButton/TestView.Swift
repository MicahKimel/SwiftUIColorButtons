import SwiftUI

@objc(MySwiftUIView)
public class MySwiftUIView: NSObject {
    private var labelText: String = ""

    @objc func setLabelText(_ text: String) {
        labelText = text
    }

    @objc func getLabelText() -> String {
        return labelText
    }

    @objc func createView() -> UIViewController {
        let swiftUIView = SwiftUIView(labelText: labelText)
        let hostingController = UIHostingController(rootView: swiftUIView)
        return hostingController
    }
}

public struct SwiftUIView: View {
    var labelText: String

    var body: some View {
        VStack {
            Text(labelText)
                .font(.largeTitle)
                .padding()
        }
    }
}
