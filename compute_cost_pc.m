function [cost] = compute_cost_pc(points, centroids)
  cost = 0;
  [N D] = size(points);
  [NC D] = size(centroids);
  for i = 1: N
    minim = norm(points(i, :) - centroids(1, :));
    for j = 2: NC
      norma = norm(points(i, :) - centroids(j, :));
      if minim > norma
        minim = norma;
      endif
    endfor
    cost += minim;
  endfor
endfunction

