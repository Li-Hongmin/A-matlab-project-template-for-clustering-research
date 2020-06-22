function latex = write_table2latex(T, filename)

    input.data = T;

    % Switch transposing/pivoting your table if needed:
    input.transposeTable = 0;

    % Switch to generate a complete LaTex document or just a table:
    input.makeCompleteLatexDocument = 0;

    input.booktabs = 1;

    input.tableCaption = filename;
    input.tableLabel = filename;

    % Now call the function to generate LaTex code:
    latex = latexTable(input);

    % save LaTex code as file
    file = [filename, '.tex'];
    f = fullfile('results','latex',file);
    fid=fopen(f,'w');
    [nrows, ~] = size(latex);
    for row = 1:nrows
        fprintf(fid,'%s\n',latex{row,:});
    end
    fclose(fid);
    fprintf('... your LaTex code has been saved as %s \n', f);
end