//uniform mat4 projectionMatrix; //transform coordinates into clip space coordinates
//uniform mat4 viewMatrix; // apply transformation relative to the camera 
//uniform mat4 modelMatrix; // apply transformation relative to the mesh
//uniform mat4 modelViewMatrix; // can exist and combine view/model
uniform vec2 uFrequency;
uniform float uTime;


//attribute vec3 position;
attribute float aRandom;
//attribute vec2 uv;

varying vec2 vUv;
varying float vElevation;

// varying float vRandom;

void main()
{
    //cant do console.log('etc'), this is gpu not cpu
    //float foobar = 0.123;
    // int a => float(a)
    //empty vecX() needs 0.0 in it. otherwise it will not work
    // vec3(0.0).r / .g / .b OR vec3(0.0).x / .y / .z
    // vec2 foo = new vec2(0.0); => vec3 bar = new vec3((foo), 0.0)
    // vec3 bar = new vec3(1.0,2.0,3.0) => vec2 foo = bar.xy OR bar.xz // CALLED SWIZZLE
    //vec4 has xyzw and rgba
    // gl_Position is a vec4 
    //gl_Position.x += 0.5; // moves the position

    vec4 modelPosition = modelMatrix* vec4(position, 1.0);

    float elevation = sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
    elevation += sin(modelPosition.y * uFrequency.y - uTime) * 0.1;

    modelPosition.z += elevation;

   // modelPosition.z += aRandom * 0.1;
    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

//    gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);

//vRandom = aRandom;
vUv = uv;
vElevation = elevation;
} 