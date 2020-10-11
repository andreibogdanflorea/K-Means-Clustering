function [centroids] = clustering_pc(points, NC, dims)
  [N D] = size(points);
  
  new_pos = zeros(NC, 1);
  bucket = 0;
  for i = 1: N
      bucket = bucket + 1;
      if bucket == NC + 1
        bucket = 1;
      endif
      new_pos(bucket) = new_pos(bucket) + 1;
      buckets(bucket, new_pos(bucket), :) = points(i, :);
  endfor
  for bucket = 1: NC
      suma = sum(buckets(bucket, 1: new_pos(bucket), :));
      if new_pos(bucket) ~= 0
        centroids(bucket, :) = suma ./ new_pos(bucket);  
      endif
  endfor
  while 1
    new_pos = zeros(NC, 1);
    for i = 1: N
      minim = norm(points(i, :) - centroids(1, :));
      bucket = 1;
      for j = 2: NC
        norma = norm(points(i, :) - centroids(j, :));
        if minim > norma
          minim = norma;
          bucket = j;
        endif
      endfor
      new_pos(bucket) = new_pos(bucket) + 1;
      buckets(bucket, new_pos(bucket), :) = points(i, :);
    endfor
    prev_centroids = centroids;
    for bucket = 1: NC
      if new_pos(bucket) == 1
        suma = buckets(bucket, 1: new_pos(bucket), :);
      else
        suma = sum(buckets(bucket, 1: new_pos(bucket), :));
      endif
      if new_pos(bucket) ~= 0
        centroids(bucket, :) = suma ./ new_pos(bucket);  
      endif
    endfor
    ok = 1;
    for i = 1: NC
      if norm(centroids(i) - prev_centroids(i)) > 1e-6
        ok = 0;
      endif
    endfor
    if ok == 1
      break;
    endif
  endwhile
endfunction
