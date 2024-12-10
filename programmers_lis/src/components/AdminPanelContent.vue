<template>
    <div class="admin-services-container">
        <!-- Панель с иконками -->
        <div class="admin-action-icons">
            <button @click="openAddModal" title="Добавить услугу"><img src="@/components/icons/add.png" width="40px"
                    height="40px" /></button>
            <button @click="deleteSelectedService" title="Удалить выбранные"><img src="@/components/icons/delete.png"
                    width="35px" height="35px" /></button>
            <button @click="openEditModal" title="Редактировать выбранные" :disabled="!selectedService"><img
                    src="@/components/icons/edit.png" width="50px" height="50px" /></button>
        </div>

        <!-- Список услуг -->
        <div class="admin-services-grid">
            <div class="admin-service-card" v-for="(service, index) in services" :key="index"
                :class="{ selected: selectedService && selectedService.id === service.id }"
                @click="selectService(service)">
                <div class="service-image">
                    <img :src="'/src/logos/services/' + service.uri" alt="Изображение услуги" />
                </div>
                <div class="service-info">
                    <h2>{{ service.name }}</h2>
                    <p>{{ service.price }} руб.</p>
                    <p>{{ service.description }}</p>
                </div>
            </div>
        </div>

        <!-- Модальные окна для добавления и редактирования -->
        <div v-if="showModal" class="modal">
            <form @submit.prevent="submitForm">
                <h2>{{ isEditMode ? 'Редактировать услугу' : 'Добавить услугу' }}</h2>
                <div>
                    <label for="name">Название услуги</label>
                    <input type="text" v-model="formData.name" id="name" />
                </div>
                <div>
                    <label for="price">Цена</label>
                    <input type="number" v-model="formData.price" id="price" />
                </div>
                <div>
                    <label for="description">Описание</label>
                    <textarea v-model="formData.description" rows="10" id="description"></textarea>
                </div>
                <div>
                    <label for="file">Загрузить изображение</label>
                    <input type="file" @change="handleFileUpload" id="file" />
                </div>
                <button type="submit">{{ isEditMode ? 'Сохранить изменения' : 'Добавить услугу' }}</button>
            </form>
            <button @click="closeModal">Закрыть</button>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import Auth from './Auth.vue';

export default {
    data() {
        return {
            services: [],
            selectedService: null,
            showModal: false,
            isEditMode: false,
            formData: {
                name: '',
                price: '',
                description: '',
                image: '' // Для хранения имени файла
            },
            selectedFile: null // Выбранный файл
        };
    },
    async created() {
        await this.fetchServices();
    },
    methods: {
        async fetchServices() {
            try {
                const response = await axios.get('http://localhost:3000/api/services');
                this.services = response.data;
            } catch (error) {
                console.error('Ошибка при получении услуг:', error);
            }
        },
        selectService(service) {
            this.selectedService = service;
        },
        openAddModal() {
            this.resetForm();
            this.isEditMode = false;
            this.showModal = true;
        },
        openEditModal() {
            if (!this.selectedService) return;
            this.formData = { ...this.selectedService };
            this.isEditMode = true;
            this.showModal = true;
        },
        handleFileUpload(event) {
            const file = event.target.files[0];
            if (file) {
                // Сохраняем файл на фронте и имя файла
                this.selectedFile = file;
                this.formData.image = file.name; // Сохраняем имя файла для отправки через API

                // Логика для сохранения файла на фронте (например, в '/src/logos/')
                const uploadPath = `/src/logos/services/${file.name}`;
                // Здесь можно реализовать код для физического сохранения файла
            }
        },
        async submitForm() {
            try {
                const payload = {
                    name: this.formData.name,
                    price: this.formData.price,
                    description: this.formData.description,
                    uri: this.selectedFile ? this.formData.image : this.selectedService.uri // Используем старое изображение, если новое не загружено
                };

                if (this.isEditMode) {
                    // Логика для обновления услуги
                    await axios.put(`http://localhost:3000/api/services/${this.selectedService.id}`, payload);
                } else {
                    // Логика для добавления новой услуги
                    await axios.post('http://localhost:3000/api/services', payload);
                }

                this.fetchServices();
                this.closeModal();
            } catch (error) {
                console.error('Ошибка при сохранении услуги:', error);
            }
        },
        closeModal() {
            this.showModal = false;
        },
        resetForm() {
            this.formData = { name: '', price: '', description: '', image: '' };
            this.selectedFile = null; // Сбрасываем выбранный файл
        },
        async deleteSelectedService() {
            if (!this.selectedService) return;
            try {
                await axios.delete(`http://localhost:3000/api/services/${this.selectedService.id}`);
                this.services = this.services.filter(service => service.id !== this.selectedService.id);
                this.selectedService = null;
            } catch (error) {
                console.error('Ошибка при удалении услуги:', error);
            }
        }
    }
};
</script>

<style scoped>
/* Стили страницы */
.admin-services-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.auth-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f8f9fa;
}

.modal {
    background-color: #fff;
    padding: 40px;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    width: 300px;
    text-align: center;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
}

.modal h2 {
    margin-bottom: 20px;
    font-size: 24px;
    color: #333;
}

.modal input {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
}

.modal button {
    width: 100%;
    padding: 10px;
    margin: 5px;
    background-color: #000000;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}

.modal textarea {

    max-width: 100%;
    min-width: 100%;
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;

}

.modal button:hover {
    background-color: #0056b3;
}

.modal .error {
    color: red;
    margin-bottom: 10px;
}

.admin-action-icons {
    display: flex;
    justify-content: flex-end;
    margin-bottom: 20px;
    gap: 10px;
}

.admin-action-icons button {

    border: none;
    background-color: #ffffff;
    color: #ffffff;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1rem;

}

.admin-services-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 20px;
}

.admin-service-card {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    cursor: pointer;
    transition: transform 0.2s, box-shadow 0.2s;
}

.admin-service-card:hover {
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
}

.service-image img {
    width: 100%;
    height: auto;
    border-radius: 8px;
}

.service-info {
    margin-top: 15px;
}

.selected {
    border: 2px solid #007bff;
    background-color: #f0f8ff;
}

/* Стили для модального окна */
.modal {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    padding: 20px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    z-index: 1000;
}
</style>