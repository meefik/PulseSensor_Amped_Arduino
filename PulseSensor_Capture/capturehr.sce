atomsLoad("serial")
h = openserial("/dev/ttyACM0","115200,n,8,1")
data=zeros(1,500)
figure(1)
clf()
plot(1:500,data)
set(gca(),"auto_clear","on")
buf = ''
for k = 1:5000
    buf = buf + readserial(h)
    arr = strsplit(buf,'/\n/')
    [r,n] = size(arr)
    for i = 1:r-1
        x = arr(i)
        if strindex(x,'S') == 1 then
            d = strtod(part(x,2:length(x)))
            //printf("_%d_\n",d)
            data = [data(2:length(data)), d]
        end
    end
    buf = arr(r)
    //printf("%s_", buf)
    plot(1+k:500+k,data)
end
//printf("%s", buf)
closeserial(h)
