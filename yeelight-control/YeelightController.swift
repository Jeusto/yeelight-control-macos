import Network

class YeelightController {
    private var connection: NWConnection?
    private let yeelightIP: NWEndpoint.Host
    private let yeelightPort: NWEndpoint.Port

    init(ip: String, port: UInt16) {
        self.yeelightIP = NWEndpoint.Host(ip)
        self.yeelightPort = NWEndpoint.Port(rawValue: port)!
    }

    private func sendCommand(_ command: String) {
        guard let data = command.data(using: .utf8) else { return }

        connection = NWConnection(host: yeelightIP, port: yeelightPort, using: .tcp)
        connection?.start(queue: .global())

        connection?.send(content: data, completion: .contentProcessed({ error in
            if let error = error {
                print("Error sending data: \(error)")
                return
            }
            print("Command sent successfully: \(command)")
            // TODO: read response from
            self.connection?.cancel()
        }))
    }

    func toggleLight() {
        let command = "{\"id\":1,\"method\":\"toggle\",\"params\":[]}\r\n"
        sendCommand(command)
    }

    func setBrightness(_ brightness: Int) {
        let command = "{\"id\":1,\"method\":\"set_bright\",\"params\":[\(brightness),\"smooth\",500]}\r\n"
        sendCommand(command)
    }
}
