% File name: PhasorAnimation.m
% Author: CHAN Yun Sang, Ethan; CHAN Ho Kwan, Tony; SIU Pui Yin, Benji
% Department of Electrical Engineering, The Hong Kong Polytechnic
% University
% Email: ethan.ys.chan@connect.polyu.hk
% Demonstration program: Phasor and space vector

clear all
close all
clc

% SETUP ===================================================================
% all physical quantities in S.I. units unless stated otherwise
                             
%% 
%% 
%% 
A = 10;                     % Amplitude of the AC Voltage
f=120;                        % Freqeuency of the AC signal
T=1/f;
N = 400;                   % Number of frames for animation; smaller the value, the more triagular the sinewave will be
t = linspace(0,0.03,400);              % time increment
v = A .* sin(2*pi*t/T);     % Mathmatic function of the AC Waveform
V1 = A .* sin(2*pi*t/T+2*pi/5*1);  % phase shift forward 72 degree
V2 = A .* sin(2*pi*t/T+2*pi/5*2);  % phase shift forward 144 degree
V3 = A .* sin(2*pi*t/T+2*pi/5*3);  % phase shift forward 216 degree
V4 = A .* sin(2*pi*t/T+2*pi/5*4);  % phase shift forward 288 degree
Phase_Num= [0:4];
real=cos(2*pi/5.*Phase_Num);
imaginary=sin(2*pi/5.*Phase_Num);


%vP = A .* cos(2*pi*t/T);   % Use this if you want a Cosine Waveform

% GRAPHICS ================================================================
%   Setup for plot window
figure('Name','Phasor & Vector Time Domain Plotting','NumberTitle','off')
set(gcf,'units','normalized'); 
set(gcf,'position',[0.1 0.1 0.8 0.6]);
set(gcf,'Color',[1 1 1]);
set(gca,'FontSize',12);


% circle
p = linspace(0,2*pi,500);
xc = 2.5*A .* cos(p);  % Horizontal Parameter of Circle_Voltage
yc = 2.5*A .* sin(p);  % Vertical Parameter of Circle_Voltage


