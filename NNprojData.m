function [answer] = mcdonnell_ERPspelling
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

letter = Z(1:10,:) ~= 0;

% nnstart --> pattern recognition input X target Y 
    % alternatly some use nntool
% generate function '[Y,Xf,Af] = myNeuralNetworkFunction(X);'


%% Testing
load('TestingDataSet4ProjectP300.mat'); %Testing

% Neural Network fucntion generated using 'nnstart'
[Y,Xf,Af] = myNeuralNetworkFunction(X);
P300 = Y; % original signal

% reshape into 2 columns a letter & find max
Z = reshape(Y,5,[]);
[Y,I] = max(Z(1:5,:));
letter = reshape(I,2,[]);

%% define dictionary
% a = double('a'); b = double('b'); c = double('c'); d = double('d'); e = double('e'); % 97    98    99   100   101
% f = double('f'); g = double('g'); h = double('h'); i = double('i'); j = double('j'); % 102   103   104   105   106
% k = double('k'); l = double('l'); m = double('m'); n = double('n'); o = double('o'); % 107   108   109   110   111
% p = double('p'); q = double('q'); r = double('r'); s = double('s'); t = double('t'); % 112   113   114   115   116
% u = double('u'); v = double('v'); w = double('w'); x = double('x'); y = double('y'); z = double('z'); space = double('_'); %117   118   119   120 121 122    95

alphabet = ['a','b','c','d','e';'f','g','h','i','j';'k','l','m','n','o';'p','q','r','s','t';'u','v','w','y','_'];
  
%% spelling

%use matrix 'letters'  to identify the row(1,:) and columns(2,:) of the alpahbet 

for i = 1:size(letter,2)
    row(i) = letter(1,i);
    col(i) = letter(2,i);
    spell(i) = alphabet(row(i),col(i));
end

answer = spell
end