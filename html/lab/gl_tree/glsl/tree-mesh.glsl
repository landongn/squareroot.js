// normal2color.glsl
//#vertex
attribute vec3 aPosition;
attribute vec3 aNormal;

uniform mat4 uMatrix;
uniform mat4 uViewMatrix;
uniform mat4 uProjection;
uniform mat3 uNormalMatrix;

varying vec3 vNormal;
varying float vZ;
     
void main() {
	vNormal = normalize(uNormalMatrix * aNormal);
	gl_Position = uProjection * uViewMatrix * vec4(aPosition, 1.0);
	vZ = gl_Position.z;
}

//#fragment
precision mediump float;
               
uniform vec3 uColor;
uniform vec3 uDarkness;

uniform float uFogStart;
uniform float uFogEnd;

varying vec3 vNormal;
varying float vZ;

//#include sphar-data
//#include sphar
           
void main() {
	float w = (vZ - uFogStart) / (uFogEnd - uFogStart);
	w = min(1.0, w);
	gl_FragColor = vec4(mix(uColor * sphericalHarmonics(vNormal), uDarkness, w), 1.0);
}