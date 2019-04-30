eq = input('Give an equation in x \nexample:  2*x^2-3*x+4 \n   :','s');
% the user types in, for instance 2*x^2-3*x+4

n = input('Type n the number of points: '); 
for i = 1:n
    inp = input('Input a number: ');
    x_values(i) = inp;
    f = inline(eq,'x');
    y = feval(f,inp);
    y_values(i) = y;
end

x0 = input('Type X0: ');

% calculate coeffts
a =  y_values;
for k = 2:n
    a(k : n) = (a(k : n) - a(k - 1)) / (x_values(k : n) - x_values(k - 1));
end

% evalPoly
for i = 1:n
    x = x_values(i);
    p = a(n);
    for k = 2:n-1
        p = a(n - k) + (x - x_values(n - k)) * p;
    end
    estmated(i) = p;
end


% calculate f(x0)
p0 = a(n);
for k = 2:n-1       
    p0 = a(n - k) + (x0 - x_values(n - k)) * p0;
end
y0 = p0;

% calculate absolute and relative error
for i = 1:n
    abs_err(i) = abs(estmated(i) - y_values(i));
    rel_err(i) = abs_err(i) / estmated(i);
end

%OUTPUT DISPLAY
disp('')
disp('')
disp('')
disp('n value ,   estimated value,     exact value,     absolute error,     relative errpr')
for i = 1:n
    disp([num2str(x_values(i)) '      ' num2str(estmated(i)) '      ' num2str(y_values(i)) '      ' num2str(abs_err(i))  '      ' num2str(rel_err(i))]);
end

disp(['value of X0 is:  ' num2str(y0)]);