
import SwiftUI

private enum Config {
    static let defaultFontSize: CGFloat = 14.0
}

enum UnderlineButtonState {
    case regular
    case progress
    case disable
    
    fileprivate var isEnable: Bool {
        switch self {
        case .regular: return true
        case .progress, .disable: return false
        }
    }
}

// MARK: - MainView

fileprivate struct UnderlineButton: View {
    
    private let title: String
    private let titleColor: Color
    private let state: UnderlineButtonState
    private let font: SwiftUI.Font
    
    private var stateColor: Color {
        switch state {
        case .regular: return titleColor
        case .progress, .disable: return titleColor.opacity(0.5)
        }
    }
    
    // MARK: - Initialize
    
    init(title: String, titleColor: Color, state: UnderlineButtonState) {
        self.title = title
        self.titleColor = titleColor
        self.state = state
        
        self.font = .system(size: 16)
        
    }
    
    var body: some View {
        HStack {
            Text(title)
                .underline()
                .foregroundColor(stateColor)
                .font(font)
        }
    }
}

// MARK: - ButtonUnderlineAction

struct UnderlineActionButton: View {
    
    private let title: String
    private let titleColor: Color
    private let state: UnderlineButtonState
    private let action: (() -> Void)
    
    // MARK: - Initialize
    
    init(title: String, titleColor: Color = .mage_blue, state: UnderlineButtonState = .regular, action: @escaping (() -> Void)) {
        self.title = title
        self.titleColor = titleColor
        self.state = state
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            UnderlineButton(title: title, titleColor: titleColor, state: state)
        }.allowsHitTesting(state.isEnable)
    }
}

// MARK: - ButtonUnderlineDestination

struct UnderlineDestinationButton < DestinationType : View > : View {
    
    private let title: String
    private let titleColor: Color
    private let state: UnderlineButtonState
    private let destination: DestinationType
    
    // MARK: - Initialize
    
    init(title: String, titleColor: Color = .mage_blue, state: UnderlineButtonState = .regular, destination: DestinationType) {
        self.title = title
        self.titleColor = titleColor
        self.state = state
        self.destination = destination
    }
    
    var body: some View {
        NavigationLink(destination: destination) {
            UnderlineButton(title: title, titleColor: titleColor, state: state)
        }.allowsHitTesting(state.isEnable)
    }
}

#if DEBUG
struct UnderlineButton_Previews: PreviewProvider {
    static var previews: some View {
        UnderlineButton(title: "Main view", titleColor: .mage_blue, state: .disable)
        UnderlineActionButton(title: "Action button") { }
        UnderlineDestinationButton(title: "Destination button", destination: EmptyView())
    }
}
#endif
