fetch('http://localhost:8000/api/questions')
  .then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json(); // Parse response as JSON
  })
  .then(data => {
    console.log(data);
    // Do something with the response data
  })
  .catch(error => {
    console.error('Error:', error);
    // Handle errors, including JSON parsing errors
  });

