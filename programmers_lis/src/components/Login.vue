<template>
    <div class="login">
      <h2>Вход в админ-панель</h2>
      <form @submit.prevent="login">
        <div>
          <label for="username">Логин</label>
          <input type="text" id="username" v-model="username" required>
        </div>
        <div>
          <label for="password">Пароль</label>
          <input type="password" id="password" v-model="password" required>
        </div>
        <button type="submit">Войти</button>
      </form>
      <p v-if="error">{{ error }}</p>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        username: '',
        password: '',
        error: ''
      };
    },
    methods: {
      async login() {
        try {
          const response = await axios.post('http://localhost:3000/api/login', {
            username: this.username,
            password: this.password
          });
          // Сохраняем токен в куки
          document.cookie = `authToken=${response.data.token}; path=/`;
          // Перенаправляем на /admin после успешной авторизации
          this.$router.push('/admin');
        } catch (err) {
          this.error = 'Неправильный логин или пароль';
        }
      }
    }
  };
  </script>
  
  <style scoped>
  .login {
    width: 500px;
    margin: 0 auto;
  }
  .login {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 80vh;
    background-color: #ffffff;
    flex-direction: column;
    vertical-align: middle;
  }
  
  .login form {
    background-color: #fff;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    width: 100%;

    text-align: center;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  }
  
  .login h2 {
    margin-bottom: 20px;
    font-size: 24px;
    color: #333;
  }
  
  .login input {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
  }
  
  .login button {
    width: 100%;
    padding: 10px;
    background-color: #000000;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
    font-weight: bold;
    transition: background-color 0.3s ease;
  }
  
  .login button:hover {
    background-color: #363636;
  }
  
  .login .error {
    color: red;
    margin-bottom: 10px;
  }
  </style>
  