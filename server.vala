public class Server
{
    public static void StartServer (SocketAddress address)
    {
        Socket s = new Socket (SocketFamily.IPV4, SocketType.STREAM, SocketProtocol.TCP);
        assert(s != null);

        s.bind(address, true);
        s.set_listen_backlog(10); //Max ammount of connections
        s.listen();

        for(int i = 0; true; (i + 1) % 10)
        {
            Socket connection = s.accept();
            print("Accepted client: " + s.get_remote_address().to_string());
            connection.send(i.to_string().data);
        }

    }

    public static void main()
    {
        InetAddress address = new InetAddress.loopback(SocketFamily.IPV4);
        InetSocketAddress inetAddress = new InetSocketAddress(address, 8080);//IP Address and port
        StartServer(inetAddress);
    }
}
