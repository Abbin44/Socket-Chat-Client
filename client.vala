public class Client
{
    static void connect(string ip)
    {
        InetAddress address = new InetAddress.loopback(SocketFamily.IPV4);
        InetSocketAddress inetAddress = new InetSocketAddress.from_string(ip, 8080);//IP Address and port

        Socket s = new Socket(SocketFamily.IPV4, SocketType.STREAM, SocketProtocol.TCP);
        assert(s != null);
        s.connect(inetAddress);
        print("Connected Successfully!");

        uint8 buffer[100];
        ssize_t len;

        len = s.receive(buffer);
        stdout.write(buffer, len);
        print("\n");
    }

    static void main()
    {
        print("Enter ip address to connect to: \n");
        string ip = stdin.read_line();

        if(ip != null)
        {
            stdout.printf(ip);
            connect(ip);
        }
    }
}
