// Copyright Evan Murray. All Rights Reserved. Revision History at http://github.com/emurray2/MusicalWeather

import CoreAudioKit

public class MusicalWeatherUI: AUViewController, AUAudioUnitFactory {
    var audioUnit: AUAudioUnit?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        if audioUnit == nil {
            return
        }
        
        // Get the parameter tree and add observers for any parameters that the UI needs to keep in sync with the AudioUnit
    }
    
    public func createAudioUnit(with componentDescription: AudioComponentDescription) throws -> AUAudioUnit {
        audioUnit = try MusicalWeatherPlugin(componentDescription: componentDescription, options: [])
        
        return audioUnit!
    }
    
}
