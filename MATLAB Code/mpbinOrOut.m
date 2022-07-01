function yesInside = mpbinOrOut(x,y,wcx,wcy,wcr)
%wcx=workspace center x
%wcy=workspace center y
%wcr=workspace circle radius

%wcx=0;
%wcy=-50;
%wcr=100;

val=sqrt((x-wcx)*(x-wcx)+(y-wcy)*(y-wcy));

if val<wcr
    yesInside=1;
else
    yesInside=0;
end
end