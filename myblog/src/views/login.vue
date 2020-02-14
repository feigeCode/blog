<template>
  <div>
    <div id="mountNode">
      <div class="user-login" style="position: relative; height: 100vh;">
        <div class="background"></div>
        <div class="content-wrapper">
          <h2 class="slogan">
            欢迎使用
            <br />FEIGE博客后台管理系统
          </h2>
          <div
            style="display: flex; justify-content: center; flex-direction: column; padding: 30px 40px; background: rgb(255, 255, 255); border-radius: 6px; box-shadow: rgb(238, 238, 238) 1px 1px 2px;"
          >
            <h4
              style="margin: 0px 0px 20px; text-align: center; color: rgb(48, 128, 254); letter-spacing: 12px;"
            >登录</h4>
            <div>
              <div
                dir="ltr"
                role="row"
                class="next-row"
                style="position: relative; margin-bottom: 25px; flex-direction: column;"
              >
                <div dir="ltr" role="gridcell" class="next-col">
                  <span class="next-input next-medium">
                    <input
                      placeholder="管理员号"
                      maxlength="20"
                      height="100%"
                      autocomplete="off"
                      value
                    />
                  </span>
                </div>
                <div dir="ltr" role="gridcell" class="next-col"></div>
              </div>
              <div
                dir="ltr"
                role="row"
                class="next-row"
                style="position: relative; margin-bottom: 25px; flex-direction: column;"
              >
                <div dir="ltr" role="gridcell" class="next-col">
                  <span class="next-input next-medium">
                    <input placeholder="密码" height="100%" type="password" autocomplete="off" value />
                  </span>
                </div>
                <div dir="ltr" role="gridcell" class="next-col"></div>
              </div>
              <div
                dir="ltr"
                role="row"
                class="next-row"
                style="position: relative; margin-bottom: 25px; flex-direction: column;"
              >
                <div dir="ltr" role="gridcell" class="next-col">
                  <label class="next-checkbox-wrapper" style="margin-left: 5px;">
                    <span class="next-checkbox">
                      <span class="next-checkbox-inner">
                        <i class="next-icon next-icon-select next-xs"></i>
                      </span>
                      <input type="checkbox" aria-checked="false" class="next-checkbox-input" />
                    </span>
                    <span class="next-checkbox-label">记住账号</span>
                  </label>
                </div>
              </div>
              <div
                dir="ltr"
                role="row"
                class="next-row"
                style="position: relative; margin-bottom: 25px; flex-direction: column;"
              >
                <button
                  type="button"
                  class="next-btn next-medium next-btn-primary"
                  style="width: 240px; background: rgb(48, 128, 254); border-radius: 28px;"
                >登 录</button>
              </div>
              <div dir="ltr" role="row" class="next-row tips" style="text-align: center;">
                <a
                  href="#"
                  style="color: rgb(153, 153, 153); text-decoration: none; font-size: 13px;"
                >立即注册</a>
                <span style="color: rgb(220, 214, 214); margin: 0px 8px;">|</span>
                <a
                  href="#"
                  style="color: rgb(153, 153, 153); text-decoration: none; font-size: 13px;"
                >忘记密码</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>


<script>
import '../../static/css/index.css';
export default {
    "name":'login',
    data() {
        return {

        }
    }
}
</script>

<style  scoped>
    .background{
        position: absolute; 
        top: 0px; 
        left: 0px; 
        right: 0px;
        bottom: 0px;
        background-size: cover;
        background-image: url("../assets/1.png");
    }
</style>