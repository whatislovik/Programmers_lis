<template>
    <div class="services-container">
     
      <div class="services-grid">
        <div class="service-card" v-for="(service, index) in services" :key="index">
          <div class="service-image">
            <!-- Здесь будет картинка услуги -->
            <img :src="'/src/logos/services/' + service.uri" alt="Изображение услуги" />
          </div>
          <div class="service-info">
            <h2>{{ service.name }}</h2>
            <p>{{ service.price }} руб.</p>
            <p>{{ service.description }}</p>
          </div>
        </div>
      </div>
    </div>
  </template>
  

  
  <style scoped>
  .services-container {
    
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    margin-top: 20px;
  }
  
  .services-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 20px;
  }
  
  .service-card {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
  }
  
  .service-image img {
    width: 100%;
    height: auto;
    border-radius: 8px;
  }
  
  .service-info {
    margin-top: 15px;
    font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
  }
  
  .service-info h2 {
    font-size: 1.2rem;
    margin-bottom: 10px;
    font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; 
  }
  
  .service-info p {
    color: #555;
    font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
  }
  </style>

  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        services: []  // Здесь будут храниться услуги
      };
    },
    async created() {
      try {
        const response = await axios.get('http://localhost:3000/api/services'); // Запрос к API
        this.services = response.data;  // Заполнение данных услуг
        console.log(response.data) 
      } catch (error) {
        console.error('Ошибка при получении услуг:', error);
      }
    }
  };
  </script>
  

  