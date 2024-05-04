const params = new URLSearchParams();
params.append('question_id', 3);
params.append('input', '4/2');
params.append('output', '2/2/2/2');

const fetchSettings = { method: 'POST', body: params };

fetch('http://localhost:8080/codecraft/api/testcases', fetchSettings)
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
