public class Server : GLib.Socket
{
    public static void server(SocketAddress address, SocketType.STREAM, SocketProtocol.TCP) throws error
    {
        Socket s = new Socket(SocketFamily);
        assert(s != null);

        s.bind(address, true);
        s.set_listen_backlog(10): //Max ammount of connections
        s.listen();
    }

    public static void main()
    {

    }
}
