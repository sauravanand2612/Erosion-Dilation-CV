function exitcode = erosion_dilation(a)
input = a; 
disp(input);
image = imread(input);
input = imbinarize(image); 
se = [0 1 0; 1 1 1; 0 1 0]; 
output1 = dilation(input, se); 
output2 = erosion(input, se);
figure(9)
subplot(1,3,1),imshow(output2),title('Eroded image');
subplot(1,3,2),imshow(input),title('Original image');
subplot(1,3,3),imshow(output1),title('Dilated image');
 exitcode = 0;
end

function output1 = dilation(input, se)
    [r, c] = size(input);
    [sr, sc] = size(se);
    output1 = zeros(r, c);
    for i = 1:r
        for j = 1:c
            if input(i, j) == 1
                flag = 1;
                for x = 1:sr
                    for y = 1:sc
                        if se(x, y) == 1
                            if i+x-floor(sr/2)-1 > 0 && i+x-floor(sr/2)-1 <= r && j+y-floor(sc/2)-1 > 0 && j+y-floor(sc/2)-1 <= c
                                if input(i+x-floor(sr/2)-1, j+y-floor(sc/2)-1) == 0
                                    flag = 0;
                                    break;
                                end
                            else
                                flag = 0;
                                break;
                            end
                        end
                    end
                    if flag == 0
                        break;
                    end
                end
                output1(i, j) = flag;
            end
        end
    end
end

function output2 = erosion(input, se)
    [r, c] = size(input);
    [sr, sc] = size(se);
    output2 = zeros(r, c);
    for i = 1:r
        for j = 1:c
            if input(i, j) == 1
                output2(i, j) = 1;
            else
                for x = 1:sr
                    for y = 1:sc
                        if se(x, y) == 1
                            if i+x-floor(sr/2)-1 > 0 && i+x-floor(sr/2)-1 <= r && j+y-floor(sc/2)-1 > 0 && j+y-floor(sc/2)-1 <= c
                                if input(i+x-floor(sr/2)-1, j+y-floor(sc/2)-1) == 1
                                    output2(i, j) = 1;
                                    break;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end