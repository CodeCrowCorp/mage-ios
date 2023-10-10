//
//  ChannelCellView.swift
//  mage-ios
//
//  Created by Gagan Suie on 10/9/23.
//

import SwiftUI

struct ChannelCellView: View {
    let channel: Channel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text(channel.title)
                    .bold()
                Spacer()
                
                Text(channel.userDetails.username)
                    
            }
            Text(channel.description)
        }
    }
}

struct ChannelCellView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelCellView(channel: Channel.preview)
    }
}
