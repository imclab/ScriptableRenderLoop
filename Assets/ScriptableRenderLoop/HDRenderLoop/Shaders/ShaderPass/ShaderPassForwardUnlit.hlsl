#if SHADER_STAGE_FRAGMENT

float4 Frag(PackedVaryings packedInput) : SV_Target
{
	Varyings input = UnpackVaryings(packedInput);

	SurfaceData surfaceData;
	BuiltinData builtinData;
	GetSurfaceAndBuiltinData(input, surfaceData, builtinData);
	
	// Not lit here (but emissive is allowed)

	BSDFData bsdfData = ConvertSurfaceDataToBSDFData(surfaceData);
		
	// TODO: we must not access bsdfData here, it break the genericity of the code!
	return float4(bsdfData.color, builtinData.opacity);
}

#endif