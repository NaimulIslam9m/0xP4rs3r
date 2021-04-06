from subprocess import getoutput

# set default file type
ext = '.py' # ex: .py,.cpp,.java, .c.

inp = input()
if 'false' in inp:
    inp = inp.replace('false,', 'False,')
if 'true' in inp:
    inp = inp.replace('true,', 'True,')

json = eval(inp)
tests = json['tests']
problem_no = json['name'][0]

getoutput('rm Testcase/' + problem_no + '*')
getoutput('code ' + problem_no + ext)

for i in range(1, len(tests) + 1):
    with open('Testcase/' + problem_no + str(i) + '.in', 'w') as f:
        f.write(tests[i - 1]['input'])
    with open('Testcase/' + problem_no + str(i) + '.out', 'w') as f:
        f.write(tests[i - 1]['output'])