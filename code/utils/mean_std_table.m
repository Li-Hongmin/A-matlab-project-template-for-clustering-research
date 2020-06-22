function celltable = mean_std_table(mean_t,std_t)

  
    % combine mean matrix and std matrix into a cell structure with ±
    [n, m] = size(mean_t);
    celltable = cell(n, m);

    for i = 1:n

        for j = 1:m
            if 0.1 < max(mean_t(:))
                celltable{i, j} = sprintf('%.2f%s%.2f', mean_t(i, j), ' $\pm$ ', std_t(i, j));
            else 
                celltable{i, j} = sprintf('%.2g%s%.1g', mean_t(i, j), ' $\pm$ ', std_t(i, j));
            end
            
        end

    end

end