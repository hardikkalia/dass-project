const fs = require('fs');
const axios = require('axios');

// Read test cases from testcases.txt
const testCasesFilePath = 'testcases.txt'; // Adjust the path as needed
const testCasesData = fs.readFileSync(testCasesFilePath, 'utf8');
const testCases = testCasesData.split('\n\n').map(testCase => {
  const lines = testCase.trim().split('\n');
  const route = lines[0].substring(6).trim(); // Extract route
  const expectedResponse = JSON.parse(lines[1].substring(18).trim()); // Extract expected response
  return { route, expectedResponse };
});

// Run test cases
testCases.forEach(testCase => {
  const { route, expectedResponse } = testCase;

  test(`GET ${route}`, async () => {
    const response = await axios.get(`http://localhost:3000${route}`); // Adjust the base URL as needed
    expect(response.data).toEqual(expectedResponse);
  });
});
