//#name Reflective
//#description Based on Cg tutorial: http://http.developer.nvidia.com/CgTutorial/cg_tutorial_chapter07.html
//#author bartekd

// shader.glsl
//#vertex
attribute vec3 aNormal;
attribute vec3 aPosition;

uniform mat4 uMatrix;
uniform mat4 uViewMatrix;
uniform mat4 uProjection;
uniform mat3 uNormalMatrix;

uniform vec3 uEyePosition;

varying vec3 vRefVec;
     
void main() {

	vec4 mPosition = uMatrix * vec4(aPosition, 1.0);
	vec3 normal = normalize(uNormalMatrix * aNormal);
	vec3 incident = normalize(mPosition.xyz - uEyePosition);
	vRefVec = reflect(incident, normal);

	vec4 mvPosition = uViewMatrix * vec4(aPosition, 1.0);
	gl_Position = uProjection * mvPosition;
}

//#fragment
#ifdef GL_ES
precision highp float;
#endif

uniform samplerCube uCubemap;
uniform vec3 uColor;

varying vec3 vRefVec;

void main(void) {
	vec3 rf = vRefVec;
	vec3 t = textureCube(uCubemap, rf).rgb;
	vec3 c = uColor;

	gl_FragColor = vec4(t + c, 1.0);
}