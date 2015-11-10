vec3 diffuse(vec3 n, vec3 l, vec3 c) {
	return max(0.0, dot(l, n)) * c;
}

vec3 hemisphere(vec3 n, vec3 l, vec3 c) {
	return (dot(l, n) * 0.5 + 0.5) * c;
}

vec3 specular(vec3 n, vec3 v, vec3 l, vec3 c, float sh, float i) {
	return pow(max(0.0, dot(reflect(l, n), v)), sh) * c * i;
}

float brightness(vec3 c) {
	return c.r * 0.2126 + c.g * 0.7152 + c.b * 0.0722;
}