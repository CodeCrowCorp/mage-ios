
import SwiftUI

struct ProgrammaticallyNavigationLink <DestinationType: View> : View {
    
    private let destination: DestinationType
    
    @Binding private var push: Bool
    
    // MARK: - Initialize
    
    init(destination: DestinationType,
         push: Binding<Bool>) {
        self.destination = destination
        self._push = push
    }
    
    var body: some View {
        NavigationLink(destination: destination,
                       isActive: $push) { EmptyView() }.hidden()
    }
}

#if DEBUG
struct ProgrammaticallyNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammaticallyNavigationLink(destination: EmptyView(), push: .constant(false))
    }
}
#endif
