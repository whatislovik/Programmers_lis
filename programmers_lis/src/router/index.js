import { createRouter, createWebHistory } from 'vue-router';
import MainLayout from '@/layouts/MainLayout.vue';
import AdminLayout from '@/layouts/AdminLayout.vue';
import Services from '@/components/Services.vue';
import Projects from '@/components/Projects.vue';
import OrderProject from '@/components/OrderProject.vue';
import About from '@/components/About.vue';
import Contact from '@/components/Contact.vue';
import AdminServicesPage from '@/components/Admin.vue';
import AdminReport from '@/components/AdminReport.vue';
import Login from '@/components/Login.vue';  // Страница логина

const routes = [
  {
    path: '/',
    component: MainLayout,
    children: [
      { path: '/', name: 'Services', component: Services },
      { path: '/projects', name: 'Projects', component: Projects },
      { path: '/about', name: 'About', component: About },
      { path: '/contact', name: 'Contact', component: Contact },
      { path: '/order', name: 'OrderProject', component: OrderProject },
    ]
  },
  {
    path: '/login',
    name: 'Login',
    component: Login,
  },
  {
    path: '/admin',
    component: AdminLayout,
    meta: { requiresAuth: true },  // Защита маршрута
    children: [
      { path: '', component: AdminServicesPage },
      { path: '/admin/reports', name: 'Reports', component: AdminReport },
    ]
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

// Проверка авторизации перед доступом к маршрутам
router.beforeEach((to, from, next) => {
  const isAuthenticated = !!document.cookie.split('; ').find(row => row.startsWith('authToken='));

  if (to.matched.some(record => record.meta.requiresAuth) && !isAuthenticated) {
    next('/login');  // Перенаправление на страницу авторизации
  } else {
    next();
  }
});

export default router;
