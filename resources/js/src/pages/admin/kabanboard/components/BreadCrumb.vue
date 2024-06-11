<template>
    <div class="row">
       <nav
           aria-label="breadcrumb"
           class="breadcrumb"
           style="background-color: rgb(245 245 245); border-radius: 5px"
       >
           <ol class="breadcrumb p-2 bg-body-tertiary rounded-3">
               <li class="breadcrumb-item">
                   <RouterLink 
                       >Create Project</RouterLink
                   >
               </li>
               <li class="breadcrumb-item" style="text-decoration: none">
                   <RouterLink to="/projects"><b>Projects</b></RouterLink>
               </li>
              
              
           </ol>
       </nav>
   </div>
</template>
<style scoped>
.breadcrumb-item a {
   text-decoration: none;
   font-weight: 400;
}
</style>