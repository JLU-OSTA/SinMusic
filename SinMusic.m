%提升音乐频域中指定频率的功率值；
%由吉林大学开放源技术协会编写于2017年3月11日。
name=input('$ Please input the name of music:\n','s');
fprintf('$ Loading audio file(%s)..........',name);
[music,fs]=audioread(name);
fhz=input('OK\n$ Please insert the frequence of Sin:\n');
fprintf('$ Creating %dHz Sin submatrix..........',fhz);
a=sin([0:pi/(fs/fhz):pi]);
a=a';
fprintf('OK\n');
fprintf('$ Completing Sin submatrix..........');
b=a;
for i=1:(fhz-1)
    a=[a;b];
end
a=a(1:fs,:);
fprintf('OK\n');
fprintf('$ Sweeping RAM..........');
clear b fhz;
fprintf('OK\n');
fprintf('$ Making Sin matrix..........');
j=floor(size(music(:,1))/fs);
b=a;
for i=1:(j-1)
    a=[a;b];
end
a=a+1;
fprintf('OK\n');
fprintf('$ Completing music..........');
music=music(1:size(a),:);
music(:,1)=music(:,1).*a;
music(:,2)=music(:,2).*a;
fprintf('OK\n');
fprintf('$ Saving music to outputmusic.wav..........');
audiowrite('outputmusic.wav',music,fs);
fprintf('OK\n');
fprintf('$ Sweeping RAM..........');
clear;
fprintf('OK\nAll Completed!\n');
