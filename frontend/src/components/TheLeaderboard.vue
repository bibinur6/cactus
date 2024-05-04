<template>

<div class="w-full min-h-[80vh] flex justify-center">

<div class=" w-[96%] flex flex-wrap flex-row justify-between">

    <div id="problems-container" class="w-full flex flex-col items-center">

        <div class="w-full">

            <table id="problem-list" class="w-full">
                <thead>
                    <tr>
                        <th class="w-[30px] flex justify-center items-center"><i class="fa-solid fa-ranking-star"></i></th>
                        <th>Name</th>
                        <th>Point</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="h-[30px]" v-for="leader in leaderboard" :key="leader.id" :class="{ 'bg-[#333]': leader.id % 2 === 0 }">
                        <td class="pl-8" :class="{ 
                            'text-red-800': leader.difficultyLevel == 'hard',
                            'text-yellow-600': leader.difficultyLevel == 'middle', 
                            'text-green-400': leader.difficultyLevel == 'easy'
                        }">{{ leader.name }}</td>
                        <td class="pl-8 text-[#6595ee] hover:cursor-pointer hover:underline">{{ leader.orderReachedPoint }}</td>
                        <td class="pl-8 text-[#6595ee] hover:cursor-pointer hover:underline">{{ leader.points }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>

</div>

</template>


<script>
import axios from 'axios';


    export default {
        props: {
            contest: {
                type: Object,
                required: true
            }
        },
        
        data() {
            return {
                leaderboard: {}
            }
        },
        methods: {
            getData() {
                // axios.get('http://localhost:8080/codecraft/api/contest/get', {roomId: localStorage.getItem("roomID")}).then(res => {
                axios.get('http://localhost:8080/codecraft/api/contest/get', {roomId: localStorage.getItem("roomID")}).then(res => {
                    this.leaderboard = res.data.leaderBoard
                })
                .catch(err => {
                    console.log(err)
                })
            }
        },  

        mounted() {
            this.getData()

            this.getDataPerMin = setInterval(() => {
                this.getData();
                console.log("HI")
            }, 6000)

        },

        beforeDestroy() {
            clearInterval(this.getDataPerMin)
        },

    }

</script>






<style scoped>

#problems-container > :first-child {
    margin-top: 120px;
}

#problems-container > * {
    margin-top: 20px;
    width: 90%;
    border-radius: 5px;
}

thead {
    background-color: rgb(183, 0, 255);
}

#problem-list th, #problem-list td {
    height: 30px;
}


</style>