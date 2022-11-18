## VCN A

resource "oci_core_vcn" "vcn_a" {
  dns_label      = "internal"
  cidr_block     = var.cidr_block_vcn_a
  compartment_id = var.compartment_id
  display_name   = var.vcn_name_a
}

## IGW A

resource "oci_core_internet_gateway" "igw_1" {
    #Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn_a.id

    #Optional
    display_name = var.internet_gateway_display_name_a
    # route_table_id = oci_core_route_table.route_table_a.id
}

## ROUTE TABLE A

resource "oci_core_route_table" "route_table_a" {
    #Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn_a.id

    #Optional
    display_name = var.route_table_display_name_a
    route_rules {
        #Required
        network_entity_id = oci_core_local_peering_gateway.test_local_peering_gateway_a.id

        #Optional
        description = "VCN A TO VCN B"
        destination = var.cidr_block_vcn_b
    }
    route_rules {
        network_entity_id = oci_core_internet_gateway.igw_1.id
        description = "IGW to the world."
        destination = var.open_to_the_world

    }
}

## SUBNET A

resource "oci_core_subnet" "subnet_a" {
    #Required
    cidr_block = var.subnet_a_cidr_block
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn_a.id

    #Optional
    display_name = var.subnet_a_display_name
    route_table_id = oci_core_route_table.route_table_a.id
    security_list_ids = [oci_core_security_list.security_list_a.id]
}

## SECURITY LIST A

resource "oci_core_security_list" "security_list_a" {
    #Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn_a.id
    display_name = var.security_list_name_a

    #Optional
    egress_security_rules {
        #Required
        destination = var.open_to_the_world
        protocol = "all"
    }
    ingress_security_rules {
        #Required
        protocol = "6"
        source = var.open_to_the_world
        tcp_options {
            min = "22"
            max = "22"
        } 
    }
}

## VNC B

resource "oci_core_vcn" "vcn_b" {
  dns_label      = "internal"
  cidr_block     = var.cidr_block_vcn_b
  compartment_id = var.compartment_id
  display_name   = var.vcn_name_b
}

## IGW 2

resource "oci_core_internet_gateway" "igw_2" {
    #Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn_b.id

    #Optional
    display_name = var.internet_gateway_display_name_b
    # route_table_id = oci_core_route_table.route_table_a.id
}

## ROUTE TABLE B

resource "oci_core_route_table" "route_table_b" {
    #Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn_b.id

    #Optional
    display_name = var.route_table_display_name_b
    route_rules {
        #Required
        network_entity_id = oci_core_local_peering_gateway.test_local_peering_gateway_b.id

        #Optional
        description = "VCN B TO VCN A"
        destination = var.cidr_block_vcn_a
    }
    route_rules {
        network_entity_id = oci_core_internet_gateway.igw_2.id
        description = "IGW to the world."
        destination = var.open_to_the_world
    }
}

## SUBNET B

resource "oci_core_subnet" "subnet_b" {
    #Required
    cidr_block = var.subnet_b_cidr_block
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn_b.id

    #Optional
    display_name = var.subnet_b_display_name
    route_table_id = oci_core_route_table.route_table_b.id
    security_list_ids = [oci_core_security_list.security_list_b.id]
}

## SECURITY LIST A

resource "oci_core_security_list" "security_list_b" {
    #Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn_b.id
    display_name = var.security_list_name_b

    #Optional
    egress_security_rules {
        #Required
        destination = var.open_to_the_world
        protocol = "all"
    }
    ingress_security_rules {
        #Required
        protocol = "6"
        source = var.subnet_a_cidr_block
        tcp_options {
            min = "22"
            max = "22"
        }
    }
}


## Local Peering Gateway

resource "oci_core_local_peering_gateway" "test_local_peering_gateway_a" {
    #Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn_a.id

    display_name = var.local_peering_gateway_display_name_a
    peer_id = oci_core_local_peering_gateway.test_local_peering_gateway_b.id
}

resource "oci_core_local_peering_gateway" "test_local_peering_gateway_b" {
    #Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn_b.id

    display_name = var.local_peering_gateway_display_name_b
}
