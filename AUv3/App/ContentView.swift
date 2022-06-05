// Copyright Evan Murray. All Rights Reserved. Revision History at http://github.com/emurray2/MusicalWeather

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            ZStack {
                LinearGradient(colors: [Color(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347), Color(red: 0.9529411793, green: 0.8685067713, blue: 0.1800223484)], startPoint: .top, endPoint: .bottom)
                VStack {
                    Text("Woodbury")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                    Text("Sunny")
                        .foregroundColor(.white)
                        .font(.system(size: 25)).padding(.bottom, 60)
                        .frame(maxWidth: .infinity)
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 120))
                    Text("72")
                        .foregroundColor(.white)
                        .font(.system(size: 90))
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
