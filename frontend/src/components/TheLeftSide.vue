<script>

export default {
    created() {
        this.setActiveClass();
        this.$router.afterEach(() => {
            this.setActiveClass();
        })
    },
    methods: {
        navigateToRoot () {
            this.$el.querySelectorAll('.side-elems').forEach(el => el.classList.remove('activated'))
            this.$router.push('/');
        },
        navigateTo(path) {
            this.$router.push(path);
            this.setActiveClass();
        },
        setActiveClass() {
            const elems = document.querySelectorAll('.side-elems');
            const prob = document.querySelector('#side-bar-of-prob');
            const contest = document.querySelector('#side-bar-of-contest')

            elems.forEach(el => {
            // console.log("Comparing:", this.$route.path, el.dataset.path);
            if (this.$route.path === el.dataset.path) {
            // if (this.$route.path.includes("problems")) {
                // console.log("Adding class 'activated'");
                el.classList.add('activated');
            } else {
                // console.log("Removing class 'activated'");
                el.classList.remove('activated');
            }
            if(this.$route.path.includes('problems')) {
                prob.classList.add('activated')
            }
    });
}
    }
}

</script>

<template>

    <div class="fixed z-3 bg-[#333333] left-0 top-0 h-screen w-[220px]">
        <div class="w-full h-[120px] flex justify-center items-center border-b-[1px] border-b-white">
            <div class="w-[70px] h-[70px]" @click="navigateToRoot()">
                <img src="/cactus.jpeg" :style="{filter: 'drop-shadow(0px 10px 20px red) invert(75%)'}" alt="website" class="w-full h-full hover:cursor-pointer rounded-full">
            </div>
        </div>
        <div class="side-elems" @click="navigateTo('/problems')" id="side-bar-of-prob" data-path="/problems">Problems</div>
        <!-- <div class="side-elems" @click="navigateTo('/languages')" data-path="/languages">Languages </div> -->
        <div class="side-elems" @click="navigateTo('/info')" data-path="/info">Info </div>
        <!-- <div class="side-elems"  >Help </div> -->

    </div>

</template>


<style scoped>
    .side-elems {
        width: 100%;
        height: 60px;
        box-sizing: border-box;
        margin-top: 10px;
        color: aliceblue;
        display: flex;
        /* justify-content: center; */
        padding-left: 20px;
        font-size: 20px;
        align-items: center;
        transition: all 80ms ease;
    }
    .side-elems:hover {
        border-left: 8px solid rgb(83, 83, 83);
        cursor: pointer;
        
    }
    .activated {
        border-left: 10px solid rgb(255, 196, 0);
        background-color: gray !important;



    }
    



</style>