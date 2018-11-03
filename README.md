# Self Assessment

## Functionality
As of now, my functionality is at a 3.

## OOP
My object oriented programming could be a 4, except that I’m not using any class methods. I am using modules and a superclass. I could refactor to use class methods. The superclass Crypter has the advantage of being able to store the character map, and the subclasses are able to be sparse. It isn't the most DRY, though, for Enigma to have decrypt and encrypt that are basically the same but each 4 lines. If there was a third or fourth type, I might use some fancy tricks to dry this out. But, since there's only two, I don't think it's worth it, and would be less readable. I have mixed feelings about ReliableDate. I created this class so I could have a date that could be initizliazed with a nil value and default to todays date, and that would be have its ddmmyy as an attribute right on it. It is useful, but is it worth the lift? Not sure. It is nice not to have a bunch of if/else junk dealing with date inside the crypt file, follows SRP. Self-score: 3

## OOP
My tests are at 100% but I’m not using any mocks or stubs. I wrote tests both for integration and unit testing. By and large, I wrote tests before writing methods, and exceptions to this rule are minor and justified/mentioned in commit history. Self-score: 3.

## Version Control
I have 67 commits and 16 closed pull requests. I’m not entirely sure if any of my commit messages are ambiguous. At least one is ambiguous as "Test passes", though meaning can be derived from context. I also can’t say with confidence that not a single commit includes multiple pieces of functionality. I’ve generally been trying to err on the small-side of commits. One thing I’m not clear about is when I’m not sure about is when I’m refactoring say something that wasn’t a class into a class. It takes a lot of little edits and then usually debugging to get this working. Is each piece of this a step of functionality? Should I be committing when the changes I made don’t yet function?  I see both sides to this. Self-score: 3 
