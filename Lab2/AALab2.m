clear
clc

% Generate a random array of numbers
arrayMixed = randi([1,1000],1,1000)

array = arrayMixed;

% Quick sort implementation
function quick_sort(array, start, finish)
  if (start < finish)
    pivot = partition(array, start, finish);
    quick_sort(array, start, pivot - 1);
    quick_sort(array, pivot + 1, finish);
  end
end

function pivot = partition(array, start, finish)
  pivot = array(finish);
  i = start - 1;
  for j = start : finish - 1
    if (array(j) <= pivot)
      i = i + 1;
      temp = array(i);
      array(i) = array(j);
      array(j) = temp;
    end
  end
  temp = array(i + 1);
  array(i + 1) = array(finish);
  array(finish) = temp;
  pivot = i + 1;
end

tic();
quick_sort(array, 1, length(array));
quick_sort_time = toc();

array = arrayMixed;

% Merge sort implementation
function array = merge_sort(array)
  if (length(array) > 1)
    mid = floor(length(array)/2);
    left = array(1:mid);
    right = array(mid+1:end);
    left = merge_sort(left);
    right = merge_sort(right);
    array = merge(left, right);
  end
end

function array = merge(left, right)
  i = 1; j = 1; k = 1;
  while (i <= length(left) && j <= length(right))
    if (left(i) <= right(j))
      array(k) = left(i);
      i = i + 1;
    else
      array(k) = right(j);
      j = j + 1;
    end
    k = k + 1;
  end
  while (i <= length(left))
    array(k) = left(i);
    i = i + 1;
    k = k + 1;
  end
  while (j <= length(right))
    array(k) = right(j);
    j = j + 1;
    k = k + 1;
  end
end

tic();
array = merge_sort(array);
merge_sort_time = toc();

array = arrayMixed;

% Heap sort implementation
function heap_sort(array)
  n = length(array);
  for i = floor(n/2):-1:1
    heapify(array, n, i);
  end
  for i = n:-1:2
    temp = array(1);
    array(1) = array(i);
    array(i) = temp;
    heapify(array, i-1, 1);
  end
end

function heapify(array, n, i)
  largest = i;
  l = 2 * i;
  r = 2 * i + 1;
  if (l <= n && array(l) > array(largest))
    largest = l;
  end
  if (r <= n && array(r) > array(largest))
    largest = r;
  end
  if (largest ~= i)
    temp = array(i);
    array(i) = array(largest);
    array(largest) = temp;
    heapify(array, n, largest);
  end
end

tic();
heap_sort(array);
heap_sort_time = toc();

array = arrayMixed;

% Bubble sort implementation
function array = bubble_sort(array)
  n = length(array);
  for i = 1:n
    for j = 1:n-i
      if (array(j) > array(j+1))
        temp = array(j);
        array(j) = array(j+1);
        array(j+1) = temp;
      end
    end
  end
end

tic();
array = bubble_sort(array);
bubble_sort_time = toc();

quick_sort_time
merge_sort_time
heap_sort_time
bubble_sort_time


% Plotting the results
x = ["Quick Sort", "Merge Sort", "Heap Sort", "Bubble Sort"];
y = [quick_sort_time, merge_sort_time, heap_sort_time, bubble_sort_time];
bar(y);
title('Comparison of Sorting Algorithms');
xlabel('Algorithms');
ylabel('Time (in seconds)');

