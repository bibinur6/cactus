const fetchSettings = { method: 'DELETE' };

fetch(`http://localhost:8080/codecraft/api/questions?id=5`, fetchSettings)
  .then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response; // Parse response as JSON
  })
  .then(data => {
    console.log('Success:', data.json());
    // Do something with the response data
  })
  .catch(error => {
    console.error('Error:', error);
    // Handle errors, including JSON parsing errors
  });
