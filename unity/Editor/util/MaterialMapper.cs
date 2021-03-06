using UnityEngine;

public class MaterialMapper
{
	public static string GetJ3DRenderer (Material m, Transform t)
	{
		int i = t.gameObject.GetComponent<Renderer>().lightmapIndex;
		if (t.gameObject.isStatic && i < 255 && i > -1)
			return "Lightmapped";

		/*
		if(m.shader.name.IndexOf("Self-Illumin") > -1 || m.shader.name.IndexOf("Unlit") > -1) return "diffuse";
		if(m.shader.name == "VertexLit") return "diffuse";
		*/
		
		return NamesUtil.CleanLc(m.shader.name);
	}
	
	public static string GetJ3DTextureName (string t)
	{
		switch (t) {
		case "_MainTex":
			return "colorTexture";
		default:
			return "colorTexture";
		}
	}
}

