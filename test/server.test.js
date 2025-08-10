const request = require('supertest');
const app = require('../src/server');

describe('GET /', () => {
  test('responds 200 json', async () => {
    const res = await request(app).get('/');
    expect(res.statusCode).toBe(200);
    expect(res.body).toHaveProperty('message');
  });
});
