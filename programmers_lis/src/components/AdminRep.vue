<template>
  <div class="reports-container">
    <h2>Аналитика продаж</h2>
    <div class="date-filter">
      <label>Период с:</label>
      <input type="date" v-model="salesStartDate" @change="filterSalesAnalysis" />
      <label>по:</label>
      <input type="date" v-model="salesEndDate" @change="filterSalesAnalysis" />
    </div>
    <table>
      <thead>
        <tr>
          <th @click="sortTable('service_name')">Название услуги</th>
          <th @click="sortTable('total_sales', true)">Количество продаж</th>
          <th @click="sortTable('total_revenue', true)">Общая выручка, руб.</th>
          <th @click="sortTable('last_sale_date')">Дата последней продажи</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(analysis, index) in filteredSalesAnalysis" :key="index">
          <td class="left">{{ analysis.service_name }}</td>
          <td>{{ analysis.total_sales }}</td>
          <td>{{ analysis.total_revenue }}</td>
          <td>{{ new Date(analysis.last_sale_date).toLocaleDateString() }}</td>
        </tr>
        <tr class="total-row">
          <td class="left">Всего</td>
          <td></td>
          <td>{{ totalSalesRevenue }}</td>
          <td></td>
        </tr>
      </tbody>
    </table>

    <h2>Заказы</h2>
    <div class="date-filter">
      <label>Период с:</label>
      <input type="date" v-model="ordersStartDate" @change="filterOrders" />
      <label>по:</label>
      <input type="date" v-model="ordersEndDate" @change="filterOrders" />
    </div>
    <table>
      <thead>
        <tr>
          <th @click="sortOrdersTable('service_name')">Название услуги</th>
          <th @click="sortOrdersTable('client_name')">Клиент</th>
          <th @click="sortOrdersTable('total_price', true)">Сумма, руб.</th>
          <th @click="sortOrdersTable('order_date')">Дата заказа</th>
          <th @click="sortOrdersTable('planing_end_date')">Плановая дата окончания</th>
          <th @click="sortOrdersTable('status')">Статус</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(order, index) in filteredOrders" :key="index">
          <td class="left">{{ order.service_name }}</td>
          <td class="left">{{ order.client_name }}</td>
          <td>{{ order.total_price }}</td>
          <td>{{ new Date(order.order_date).toLocaleDateString() }}</td>
          <td>{{ new Date(order.planing_end_date).toLocaleDateString() }}</td>
          <td class="left">{{ order.status }}</td>
        </tr>
        <tr class="total-row">
          <td class="left">Всего</td>
          <td></td>
          <td>{{ totalOrdersRevenue }}</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      salesAnalysis: [],
      orders: [],
      salesStartDate: '',
      salesEndDate: '',
      ordersStartDate: '',
      ordersEndDate: '',
      isAscending: true,
    };
  },
  computed: {
    filteredSalesAnalysis() {
      return this.salesAnalysis.filter((item) => {
        const date = new Date(item.last_sale_date);
        return (!this.salesStartDate || date >= new Date(this.salesStartDate)) &&
          (!this.salesEndDate || date <= new Date(this.salesEndDate));
      });
    },
    filteredOrders() {
      return this.orders.filter((item) => {
        const date = new Date(item.order_date);
        return (!this.ordersStartDate || date >= new Date(this.ordersStartDate)) &&
          (!this.ordersEndDate || date <= new Date(this.ordersEndDate));
      });
    },
    totalSalesRevenue() {
      return this.filteredSalesAnalysis.reduce((sum, item) => sum + Number(item.total_revenue), 0).toFixed(2);
    },
    totalOrdersRevenue() {
      return this.filteredOrders.reduce((sum, item) => sum + Number(item.total_price), 0).toFixed(2);
    },
  },
  async created() {
    await this.fetchSalesAnalysis();
    await this.fetchOrders();
  },
  methods: {
    async fetchSalesAnalysis() {
      try {
        const response = await axios.get('http://localhost:3000/api/sales-analysis');
        this.salesAnalysis = response.data;
      } catch (error) {
        console.error('Ошибка при получении аналитики продаж:', error);
      }
    },
    async fetchOrders() {
      try {
        const response = await axios.get('http://localhost:3000/api/orders');
        this.orders = response.data;
      } catch (error) {
        console.error('Ошибка при получении заказов:', error);
      }
    },
    sortTable(property, isNumeric = false) {
      const compareFunction = isNumeric
        ? (a, b) => (this.isAscending ? a[property] - b[property] : b[property] - a[property])
        : (a, b) => {
          if (a[property] < b[property]) return this.isAscending ? -1 : 1;
          if (a[property] > b[property]) return this.isAscending ? 1 : -1;
          return 0;
        };

      this.salesAnalysis.sort(compareFunction);
      this.isAscending = !this.isAscending;
    },
    sortOrdersTable(property, isNumeric = false) {
      const compareFunction = isNumeric
        ? (a, b) => (this.isAscending ? a[property] - b[property] : b[property] - a[property])
        : (a, b) => {
          if (a[property] < b[property]) return this.isAscending ? -1 : 1;
          if (a[property] > b[property]) return this.isAscending ? 1 : -1;
          return 0;
        };

      this.orders.sort(compareFunction);
      this.isAscending = !this.isAscending;
    },
    filterSalesAnalysis() {
      // Вычисляем фильтрованные данные через computed-свойства
    },
    filterOrders() {
      // Вычисляем фильтрованные данные через computed-свойства
    }
  }
};
</script>

<style scoped>
.reports-container {
  max-width: 1000px;
  margin: 0 auto;
  padding: 20px;
}

.date-filter {
  margin-bottom: 10px;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

td,
th {
  padding: 10px;
  border: 1px solid #ddd;
  text-align: right;
}

th {
  background-color: #f4f4f4;
  cursor: pointer;
  text-align: center;
}

.left {
  text-align: left;
}

.total-row td {
  font-weight: bold;
}
</style>
