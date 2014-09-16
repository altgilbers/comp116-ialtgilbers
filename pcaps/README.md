1. How many packets are there in this set?

1503

2. What protocol was used to transfer files from PC to server?

FTP

3. Briefly describe why the protocol used to transfer the files is insecure?

Credentials and content are transmitted in clear text.  Anyone monitoring the network could steal this information and abuse it.

4. What is the secure alternative to the protocol used to transfer files?

There are many, but SFTP (SSH File Transfer Protocol) is a common one.

5. What is the IP address of the server?

67.23.79.113

6. What was the username and password used to access the server?

USER ihackpineapples
PASS rockyou1

7. How many files were transferred from PC to server?

4

8. What are the names of the files transferred from PC to server?

BjN-O1hCAAAZbiq.jpg
BvgT9p2IQAEEoHu.jpg
BvzjaN-IQAA3XG7.jpg
smash.txt

9. Extract all the files that were transferred from PC to server. These files must be part of your submission!

extracted



10. How many packets are there in this set?

77882

11. How many plaintext username-password pairs are there in this packet set?

I only found a couple copies 

12. Briefly describe how you found the username-password pairs.

I tried a few things..  first I used ettercap and grepped for variants of pass.   I used "strings" to do the same thing and got similar results.

Finally, used WireShark's Protocol Hierarchy Statistics report to show all of the protocols detected.  Then I used filters on each of those protocols (which weren't encrypted) to look for potential gold.  Specifically I was looking for unencrypted protocols that might have credentials..   I found:

HTTP - didn't see any username/passwords, but there was a wordpress_logged_in cookie that could have been used to hijack a session if the capture was "live"
FTP - lots of files transmitted, but no credentials passed
POP - see #13
TELNET - see #13
SNMP - only "public" community SNMP queries


13. For each of the plaintext username-password pair that you found, identify the protocol used, server IP, the corresponding domain name (e.g., google.com), and port number.

Telnet - TCP/23 - all attempts were to:   200.60.17.1 which has no DNS, but the WHOIS record points to a Peruvian telecom company.  The device's telnet banner also identified itself as an asset of Telefonica Empresas Peru
 
|cisco|185 12345d|
|cidco|185 122333|
|cisco|185 august23|
|cisco|184 yomama1|
|cisco|185 anthony7|
|cisco|185 allahu|

POP - Post Office Protocol - TCP/110
mail.si-sv3231.comchirs@digitalinterlude.com:Volrathw69


14. Of all the plaintext username-password pairs that you found, how many of them are legitimate? That is, the username-password was valid, access successfully granted?


15. How did you verify the successful username-password pairs?

The POP server responded with:
+OK Password ok
Also the user was then able to list his mailbox contents and retrieve mail messages.

16. What advice would you give to the owners of the username-password pairs that you found so their account information would not be revealed "in-the-clear" in the future?

I would advise them to find some way to encrypting their data...   They could use a more secure protocol (like IMAP over SSL) or they could send all of their traffic through a encrypted tunnel (i.e. VPN).  

