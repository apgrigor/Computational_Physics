clear all;
close all;
clc;


a=-2;
b=2;
tol=1e-5; 
inte=0.;

integral=prosa(a,b,tol,inte);

sentence=sprintf('The integral using the adjustable 3 point gauss is equal to I=%f',integral);
disp(sentence)


function y=myfunc(x)
y=x^4;
end 

function integ=gausquad(a,b)
t=[-sqrt(3./5),0,sqrt(3/5.)];
x=[0.5*((b-a)*t(1)+b+a),0.5*((b-a)*t(2)+b+a),0.5*((b-a)*t(3)+b+a)];
integ=0.5*(b-a)*(myfunc(x(1))/1.8+myfunc(x(2))/1.125+myfunc(x(3))/1.8);
end 

function inte=prosa(a,b,tol,inte)
g0=gausquad(a,b);
g1=gausquad(a,0.5*(a+b));
g2=gausquad(0.5*(a+b),b);

if abs(g0-g1-g2)/31<tol         %������ � Gauss ����������� �� ������� �������� ��� 5�� ����� ���������
    inte=inte+g1+g2; 
else
    inte=prosa(a,0.5*(a+b),0.5*tol,inte);
    inte=prosa(0.5*(a+b),b,0.5*tol,inte);
end 
end 
