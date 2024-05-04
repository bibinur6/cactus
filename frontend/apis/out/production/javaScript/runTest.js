const jsonData = {
    fileName: "Example",
    language: "rs",
    id: "3",
    code: "use std::io;fn main(){let mut a=String::new();io::stdin().read_line(&mut a).expect(\"Failed to read line\");let a=a.trim().parse::<usize>().expect(\"Invalid input\");let mut b=String::new();io::stdin().read_line(&mut b).expect(\"Failed to read line\");for _ in 0..a{print!(\"{}\",b);}}"
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