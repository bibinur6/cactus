import { createRouter, createWebHistory} from 'vue-router';
import Home from './routes/Home.vue';
import ProblemShow from './routes/ProblemShow.vue';

const routes = [
    {path: '/', name:"Home", component: Home, meta: {layout: 'no-navbar'}},
    {path: '/problems', name:"Problems", component: () => import('./routes/Problems.vue')},
    {path: '/info', name:"Info", component: () => import('./routes/Info.vue')},
    {path: '/languages', name:"Languages", component: () => import('./routes/Languages.vue')},
    {path: '/problems/:prob', component: ProblemShow, meta: {layout: 'no-navbar'}},
    {path: '/login', component: () => import('./routes/Login.vue')},
]
const router = createRouter({
    history: createWebHistory(),
    routes
})

export default router;