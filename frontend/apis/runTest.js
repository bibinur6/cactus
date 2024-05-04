const jsonData = {
    fileName: "Example",
    language: "py",
    id: "1",
    code: "print(\"CodeCraft\")"
};

const fetchSettings = { method: 'POST', body: JSON.stringify(jsonData)};
console.log(fetchSettings);

fetch('http://localhost:8080/codecraft/api/run', fetchSettings)
    .then(response => response.json())
    .then(data => {
    console.log('Success:', data);
    // Do something with the response data
  })
  .catch(error => {
    console.error('Error:', error);
    // Handle errors, including JSON parsing errors
  });