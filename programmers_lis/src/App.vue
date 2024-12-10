<template>
  <div id="app">
    
    <header>
      <img
      src="@/components/icons/10752058.png" width="30px" height="30px" color="white" /> АРМ фрилансера
    </header>

    <!-- Здесь отображаются страницы -->
    <main>

      <router-view></router-view>
    </main>
  </div>
</template>

<script>
export default {
  name: "App"
};
</script>

<style>
/* Стили шапки */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
img {
    background-color: white;
}

header {
  background-color: #000000;
  color: #fff;
  padding: 20px;
  font-size: 25px;
  font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
}

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

/* Основной контент */
main {
  padding: 20px;
}
</style>
