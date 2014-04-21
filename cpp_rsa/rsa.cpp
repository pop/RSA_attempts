#include <iostream>
#include <cmath>
#include <cstring>
#include <cstdlib>
#include "bigint-2010.04.30/BigIntegerLibrary.hh"

using namespace std;

int main(){

    int p = 61;
    int q = 53; 
    int n = p*q;
    int t = (p-1)*(q-1);
    int e = 17;
    int d;

    for(int i = 2; true; i++){
        if (((e*i) % t) == (1 % t)){
            d = i;
            break;
        }
    }

    cout << "p " << p << endl;
    cout << "q " << q << endl;
    cout << "n " << n << endl;
    cout << "t " << t << endl;
    cout << "e " << e << endl;
    cout << "d " << d << endl;

    char msg[100];
    int num_msg[100];
    cout << "Please enter a message less than 100 characters: ";
    cin >> msg;
    
    int i;

    for(i = 0; msg[i] != '\0'; i++){
        num_msg[i] = msg[i];
        cout << msg[i] << " " << num_msg[i] << endl;
    }
    num_msg[i] = '\0';

    cout << "encrypting" << endl;
    BigInteger c_num[100];
    for(i = 0; num_msg[i] != '\0'; i++){
        c_num[i] = fmod(pow(num_msg[i], e),n);
    }
    c_num[i] = '\0';

    for(i = 0; c_num[i] != '\0'; i++){
        cout << c_num[i] << " ";
    } 
    cout << endl;

    cout << "Decrypting" << endl;
    BigInteger m_num[100];
    for(i = 0; c_num[i] != '\0'; i++){
        cout << "c_num^d " << pow(c_num[i], d) << endl;
        m_num[i] = fmod(pow(c_num[i], d), n);
        cout << m_num[i] << " ";
    }
    m_num[i] = '\0';

    cout << endl << "m_num" << endl;
    for(i = 0; m_num[i] != 0; i++){
        cout << m_num[i] << " ";
        cout << m_num[i] << " ";
        cout << endl;
    } 
    cout << endl;


    return 0;
}
