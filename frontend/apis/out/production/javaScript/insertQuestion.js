const params = new URLSearchParams();
params.append('title', 'Printing several outputs');
params.append('content', 'Write a program that takes two lines: number of rows to print and what to print.');
params.append('level', 'easy');
params.append('input', '1\n1');
params.append('output', '1');

// const params = {
//     'title': "",
//     "content": "",
//     "level": "",
//     "input": "",
//     "output": ""
// }

const fetchSettings = { method: 'POST', body: params };

fetch('http://localhost:8080/codecraft/api/questions', fetchSettings)
  .then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response; // Parse response as JSON
  })
  .then(data => {
    console.log('Success:', data);
    // Do something with the response data
  })
  .catch(error => {
    console.error('Error:', error);
    // Handle errors, including JSON parsing errors
  });
