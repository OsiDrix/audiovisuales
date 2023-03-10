import bcrypt from 'bcrypt';
import HttpStatus from 'http-status-codes';
import jwt from 'jsonwebtoken';
import { pool } from '../db.js';

/**
 * Returns jwt token if valid email and password is provided
 *
 * @param {object} req
 * @param {object} res
 * @returns {*}
 */
export const login = async (req, res) => {
  const { email, password } = req.body;
  const [users] = await pool.query('SELECT * FROM user where email = ?', [email]);

  if (users.length !== 0) {
    const [user] = users;
    if (bcrypt.compareSync(password, user.password)) {
      const token = jwt.sign(
        {
          id: user.id,
          email: user.email,
        },
        process.env.TOKEN_SECRET_KEY
      );

      res.json({
        success: true,
        token,
        user: {
          id: user.id,
          firstName: user.name,
          lastName: user.surname,
          birthday: user.birthday,
          email: user.email,
          phone: user.phone,
          userName: user.username,
        },
      });
    } else {
      res.status(HttpStatus.UNAUTHORIZED).json({
        success: false,
        message: 'Authentication failed. Invalid password.',
      });
    }
  } else {
    res.status(HttpStatus.UNAUTHORIZED).json({
      success: false,
      message: 'Invalid username or password.',
    });
  }
};

export const register = async (req, res) => {
  const { email, password, firstName, lastName, birthday, phone, userName } = req.body;

  const salt = bcrypt.genSaltSync(10);
  const hash = bcrypt.hashSync(password, salt);

  await pool.query(
    'INSERT INTO user (surname, birthday, email, phone, username, password, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
    [firstName, lastName, birthday, email, phone, userName, hash, 0]
  );
  // generate token

  const token = jwt.sign(
    {
      email,
    },
    process.env.TOKEN_SECRET_KEY
  );

  res.json({
    success: true,
    message: 'User created successfully',
    token,
  });
};
