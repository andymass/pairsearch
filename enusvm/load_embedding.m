function [X,kopt,error_frac,embed_scale] = load_embedding(dim)
    
    dataset_home = '../make-embedding/data/';
    embed_files = struct(...
    'd2', 'output-d220180512-001631.mat',...
    'd3', 'output-d320180509-165802.mat',...
    'd4', 'output-d420180509-165958.mat',...
    'd5', 'output-d520180512-000800.mat',...
    'd6', 'output-d620180512-001232.mat',...
    'd7', 'output-d720180512-001205.mat',...
    'd9', 'output-d9-20190428-020247.mat',...
    'd12', 'output-d12-20190428-020705.mat',...
    'd15', 'output-d15-20190428-020815.mat',...
    'd20', 'output-d20-20190428-020534.mat'...
    );

    embed_file = embed_files.(['d',num2str(dim)]);
    load([dataset_home,embed_file],'X');
    load([dataset_home,embed_file(1:end-4),'_processed.mat'],'embed_scale','kopt','error_frac');
    
    assert(size(X,2) == dim);
    X = X - mean(X,1);
    X = X*embed_scale;
end

