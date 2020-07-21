#!/usr/bin/python
import getpass
import sys
import telnetlib

HOST = "localhost"
user = "root"
password = "dbps"

tn = telnetlib.Telnet("bbts-tlab",2002)

tn.write("\n");
if password:
    tn.read_until("[VxWorks Boot]:")
    tn.write("c\n")


tn.write("dc\n")
tn.write("0\n");
tn.write("triton\n");
tn.write("/home/daq/bbite/vxworks/vx2400_v2\n");
tn.write("129.57.36.180:fffffc00\n");
tn.write("\n");
tn.write("129.57.37.36\n");
tn.write("129.57.36.1\n");
tn.write("daq\n");
tn.write(".\n");
tn.write("0x20\n");
tn.write("bbsfi1-tlab\n");
tn.write("/home/daq/bbite/vxworks/bb_sfi1.boot\n");
tn.write("\n");
tn.write("p\n");
print tn.read_until("[VxWorks Boot]:");
tn.write("@\n");
print tn.read_until("Starting at 0x100000...")
print tn.read_until("executing startup script")

exit();
#exit()
