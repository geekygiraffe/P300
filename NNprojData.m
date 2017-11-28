%% P300 spelling project BIME 6259

% generate NN funtion from training data then run the testing data throught
% the code, define the dicitonary, output the outcome

% jessica mcdonnell

clear;close
%cd '/Volumes/HOME/SMILPhD/6250SignalProcessing/code'

%cd 'U:\SMILPhD\6250SignalProcessing\code'


%% Training 
load('TrainingDataSet4ProjectP300.mat'); %training

% converts -1 to zeros in order to run nnstart
for i = 1:size(Y);
    if Y(i) == -1;
        Y(i) = 0;
    end
end

for i = 1:size(Y);
    if 1 - (Y (i,1)) > 1e-3
        Y(i,1) = 0.0;
    end
end

Z = reshape(Y,10,[]);

letters = Z(1:10,:) ~= 0;

% nnstart --> pattern recognition input X target Y 
    % alternatly some use nntool
% generate function '[Y,Xf,Af] = myNeuralNetworkFunction(X);'


%% Testing
load('TestingDataSet4ProjectP300.mat'); %Testing

% Neural Network fucntion generated using 'nnstart'
[Y,Xf,Af] = myNeuralNetworkFunction(X);
P300 = Y;

for i = 1:size(Y);
    if 1 - (Y (i,1)) < 1e-3
%    if (Y (i,1)) <= 1e-5
        Y(i,1) = 0.0;
    else Y(i,1) = 1.0;
    end
end

% reshape 
Z = reshape(Y,10,[]);
letters = Z(1:10,:) ~= 0;

%% define dictionary
a = double('a'); b = double('b'); c = double('c'); d = double('d'); e = double('e'); % 97    98    99   100   101
f = double('f'); g = double('g'); h = double('h'); i = double('i'); j = double('j'); % 102   103   104   105   106
k = double('k'); l = double('l'); m = double('m'); n = double('n'); o = double('o'); % 107   108   109   110   111
p = double('p'); q = double('q'); r = double('r'); s = double('s'); t = double('t'); % 112   113   114   115   116
u = double('u'); v = double('v'); w = double('w'); x = double('x'); y = double('y'); z = double('z'); space = double('_'); %117   118   119   120 121 122    95

alphabet = ['a','b','c','d','e';'f','g','h','i','j';'k','l','m','n','o';'p','q','r','s','t';'u','v','w','y','_'];
% double(alphabet);
  a = alphabet(1,1); b = alphabet(1,2); c = alphabet(1,3); d = alphabet(1,4); e = alphabet(1,5);
  f = alphabet(2,1); g = alphabet(2,2); h = alphabet(2,3); i = alphabet(2,4); j = alphabet(2,5);
  k = alphabet(3,1); l = alphabet(3,2); m = alphabet(3,3); n = alphabet(3,4); o = alphabet(3,5);
  p = alphabet(4,1); q = alphabet(4,1); r = alphabet(4,3); s = alphabet(4,4); t = alphabet(4,5);
  u = alphabet(5,1); v = alphabet(5,2); w = alphabet(5,3); xyz = alphabet (5,4); space = alphabet (5,5);
  
%% spelling

idx = zeros(size(Z));

for i = 1:size(Z,2);
    spell(1:10,i) = Z(:,i) ~= 0;
%    find(spell(1:10,i) == 1);
    ind(:,i) = find(spell(1:10,i) < 0);
end



    


%% 
%{

j=0;
Z = [Y,X]; ceil(Z);

% preallocate size of matrixes
abc = zeros(50,1134);
spell = zeros(10,1134);

for i = 1:size(Z);
    
    if Y(i,1) == 1;
        abc = Z(i,:);
        j=j+1;
     spell(j,:) = abc;
     clear 'abc';
    end
end

% for i = 1:size(Z)
% [im(:,i)] = DetectMaxima(Z(:,i),0)
% end

%for i = 1:size(Z)
%max(Z(1+5*(i-1),5*i));
%end
% for i = 1:size(Z);
%
%     if Y(i,1) 1 - ;
%         abc = Z(i,:);
%         j=j+1;
%      spell(j,:) = abc;
%      clear 'abc';
%     end
% end
%%  dr. kim:
for ct = 1:15, max(Y(1+5*(ct-1),5*ct)); end 

% % for i = 1:15 % %
% %     max(Y(1+5*(i-1),5*i)); % %
% % end % %
%

%}