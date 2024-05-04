<script>

</script>

<template>

    <div id="nav-bar" class="flex fixed overflow-hidden h-[80px] justify-center ml-[220px] top-0 z-[100]">

        <div class="w-[80%] h-[80px] relative">
            <nav class="w-[100%] p-4 absolute bottom-0 rounded-full h-[50px] bg-[#474747] flex items-center">
                <div class="text-[20px] text-center w-full">{{$route.name === undefined ? $route.path : $route.name}}</div>                
            </nav>
        </div>

    </div>


</template>


<style scoped>
    #nav-bar {
        width: calc(100% - 220px);
        background: linear-gradient(to right, #1f1f1f, #202020, #2b2a2a);
        /* background-color: transparent; */
        background-repeat: repeat;

    }
</style>