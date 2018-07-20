function [Targets] = Target_order(nb_Targets)
% Target --> Defines a vector of randomly ordered targets.

    Targets_Rep1 = randperm(nb_Targets)-1;
    Targets_Rep2 = randperm(nb_Targets)-1;
    Targets_Rep3 = randperm(nb_Targets)-1;
    Targets_Rep4 = randperm(nb_Targets)-1;

    while isequal(Targets_Rep1, [1:nb_Targets]) || Targets_Rep1(1) == 0
        Targets_Rep1 = randperm(nb_Targets)-1;
    end 

    while Targets_Rep1(end) == Targets_Rep2(1) || isequal(Targets_Rep2, [1:nb_Targets]) || ...
          isequal(Targets_Rep2, Targets_Rep1) 
        Targets_Rep2 = randperm(nb_Targets)-1;
    end

    while Targets_Rep2(end) == Targets_Rep3(1) || isequal(Targets_Rep3, [1:nb_Targets]) || ...
          isequal(Targets_Rep3, Targets_Rep2) || isequal(Targets_Rep3, Targets_Rep1) 
        Targets_Rep3 = randperm(nb_Targets)-1;
    end

    while Targets_Rep3(end) == Targets_Rep4(1) || isequal(Targets_Rep4, [1:nb_Targets]) || ...
          isequal(Targets_Rep4, Targets_Rep3) || isequal(Targets_Rep4, Targets_Rep2) || ...
          isequal(Targets_Rep4, Targets_Rep1) 
        Targets_Rep4 = randperm(nb_Targets)-1;
    end
    
    Targets = [Targets_Rep1 Targets_Rep2 Targets_Rep3 Targets_Rep4];
end
