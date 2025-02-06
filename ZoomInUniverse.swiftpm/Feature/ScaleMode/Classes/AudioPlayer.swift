import Observation
import AVKit

@Observable
class AudioPlayer {
    private var player: AVAudioPlayer?
    var volumn: Float {
        get {
            player?.volume ?? 0
        }
        set {
            guard let player else { return }
            player.volume = newValue
        }
    }
    
    init() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("오디오 세션 설정 오류:", error.localizedDescription)
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "StarsSurfing", withExtension: "mp3") else {
            print("MP3 파일을 찾을 수 없습니다.")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1 // loop
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("오디오 재생 중 오류 발생: \(error.localizedDescription)")
        }
    }
    
    func stopSound() {
        player?.stop()
    }
    
    func toggleVolumn() {
        if player?.volume == 0 {
            player?.volume = 1
        } else if player?.volume == 1 {
            player?.volume = 0
        }
    }
}
