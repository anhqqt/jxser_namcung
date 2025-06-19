function logplayer(zFile, szMsg)
    local handle = openfile(zFile, "a")
    write(handle, format("%s\n", szMsg));
    closefile(handle);
end

function WriteLogPro(data, str)
    local Data2 = openfile("" .. data .. "", "a+");
    write(Data2, tostring(str));
    closefile(Data2);
end