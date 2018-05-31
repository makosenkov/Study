% https://www.macalester.edu/~kaplan/Resampling/PDF/regress.pdf
x = [-2.000000 -1.900000 -1.800000 -1.700000 -1.600000 -1.500000 -1.400000 -1.300000 -1.200000 -1.100000 -1.000000 -0.900000 -0.800000 -0.700000 -0.600000 -0.500000 -0.400000 -0.300000 -0.200000 -0.100000 0.000000 0.100000 0.200000 0.300000 0.400000 0.500000 0.600000 0.700000 0.800000 0.900000 1.000000 1.100000 1.200000 1.300000 1.400000 1.500000 1.600000 1.700000 1.800000 1.900000 2.000000];
y = [0.4883057 3.1223078 3.77656271 2.295281 6.729121 4.2952748 3.771689 9.949333 6.994875 6.9013629 -11.460688 -4.97812 -11.106408 -23.275905 -24.972447 -30.3647958 -13.410703 -36.96716 -14.9446169 -7.760967 4.332576  14.1944957 25.88604 41.056389 61.92032 64.56782 67.62361 66.25838 55.44725 36.64037 13.52595 -16.45523 -51.69349 -82.84448 -111.7191 -131.0525 -134.9485 -138.7488 -118.82302 -95.11703 -47.0556];

hold on
    % ??������� �����
    scatter(x,y,'filled'); grid on;
    % ��������� 
    brob = robustfit(x',y');
    plot(x,brob(1)+brob(2)*x,'g','LineWidth',2)
    % ���������
    bls = regress(y',[ones(41,1) x']);
    plot(x,bls(1)+bls(2)*x,'r','LineWidth',2);
    % ��������������
    p = polyfit(x', y', 1);
    y1 = polyval(p, x);
    plot(x, y1, 'b--', 'LineWidth', 2);
    % ����
    k = min(x):0.01:max(x);
    rid = ridge(y', x', k);
    plot(k, rid, 'k--', 'LineWidth', 1);
    legend('??������� ������','��������� �������������','��������� (R -Square)', '�������������� (�� �������� 1)', '����-���������')
hold off