syms theta1 theta2 theta3 theta4 theta5 L1 L2 L3 L5 r11 r12 r13 px r21 r22 r23 py r31 r32 r33 pz 

T_01 = [cos(theta1) 0   -sin(theta1)  0;
        sin(theta1) 0   cos(theta1)   0;
        0           -1  0             L1;
        0           0   0             1];

T_12 = [cos(theta2) -sin(theta2)  0   L2*cos(theta2);
        sin(theta2) cos(theta2)   0   L2*sin(theta2);
        0           0             1   0;
        0           0             0   1];

T_23 = [cos(theta3) -sin(theta3)  0   L3*cos(theta3);
        sin(theta3) cos(theta3)   0   L3*sin(theta3);
        0           0             1   0;
        0           0             0   1];

T_34 = [cos(theta4) 0   -sin(theta4) 0;
        sin(theta4) 0   cos(theta4)  0;
        0           -1  0            0;
        0           0   0            1];

T_45 = [cos(theta5) -sin(theta5) 0 0;
        sin(theta5) cos(theta5)  0 0;
        0           0            1 L5;
        0           0            0 1];

T_05 = simplify(T_01*T_12*T_23*T_34*T_45);

T_NN = [r11 r12 r13 px; r21 r22 r23 py; r31 r32 r33 pz; 0 0 0 1];

LHS = simplify(inv(T_01)*T_NN)
RHS = simplify(T_12*T_23*T_34*T_45) 

