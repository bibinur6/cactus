<template>

<div id="problems-container" class="w-full flex flex-col items-center">
        <div class="text-[35px] bg-[#333] pl-4 ">
            <h1 class="border-b-[2px] border-b-[aliceblue]">Problems</h1>
        </div>

        <div class="w-full">
            <table id="problem-list" class="w-full">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Difficult</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="h-[30px]" v-for="item in contest.questions" :key="item.id" :class="{ 'bg-[#333]': item.id % 2 === 0 }">
                        <td class="pl-8 text-[#6595ee] hover:cursor-pointer hover:underline" @click="goTo(item.title)">{{ item.title }}</td>
                        <td class="pl-8" :class="{ 
                        'text-red-800': item.difficultyLevel == 'hard',
                        'text-yellow-600': item.difficultyLevel == 'middle', 
                        'text-green-400': item.difficultyLevel == 'easy'
                        }">{{ item.difficultyLevel }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

</template>


<script>


export default {
    props: {
        contest: {
            type: Object,
            required: true
        }
    },
    methods: {
        goTo (path) {
            this.$router.push("" + path)
        },
    },
}

</script>







<style>
#problems-container > :first-child {
    margin-top: 50px;
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