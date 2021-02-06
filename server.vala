public class Server
{
    public static void StartServer (SocketAddress address) throws Error
    {
        Socket socket = new Socket(SocketFamily.IPV4, SocketType.STREAM, SocketProtocol.TCP);
    	assert(socket != null);

    	socket.bind(address, true);
    	socket.set_listen_backlog(10);
    	socket.listen();

        int id = 0;
    	while(true)
        {
            Socket connection = socket.accept();
            print(@"[Accepted Client ID: $id]\n");

            connection.send(@"[Your ID: $id]".data);
            ++id;
        }
    }

    public static void main()
    {
        print("[Server Started]\n");
        InetAddress address = new InetAddress.loopback(SocketFamily.IPV4);
        InetSocketAddress inetAddress = new InetSocketAddress(address, 8080);//IP Address and port
        StartServer(inetAddress);
    }
}