for c = 1 : N
   hold off
 %Circle Voltage
   
   subplot(1,2,1);

   plot([0 v(c)*real(1)],[0 v(c)*imaginary(1)],'lineWidth',3,'Color',[0 0 1], 'LineStyle',':'); % Tracking line of circle (Blue) degree:0
   hold on
   plot([v(c)*real(1) v(c)*real(1)+V1(c)*real(2)],[v(c)*imaginary(1) v(c)*imaginary(1)+V1(c)*imaginary(2)],'lineWidth',3,'Color',[1 1 0], 'LineStyle',':'); % Tracking line of circle (yellow) degree:72

   plot([v(c)*real(1)+V1(c)*real(2) v(c)*real(1)+V1(c)*real(2)+V2(c)*real(3)],[v(c)*imaginary(1)+V1(c)*imaginary(2) v(c)*imaginary(1)+V1(c)*imaginary(2)+V2(c)*imaginary(3)],'lineWidth',3,'Color',[0 1 0], 'LineStyle',':');% Tracking line of circle (yellow) degree:144

   plot([v(c)*real(1)+V1(c)*real(2)+V2(c)*real(3) v(c)*real(1)+V1(c)*real(2)+V2(c)*real(3)+V3(c)*real(4)],[v(c)*imaginary(1)+V1(c)*imaginary(2)+V2(c)*imaginary(3) v(c)*imaginary(1)+V1(c)*imaginary(2)+V2(c)*imaginary(3)+V3(c)*imaginary(4)],'lineWidth',3,'Color',[1 0 0], 'LineStyle',':'); % Tracking line of circle (green) degree:216

   plot([v(c)*real(1)+V1(c)*real(2)+V2(c)*real(3)+V3(c)*real(4) v(c)*real(1)+V1(c)*real(2)+V2(c)*real(3)+V3(c)*real(4)+V4(c)*real(5)],[v(c)*imaginary(1)+V1(c)*imaginary(2)+V2(c)*imaginary(3)+V3(c)*imaginary(4) v(c)*imaginary(1)+V1(c)*imaginary(2)+V2(c)*imaginary(3)+V3(c)*imaginary(4)+V4(c)*imaginary(5)],'lineWidth',3,'Color',[1 0 1], 'LineStyle',':'); % Tracking line of circle (Red) degree:288
   
   plot([0 v(c)*real(1)+V1(c)*real(2)+V2(c)*real(3)+V3(c)*real(4)+V4(c)*real(5)],[0 v(c)*imaginary(1)+V1(c)*imaginary(2)+V2(c)*imaginary(3)+V3(c)*imaginary(4)+V4(c)*imaginary(5)],'lineWidth',2,'Color',[0 0 0]); % Tracking line of circle (Black) combined

   plot(xc,yc,'b','lineWidth',1);  % Perimeter of circle
   title('Space Vectors in  Complex Plane')
   xlabel('Unit Length');

   xP = [0 0]; yP = [-A*2.5 A*2.5]; % Background vertical coordinate axis of circle
   plot(xP,yP,'k','LineWidth',1);

   xP = [-A*2.5 A*2.5]; yP = [0 0];  % Background horizontal coordinate axis of circle
   plot(xP,yP,'k','LineWidth',1);
   
   hold off
   set(gca,'FontSize',14);
   txtTime = ['Time: ' num2str(t(c)) 's'];
   txtFrequency = ['Frequency: ' num2str(f) 'Hz'];
   txtPeriod = ['Period: ' num2str(T) 's'];
   text(26,28,txtTime,'FontSize',12);
   text(26,24,txtFrequency,'FontSize',12);
   text(26,20,txtPeriod,'FontSize',12);
   axis equal
   axis on

  % Sin wave Voltage 
  subplot(1,2,2);
   
   xP = [0 t(end)]; yP = [0 0]; %Background horizontal axis of sin wave, [start point, end point]
   plot(xP,yP,'k','LineWidth',1);
   hold on
   
   xlabel('Time in seconds')
   ylabel('Amplitude')
   
   title('Balanced 5-phase currents waveform')
   xP = t(1:c); yP = v(1:c); % Horizontal component of sin wave (blue trcking line)
   plot(xP,yP,'b','LineWidth',2); 

   yP = V1(1:c); % Horizontal component of sin wave (yellow trcking line)
   plot(xP,yP,'y','LineWidth',2); 

   yP = V2(1:c); % Horizontal component of sin wave (green trcking line)
   plot(xP,yP,'g','LineWidth',2); 

   yP = V3(1:c); % Horizontal component of sin wave (Red trcking line)
   plot(xP,yP,'r','LineWidth',2); 

   yP = V4(1:c); % Horizontal component of sin wave (pink trcking line)
   plot(xP,yP,'m','LineWidth',2); 


   %{
   xP = t(1:c); yP = v(1:c); % Horizontal component of sin wave (blue trcking line)
   plot(xP,yP,'b','LineWidth',2); 

   xP = t(1:c); yP = V1(1:c); % Horizontal component of sin wave (yellow trcking line)
   plot(xP,yP,'y','LineWidth',2); 

   xP = t(1:c); yP = V2(1:c); % Horizontal component of sin wave (green trcking line)
   plot(xP,yP,'g','LineWidth',2); 

   xP = t(1:c); yP = V3(1:c); % Horizontal component of sin wave (Red trcking line)
   plot(xP,yP,'r','LineWidth',2); 

   xP = t(1:c); yP = V4(1:c); % Horizontal component of sin wave (pink trcking line)
   plot(xP,yP,'m','LineWidth',2); 
   %}

   hold off
   set(gca,'FontSize',12);
   legend('','Phase A','Phase B','Phase C','Phase D','Phase E');

   axis on
   pause(0.001) % Delay 

end
