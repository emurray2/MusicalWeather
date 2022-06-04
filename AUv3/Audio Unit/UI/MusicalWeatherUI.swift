// Copyright Evan Murray. All Rights Reserved. Revision History at http://github.com/emurray2/MusicalWeather

import CoreAudioKit
import SwiftUI

public class MusicalWeatherUI: AUViewController, AUAudioUnitFactory {
    var audioUnit: MusicalWeatherPlugin? {
        didSet {
            // Connect parameters to the view model
            print("got the audio unit")
        }
    }

    let contentView = UIHostingController(rootView: ContentView())

    public override func viewDidLoad() {
        super.viewDidLoad()
        addChild(contentView)
        view.addSubview(contentView.view)
        setupConstraints()
    }

    fileprivate func setupConstraints() {
        contentView.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

    public func createAudioUnit(with componentDescription: AudioComponentDescription) throws -> AUAudioUnit {
        audioUnit = try MusicalWeatherPlugin(componentDescription: componentDescription, options: [])
        return audioUnit!
    }
}
