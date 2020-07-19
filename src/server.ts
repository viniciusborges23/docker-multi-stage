import express, { Response } from 'express';

const app = express();

app.use('/', (_, res: Response) => {
	res.json({ ok: true });
});

app.listen(3000, () => {
	console.log('Server running: http://localhost:3000');
});
