//precision mediump float;

uniform vec3 uColor;
uniform sampler2D uTexture;

//varying float vRandom;
varying vec2 vUv;
varying float vElevation;

void main(){
    // can enable transparency here. dont forget toset transparent to true in the js
    vec4 textureColor = texture2D(uTexture, vUv );
    textureColor.rgb *= vElevation * 2.0 + 0.5;
    gl_FragColor = textureColor;
}