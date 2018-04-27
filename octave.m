a=5;
a+10;

#b = csvread(train.csv);

#b;

format long g
 m=dlmread('train.csv',' ,',1,0);


X_train = m(:,1);

Y_train = m(:,2);

#disp(X_train);
#disp(Y_train);

i = ones(10000,1);

New_X_train = [i,X_train];

#disp(New_X_train);
#######22222222


w = rand(2,1);


###########333333333333
w_transpose = w';
x = X_train;

x_bar = [i x]
z = w_transpose*(x_bar');

hold on;
plot(X_train, Y_train);
xlabel ("X_train");
ylabel ("Y_train");
title ("Graph1");



plot(z, x)
print -dpdf "fig1.pdf";
#pause(3);
close;


w_direct = (inv((New_X_train') *(New_X_train))) * ((New_X_train')*(Y_train));

#disp(w_direct);
t = (w_direct')*(x_bar)';
hold on;
plot(X_train, Y_train);
xlabel ("X_train");
ylabel ("Y_train");
title ("Graph2");

plot(t,x_bar)

print -dpdf "fig2.pdf";
#pause(3);
close;

eta = 0.00000001;

for i = 1:2,
  for j = 1:10000,
    x_cor = X_train(j);
    y_cor = Y_train(j);
    x_bar_new = [1,x_cor]' ;
    w = w - ( eta * (( (w')*x_bar_new)-y_cor) * x_bar_new);
    z = (w') * (x_bar)';
    if(rem(j,1000) == 0),
       
       plot(X_train, Y_train);
       hold on;
      
       xlabel ("X_train");
       ylabel ("Y_train");
       title ("Graph7");
  
       plot(z, x)
       print -dpdf "fig3.pdf";
       #pause(3);
       close;
    end,
  end,  
end,



hold on;
plot(X_train, Y_train);
xlabel ("X_train");
ylabel ("Y_train");
title ("Graph3");

z = (w')*(x_bar)';

plot(z, x)
print -dpdf "fig4.pdf";
#pause(3);
close;


w_direct = (inv((New_X_train') *(New_X_train))) * ((New_X_train')*(Y_train));

#disp(w_direct);
t = (w_direct')*(x_bar)';
hold on;
plot(X_train, Y_train);
xlabel ("X_train");
ylabel ("Y_train");
title ("Graph4");

plot(t,x_bar)

print -dpdf "fig5.pdf";
#pause(3);
close;

###########################666666666666666666
format long g
 m=dlmread('test.csv',' ,',1,0);


X_test = m(1:1000,1);

Y_test = m(1:1000,2);

#disp(X_test);
#disp(Y_test(3));

i = ones(1000,1);

New_X_test = [i,X_test];

summ = 0;
y_pred1 = New_X_test*w;
summ1 = 0;
y_pred2 = New_X_test*w_direct;
for i = 1:1000,
 summ = summ+((Y_test(i)-y_pred1(i))*(Y_test(i)-y_pred1(i)));
summ1 = summ1+((Y_test(i)-y_pred2(i))*(Y_test(i)-y_pred2(i)));
end,

disp(sqrt(summ));
disp(sqrt(summ1));


