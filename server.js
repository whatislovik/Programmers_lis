const express = require('express');
const cors = require('cors');
const { Pool } = require('pg');

const app = express();
const port = 3000;

// Настройка соединения с базой данных PostgreSQL
const pool = new Pool({
  user: 'postgres',     // Имя пользователя PostgreSQL
  host: 'localhost',         // Хост базы данных
  database: '2', // Имя базы данных
  password: '1234', // Пароль пользователя
  port: 5432                 // Порт PostgreSQL
});

app.use(cors());
app.use(express.json());

// Маршрут для получения услуг
app.get('/api/services', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM services');
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send('Ошибка сервера');
  }
});

app.delete('/api/services/:id', async (req, res) => {
  const { id } = req.params;
  try {
    await pool.query('DELETE FROM services WHERE id = $1', [id]);
    res.status(200).send(`Услуга с ID ${id} удалена`);
  } catch (err) {
    console.error(err);
    res.status(500).send('Ошибка при удалении услуги');
  }
});

app.post('/api/services', async (req, res) => {
  const { name, description, price, uri } = req.body;
  try {
    const result = await pool.query(
      'INSERT INTO services (name, description, price, uri) VALUES ($1, $2, $3, $4) RETURNING *',
      [name, description, price, uri]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).send('Ошибка при добавлении услуги');
  }
});

// Маршрут для обновления услуги
app.put('/api/services/:id', async (req, res) => {
  const { id } = req.params;
  const { name, description, price, uri } = req.body;

  try {
    const result = await pool.query(
      'UPDATE services SET name = $1, description = $2, price = $3, uri = $4 WHERE id = $5 RETURNING *',
      [name, description, price, uri, id]
    );

    if (result.rowCount === 0) {
      return res.status(404).send(`Услуга с ID ${id} не найдена`);
    }

    res.status(200).json(result.rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).send('Ошибка при обновлении услуги');
  }
});

// Маршрут для получения аналитики продаж
// app.get('/api/sales-analysis', async (req, res) => {
//     try {
//       const result = await pool.query(`
//         SELECT sa.service_id, s.name as service_name, sa.total_sales, sa.total_revenue, sa.last_sale_date
//         FROM sales_analysis sa
//         JOIN services s ON sa.service_id = s.id
//       `);
//       res.json(result.rows);
//     } catch (err) {
//       console.error('Ошибка при получении аналитики продаж:', err);
//       res.status(500).send('Ошибка сервера');
//     }
//   });

app.get('/api/sales-analysis', async (req, res) => {
  try {

    // Запрос для аналитики
    const result = await pool.query(`
      SELECT
          s.name AS service_name,
          COUNT(o.id) AS total_sales,
          SUM(o.total_price) AS total_revenue,
          MAX(o.order_date) AS last_sale_date
      FROM
          public.orders o
      JOIN
          public.services s ON o.service_id = s.id
      WHERE
          o.status = 'Завершено'
      GROUP BY
          s.name
      ORDER BY
          total_revenue DESC;


      `);
    res.json(result.rows);
  } catch (err) {
    console.error('Ошибка при получении аналитики продаж:', err);
    res.status(500).send('Ошибка сервера');
  }
});


// Маршрут для получения всех заказов
app.get('/api/orders', async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT o.id, s.name as service_name, o.client_name, o.total_price, o.order_date, o.planing_end_date, o.status
      FROM orders o
      JOIN services s ON o.service_id = s.id
    `);
    res.json(result.rows);
  } catch (err) {
    console.error('Ошибка при получении заказов:', err);
    res.status(500).send('Ошибка сервера');
  }
});


app.post('/api/login', (req, res) => {
  const { username, password } = req.body;

  // Простая проверка логина и пароля (замени на свою логику)
  if (username === 'admin' && password === '1234') {
    const token = 'some-jwt-token';  // Здесь ты можешь сгенерировать реальный JWT
    res.json({ token });
  } else {
    res.status(401).json({ message: 'Неверные логин или пароль' });
  }
});


// Запуск сервера
app.listen(port, () => {
  console.log(`Сервер запущен на http://localhost:${port}`);
});
