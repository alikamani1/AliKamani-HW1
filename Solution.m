clc;clear;close all;
%% Numerical
x_min = 0;
x_max = 1;
dx1 = 0.0001;
dx2 = 0.001;
dx3 = 0.01;
dx4 = 0.1;
x1 = x_min:dx1:x_max;
x2 = x_min:dx2:x_max;
x3 = x_min:dx3:x_max;
x4 = x_min:dx4:x_max;
[theta1] = Num_sol(x1);
[theta2] = Num_sol(x2);
[theta3] = Num_sol(x3);
[theta4] = Num_sol(x4);
%%
syms c1
m = 1.4175;
bi = 0.1055;
eqs = c1*m*cosh(m)+1*m*sinh(m)== -bi*(c1*sinh(m)+1*cosh(m));
[c1] = solve(eqs,c1);
x5 = 0:0.01:1;
x6 = 0.5;
y = c1*sinh(m*x5)+1*cosh(m*x5);
y1 = c1*sinh(m*x6)+1*cosh(m*x6);
%% Plot
close all
subplot(1,1,1,'FontName','Times New Roman','FontSize',14)
hold on
box on
plot(x1,theta1,'--','LineWidth',1.5)
hold on
plot(x2,theta2,'LineWidth',1.5)
hold on
plot(x3,theta3,'LineWidth',1.5)
hold on
plot(x4,theta4,'LineWidth',1.5)
hold on
plot(x5,y,'LineWidth',1.5)
hold off
xlabel('x^* = x/L','FontName','Times New Roman','FontSize',14)
ylabel('$$\theta^*=\frac{T-T_{\infty}}{T_0-T_{\infty}}$$','FontName','Times New Roman','FontSize',14,'Interpreter','Latex')
grid on
legend({'x = 0.0001','x = 0.001','x = 0.01','x = 0.1','Analytic'},'FontName','Times New Roman','FontSize',14,'Location','SouthWest')
% add 1 zoomed zones
%  zp = BaseZoom();
%  zp.plot;

%% 
index1 = find(x1==0.5);
index2 = find(x2==0.5);
index3 = find(x3==0.5);
index4 = find(x4==0.5);
err1 = double(y1- theta1(index1))
err2 = double(y1- theta2(index2))
err3 = double(y1- theta3(index3))
err4 = double(y1- theta4(index4))

figure()
subplot(1,1,1,'FontName','Times New Roman','FontSize',14)
hold on
box on
plot([dx1 dx2 dx3 dx4],abs([err1 err2 err3 err4]),'o','LineWidth',4)
xlabel('dx','FontName','Times New Roman','FontSize',14)
ylabel('Error','FontName','Times New Roman','FontSize',14)
grid on
% add 1 zoomed zones
%   zp = BaseZoom();
%   zp.plot;

figure()
subplot(1,1,1,'FontName','Times New Roman','FontSize',14)
hold on
box on
plot(log10([dx1 dx2 dx3 dx4]),log10(abs([err1 err2 err3 err4])),'o','LineWidth',4)
xlabel('log_{10}(dx)','FontName','Times New Roman','FontSize',14)
ylabel('log_{10}(Error)','FontName','Times New Roman','FontSize',14)
grid on

% % 
w=abs(err4-err3);
e=abs(err3-err2);
r=abs(err2-err1);
figure()
plot([dx2 dx3 dx4],[w e r],'o','LineWidth',4)
xlabel('dx','FontName','Times New Roman','FontSize',14)
ylabel('Error','FontName','Times New Roman','FontSize',14)