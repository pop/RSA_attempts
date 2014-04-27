Elijah Voigt's Attempt at RSA
=============================

It failed. You can look at the code here. Thanks.

-Elijah

UPDATE
======
My python implementation did not fail!
I'm dubbing it "RCPRSAI [Really Crude Python RSA Implementation] v0.1"

It takes command line arguments, so here's how to use it:

  ---

    $ python3 rsa.py --version
    Version:
    RCPRSAI [Really Crude Python RSA Implementation] v0.1
    Avaliable for free! Take it, break it, learn from it
    For more info visit https://github.com/ElijahCaine

  ---

    $ python3 rsa.py --help
    Help:
    rsa.py -p [prime #X] -q [prime #Y] -e [prime #Z] -m 'Secret Message'
    [It is suggested that p and q be much larger than e]
    [The message (-m '---') must be in quotes]
    rsa.py -h -> This help message -v -> Version
  
  --- 
    
    $ python3 rsa.py -p 3571 -q 2003 -e 107 -m "Hey look a secret message..."
    Public key:  107
    Priavte key:  1283
    Encrypted Message: ֭୐దҜŻHHʲҜܗҜ૬୐ڇ࠶୐ࡶҜ୾୐૬૬ܗ࣌୐ԔԔԔ
    Decrypted Message: Hey look a secret message...

  ---
 
    $ python3 rsa.py -m "Hey look a secret message..."
    WARNING: Even less secure
    Some (or all) custom values missing. Using defaults.
    To enter custom values view the README or call the script with the -h argument
    |p: 61 |q: 53 |n: 3233 |t: 3120 |e: 17 |m: Hey look a secret message... |d: 2753 |
 
    Public key:  17
    Priavte key:  2753
    Encrypted Message: ஸԡǧ߈˩ࢉࢉʲ߈٠߈ӎԡę६ԡʹ߈ࣟԡӎӎ٠୫ԡଉଉଉ
    Decrypted Message: Hey look a secret message...
  ---
    
There's some comments in the code if you'd like to read them.
