import { createRouter, createWebHistory } from 'vue-router';
import Services from '../components/Services.vue';
import Projects from '../components/Projects.vue';
import About from '../components/About.vue';
import Contact from '../components/Contact.vue';
import OrderProject from '../components/OrderProject.vue';
import Admin from '../components/Admin.vue';

const routes = [
  { path: '/', name: 'Services', component: Services },
  { path: '/projects', name: 'Projects', component: Projects },
  { path: '/about', name: 'About', component: About },
  { path: '/contact', name: 'Contact', component: Contact },
  { path: '/order', name: 'OrderProject', component: OrderProject },
  { path: '/admin', name: 'Admin', component: Admin }
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
