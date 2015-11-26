import serial

ser = serial.Serial('/dev/ttyACM0', 115200, timeout=0)

buffer = ''
while True:
   buffer = buffer + ser.read(ser.inWaiting())
   if '\n' in buffer:
      lines = buffer.split('\n')
      last_received = lines.pop(0)
      buffer = '\n'.join(lines)
      print last_received

ser.close()
