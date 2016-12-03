clc;
clear all;
close all;
s=serial('COM3');
obj1 = instrfind('Type', 'serial', 'Port', 'COM3', 'Tag', '');
if isempty(obj1)
    obj1 = serial('COM3');
else
    fclose(obj1);
    obj1 = obj1(1)
end
fopen(obj1);
out = fread(s,s.BytesAvailable);
if(out==1)
x=videoinput('winvideo',1);
 
preview(x);
set(x, 'ReturnedColorSpace', 'RGB');
pause(5);
img = getsnapshot(x);
imshow(img);
fullImageFileName = fullfile(pwd, 'object.jpg');
imwrite(img,fullImageFileName);
inp_img=img;
if(size(size(inp_img),2)>2)
    gray_img=rgb2gray(inp_img);
else
    gray_img=inp_img;
end

subplot(1,2,2),imshow(gray_img),title('Gray Image');
[height_val,width_val,w_h_img]=hand_height_width ( gray_img );
figure,imshow(w_h_img),title('Height and Width Image');impixelinfo;

 msgbox(strcat('The Width and Height Pixel Counts are=',num2str(width_val),':',num2str(height_val)));
disp(width_val);
disp(height_val);
if(width_val<30)
    fwrite(s,1);
else
    fwrite(s,0);
s.ValuesSent;
end
else
    fwrite(s,0);
end
fclose(s);
delete(s);
clear s;