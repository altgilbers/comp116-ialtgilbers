require 'packetfu'

include PacketFu

S = Capture.new(:start =>true, :iface => 'eth0', :promisc => true);
S.stream.each do |pp|
p=Packet.parse pp
#puts p.inspect
#puts "%s" %p.proto.join(",")
#puts "%s" %p.peek_format()
puts "%s" %p.tcp_flags.ack 
if p.is_ip?
 #packet_info=[p.ip_saddr,p.ip_daddr,p.size,p.proto.last]
# puts "%-15s -> %-15s $-4d %s" %packet_info
end
end
