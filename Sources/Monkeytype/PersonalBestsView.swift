//
//  Created by Artem Novichkov on 20.11.2024.
//

import SwiftUI
import AppKit

public struct PersonalBestsView: View {
    @State public var personalBestsResponse: PersonalBestsResponse

    public init(personalBestsResponse: PersonalBestsResponse) {
        self.personalBestsResponse = personalBestsResponse
    }

    public var body: some View {
        HStack {
            ForEach(["15", "30", "60", "120"], id: \.self) { key in
                PersonalBestView(title: key + " seconds",
                                 personalBest: personalBestsResponse.data[key]?.first)
            }
        }
        .frame(maxHeight: .infinity)
        .background(Color(nsColor: .windowBackgroundColor))
    }
}

struct PersonalBestView: View {
    @State var title: String
    @State var personalBest: PersonalBest?

    public var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Text(title)
                .font(.body)
                .foregroundColor(Color(nsColor: .tertiaryLabelColor))
            wpm
                .font(.title)
                .foregroundColor(Color(nsColor: .labelColor))
            acc
                .font(.body)
                .foregroundColor(Color(nsColor: .secondaryLabelColor))
        }
        .frame(maxWidth: .infinity)
    }

    private var wpm: Text {
        if let wpm = personalBest?.wpm {
            Text(wpm, format: .number.precision(.fractionLength(0)).rounded())
        } else {
            Text("—")
        }
    }

    private var acc: Text {
        if let acc = personalBest?.acc {
            Text(acc / 100, format: .percent.precision(.fractionLength(0)).rounded())
        } else {
            Text("—")
        }
    }
}

#Preview {
    PersonalBestView(title: "15 seconds",
                     personalBest: .mock)
}

#Preview(traits: .fixedLayout(width: 422, height: 100)) {
    PersonalBestsView(personalBestsResponse: .init(data: ["15": [.mock]]))
}
