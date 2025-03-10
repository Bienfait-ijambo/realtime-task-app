import { createRouter, createWebHistory } from "vue-router";

const router = createRouter({
    // http://127.0.0.1:8000/app
    history: createWebHistory("/app"),
    routes: [
        {
            path: "/register",
            name: "register",
            component: () => import("../pages/auth/AuthPage.vue"),
            children: [
                {
                    path: "/register",
                    name: "register",
                    component: () => import("../pages/auth/RegisterPage.vue"),
                },
                {
                  path: "/login",
                  name: "login",
                  component: () => import("../pages/auth/LoginPage.vue"),
              },
            ],
        },

        {
            path: "/admin",
            name: "admin",
            component: () => import("../pages/admin/AdminPage.vue"),
            children: [
                {
                    path: "/admin",
                    name: "admin",
                    component: () => import("../pages/admin/dashbaord/DashboardPage.vue"),
                },
               
                {
                    path: "/members",
                    name: "members",
                    component: () => import("../pages/admin/member/MemberPage.vue"),
                },
                {
                    path: "/create-members",
                    name: "create-members",
                    component: () => import("../pages/admin/member/CreateMember.vue"),
                },
              
                {
                    path: "/projects",
                    name: "projects",
                    component: () => import("../pages/admin/project/ProjectPage.vue"),
                },
                {
                    path: "/kaban",
                    name: "kaban",
                    component: () => import("../pages/admin/kabanboard/KabanBoard.vue"),
                },
                 {
                    path: "/create-projects",
                    name: "create-projects",
                     component: () => import("../pages/admin/project/CreateProject.vue"),
                },
      

   
                
            ],
        },
    ],
});

export default router;
