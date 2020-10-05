import std.stdio;
import std.algorithm.iteration;
import std.range;
import std.random;
import std.array;
import std.conv;

// cerner_2^5_2020
int main(string[] args)
{
    if (args.length != 2)
    {
        writefln("No dice to roll");
        return 1;
    }

    string request = args[1];
    auto parts = request.split("d");

    int amount = 1;
    string rangePart = parts[1];

    if (parts[0].empty) // form dY
    {
        rangePart = parts[1];
    }
    else // form XdY
    {
        amount = to!int(parts[0], 10);
    }

    const range = to!int(rangePart, 10);
    int[] arr = generate!(() => uniform(1, range + 1)).takeExactly(amount).array;
    writefln("Total: %s, rolls: %s", arr.sum, arr);

    return 0;
}
