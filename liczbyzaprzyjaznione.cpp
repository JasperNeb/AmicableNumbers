#include <iostream>
#include <fstream>
#include <cstdlib>
using namespace std;

bool czy_zaprzyjaznione(int a, int b)
{
	int sumaA=0;
    int sumaB=0;

	for(int i=1 ; i<=a/2 ; i++)
    {
        if(a%i==0)
        {
            sumaA+=i;
        }
    }
    for(int i=1 ; i<=b/2 ; i++)
    {
        if(b%i==0)
        {
            sumaB+=i;
        }
    }

    if(sumaA==b && sumaB==a)
    {
        return true;
    }
    else
    {
        return false;
    }
}


int main(int argc, char *argv[])
{
    int a,b;


	if(argc!=2)
	{
		cout << "Nieprawidlowa ilosc parametrow.\n";
		exit(0);
	}
	else
	{
		ifstream file;
        file.open(argv[1], ios_base::in);

        if (!file.is_open())
        {
            cout << "Wystapil blad. Nie mozna otworzyc pliku.\n";
            exit(1);
        }

        while(!file.eof())
        {
			file >> a;
			file >> b;

     //       cout << a << "  " << b << "  ";
			if(czy_zaprzyjaznione(a,b))
			{
                cout << "zaprzyjaznione\n";
			}
			else
			{
                cout <<"niezaprzyjaznione\n";
			}
		}
	}


}
