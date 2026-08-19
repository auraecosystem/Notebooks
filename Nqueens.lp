% Define board size (default n = 8)
#const n = 8.

% Domain: 1 to n
board(1..n).

% 1. GENERATE: Place exactly 1 queen in each row
1 { queen(R, C) : board(C) } 1 :- board(R).

% 2. TEST (Constraints)
% Constraint 1: No two queens can share the same column
:- queen(R1, C), queen(R2, C), R1 < R2.

% Constraint 2: No two queens on the same major diagonal (\)
:- queen(R1, C1), queen(R2, C2), R1 < R2, R1 - C1 == R2 - C2.

% Constraint 3: No two queens on the same anti-diagonal (/)
:- queen(R1, C1), queen(R2, C2), R1 < R2, R1 + C1 == R2 + C2.

% Output filter: display only queen positions
#show queen/2.
