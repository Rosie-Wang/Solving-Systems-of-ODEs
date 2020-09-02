function [t,Y] = solvesystem_wangrush(t0,tN,Y0,h,f1,f2)
%t0 is tinitial
%tN is tfinal
%Y0 is the inital condition matrix 
%h is used as 0.05
%f1,f2 are the two functions with x1, x2 respectively 
t = (t0:h:tN); %create t vector 
   
%Allocate space for 2 components of y vector
x1 = zeros(1, length(t)); 
x2 = zeros(1, length(t));
%ICs
x1(1) = Y0(1); 
x2(1) = Y0(2);
for i = (1:(length(t)-1)) %through every t 
    x1_next = x1(i) + h*f1(t(i), x1(i), x2(i)); 
    x2_next = x2(i) + h*f2(t(i), x1(i), x2(i)); 
       
    x1(i+1) = x1(i) + (h*(1/2))*(f1(t(i+1),x1_next,x2_next) + f1(t(i),x1(i),x2(i))); 
    x2(i+1) = x2(i) + (h*(1/2))*(f2(t(i+1),x1_next,x2_next) + f2(t(i),x1(i),x2(i))); 
   end
   
   %Set the x1, x2 values in A output as x1,x2
   Y.x1=x1; 
   Y.x2=x2;
end