-- io handle
fileHandle = io.open("file.txt", "w")
print(io.type(fileHandle))
io.close(fileHandle)

fileHandle2 = io.open("file2.txt", "w")
print(io.type(fileHandle2))
fileHandle2:write("Hello world\n 2nd line \n 3rd line \n 4th line")
fileHandle2:close()
--io.close(fileHandle2)
print(io.type(fileHandle2))


print("-------io.open  \"r\"---------")
fileHandle3 = io.open("file2.txt", "r")
print(io.type(fileHandle3))
io.input(fileHandle3)
for line in io.lines("file2.txt") do
    print(line)
end
fileHandle3:close()



print("-------io.open  \"a\"---------")
fileHandle4 = io.open("file2.txt", "a")
fileHandle4:write("\n 5th line \n 6th line")

--oldIOFile = io.output()
--io.output("file2.txt")
--io.write("file2 content")
--io.output():close()
--io.output(oldIOFile)

print(io.type(fileHandle4))
fileHandle4:close()

print("------ io.tmpfile()----------")
fh = io.tmpfile()
fh:write("Some sample data")
fh:flush()
fh:seek("set", 1)
content = fh:read("*a")
print("WE GOT : ", content)


print("------------------")
fh2 = io.open("README.md")
content2 = fh2:read("*a")
print("readme.md content :\n", content2)
for line in io.lines("README.md") do
    print(line)
end
