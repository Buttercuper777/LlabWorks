﻿#include <iostream>
#include <string>
using namespace std;

#define TABLE_SIZE 20

#define PRIME 13

class DoubleHash
{
    int* hashTable;
    int curr_size;

public:

    bool isFull()
    {

        return (curr_size == TABLE_SIZE);
    }

    int hash1(int key)
    {
        return (key % TABLE_SIZE);
    }

    int hash2(int key)
    {
        return (PRIME - (key % PRIME));
    }

    DoubleHash()
    {
        hashTable = new int[TABLE_SIZE];
        curr_size = 0;
        for (int i = 0; i < TABLE_SIZE; i++)
            hashTable[i] = -1;
    }

    void insertHash(int key)
    {
        if (isFull())
            return;

        int index = hash1(key);

        if (hashTable[index] != -1)
        {
            int index2 = hash2(key);
            int i = 1;
            while (1)
            {
                int newIndex = (index + i * index2) %
                    TABLE_SIZE;

                if (hashTable[newIndex] == -1)
                {
                    hashTable[newIndex] = key;
                    break;
                }
                i++;
            }
        }

        else
            hashTable[index] = key;
        curr_size++;
    }

    void displayHash()
    {
        for (int i = 0; i < TABLE_SIZE; i++)
        {
            if (hashTable[i] != -1)
                cout << i << " --> "
                << hashTable[i] << endl;
            else
                cout << i << endl;
        }
    }
};

int main()
{
    const char* a[] = { "ada", "sdcsdcs" };


    cout << a[0];
    /*//int n = sizeof(a) / sizeof(a[0]);

    DoubleHash h;
    for (int i = 0; i < n; i++)
        //h.insertHash(a[i]);

    h.displayHash();*/
    return 0;
}