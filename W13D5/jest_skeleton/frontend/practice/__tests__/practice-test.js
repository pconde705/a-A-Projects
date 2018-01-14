import {sum, screamify } from '../practice'

describe("sum", () => {
  test("adds the two inputs together", () => {
    expect(sum(10, 20)).toEqual(30);
  })
});

describe('screamify', () => {
  test("scream with a loud voice", () => {
    expect(screamify("hello")).toEqual("HELLO");
  })
});
