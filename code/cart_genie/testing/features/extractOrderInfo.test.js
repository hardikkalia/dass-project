const fs = require('fs');
const extractOrderInfo = require('../cart_genie/server/middleware/processing'); 

describe('extractOrderInfo function', () => {
  const testCasesFilePath = 'testCases.txt'; // Adjust the path as needed

  // Read test cases from the text file
  const testCasesData = fs.readFileSync(testCasesFilePath, 'utf8');
  const testCases = testCasesData.split('\n\n').map(testCase => {
    const lines = testCase.trim().split('\n');
    const message = JSON.parse(lines[0].substring(9)); // Extract message JSON
    const expected = JSON.parse(lines[1].substring(10)); // Extract expected JSON
    return { message, expected };
  });

  testCases.forEach((testCase, index) => {
    const { message, expected } = testCase;

    test(`Test Case ${index + 1}: ${message}`, () => {
      const result = extractOrderInfo(message);
      expect(result).toEqual(expected);
    });
  });
});