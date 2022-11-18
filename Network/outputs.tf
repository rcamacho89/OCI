output vcn_a_id {
  value       = oci_core_vcn.vcn_a.id
  description = "The VCN 1 OCID."
}

output vcn_b_id {
  value       = oci_core_vcn.vcn_b.id
  description = "The VCN 2 OCID."
}

output lpg_1 {
    value   = oci_core_local_peering_gateway.test_local_peering_gateway_a.id
    description = "The LPG-1 OCID."
}

output lpg_2 {
    value   = oci_core_local_peering_gateway.test_local_peering_gateway_b.id
    description = "The LPG-2 OCID."
}

output igw_1 {
    value = oci_core_internet_gateway.igw_1.id
    description = "The IGW-1 OCID."    
}

output igw_2 {
    value = oci_core_internet_gateway.igw_2.id
    description = "The IGW-2 OCID."    
}

output route_table_a {
    value = oci_core_route_table.route_table_a.id
    description = "The Route Table A OCID."
}

output route_table_b {
    value = oci_core_route_table.route_table_b.id
    description = "The Route Table B OCID."
}
