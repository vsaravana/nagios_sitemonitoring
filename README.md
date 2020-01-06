# Website monitoring
Monitoring whole website using the sitemap.xml

Dependencies:
--------------
 1. sitemap
 2. wget
 3. xmlstarlet
 4. awk.
 
 
Prerequesties:
--------------
 1. Make sure that you've installed sitemap in you website and xmlstarlet, wget and awk in your PC.
 2. Enter only domain name while executing the script. Example: mysite.com. No need to mention http or https.
 3. Enter the sitemap path staring with "/" and ending with ".xml"


Syntax:
--------------
sudo sh websitemonitoring.sh {websiteurl.com} /{sitemap_path.xml}
