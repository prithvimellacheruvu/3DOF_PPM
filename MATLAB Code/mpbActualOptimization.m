clc;
clear all;

len0=130;
A=[];
b=[];
Aeq = [];
beq = [];
lb = 15;
ub = 450;
nonlcon=@mpbcCeqReturnFunction;
options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
[le,fval,exitflag,output]=fmincon(@mpboptimizationObjective,len0,A,b,Aeq,beq,lb,ub,nonlcon,options)