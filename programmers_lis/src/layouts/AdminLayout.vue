<template>
    <div>   
      <!-- Контент админской части -->
      <main>
        <nav>
          <ul>
            <li><router-link to="/admin">Управление услугами</router-link></li>
            <!-- <li><router-link to="/admin/projects">Управление проектами</router-link></li> -->
            <li><router-link to="/admin/reports">Отчеты</router-link></li>
            <li><router-link to="/">Выйти из админки</router-link></li>
          </ul>
        </nav>
        <router-view></router-view>
      </main>
    </div>
  </template>
  
  <script>
  export default {
    name: 'AdminLayout',
  };
  </script>
  
  <style scoped>
  /* Стили для навигации в админке */
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
  