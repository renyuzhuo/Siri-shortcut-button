import AVFoundation
import UIKit

class ViewController: UIViewController {
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioPlayer()
    }

    func setupAudioPlayer() {
        // 获取音频文件路径
        guard let path = Bundle.main.path(forResource: "yourAudioFileName", ofType: "mp3") else {
            print("音频文件未找到")
            return
        }
        let url = URL(fileURLWithPath: path)

        do {
            // 初始化 AVAudioPlayer
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay() // 预加载音频缓冲区
            audioPlayer?.play() // 播放音频
        } catch {
            print("AVAudioPlayer 初始化失败: \(error.localizedDescription)")
        }
    }

    @IBAction func playButtonTapped(_ sender: UIButton) {
        audioPlayer?.play() // 播放音频
    }

    @IBAction func stopButtonTapped(_ sender: UIButton) {
        audioPlayer?.stop() // 停止播放
        audioPlayer?.currentTime = 0 // 可选：重置播放进度到开头
    }
}
