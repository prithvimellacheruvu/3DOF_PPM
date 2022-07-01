function ICN = mpbfindICN(x, y, phi, le)

a=le;
b=le;
c=2*le/3;
d=2*le/3;
e=0;
r=12;
cr=2*le/3;

d=sqrt((x*x)+(y*y));
g=((a*a)-(c*c)+(d*d))/(2*d);
h=sqrt((a*a)-(g*g));

X2=g*x/d;
Y2=g*y/d;

Cy=Y2 - h*x/d;
Dy=Cy;
Cx=X2 + h*y/d;
Dx=-Cx;


O = [0 ; 0];
A = [0 ; 0];
B = [0 ; 0];
C = [Cx ; Cy];
D = [Dx ; Dy];
E = [x ; y];
F = [0 ; 2*le];

H = [x + r*cos(phi) ; y + r*sin(phi)];
rho=2*le - (H(2)-sqrt((cr*cr) - (H(1)*H(1))));

G = [0 ; 2*le - rho];

u1Cap = (C - A)/a;
v1Cap = (E - C)/c;

u2Cap = (D - B)/b;
v2Cap = (E - D)/d;

lvCap = (H - G)/cr;
mCap = (E - H)/r;
jCap = [0 ; 1];

Em = [0 -1; 1 0];

row1=[transpose(v1Cap) 0];
row2=[transpose(v2Cap) 0];
row3=[-transpose(lvCap) r*transpose(lvCap)*Em*mCap];

forJacob = [row1 ; row2 ; row3];
invJacob = [a*transpose(v1Cap)*Em*u1Cap 0 0 ; 0 b*transpose(v2Cap)*Em*u2Cap 0 ; 0 0 transpose(lvCap)*jCap];

if det(forJacob)==0 | det(invJacob)==0
    %fprintf("here");
    forICN=0;
    invICN=0;
else
    forICN=1/cond(forJacob);
    invICN=1/cond(invJacob);
end

ICN = [forICN ; invICN];
end
