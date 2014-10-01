function bisection_assignment
clear, clc

ezplot('x^3-x-2');
grid on

syms x;

func = x^3-x-2;
bisection(func, 100, 0, 2, 1e-3);

%% fsolve bonus!!!
fsolve(@(x) x^3-x-2, 1)
end

function bisection(func, iterations, a, b, epsilon)
  i=1;
  fprintf('%-10s%-10s%-10s%-10s%-10s%-10s%-10s%-10s\n', 'iter', 'a', 'c', 'b', 'f(a)', 'f(c)', 'f(b)', 'error')
  while i <= iterations
     c = a + (b-a)/2;
     fa = double(subs(func, a));
     fb = double(subs(func, b));
     fc = double(subs(func, c));
     error = abs(b - a);
     
     fprintf('%-10d%-10.5f%-10.5f%-10.5f%-10.5f%-10.5f%-10.5f%-10.5f\n', i, a, c, b, fa, fc, fb, error); 
     if error < epsilon
         fa = abs(fa);
         fb = abs(fb);
         fc = abs(fc);
         
         closest = a;
         minimum = fa;
         if minimum > fb
             minimum = fb;
             closest = b;
         end
         if minimum > fc
              minimum = fc;
              closest = c;
         end

         
         fprintf('The closest root %.5f\n', closest);
         return
     end
     if fc * subs(func, a) > 0
         a = c;
     else
         b = c;
     end
     
     i = i +1;
  end
end
