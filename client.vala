public class Client
{
    static void connect(SocketAddress address) throws Error
    {
        //InetAddress address = new InetAddress.from_string(ip);
        //InetSocketAddress inetAddress = new InetSocketAddress(address, 8080);//IP Address and port

      Socket socket = new Socket (SocketFamily.IPV4, SocketType.STREAM, SocketProtocol.TCP);
    	assert(socket != null);

    	socket.connect (address);

    	uint8 buffer[100];
    	ssize_t len;
      while(true)
      {
        while (socket.get_available_bytes() > 0)
        {
          len = socket.receive(buffer);
          stdout.write(buffer, len);
          print("\n");
        }
      }
    }

    static void main()
    {
        InetAddress address = new InetAddress.loopback(SocketFamily.IPV4);
        InetSocketAddress inetAddress = new InetSocketAddress(address, 8080);
        connect(inetAddress);

        /*
        print("Enter ip address to connect to: \n");
        string ip = stdin.read_line();
        if(ip != null)
        {
            connect(ip);
        }
        */
    }
}
