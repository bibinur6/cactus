<script>
    export default {
        methods: {
            goTo () {
                this.$router.push("/problems");
            }
        }
    }
</script>


<template>

    <div id="home-container" class="w-[90%] flex flex-col items-center">


        <div class="h-[auto] pt-0 pb-3 flex flex-col items-center mb-[120px]">
            <h1 class="text-[80px] font-mono mt-3 text-center w-[90%] rounded-full pl-0 kaushan-script-regular">Welcome to CACTUS</h1>
            <p class="text-center text-[30px] w-[80%] font-mono font-light mt-[90px]">Here you can find thousands of programming problems to solve. If you're new here you're very much welcome! Just register and start solving.</p>
            
        </div>


        <div class="bg-[#3d4964] p-10 relative">
            <div><img src="/web-programming.png" alt="web" class="w-[70px] h-[70px]"></div>
            <h1 class="text-[35px] mt-4">Sharpen your coding skills</h1>
            <div class="absolute top-20 right-0 rounded-tl-[20px] rounded-bl-[20px] overflow-hidden"><img src="/coding.png" alt="coding"></div>
            <p class="w-[50%] text-[18px]">Challenge yourself on small coding exersices. Each exsercises is crafted by the community to help you strengthen different coding techniques. Master your current language of choice, or quickly pick up any of the 10+ programming languages supported.</p>
            <button class="text-[20px]" @click="goTo">Go to solving problems</button>
        </div>



        <div class="flex w-full">

            <div class="contenting mr-[20px]">
                <div><img src="/sport.png" alt="web" class="w-[70px] h-[70px]"></div>

                <h1>Earn Ranks And Honor</h1>
                <p>Our code challenges are ranked from beginner to expert level. As you complete higher-ranked exersice, you level up your profile and push your software development skills to your highest potential.</p>
            </div>

            <div class="contenting">
                <div><img src="/share.png" alt="web" class="w-[70px] h-[70px]"></div>

                <h1>Share Your Code</h1>
                <p>Share your code to get feedback and improve your code thanks to other users of our project</p>
            </div>

        </div>

        <div class="h-[150px]"></div>
    </div>

</template>


<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Kaushan+Script&display=swap');

.kaushan-script-regular {
    font-family: "Kaushan Script", cursive;
    font-weight: 400;
    font-style: normal;
    box-shadow: #3b3d42  5px 5px;
    backdrop-filter: blur(100px);
    background-size: cover;

}

.welcome {
    font-family: "Dancing Script", cursive;
    font-optical-sizing: auto;
    font-weight: 700;
    font-style: normal;
}

.contenting {
    width: 50%;
    padding: 40px;
    background-color: #3b3d42;
    border-radius: 10px;

}

.contenting > h1 {
    margin-top: 10px;
    font-size: 30px;
    margin-bottom: 20px;
}

#home-container:first-child {
    margin-top: 20px;
}

#home-container > * {
    margin-top: 20px;
    width: 80%;
    border-radius: 9px;
    overflow: hidden;
}


button {
    border-radius: 4px;
    background-color: #5ca1e1;
    text-align: center;
    padding: 16px;
    width: 300px;
    transition: all 0.5s;
    cursor: pointer;
    margin: 36px 36px 36px 0;
    box-shadow: 0 10px 20px -8px rgba(0, 0, 0,.7);
}

button{
    cursor: pointer;
    display: inline-block;
    position: relative;
    transition: 0.5s;
}

button:after {
    content: '»';
    position: absolute;
    opacity: 0;  
    top: 14px;
    right: -20px;
    transition: 0.5s;
}

button:hover{
    padding-right: 24px;
    padding-left:8px;
}

button:hover:after {
    opacity: 1;
    right: 10px;
}


</style>