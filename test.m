clc;
clear all;
close all;
x=videoinput('winvideo',1);
 
preview(x);
set(x, 'ReturnedColorSpace', 'RGB');
pause(5);
img = getsnapshot(x);
imshow(img);
fullImageFileName = fullfile(pwd, 'object.jpg');
imwrite(img,fullImageFileName);

%[file,path]=fopen('object.jpg');
%[file,path]=uigetfile({'*.jpg';'*.png';'*.bmp';'*.*'},'Select image');

inp_img=img;
%[file,path]=uigetfile('object.jpg');
%figure
%if(path)
%    inp_img=imread([path file]);
%   subplot(1,2,1),imshow(inp_img),title('Input Image')
%else
%   msgbox('select correct image');
%end

if(size(size(inp_img),2)>2)
    gray_img=rgb2gray(inp_img);
else
    gray_img=inp_img;
end

subplot(1,2,2),imshow(gray_img),title('Gray Image');
[height_val,width_val,w_h_img]=hand_height_width ( gray_img );
figure,imshow(w_h_img),title('Height and Width Image');impixelinfo;

 msgbox(strcat('The Width and Height Pixel Counts are=',num2str(width_val),':',num2str(height_val)));
 m=width_val*0.1;
 if(m<8)
     disp('the object can be picked send 1');
 else
     disp('greater object send 0');
 end
disp(m);
