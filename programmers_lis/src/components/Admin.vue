<template>

    <!-- Контент админ-панели -->
    <AdminPanelContent />

</template>

<script>
import Auth from './Auth.vue';
import AdminPanelContent from './AdminPanelContent.vue';

export default {
  components: {
    Auth,
    AdminPanelContent
  }
};
</script>