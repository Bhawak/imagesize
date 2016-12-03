x=videoinput('winvideo',1);
preview(x);
set(x, 'ReturnedColorSpace', 'RGB');
pause(3);
img = getsnapshot(x);
imshow(img);
pause(2);
fullImageFileName = fullfile(pwd, 'object.jpg');
 imwrite(img,fullImageFileName);
 
 Image3=img;
 image(Image3);
 figure(gcf);
 Image4 = Image3 >= 100;
 scaled2 = Image4 * 10.0;
 level = graythresh (scaled2);
 bw = im2bw (scaled2, level);
 bw = bwareaopen (bw, 6);
 horizontalProfile = max(bw, [], 1);
 x1 = find(horizontalProfile, 1, 'first');
 x2 = find(horizontalProfile, 1, 'last');
 verticalProfile =max(bw, [], 2);
 y1 = find(verticalProfile, 1, 'first');
 y2 = find(verticalProfile, 1, 'last');
 boxX = [x1 x2 x2 x1 x1];
 boxY = [y1 y1 y2 y2 y1];
 imshow(bw, []);
  fullImageFileName = fullfile(pwd, 'black.jpg');
 imwrite(bw,fullImageFileName);
[B,L,N,A] = bwboundaries(bw);
figure, imshow(bw); hold on;
for k=1:length(B)
    boundary = B{k};
 
    rndRow = ceil(length(boundary)/(mod(rand*k,7)+1));
    col = boundary(rndRow,2); row = boundary(rndRow,1);
    h = text(col+1, row-1, num2str(L(row,col)));
    
end
function [ height,width,out_img ] = hand_height_width ( gray_img );