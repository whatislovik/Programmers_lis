<template>
    <div class="auth-container" v-if="!isAuthenticated">
      <div class="auth-form">
        <h2>Вход в админ-панель</h2>
        <div class="error" v-if="errorMessage">{{ errorMessage }}</div>
        <input v-model="username" type="text" placeholder="Логин" />
        <input v-model="password" type="password" placeholder="Пароль" />
        <button @click="login">Войти</button>
      </div>
    </div>
  
    <div v-else>
      <!-- Здесь будет контент админ-панели после авторизации -->
      <slot></slot>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        username: '',
        password: '',
        errorMessage: '',
        isAuthenticated: false
      };
    },
    methods: {
      login() {
        // Пример проверки логина и пароля
        if (this.username === 'admin' && this.password === '1234') {
          this.isAuthenticated = true;
          this.errorMessage = '';
        } else {
          this.errorMessage = 'Неверный логин или пароль';
        }
      }
    }
  };
  </script>
  
  <style scoped>
  .auth-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f0f2f5;
  }
  
  .auth-form {
    background-color: #fff;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
    text-align: center;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  }
  
  .auth-form h2 {
    margin-bottom: 20px;
    font-size: 24px;
    color: #333;
  }
  
  .auth-form input {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
  }
  
  .auth-form button {
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
  
  .auth-form button:hover {
    background-color: #363636;
  }
  
  .auth-form .error {
    color: red;
    margin-bottom: 10px;
  }
  </style>
  