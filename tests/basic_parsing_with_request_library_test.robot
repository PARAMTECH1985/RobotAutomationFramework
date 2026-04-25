** *Settings ** *
Library
RequestsLibrary
Library
Collections

** *Test
Cases ** *
Simple
JSON
Parse
Example
Create
Session
mysession
https: // typicode.com
${response} = GET
On
Session
mysession / posts / 1

# Convert response to dictionary
${json_dict} = Set
Variable    ${response.json()}

# Access values using standard dictionary syntax
Log
To
Console
Post
Title: ${json_dict['title']}
Should
Be
Equal
As
Strings    ${json_dict['id']}
1
