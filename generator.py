import sys, os, glob

output = open('raport.html', 'w')
output.write(   "<!doctype html>\n\
                <html>\n\
                <head>\n\
                <meta charset=\"utf-8\">\n\
                <link rel=\"stylesheet\" href=\"style.css\"type=\"text/css\"/>\n\
                <title>Raport</title>\n\
                </head>\n\
                <body>\n\
                <h1>Raport</h1>\n\
                <div class=\"wrap\">"
            )

os.chdir("./in")
number=1
strlp="L.p<br><br>"
strliczby="liczby<br><br>"
str_czyzaprzyjaznione="Zaprzyjaznione?<br><br>"

for i in range (1, len(glob.glob("l*.txt"))+1):
	strlp+=str(i)
	strlp+="<br>"
	
while number <= len(glob.glob("l*.txt")):
    os.chdir("../in") 
    tempIn = open("l"+str(number)+".txt",'r')
    strg = tempIn.read()
    strg+="<br>"		
    strliczby+=strg
    tempIn.close()
    
    os.chdir("../out")
    tempOut = open("lout"+str(number)+".txt",'r')
    str_czyzaprzyjaznione+=tempOut.read()
    str_czyzaprzyjaznione+="<br>"
    tempOut.close()
    number+=1
    
    
output.write("<div class=\"lewy\">"+strlp+"</div>")
output.write("<div class=\"content\"> "+strliczby+"</div>")
output.write("<div class=\"prawy\"> "+str_czyzaprzyjaznione+"</div>")


output.write(   "</body>\n\
                 </html>\n"
            )

output.close()
