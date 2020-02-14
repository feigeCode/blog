<template>
    <div>
        <el-table
            :data="data.user.filter(data => !search || data.username.toLowerCase().includes(search.toLowerCase()))"
            style="width: 100%">
            <el-table-column
            label="用户ID"
            width="100">
            <template slot-scope="scope">
                <div slot="reference" class="name-wrapper">
                    <el-tag size="medium">{{ scope.row.id }}</el-tag>
                </div>
            </template>
            </el-table-column>
            <el-table-column
            label="用户名"
            width="100">
            <template slot-scope="scope">
                <div slot="reference" class="name-wrapper">
                    <el-tag size="medium">{{ scope.row.username }}</el-tag>
                </div>
            </template>
            </el-table-column>
            <el-table-column
            label="邮箱"
            min-width="100">
            <template slot-scope="scope">
                <span style="margin-left: 10px">{{ scope.row.email }}</span>
            </template>
            </el-table-column>
            <el-table-column
            label="密码"
            min-width="100">
            <template slot-scope="scope">
                <span style="margin-left: 10px">{{ scope.row.password }}</span>
            </template>
            </el-table-column>
            <el-table-column
            label="性别"
            min-width="50">
            <template slot-scope="scope">
                <span style="margin-left: 10px">{{ scope.row.sex | numSex}}</span>
            </template>
            </el-table-column>
            <el-table-column
            label="注册时间"
            min-width="180">
            <template slot-scope="scope">
                <span style="margin-left: 10px">{{ format(scope.row.time, "yyyy-MM-dd HH:mm:ss") }}</span>
            </template>
            </el-table-column>
            <el-table-column
      align="right" width="199">
      <template slot="header" slot-scope="">
        <el-input
          v-model="search"
          size="mini"
          placeholder="输入用户名搜索"/>
      </template>
      <template slot-scope="scope">
        <el-button
          size="mini"
          @click="handleEdit(scope.$index, scope.row)">Edit</el-button>
        <el-button
          size="mini"
          type="danger"
          @click="handleDelete(scope.$index, scope.row)">Delete</el-button>
      </template>
    </el-table-column>
        </el-table>
        <div class="block">
            <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="currentPage"
            :page-sizes="[10, 30, 50, 100]"
            :page-size="count"
            layout="total, sizes, prev, pager, next, jumper"
            :total="data.total">
            </el-pagination>
        </div>
        <el-drawer
        title="修改用户"
        :before-close="handleClose"
        :visible.sync="dialog"
        direction="ltr"
        custom-class="demo-drawer"
        ref="drawer">
        <div class="demo-drawer__content">
            <el-form :model="form" label-width="100px" class="demo-ruleForm">
                <el-input type="hidden" v-model="form.id" autocomplete="off"></el-input>
                <el-form-item label="用户名" prop="username">
                    <el-input type="text" v-model="form.username" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="邮箱" prop="email">
                    <el-input type="email" v-model="form.email" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="密码" prop="password">
                    <el-input type="text" v-model="form.password" autocomplete="off"></el-input>
                </el-form-item>
                <span>性别</span>
                <el-radio-group v-model="form.sex" style="align:center;">
                    <el-radio-button label="1">男</el-radio-button>
                    <el-radio-button label="0">女</el-radio-button>
                </el-radio-group>
                <el-form-item label="注册时间" style="margin-top:10px;">
                <el-col :span="11">
                    <el-date-picker
                    v-model="form.time"
                    type="datetime"
                    align="left"
                    format="yyyy-MM-dd HH:mm:ss"
                    :picker-options="pickerOptions">
                    </el-date-picker>
                </el-col>
            </el-form-item>
            </el-form>
            <div class="demo-drawer__footer">
            <el-button @click="cancelForm">取 消</el-button>
            <el-button type="primary" @click="$refs.drawer.closeDrawer()" :loading="loading">{{ loading ? '提交中 ...' : '确 定' }}</el-button>
            </div>
        </div>
        </el-drawer>
    </div>
