function [ fi, lambda, height ] = XYZtoLLA( x, y, z, a, e2 )

b = sqrt((1 - e2) * a .^ 2);
e_p = a * sqrt(e2) / b;
r = sqrt(x .^ 2 + y .^ 2);
E2 = a .^ 2 - b .^ 2;
F = 54 * (b .^ 2) .* (z .^ 2);
G = r .^ 2 + (1 - e2) .* (z .^ 2) - e2 * E2;
c = e2 * F .* (r .^ 2) ./ (G .^ 3);
s = (1 + c + (c .^ 2 + 2 * c) .^ (1 / 2)) .^ (1 / 3);
P = F ./ (3 * ((s + 1) ./ (s - 1)) .* (G .^ 2));
Q = (1 + 2 * (e2 .^ 2) .* P) .^ (1 / 2);
r0 = ((-1) * (P - e2 .* r) ./ (1 + Q)) + ( ((a .^ 2) .* (1 + 1 ./ Q) / 2) - ((P .* (1 - e2) .* z .^ 2) ./ (Q ./ (1 + Q))) - (P .* (r .^ 2) / 2)) .^ (1 / 2);
U = ((z .^ 2) + (r - (r0 .* e2)) .^ 2) .^ (1 / 2);
V = ((z .^ 2) .* (1 - e2) + (r - (r0 .* e2)) .^ 2) .^ (1 / 2);
z0 = ((b .^ 2) .* z) ./ (a .* V);

fi = atan((z + (e_p) ^2 *z0) ./ r);
lambda = atan(y ./ x);
height = U .* (1 - (b .^ 2) ./ (a .* V));

end
