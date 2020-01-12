function img_frame = renderImage(channel_array)

ch1 = channel_array(1);
ch2 = channel_array(2);
ch3 = channel_array(3);
ch4 = channel_array(4);
ch5 = channel_array(5);
ch6 = channel_array(6);
ch7 = channel_array(7);
ch8 = channel_array(8);
ch9 = channel_array(9);
ch10 = channel_array(10);
ch11 = channel_array(11);
ch12 = channel_array(12);
ch13 = channel_array(13);

% Step 1: Normalize Values

% Step 2: Assign Image Color Values to Individual Areas

img_frame = ones(500,1700);

% Channel 1 data assignment
img_frame((1:100),(100:400)) = ch1;

% Channel 2 data assignment
img_frame((1:100),(500:800)) = ch2;

% Channel 3 data assignment
img_frame((1:100),(900:1200)) = ch3;

% Channel 4 data assignment
img_frame((1:100),(1300:1600)) = ch4;

% Channel 5 data assignment
img_frame((100:400),(1:100)) = ch5;

% Channel 6 data assignment
img_frame((100:400),(400:500)) = ch6;

% Channel 7 data assignment
img_frame((100:400),(800:900)) = ch7;

% Channel 8 data assignment
img_frame((100:400),(1200:1300)) = ch8;

% Channel 9 data assignment
img_frame((100:400),(1600:1700)) = ch9;

% Channel 10 data assignment
img_frame((400:500),(100:400)) = ch10;

% Channel 11 data assignment
img_frame((400:500),(500:800)) = ch11;

% Channel 12 data assignment
img_frame((400:500),(900:1200)) = ch12;

% Channel 13 data assignment
img_frame((400:500),(1300:1600)) = ch13;

% Step 3: Return Image

end