</template>

<script>

export default {
    name: "user",
    data() {
      return {
           pickerOptions: {
          shortcuts: [{
            text: '今天',
            onClick(picker) {
              picker.$emit('pick', new Date());
            }
          }, {
            text: '昨天',
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24);
              picker.$emit('pick', date);
            }
          }, {
            text: '一周前',
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
              picker.$emit('pick', date);
            }
          }]
        },
        data: {
            total:0,
            user:[]
        },
        search:'',
        currentPage: 1,
        count:10,
        dialog: false,
        loading: false,
        form: {
        id:0,
        username: '',
        email: '',
        password: '',
        sex: 1,
        time: '',
      },
      formLabelWidth: '80px',
      timer: null,
      };
    },
     created() {
        this.$axios.get("http://localhost:8080/user/getUsers",{
            params: {
                page:this.currentPage,
                count:this.count
            }
        }).then((response)=> {
            this.data = response.data;
            }).catch((error)=>{
                console.log(error)
                })
    },
    methods: {
      //封装时间格式
      format(time, format) {
        var t = new Date(time);
        var tf = function (i) {
          return (i < 10 ? '0' : '') + i
        };
        return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function (a) {
          switch (a) {
            case 'yyyy':
              return tf(t.getFullYear());
              break;
            case 'MM':
              return tf(t.getMonth() + 1);
              break;
            case 'mm':
              return tf(t.getMinutes());
              break;
            case 'dd':
              return tf(t.getDate());
              break;
            case 'HH':
              return tf(t.getHours());
              break;
            case 'ss':
              return tf(t.getSeconds());
              break;
          }
        })
      },
      handleEdit(index, row) {
          this.dialog = true;
          this.form = row;
      },
      handleDelete(index, row) {
        this.$confirm("真的删除么？").then((_) => {
              this.$axios.get("http://localhost:8080/user/deleteUser",{
                  params: {
                    username: row.username
                  }
                }).then((reponse) => {
                  if(reponse.data){
                    alert("删除成功！");
                  }else{
                    alert("删除失败！");
                  }
                }).catch((err) => {
                  console.log(err);
                });
        }).catch((_) => {
          console.log(_);
        })
        
      },
      handleSizeChange(val) {
          this.count = val;
          this.$axios.get("http://localhost:8080/user/getUsers",{
            params: {
                page:this.currentPage,
                count:this.count
            }
        }).then((response)=> {
            this.data = response.data;
            }).catch((error)=>{
                console.log(error);
                })
      },
      handleCurrentChange(val) {
          this.currentPage = val;
          this.$axios.get("http://localhost:8080/user/getUsers",{
            params: {
                page:this.currentPage,
                count:this.count
            }
        }).then((response)=> {
            this.data = response.data;
            }).catch((error)=>{
                console.log(error);
                });
      },
      handleClose(done) {
      if (this.loading) {
        return;
      }
      this.$confirm('确定要修改用户吗？')
        .then(_ => {
          this.$axios.get("http://localhost:8080/user/updateUser",{
            params: {
              id: this.form.id,
              username: this.form.username,
              email: this.form.email,
              password: this.form.password,
              sex: this.form.sex,
              time: this.format(this.form.time, "yyyy-MM-dd HH:mm:ss")
            }
          }).then((reponse) => {
            if(reponse.data){
              alert("修改成功！");
            }else{
              alert("修改失败！");
            }
          }).catch((err) =>{
            console.log(err);
          });
          this.loading = true;
          this.timer = setTimeout(() => {
            done();
            // 动画关闭需要一定的时间
            setTimeout(() => {
              this.loading = false;
            }, 400);
          }, 2000);
        })
        .catch(_ => {});
    },
    cancelForm() {
      this.loading = false;
      this.dialog = false;
      clearTimeout(this.timer);
    }
    },
    filters: {
        numSex:function(sex) {
            if(sex){
                return '男';
            }else{
                return '女';
            }
        }
    }
}

</script>

<style scoped>

</style>