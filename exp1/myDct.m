function[pic_dct]=myDct(pic)
x=size(pic);
if x(1)>x(2)
    pic_1=[pic zeros(x(1),x(1)-x(2))];
elseif x(1)<x(2)
    pic_1=[pic;zeros(x(2)-x(1),x(2))];
else
    pic_1=pic;
end

pic1_size=size(pic_1,1);
A=zeros(pic1_size);
for i=0:pic1_size-1
    for j=0:pic1_size-1
        if i==0
            a=sqrt(1/pic1_size);
        else
            a=sqrt(2/pic1_size);
        end            
        A(i+1,j+1)=a*cos(pi*(j+0.5)*i/pic1_size);
    end
end
pic_1_dct=A*255*im2double(pic_1)*A';
pic_dct=pic_1_dct(1:size(pic,1),1:size(pic,2));

    

