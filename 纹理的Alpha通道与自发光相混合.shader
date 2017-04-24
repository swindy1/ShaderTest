Shader "swindy的shader编程/纹理的Alpha通道与自发光相混合" {
	Properties {
		_IlluminCol ("自发光(RGB)", Color) = (1,1,1,1)  
		_MainTex("主纹理",2D)="white"{}
	}
	SubShader {
	Pass{
	    //设置白色的顶点光照
		Material{

			Diffuse(1,1,1,1)
			Ambient(1,1,1,1)
		}
		//开启光照
		Lighting On

		//SetTexture为分配一个纹理
		//使用纹理的Alpha通道来插值混合颜色（1，1，1，1）
		//{}中为纹理块操作，可以执行3种操作，合并操作，矩阵操作、与常量颜色进行混合操作
		//Previous 是上一次SetTexture的结果
		//Constant是被ConstantColor定义的颜色
		//Texture是在SetTexture中被定义的纹理的颜色
		SetTexture[_MainTex]{
		constantColor [_IlluminCol]
			combine constant lerp(texture) previous
		}
		//和纹理相乘
		SetTexture[_MainTex]{
			combine texture * previous
		}

	    }
	}
	FallBack "Diffuse"
}
