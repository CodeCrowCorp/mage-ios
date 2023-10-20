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
        VStack(alignment: .leading, spacing: AppConfig.smallRadius) {
            HStack(alignment: .firstTextBaseline, spacing: AppConfig.smallRadius) {
                Text(channel.title)
                    .font(AppFonts.font(size: 16, style: .bold))
                Text(channel.userDetails.username)
                    .font(AppFonts.font(size: 16, style: .medium))
                Spacer()
            }
            Text(channel.description)
                .font(AppFonts.font(size: 14, style: .regular))
        }
    }
}

struct ChannelCellView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelCellView(channel: Channel.preview)
    }
}
