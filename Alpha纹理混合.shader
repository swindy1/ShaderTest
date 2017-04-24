Shader "swindy的shader编程/NewSurfaceShader" {
	Properties {
		_MainTex("主纹理",2D)="white"{}
		_BlendTex("混合纹理",2D)="white"{}
	}
	SubShader {
		Pass{
			//【1】应用主纹理  
			SetTexture[_MainTex]{combine texture }
			//【1】应用混合纹理  
			SetTexture[_BlendTex]{combine texture*previous}
		}
	}
	FallBack "Diffuse"
}
