#We need to create multiple objects that can hold values assoicated with a quiz
#Object will need to have properties:
#Question
#Answers
#Correct Answer
#We need these values to be dynamically added to an array that can be referenced through out the quiz
#Create a function that initiate the quiz

Function banner-art {
    
    Write-Host @"
                                .     .-/,\-.     ,
                                \ .-'//,M,\\`-. /
                                .-' .'/,MMM,\`. `-.
                        _.-"^\  / /       \ \  /^"-._
                        /,MMMM".' /  .-|-.  \ '."MMMM,\
            ________,,,/_,MMMM"/  /.-"  |  "-.\  \"MMMM,_\,,,_________
    -=========================='===^==^==^=====^==='=============================-
            ``^^^"""""""||\""""""""""""||\""""""""""""/||""""""""^^^``
                        ||             ||_)            ||
                        ||,            (|             ,||
                        db|            d8b            |db
                        YP             Y8P             YP


                                AUTHOR: Peter O'Driscoll
                                VERSION:April
"@
}
banner-art

#Create a counter that will keep record of correct / wrong / total questions asked.
[int]$presentedQuestions = 0
[int]$correctlyAnswered = 0 

#Import the assembly to allow popup windows
Add-Type -AssemblyName PresentationCore,PresentationFramework

#Call the initisation function
#Create our array

    [array]$Questions = @()

#Create a psobject for each questions and then assign the right value to the array

$Questions1 = New-Object -TypeName PSObject -Property @{

'Questions'= "What does C stand for in CIA?"
'Answers' = (
        'A = Corrupt', 
        'B = Computational',
        'C = Candy',
        'D = Confidentiality'
        )
'CorrectAnswer' = 'D'
'referenceLink' = 'https://www.csoonline.com/article/3519908/the-cia-triad-definition-components-and-examples.html'
}

$Questions2 = New-Object -TypeName PSObject -Property @{

'Questions'= "Asymmetric cryptography DOES NOT require a lot of computing power?"
'Answers' = (
        'A = True', 
        'B = False'
        )
'CorrectAnswer' = 'b'
'referenceLink' = 'https://www.sciencedirect.com/topics/computer-science/asymmetric-encryption'
}

$Questions3 = New-Object -TypeName PSObject -Property @{

'Questions'= "In RSA key generation what does N equal?"
'Answers' = (
        'A = Nothing', 
        'B = totient',
        'C = Modulus',
        'D = public key'
        )
'CorrectAnswer' = 'c'
'referenceLink' = 'https://en.wikipedia.org/wiki/RSA_(cryptosystem)'

}

$Questions4 = New-Object -TypeName PSObject -Property @{

'Questions'= "In RSA key generation how do you calculate the modulus?"
'Answers' = (
        'A = Multiplying two prime numbers', 
        'B = dividing two prime numbers',
        'C = Multiplying two composite numbers',
        'D = Square root of 8'
        )
'CorrectAnswer' = 'a'
'referenceLink' = 'https://en.wikipedia.org/wiki/RSA_(cryptosystem)'
}

$Questions5 = New-Object -TypeName PSObject -Property @{ 

'Questions'= "Find the modulus of 10 mod 4"
'Answers' = (
        'A = 6', 
        'B = 1',
        'C = 3',
        'D = 2'
        )
'CorrectAnswer' = 'd'
'referenceLink' = 'https://www.wolframalpha.com/input/?i=10+mod+4'
}

$Questions6 = New-Object -TypeName PSObject -Property @{ 

'Questions'= "What is Asymmetric encryption?"
'Answers' = (
        'A = Encrypting and decrypting data with a public and private key', 
        'B = creating a hash to ensure the intergrity of a message',
        'C = Encrypting cipher text into plain text',
        'D = A phishing attack'
        )
'CorrectAnswer' = 'a'
'referenceLink' = 'https://en.wikipedia.org/wiki/Public-key_cryptography'
}

$Questions7 = New-Object -TypeName PSObject -Property @{ 

'Questions'= "Which one is not an Asymmetric algorithm?"
'Answers' = (
        'A = RSA', 
        'B = DSA',
        'C = Diffie-Hellman',
        'D = AES'
        )
'CorrectAnswer' = 'd'
'referenceLink' = 'https://preyproject.com/blog/en/types-of-encryption-symmetric-or-asymmetric-rsa-or-aes/'
}

$Questions8 = New-Object -TypeName PSObject -Property @{ 

'Questions'= "What is the inverse of 5 mod 16?"
'Answers' = (
        'A = 8', 
        'B = 1',
        'C = 13',
        'D = 1024'
        )
'CorrectAnswer' = 'c'
'referenceLink' = 'https://www.wolframalpha.com/input/?i=inverse+5+mod+16'
}

$Questions9 = New-Object -TypeName PSObject -Property @{ 

'Questions'= "What is 233 in binary digits?"
'Answers' = (
        'A = 11101001', 
        'B = 10101010',
        'C = 11111111',
        'D = 10000000'
        )
'CorrectAnswer' = 'a'
'referenceLink' = 'https://www.wolframalpha.com/input/?i=233+in+binary'
}

$Questions10 = New-Object -TypeName PSObject -Property @{ 

'Questions'= "Convert 15^4 into binary digits?"
'Answers' = (
        'A = 2^4', 
        'B = 2^8',
        'C = 2^16',
        'D = 2^32'
        )
'CorrectAnswer' = 'c'
'referenceLink' = 'https://www.wolframalpha.com/input/?i=15%5E4+in+binary'
}

#We need to add all the questions to the array. 
#We then need to iterate through array and present user the questions

$Questions += $Questions1, $Questions2, $Questions3 , $Questions4, $Questions5, $Questions6, $Questions7, $Questions8, $Questions9, $Questions10 | Get-Random -Count 2

#Create a forloop to go through every question and request user input for the answer 
#Nested forloop will ensure the question is displayed as well as the possible answers

foreach ($individualQuestion in $Questions){
    Write-host $individualQuestion.Questions "`n"
    foreach ($choices in $individualQuestion.Answers){
        #write-host $choices "`n"
        $choices
        }

        $answer = Read-Host "`nWhat is your answer?"
    
    if ($answer -eq $individualQuestion.CorrectAnswer){
        Write-host "`n[+] '$answer' Well done, that is correct!" -ForegroundColor Yellow
        write-host "[+] Reference URL:" $individualQuestion.referenceLink "`n" -ForegroundColor Magenta
        $presentedQuestions++
        $correctlyAnswered++
        Start-Sleep -Seconds 3
        #Clear-Host 
        }
        else{
            write-host "`n[+] I'm sorry $answer is incorrect" -ForegroundColor Red
            write-host "[+] Reference URL:" $individualQuestion.referenceLink "`n" -ForegroundColor Magenta
            $presentedQuestions++
            Start-Sleep -Seconds 3
            #Clear-Host
        }
}

#Need to calculate the percentage for correctly answered questions 
#Correctly answered / total questions * 100 

$percentageRight =  $correctlyAnswered / $presentedQuestions * 100

#We want to present the results to the users in a message box windows

$ButtonType = [System.Windows.MessageBoxButton]::OK
$MessageIcon = [System.Windows.MessageBoxImage]::Exclamation
$MessageBody = "Out of $presentedQuestions questions, you answered $correctlyAnswered correct! `n`nYou got $percentageRight%"
$MessageTitle = "Results" 
$Result = [System.Windows.MessageBox]::Show($MessageBody,$MessageTitle,$ButtonType,$MessageIcon)
    
