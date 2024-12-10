<template>
    <div>

      
      <!-- Основной контент -->
      <main>
        <nav>
          <ul>
            <li><router-link to="/">Услуги</router-link></li>
            <li><router-link to="/projects">Анализ проектов</router-link></li>
            <li><router-link to="/about">Обо мне</router-link></li>
            <li><router-link to="/contact">Контактная информация</router-link></li>
            <li><router-link to="/order">Заказать проект</router-link></li>
          </ul>
        </nav>
        <router-view></router-view>
      </main>
    </div>
  </template>
  
  <script>
  export default {
    name: 'MainLayout',
  };
  </script>
  
  <style scoped>
  /* Стили для основной навигации */
  nav ul {
  list-style: none;
  display: flex;
  justify-content: center;
  padding: 0;
  margin: 0;
 
  
}

nav li {
  margin-left: 3%;
  margin-right: 3%;
  font-size: 18px;
  font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
}

nav a {
  color: rgb(0, 0, 0);
  text-decoration: none;
}

nav a:hover {
  text-decoration: underline;
}
  </style>
  