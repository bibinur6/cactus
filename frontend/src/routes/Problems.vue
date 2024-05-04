<script>
    import axios from 'axios'


    export default {
        data () {
            return {
                responded_data: "",
                sorted_data: {},
                enteredName: "",

                userName: localStorage.getItem('userName')
            }
        },
        methods: {
            goTo (path) {
                this.$router.push({path: `problems/${path}`, params: {title: "hi", userName:"Almas"}})
            },
            sortData() {
                console.log(this.responded_data);
              this.sorted_data = this.responded_data.slice().sort((a, b) => a.id - b.id)
            },
            setName() {
                localStorage.setItem("userName", this.enteredName);
                setTimeout(() => {
                window.location.reload();
              }, 100);
            }
        },
        created () {
            axios.get('http://localhost:8000/api/questions').then(res => {
            // axios.get('http://localhost:3233/').then(res => {
            
                this.responded_data = res.data
                this.sortData();

            }).catch(err => {
                console.log(err)
            }).then(this.toComplement)
        }
    }
</script>

<template>

    <div id="problems-container" v-if="userName" class="w-full flex flex-col items-center">

        <div class="w-full">

            <table id="problem-list" class="w-full">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Difficult</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="h-[30px]" v-for="item in sorted_data" :key="item.id" :class="{ 'bg-[#333]': item.id % 2 === 0 }">
                        <td class="pl-8 text-[#6595ee] hover:cursor-pointer hover:underline" @click="goTo(item.id)">{{ item.title }}</td>
                        <td class="pl-8" :class="{ 
                        'text-red-800': item.difficultyLevel === 'hard',
                        'text-yellow-600': item.difficultyLevel === 'normal',
                        'text-green-400': item.difficultyLevel === 'easy'
                        }">{{ item.difficultyLevel }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div v-if="!userName" class="w-full flex flex-col items-center justify-center h-[600px]">

        <div class="container">
    <div class="inner-box">
        <p>Enter your name</p>
        <input type="text" class="input-field" placeholder="Enter your name" v-model="enteredName">
        <button class="w-[200px] h-[40px] bg-green-600 mt-4 rounded-[10px]" @click="setName">Submit</button>
    </div>
</div>
</div>

</template>


<style>

.container {
  width: 100%;
  display: flex;
  justify-content: center;
}

/* Styles for the inner box */
.inner-box {
  width: 400px;
  height: 200px;
  background-color: #333;
  display: flex;
  color: black;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Styles for the paragraph */
.inner-box p {
  color: #fff;
  font-size: 18px;
  margin-bottom: 10px;
}

/* Styles for the input field */
.input-field {
  width: 80%;
  padding: 10px;
  border: none;
  border-radius: 5px;
  font-size: 16px;
  outline: none;
  background-color: #eee;
}

/* Styles for the input field placeholder */
.input-field::placeholder {
  color: black;
}

/* Styles for the input field on focus */
.input-field:focus {
  background-color: #fff;
}

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
