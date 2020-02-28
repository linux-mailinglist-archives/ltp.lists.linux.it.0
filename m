Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB45817319D
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 08:14:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 508533C6AE3
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 08:14:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 1649C3C22CB
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 08:14:26 +0100 (CET)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390112.outbound.protection.outlook.com [40.107.139.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 015511A01D78
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 08:14:24 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+B7uTFHdAe3tqywrKODKMHW52xHSi+o03T69GQVwKM1W8eayzfYuiO5mR72t4K0tngXNpYKoA/hUB3y0AkBOMdEI2pVMxh1fjo4ayvfVFm/oewm+IdzKqtZzEduHDQVvwYVu8MaWcdHuHSCr9Fex554w7JTUcLdc3crOnzk3ycqxRrlRENLqQPTNvPgIGtAvDsvYfnIB/Fo/JUsHM1TAQ2qJQvCD2+9yXMaG4YBYfiApajIlklkEM14Cm/dHPLkUK+O86KkmwE+FEYsOdmtzBB9/i/7B2SbIW49KBl2xmDa8eiEFu9lIMu4yPFM5J877iqun18obbwycE2yfiv+YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WG/q4Co2IOISXxbB//hk2/TjI1SkxzwJRBuoMM8I2M=;
 b=CQspNhmPFWQPCOoHq3wmZlGhkHVe3Ub9XcTTNRuxFl0S9hhpwzEE/JpSd80LVLCL5VT0H6e2zAgRVgT8C7ik5tDfnmDX8ZoFBZROepDI1byQtSVmbLSMyG0byb8dQWrw7U+rUHcJBOp7bXXSt6I0R1+x0iy/LC2QIpNxsNe3KH16SbIcydyIoF7/B6eDxvin4WH9mVeqUzjmCnwbWP+GbClPauhnvp37iXDGkTActiWrGe1KSSJR4Hy4pJ71+oYLBwBqiVnxQiavFu3ymhP/Y+jE9YjBGGm8vRSUv3YCCqRYX56xUujyb6OtNDDEIIRF98J6SfFx8sP1ZVNQb5t08Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WG/q4Co2IOISXxbB//hk2/TjI1SkxzwJRBuoMM8I2M=;
 b=wWX/+0cznvbyRDNVrWsljpNejl9yqhA2COBO+0PZu7an/U0aEw//B5XoBxjXyDjsYJS6hnp+mpCbqfNLxPcZPenyRltLy5tEns6tk57rMZcwcKclfU8r5An3sTAF36oEh3gdJSRwTx3dmgBWSB2AiH0CDKJV/VBPBXf2KvVjsOY=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1482.INDPRD01.PROD.OUTLOOK.COM (52.134.128.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Fri, 28 Feb 2020 07:14:21 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7%12]) with mapi id 15.20.2750.024; Fri, 28 Feb
 2020 07:14:21 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: netns_netlink test failure
Thread-Index: AQHV7gWTY21LVV77S0ewHm9hor5oPw==
Date: Fri, 28 Feb 2020 07:14:21 +0000
Message-ID: <MAXPR0101MB14681590CE13BB4E2ED97CFEEEE80@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [14.98.179.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7aec2dc9-2df0-4d68-729f-08d7bc1dd53e
x-ms-traffictypediagnostic: MAXPR0101MB1482:
x-microsoft-antispam-prvs: <MAXPR0101MB1482EF74C3517266C62C57A5EEE80@MAXPR0101MB1482.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0327618309
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39830400003)(376002)(396003)(366004)(346002)(199004)(189003)(30864003)(66946007)(9686003)(76116006)(55016002)(7696005)(6916009)(508600001)(7116003)(5660300002)(52536014)(66556008)(66574012)(86362001)(81156014)(81166006)(64756008)(66446008)(71200400001)(8936002)(66476007)(6506007)(55236004)(186003)(8676002)(19627405001)(33656002)(316002)(26005)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MAXPR0101MB1482;
 H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QepR8ciLQU+rH0LlZ1g6LPA67SBX45oO2A+3rNzWdvMeMauiQRi2H4jidvOn6s/lGdr/RLTAfg8jswYJ2a3/2X6JcdceHQ2eaS3R+vakY3d6gLD6a8as6YB7uAiyx1cUj1MbR6Pz6gNk9pi70n55LgMIF128/mhj3Lcoq/tp6AsX+ib8YPFz5RI1chNWiPozyYN6tXS5qNZfTxoIUqMma3Rlsbd+dcEDk75Xzdv3byrCKEqOOfx4skJxDC8TPNtOsC60RNpnMfLGD6EjvjkUarAgaKreo/sRppGVyeMbIDGXHiY4Ae+uF42HcqiOS1CTG4JPIvsFfvvQwsHtJ6ES0KDsypiFf7eQs9yEGlz+t7t3SA1DOP0i1ff8pdb/fMHJHAmp85Qpg9c32f1nGBOxQbT3cVJVJNITy4M0MG5ZRVx+Hfzz/25eJOxaAr98kXDO
x-ms-exchange-antispam-messagedata: NmoYsn3NzBCD86zKuJBUYN3wG2YE+Z6hdpjqg+JgYv1aVpG9yj/1FJVcxr9zDHD6gqUa76Sc8Wf/3FaIjfdI1w0gf1+tiGS1PfbA9owMg1jCx2n4x3Lmgzq0Psw6UZTTQoZ/9xZTr80CVZ//98ZhFg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aec2dc9-2df0-4d68-729f-08d7bc1dd53e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2020 07:14:21.1848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2+7pEVWvMjZZagNnx+x5l8PT3oPclYlnhfRR2WxshZJ6nl7hfQIVzEnCdwl2HmrsWgkIDQx1bIvcw1So9kMeJo3CgWVqmqM3B4X2P4G1+3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1482
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS,UPPERCASE_50_75 autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] netns_netlink test failure
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2004566515=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2004566515==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB14681590CE13BB4E2ED97CFEEEE80MAXPR0101MB1468_"

--_000_MAXPR0101MB14681590CE13BB4E2ED97CFEEEE80MAXPR0101MB1468_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I am trying to run networking test on RISCv with linux 5.4.3,Yocto i am get=
ting failure in netns_netlink and getaddrinfo_01
$./runltp -f containers netns_netlink

cmdline=3D"netns_netlink"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
open: No such file or directory
netns_netlink    1  TBROK  :  netns_netlink.c:143: system() failed
netns_netlink    2  TBROK  :  netns_netlink.c:143: Remaining cases broken
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D2 corefile=3Dno
cutime=3D0 cstime=3D3
<<<test_end>>>

I have enabled follwiong configurationi am i missing any configuration to b=
e enabled??Kindly suggest

CONFIG_NET=3Dy
CONFIG_NET_INGRESS=3Dy
CONFIG_SKB_EXTENSIONS=3Dy

#
# Networking options
#
CONFIG_PACKET=3Dy
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=3Dy
CONFIG_UNIX_SCM=3Dy
# CONFIG_UNIX_DIAG is not set
# CONFIG_TLS is not set
# CONFIG_XFRM_USER is not set
# CONFIG_NET_KEY is not set
# CONFIG_XDP_SOCKETS is not set
CONFIG_INET=3Dy
CONFIG_IP_MULTICAST=3Dy
CONFIG_IP_ADVANCED_ROUTER=3Dy
# CONFIG_IP_FIB_TRIE_STATS is not set
# CONFIG_IP_MULTIPLE_TABLES is not set
# CONFIG_IP_ROUTE_MULTIPATH is not set
# CONFIG_IP_ROUTE_VERBOSE is not set
CONFIG_IP_PNP=3Dy
CONFIG_IP_PNP_DHCP=3Dy
CONFIG_IP_PNP_BOOTP=3Dy
CONFIG_IP_PNP_RARP=3Dy
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
CONFIG_NET_IP_TUNNEL=3Dy
# CONFIG_IP_MROUTE is not set
CONFIG_SYN_COOKIES=3Dy
# CONFIG_NET_IPVTI is not set
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_TUNNEL=3Dy
CONFIG_INET_DIAG=3Dy
CONFIG_INET_TCP_DIAG=3Dy
# CONFIG_INET_UDP_DIAG is not set
# CONFIG_INET_RAW_DIAG is not set
# CONFIG_INET_DIAG_DESTROY is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=3Dy
CONFIG_DEFAULT_TCP_CONG=3D"cubic"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=3Dy
# CONFIG_IPV6_ROUTER_PREF is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
# CONFIG_INET6_AH is not set
# CONFIG_INET6_ESP is not set
# CONFIG_INET6_IPCOMP is not set
# CONFIG_IPV6_MIP6 is not set
# CONFIG_IPV6_ILA is not set
# CONFIG_IPV6_VTI is not set
CONFIG_IPV6_SIT=3Dy
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=3Dy
# CONFIG_IPV6_TUNNEL is not set
# CONFIG_IPV6_MULTIPLE_TABLES is not set
# CONFIG_IPV6_MROUTE is not set
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_NETWORK_SECMARK is not set
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
CONFIG_NETFILTER=3Dy
CONFIG_NETFILTER_ADVANCED=3Dy
CONFIG_BRIDGE_NETFILTER=3Dm

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=3Dy
CONFIG_NETFILTER_NETLINK=3Dm
CONFIG_NETFILTER_FAMILY_BRIDGE=3Dy
CONFIG_NETFILTER_NETLINK_ACCT=3Dm
CONFIG_NETFILTER_NETLINK_QUEUE=3Dm
# CONFIG_NETFILTER_NETLINK_LOG is not set
CONFIG_NETFILTER_NETLINK_OSF=3Dm
CONFIG_NF_CONNTRACK=3Dm
# CONFIG_NF_LOG_NETDEV is not set
CONFIG_NETFILTER_CONNCOUNT=3Dm
# CONFIG_NF_CONNTRACK_MARK is not set
# CONFIG_NF_CONNTRACK_ZONES is not set
CONFIG_NF_CONNTRACK_PROCFS=3Dy
# CONFIG_NF_CONNTRACK_EVENTS is not set
# CONFIG_NF_CONNTRACK_TIMEOUT is not set
# CONFIG_NF_CONNTRACK_TIMESTAMP is not set
# CONFIG_NF_CONNTRACK_LABELS is not set
CONFIG_NF_CT_PROTO_DCCP=3Dy
CONFIG_NF_CT_PROTO_SCTP=3Dy
CONFIG_NF_CT_PROTO_UDPLITE=3Dy
# CONFIG_NF_CONNTRACK_AMANDA is not set
CONFIG_NF_CONNTRACK_FTP=3Dm
# CONFIG_NF_CONNTRACK_H323 is not set
# CONFIG_NF_CONNTRACK_IRC is not set
CONFIG_NF_CONNTRACK_BROADCAST=3Dm
CONFIG_NF_CONNTRACK_NETBIOS_NS=3Dm
# CONFIG_NF_CONNTRACK_SNMP is not set
# CONFIG_NF_CONNTRACK_PPTP is not set
# CONFIG_NF_CONNTRACK_SANE is not set
# CONFIG_NF_CONNTRACK_SIP is not set
CONFIG_NF_CONNTRACK_TFTP=3Dm
CONFIG_NF_CT_NETLINK=3Dm
# CONFIG_NETFILTER_NETLINK_GLUE_CT is not set
CONFIG_NF_NAT=3Dm
CONFIG_NF_NAT_FTP=3Dm
CONFIG_NF_NAT_TFTP=3Dm
CONFIG_NF_NAT_REDIRECT=3Dy
CONFIG_NF_NAT_MASQUERADE=3Dy
CONFIG_NETFILTER_SYNPROXY=3Dm
CONFIG_NF_TABLES=3Dm
CONFIG_NF_TABLES_SET=3Dm
CONFIG_NF_TABLES_INET=3Dy
CONFIG_NF_TABLES_NETDEV=3Dy
CONFIG_NFT_NUMGEN=3Dm
CONFIG_NFT_CT=3Dm
CONFIG_NFT_COUNTER=3Dm
CONFIG_NFT_CONNLIMIT=3Dm
# CONFIG_NFT_LOG is not set
CONFIG_NFT_LIMIT=3Dm
CONFIG_NFT_MASQ=3Dm
# CONFIG_NFT_REDIR is not set
CONFIG_NFT_NAT=3Dm
# CONFIG_NFT_TUNNEL is not set
# CONFIG_NFT_OBJREF is not set
# CONFIG_NFT_QUEUE is not set
# CONFIG_NFT_QUOTA is not set
# CONFIG_NFT_REJECT is not set
# CONFIG_NFT_COMPAT is not set
# CONFIG_NFT_HASH is not set
CONFIG_NFT_FIB=3Dm
# CONFIG_NFT_FIB_INET is not set
CONFIG_NFT_SOCKET=3Dm
# CONFIG_NFT_OSF is not set
# CONFIG_NFT_TPROXY is not set
# CONFIG_NFT_SYNPROXY is not set
CONFIG_NF_DUP_NETDEV=3Dm
# CONFIG_NFT_DUP_NETDEV is not set
CONFIG_NFT_FWD_NETDEV=3Dm
# CONFIG_NFT_FIB_NETDEV is not set
# CONFIG_NF_FLOW_TABLE is not set
CONFIG_NETFILTER_XTABLES=3Dm

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=3Dm
# CONFIG_NETFILTER_XT_CONNMARK is not set

#
# Xtables targets
#
# CONFIG_NETFILTER_XT_TARGET_CHECKSUM is not set
# CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
# CONFIG_NETFILTER_XT_TARGET_CT is not set
# CONFIG_NETFILTER_XT_TARGET_DSCP is not set
# CONFIG_NETFILTER_XT_TARGET_HL is not set
# CONFIG_NETFILTER_XT_TARGET_HMARK is not set
# CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set
# CONFIG_NETFILTER_XT_TARGET_LOG is not set
# CONFIG_NETFILTER_XT_TARGET_MARK is not set
CONFIG_NETFILTER_XT_NAT=3Dm
CONFIG_NETFILTER_XT_TARGET_NETMAP=3Dm
# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
# CONFIG_NETFILTER_XT_TARGET_NOTRACK is not set
# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=3Dm
# CONFIG_NETFILTER_XT_TARGET_TEE is not set
# CONFIG_NETFILTER_XT_TARGET_TRACE is not set
# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
# CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP is not set

#
# Xtables matches
#
# CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set
# CONFIG_NETFILTER_XT_MATCH_BPF is not set
# CONFIG_NETFILTER_XT_MATCH_CGROUP is not set
# CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set
# CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
# CONFIG_NETFILTER_XT_MATCH_CONNBYTES is not set
# CONFIG_NETFILTER_XT_MATCH_CONNLABEL is not set
# CONFIG_NETFILTER_XT_MATCH_CONNLIMIT is not set
# CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm
# CONFIG_NETFILTER_XT_MATCH_CPU is not set
# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
# CONFIG_NETFILTER_XT_MATCH_DEVGROUP is not set
# CONFIG_NETFILTER_XT_MATCH_DSCP is not set
CONFIG_NETFILTER_XT_MATCH_ECN=3Dm
# CONFIG_NETFILTER_XT_MATCH_ESP is not set
# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
# CONFIG_NETFILTER_XT_MATCH_HELPER is not set
CONFIG_NETFILTER_XT_MATCH_HL=3Dm
# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
# CONFIG_NETFILTER_XT_MATCH_L2TP is not set
# CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
# CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
# CONFIG_NETFILTER_XT_MATCH_MAC is not set
# CONFIG_NETFILTER_XT_MATCH_MARK is not set
# CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
# CONFIG_NETFILTER_XT_MATCH_OSF is not set
# CONFIG_NETFILTER_XT_MATCH_OWNER is not set
# CONFIG_NETFILTER_XT_MATCH_PHYSDEV is not set
# CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
# CONFIG_NETFILTER_XT_MATCH_REALM is not set
# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
# CONFIG_NETFILTER_XT_MATCH_SCTP is not set
# CONFIG_NETFILTER_XT_MATCH_SOCKET is not set
# CONFIG_NETFILTER_XT_MATCH_STATE is not set
# CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
# CONFIG_NETFILTER_XT_MATCH_STRING is not set
# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
# CONFIG_NETFILTER_XT_MATCH_TIME is not set
# CONFIG_NETFILTER_XT_MATCH_U32 is not set
# end of Core Netfilter Configuration

# CONFIG_IP_SET is not set
# CONFIG_IP_VS is not set

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=3Dm
CONFIG_NF_SOCKET_IPV4=3Dm
# CONFIG_NF_TPROXY_IPV4 is not set
CONFIG_NF_TABLES_IPV4=3Dy
# CONFIG_NFT_DUP_IPV4 is not set
CONFIG_NFT_FIB_IPV4=3Dm
# CONFIG_NF_TABLES_ARP is not set
CONFIG_NF_DUP_IPV4=3Dm
# CONFIG_NF_LOG_ARP is not set
# CONFIG_NF_LOG_IPV4 is not set
CONFIG_NF_REJECT_IPV4=3Dm
CONFIG_IP_NF_IPTABLES=3Dm
CONFIG_IP_NF_MATCH_AH=3Dm
CONFIG_IP_NF_MATCH_ECN=3Dm
# CONFIG_IP_NF_MATCH_RPFILTER is not set
CONFIG_IP_NF_MATCH_TTL=3Dm
CONFIG_IP_NF_FILTER=3Dm
CONFIG_IP_NF_TARGET_REJECT=3Dm
# CONFIG_IP_NF_TARGET_SYNPROXY is not set
CONFIG_IP_NF_NAT=3Dm
CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
CONFIG_IP_NF_TARGET_NETMAP=3Dm
CONFIG_IP_NF_TARGET_REDIRECT=3Dm
# CONFIG_IP_NF_MANGLE is not set
CONFIG_IP_NF_RAW=3Dm
# CONFIG_IP_NF_ARPTABLES is not set
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=3Dm
# CONFIG_NF_TPROXY_IPV6 is not set
CONFIG_NF_TABLES_IPV6=3Dy
# CONFIG_NFT_DUP_IPV6 is not set
CONFIG_NFT_FIB_IPV6=3Dm
# CONFIG_NF_DUP_IPV6 is not set
CONFIG_NF_REJECT_IPV6=3Dm
# CONFIG_NF_LOG_IPV6 is not set
CONFIG_IP6_NF_IPTABLES=3Dm
CONFIG_IP6_NF_MATCH_AH=3Dm
CONFIG_IP6_NF_MATCH_EUI64=3Dm
CONFIG_IP6_NF_MATCH_FRAG=3Dm
CONFIG_IP6_NF_MATCH_OPTS=3Dm
CONFIG_IP6_NF_MATCH_HL=3Dm
CONFIG_IP6_NF_MATCH_IPV6HEADER=3Dm
CONFIG_IP6_NF_MATCH_MH=3Dm
# CONFIG_IP6_NF_MATCH_RPFILTER is not set
CONFIG_IP6_NF_MATCH_RT=3Dm
CONFIG_IP6_NF_MATCH_SRH=3Dm
# CONFIG_IP6_NF_TARGET_HL is not set
CONFIG_IP6_NF_FILTER=3Dm
CONFIG_IP6_NF_TARGET_REJECT=3Dm
CONFIG_IP6_NF_TARGET_SYNPROXY=3Dm
CONFIG_IP6_NF_MANGLE=3Dm
CONFIG_IP6_NF_RAW=3Dm
CONFIG_IP6_NF_NAT=3Dm
CONFIG_IP6_NF_TARGET_MASQUERADE=3Dm
CONFIG_IP6_NF_TARGET_NPT=3Dm
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=3Dm
# CONFIG_NF_TABLES_BRIDGE is not set
CONFIG_NF_CONNTRACK_BRIDGE=3Dm
# CONFIG_BRIDGE_NF_EBTABLES is not set
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
CONFIG_STP=3Dy
CONFIG_BRIDGE=3Dy
CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
CONFIG_HAVE_NET_DSA=3Dy
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_DECNET is not set
CONFIG_LLC=3Dy
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
CONFIG_DNS_RESOLVER=3Dy
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
CONFIG_NETLINK_DIAG=3Dy
# CONFIG_MPLS is not set
# CONFIG_NET_NSH is not set
# CONFIG_HSR is not set
# CONFIG_NET_SWITCHDEV is not set
# CONFIG_NET_L3_MASTER_DEV is not set
# CONFIG_NET_NCSI is not set
CONFIG_RPS=3Dy
CONFIG_RFS_ACCEL=3Dy
CONFIG_XPS=3Dy
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=3Dy
CONFIG_BQL=3Dy
# CONFIG_BPF_JIT is not set
# CONFIG_BPF_STREAM_PARSER is not set
CONFIG_NET_FLOW_LIMIT=3Dy

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_WIRELESS=3Dy
CONFIG_WIRELESS_EXT=3Dy
CONFIG_WEXT_CORE=3Dy
CONFIG_WEXT_PROC=3Dy
CONFIG_WEXT_SPY=3Dy
CONFIG_WEXT_PRIV=3Dy
CONFIG_CFG80211=3Dm
CONFIG_NL80211_TESTMODE=3Dy
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
# CONFIG_CFG80211_CERTIFICATION_ONUS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=3Dy
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=3Dy
CONFIG_CFG80211_DEFAULT_PS=3Dy
CONFIG_CFG80211_CRDA_SUPPORT=3Dy
CONFIG_CFG80211_WEXT=3Dy
CONFIG_LIB80211=3Dm
CONFIG_LIB80211_CRYPT_WEP=3Dm
CONFIG_LIB80211_CRYPT_CCMP=3Dm
CONFIG_LIB80211_CRYPT_TKIP=3Dm
# CONFIG_LIB80211_DEBUG is not set
CONFIG_MAC80211=3Dm
CONFIG_MAC80211_HAS_RC=3Dy
CONFIG_MAC80211_RC_MINSTREL=3Dy
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=3Dy
CONFIG_MAC80211_RC_DEFAULT=3D"minstrel_ht"
CONFIG_MAC80211_MESH=3Dy
CONFIG_MAC80211_MESSAGE_TRACING=3Dy
CONFIG_MAC80211_DEBUG_MENU=3Dy
# CONFIG_MAC80211_NOINLINE is not set
# CONFIG_MAC80211_VERBOSE_DEBUG is not set
# CONFIG_MAC80211_MLME_DEBUG is not set
# CONFIG_MAC80211_STA_DEBUG is not set
# CONFIG_MAC80211_HT_DEBUG is not set
# CONFIG_MAC80211_OCB_DEBUG is not set
# CONFIG_MAC80211_IBSS_DEBUG is not set
# CONFIG_MAC80211_PS_DEBUG is not set
# CONFIG_MAC80211_MPL_DEBUG is not set
# CONFIG_MAC80211_MPATH_DEBUG is not set
# CONFIG_MAC80211_MHWMP_DEBUG is not set
# CONFIG_MAC80211_MESH_SYNC_DEBUG is not set
# CONFIG_MAC80211_MESH_CSA_DEBUG is not set
# CONFIG_MAC80211_MESH_PS_DEBUG is not set
# CONFIG_MAC80211_TDLS_DEBUG is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
# CONFIG_WIMAX is not set
# CONFIG_RFKILL is not set
CONFIG_NET_9P=3Dy
CONFIG_NET_9P_VIRTIO=3Dy
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set
# CONFIG_PSAMPLE is not set
# CONFIG_NET_IFE is not set
# CONFIG_LWTUNNEL is not set
CONFIG_DST_CACHE=3Dy
CONFIG_GRO_CELLS=3Dy
CONFIG_FAILOVER=3Dy
CONFIG_HAVE_EBPF_JIT=3Dy


Thanks

--_000_MAXPR0101MB14681590CE13BB4E2ED97CFEEEE80MAXPR0101MB1468_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I am trying to run networking test on RISCv with linux 5.4.3,Yocto i am get=
ting failure in
<b>netns_netlink</b> and <b>getaddrinfo_01</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
$./runltp -f containers netns_netlink</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>cmdline=3D&quot;netns_netlink&quot;<br>
</span>
<div>contacts=3D&quot;&quot;<br>
</div>
<div>analysis=3Dexit<br>
</div>
<div>&lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
</div>
<div>open: No such file or directory<br>
</div>
<div><b>netns_netlink &nbsp; &nbsp;1 &nbsp;TBROK &nbsp;: &nbsp;netns_netlin=
k.c:143: system() failed<br>
</b></div>
<div><b>netns_netlink &nbsp; &nbsp;2 &nbsp;TBROK &nbsp;: &nbsp;netns_netlin=
k.c:143: Remaining cases broken</b><br>
</div>
<div>&lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
</div>
<div>initiation_status=3D&quot;ok&quot;<br>
</div>
<div>duration=3D0 termination_type=3Dexited termination_id=3D2 corefile=3Dn=
o<br>
</div>
<div>cutime=3D0 cstime=3D3<br>
</div>
<div>&lt;&lt;&lt;test_end&gt;&gt;&gt;<br>
</div>
<span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I have enabled follwiong configurationi am i missing any configuration to b=
e enabled??Kindly suggest</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>CONFIG_NET=3Dy<br>
</span>
<div>CONFIG_NET_INGRESS=3Dy<br>
</div>
<div>CONFIG_SKB_EXTENSIONS=3Dy<br>
</div>
<div><br>
</div>
<div>#<br>
</div>
<div># Networking options<br>
</div>
<div>#<br>
</div>
<div>CONFIG_PACKET=3Dy<br>
</div>
<div># CONFIG_PACKET_DIAG is not set<br>
</div>
<div>CONFIG_UNIX=3Dy<br>
</div>
<div>CONFIG_UNIX_SCM=3Dy<br>
</div>
<div># CONFIG_UNIX_DIAG is not set<br>
</div>
<div># CONFIG_TLS is not set<br>
</div>
<div># CONFIG_XFRM_USER is not set<br>
</div>
<div># CONFIG_NET_KEY is not set<br>
</div>
<div># CONFIG_XDP_SOCKETS is not set<br>
</div>
<div>CONFIG_INET=3Dy<br>
</div>
<div>CONFIG_IP_MULTICAST=3Dy<br>
</div>
<div>CONFIG_IP_ADVANCED_ROUTER=3Dy<br>
</div>
<div># CONFIG_IP_FIB_TRIE_STATS is not set<br>
</div>
<div># CONFIG_IP_MULTIPLE_TABLES is not set<br>
</div>
<div># CONFIG_IP_ROUTE_MULTIPATH is not set<br>
</div>
<div># CONFIG_IP_ROUTE_VERBOSE is not set<br>
</div>
<div>CONFIG_IP_PNP=3Dy<br>
</div>
<div>CONFIG_IP_PNP_DHCP=3Dy<br>
</div>
<div>CONFIG_IP_PNP_BOOTP=3Dy<br>
</div>
<div>CONFIG_IP_PNP_RARP=3Dy<br>
</div>
<div># CONFIG_NET_IPIP is not set<br>
</div>
<div># CONFIG_NET_IPGRE_DEMUX is not set<br>
</div>
<div>CONFIG_NET_IP_TUNNEL=3Dy<br>
</div>
<div># CONFIG_IP_MROUTE is not set<br>
</div>
<div>CONFIG_SYN_COOKIES=3Dy<br>
</div>
<div># CONFIG_NET_IPVTI is not set<br>
</div>
<div># CONFIG_NET_FOU is not set<br>
</div>
<div># CONFIG_NET_FOU_IP_TUNNELS is not set<br>
</div>
<div># CONFIG_INET_AH is not set<br>
</div>
<div># CONFIG_INET_ESP is not set<br>
</div>
<div># CONFIG_INET_IPCOMP is not set<br>
</div>
<div>CONFIG_INET_TUNNEL=3Dy<br>
</div>
<div>CONFIG_INET_DIAG=3Dy<br>
</div>
<div>CONFIG_INET_TCP_DIAG=3Dy<br>
</div>
<div># CONFIG_INET_UDP_DIAG is not set<br>
</div>
<div># CONFIG_INET_RAW_DIAG is not set<br>
</div>
<div># CONFIG_INET_DIAG_DESTROY is not set<br>
</div>
<div># CONFIG_TCP_CONG_ADVANCED is not set<br>
</div>
<div>CONFIG_TCP_CONG_CUBIC=3Dy<br>
</div>
<div>CONFIG_DEFAULT_TCP_CONG=3D&quot;cubic&quot;<br>
</div>
<div># CONFIG_TCP_MD5SIG is not set<br>
</div>
<div>CONFIG_IPV6=3Dy<br>
</div>
<div># CONFIG_IPV6_ROUTER_PREF is not set<br>
</div>
<div># CONFIG_IPV6_OPTIMISTIC_DAD is not set<br>
</div>
<div># CONFIG_INET6_AH is not set<br>
</div>
<div># CONFIG_INET6_ESP is not set<br>
</div>
<div># CONFIG_INET6_IPCOMP is not set<br>
</div>
<div># CONFIG_IPV6_MIP6 is not set<br>
</div>
<div># CONFIG_IPV6_ILA is not set<br>
</div>
<div># CONFIG_IPV6_VTI is not set<br>
</div>
<div>CONFIG_IPV6_SIT=3Dy<br>
</div>
<div># CONFIG_IPV6_SIT_6RD is not set<br>
</div>
<div>CONFIG_IPV6_NDISC_NODETYPE=3Dy<br>
</div>
<div># CONFIG_IPV6_TUNNEL is not set<br>
</div>
<div># CONFIG_IPV6_MULTIPLE_TABLES is not set<br>
</div>
<div># CONFIG_IPV6_MROUTE is not set<br>
</div>
<div># CONFIG_IPV6_SEG6_LWTUNNEL is not set<br>
</div>
<div># CONFIG_IPV6_SEG6_HMAC is not set<br>
</div>
<div># CONFIG_NETWORK_SECMARK is not set<br>
</div>
<div># CONFIG_NETWORK_PHY_TIMESTAMPING is not set<br>
</div>
<div>CONFIG_NETFILTER=3Dy<br>
</div>
<div>CONFIG_NETFILTER_ADVANCED=3Dy<br>
</div>
<div>CONFIG_BRIDGE_NETFILTER=3Dm<br>
</div>
<div><br>
</div>
<div>#<br>
</div>
<div># Core Netfilter Configuration<br>
</div>
<div>#<br>
</div>
<div>CONFIG_NETFILTER_INGRESS=3Dy<br>
</div>
<div>CONFIG_NETFILTER_NETLINK=3Dm<br>
</div>
<div>CONFIG_NETFILTER_FAMILY_BRIDGE=3Dy<br>
</div>
<div>CONFIG_NETFILTER_NETLINK_ACCT=3Dm<br>
</div>
<div>CONFIG_NETFILTER_NETLINK_QUEUE=3Dm<br>
</div>
<div># CONFIG_NETFILTER_NETLINK_LOG is not set<br>
</div>
<div>CONFIG_NETFILTER_NETLINK_OSF=3Dm<br>
</div>
<div>CONFIG_NF_CONNTRACK=3Dm<br>
</div>
<div># CONFIG_NF_LOG_NETDEV is not set<br>
</div>
<div>CONFIG_NETFILTER_CONNCOUNT=3Dm<br>
</div>
<div># CONFIG_NF_CONNTRACK_MARK is not set<br>
</div>
<div># CONFIG_NF_CONNTRACK_ZONES is not set<br>
</div>
<div>CONFIG_NF_CONNTRACK_PROCFS=3Dy<br>
</div>
<div># CONFIG_NF_CONNTRACK_EVENTS is not set<br>
</div>
<div># CONFIG_NF_CONNTRACK_TIMEOUT is not set<br>
</div>
<div># CONFIG_NF_CONNTRACK_TIMESTAMP is not set<br>
</div>
<div># CONFIG_NF_CONNTRACK_LABELS is not set<br>
</div>
<div>CONFIG_NF_CT_PROTO_DCCP=3Dy<br>
</div>
<div>CONFIG_NF_CT_PROTO_SCTP=3Dy<br>
</div>
<div>CONFIG_NF_CT_PROTO_UDPLITE=3Dy<br>
</div>
<div># CONFIG_NF_CONNTRACK_AMANDA is not set<br>
</div>
<div>CONFIG_NF_CONNTRACK_FTP=3Dm<br>
</div>
<div># CONFIG_NF_CONNTRACK_H323 is not set<br>
</div>
<div># CONFIG_NF_CONNTRACK_IRC is not set<br>
</div>
<div>CONFIG_NF_CONNTRACK_BROADCAST=3Dm<br>
</div>
<div>CONFIG_NF_CONNTRACK_NETBIOS_NS=3Dm<br>
</div>
<div># CONFIG_NF_CONNTRACK_SNMP is not set<br>
</div>
<div># CONFIG_NF_CONNTRACK_PPTP is not set<br>
</div>
<div># CONFIG_NF_CONNTRACK_SANE is not set<br>
</div>
<div># CONFIG_NF_CONNTRACK_SIP is not set<br>
</div>
<div>CONFIG_NF_CONNTRACK_TFTP=3Dm<br>
</div>
<div>CONFIG_NF_CT_NETLINK=3Dm<br>
</div>
<div># CONFIG_NETFILTER_NETLINK_GLUE_CT is not set<br>
</div>
<div>CONFIG_NF_NAT=3Dm<br>
</div>
<div>CONFIG_NF_NAT_FTP=3Dm<br>
</div>
<div>CONFIG_NF_NAT_TFTP=3Dm<br>
</div>
<div>CONFIG_NF_NAT_REDIRECT=3Dy<br>
</div>
<div>CONFIG_NF_NAT_MASQUERADE=3Dy<br>
</div>
<div>CONFIG_NETFILTER_SYNPROXY=3Dm<br>
</div>
<div>CONFIG_NF_TABLES=3Dm<br>
</div>
<div>CONFIG_NF_TABLES_SET=3Dm<br>
</div>
<div>CONFIG_NF_TABLES_INET=3Dy<br>
</div>
<div>CONFIG_NF_TABLES_NETDEV=3Dy<br>
</div>
<div>CONFIG_NFT_NUMGEN=3Dm<br>
</div>
<div>CONFIG_NFT_CT=3Dm<br>
</div>
<div>CONFIG_NFT_COUNTER=3Dm<br>
</div>
<div>CONFIG_NFT_CONNLIMIT=3Dm<br>
</div>
<div># CONFIG_NFT_LOG is not set<br>
</div>
<div>CONFIG_NFT_LIMIT=3Dm<br>
</div>
<div>CONFIG_NFT_MASQ=3Dm<br>
</div>
<div># CONFIG_NFT_REDIR is not set<br>
</div>
<div>CONFIG_NFT_NAT=3Dm<br>
</div>
<div># CONFIG_NFT_TUNNEL is not set<br>
</div>
<div># CONFIG_NFT_OBJREF is not set<br>
</div>
<div># CONFIG_NFT_QUEUE is not set<br>
</div>
<div># CONFIG_NFT_QUOTA is not set<br>
</div>
<div># CONFIG_NFT_REJECT is not set<br>
</div>
<div># CONFIG_NFT_COMPAT is not set<br>
</div>
<div># CONFIG_NFT_HASH is not set<br>
</div>
<div>CONFIG_NFT_FIB=3Dm<br>
</div>
<div># CONFIG_NFT_FIB_INET is not set<br>
</div>
<div>CONFIG_NFT_SOCKET=3Dm<br>
</div>
<div># CONFIG_NFT_OSF is not set<br>
</div>
<div># CONFIG_NFT_TPROXY is not set<br>
</div>
<div># CONFIG_NFT_SYNPROXY is not set<br>
</div>
<div>CONFIG_NF_DUP_NETDEV=3Dm<br>
</div>
<div># CONFIG_NFT_DUP_NETDEV is not set<br>
</div>
<div>CONFIG_NFT_FWD_NETDEV=3Dm<br>
</div>
<div># CONFIG_NFT_FIB_NETDEV is not set<br>
</div>
<div># CONFIG_NF_FLOW_TABLE is not set<br>
</div>
<div>CONFIG_NETFILTER_XTABLES=3Dm<br>
</div>
<div><br>
</div>
<div>#<br>
</div>
<div># Xtables combined modules<br>
</div>
<div>#<br>
</div>
<div>CONFIG_NETFILTER_XT_MARK=3Dm<br>
</div>
<div># CONFIG_NETFILTER_XT_CONNMARK is not set<br>
</div>
<div><br>
</div>
<div>#<br>
</div>
<div># Xtables targets<br>
</div>
<div>#<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_CHECKSUM is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_CT is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_DSCP is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_HL is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_HMARK is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_LOG is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_MARK is not set<br>
</div>
<div>CONFIG_NETFILTER_XT_NAT=3Dm<br>
</div>
<div>CONFIG_NETFILTER_XT_TARGET_NETMAP=3Dm<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_NFLOG is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_NOTRACK is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_RATEEST is not set<br>
</div>
<div>CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm<br>
</div>
<div>CONFIG_NETFILTER_XT_TARGET_MASQUERADE=3Dm<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_TEE is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_TRACE is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP is not set<br>
</div>
<div><br>
</div>
<div>#<br>
</div>
<div># Xtables matches<br>
</div>
<div>#<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_BPF is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_CGROUP is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_COMMENT is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_CONNBYTES is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_CONNLABEL is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_CONNLIMIT is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set<br>
</div>
<div>CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_CPU is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_DCCP is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_DEVGROUP is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_DSCP is not set<br>
</div>
<div>CONFIG_NETFILTER_XT_MATCH_ECN=3Dm<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_ESP is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_HELPER is not set<br>
</div>
<div>CONFIG_NETFILTER_XT_MATCH_HL=3Dm<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_L2TP is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_LENGTH is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_LIMIT is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_MAC is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_MARK is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_NFACCT is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_OSF is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_OWNER is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_PHYSDEV is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_QUOTA is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_RATEEST is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_REALM is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_RECENT is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_SCTP is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_SOCKET is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_STATE is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_STRING is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_TIME is not set<br>
</div>
<div># CONFIG_NETFILTER_XT_MATCH_U32 is not set<br>
</div>
<div># end of Core Netfilter Configuration<br>
</div>
<div><br>
</div>
<div># CONFIG_IP_SET is not set<br>
</div>
<div># CONFIG_IP_VS is not set<br>
</div>
<div><br>
</div>
<div>#<br>
</div>
<div># IP: Netfilter Configuration<br>
</div>
<div>#<br>
</div>
<div>CONFIG_NF_DEFRAG_IPV4=3Dm<br>
</div>
<div>CONFIG_NF_SOCKET_IPV4=3Dm<br>
</div>
<div># CONFIG_NF_TPROXY_IPV4 is not set<br>
</div>
<div>CONFIG_NF_TABLES_IPV4=3Dy<br>
</div>
<div># CONFIG_NFT_DUP_IPV4 is not set<br>
</div>
<div>CONFIG_NFT_FIB_IPV4=3Dm<br>
</div>
<div># CONFIG_NF_TABLES_ARP is not set<br>
</div>
<div>CONFIG_NF_DUP_IPV4=3Dm<br>
</div>
<div># CONFIG_NF_LOG_ARP is not set<br>
</div>
<div># CONFIG_NF_LOG_IPV4 is not set<br>
</div>
<div>CONFIG_NF_REJECT_IPV4=3Dm<br>
</div>
<div>CONFIG_IP_NF_IPTABLES=3Dm<br>
</div>
<div>CONFIG_IP_NF_MATCH_AH=3Dm<br>
</div>
<div>CONFIG_IP_NF_MATCH_ECN=3Dm<br>
</div>
<div># CONFIG_IP_NF_MATCH_RPFILTER is not set<br>
</div>
<div>CONFIG_IP_NF_MATCH_TTL=3Dm<br>
</div>
<div>CONFIG_IP_NF_FILTER=3Dm<br>
</div>
<div>CONFIG_IP_NF_TARGET_REJECT=3Dm<br>
</div>
<div># CONFIG_IP_NF_TARGET_SYNPROXY is not set<br>
</div>
<div>CONFIG_IP_NF_NAT=3Dm<br>
</div>
<div>CONFIG_IP_NF_TARGET_MASQUERADE=3Dm<br>
</div>
<div>CONFIG_IP_NF_TARGET_NETMAP=3Dm<br>
</div>
<div>CONFIG_IP_NF_TARGET_REDIRECT=3Dm<br>
</div>
<div># CONFIG_IP_NF_MANGLE is not set<br>
</div>
<div>CONFIG_IP_NF_RAW=3Dm<br>
</div>
<div># CONFIG_IP_NF_ARPTABLES is not set<br>
</div>
<div># end of IP: Netfilter Configuration<br>
</div>
<div><br>
</div>
<div>#<br>
</div>
<div># IPv6: Netfilter Configuration<br>
</div>
<div>#<br>
</div>
<div>CONFIG_NF_SOCKET_IPV6=3Dm<br>
</div>
<div># CONFIG_NF_TPROXY_IPV6 is not set<br>
</div>
<div>CONFIG_NF_TABLES_IPV6=3Dy<br>
</div>
<div># CONFIG_NFT_DUP_IPV6 is not set<br>
</div>
<div>CONFIG_NFT_FIB_IPV6=3Dm<br>
</div>
<div># CONFIG_NF_DUP_IPV6 is not set<br>
</div>
<div>CONFIG_NF_REJECT_IPV6=3Dm<br>
</div>
<div># CONFIG_NF_LOG_IPV6 is not set<br>
</div>
<div>CONFIG_IP6_NF_IPTABLES=3Dm<br>
</div>
<div>CONFIG_IP6_NF_MATCH_AH=3Dm<br>
</div>
<div>CONFIG_IP6_NF_MATCH_EUI64=3Dm<br>
</div>
<div>CONFIG_IP6_NF_MATCH_FRAG=3Dm<br>
</div>
<div>CONFIG_IP6_NF_MATCH_OPTS=3Dm<br>
</div>
<div>CONFIG_IP6_NF_MATCH_HL=3Dm<br>
</div>
<div>CONFIG_IP6_NF_MATCH_IPV6HEADER=3Dm<br>
</div>
<div>CONFIG_IP6_NF_MATCH_MH=3Dm<br>
</div>
<div># CONFIG_IP6_NF_MATCH_RPFILTER is not set<br>
</div>
<div>CONFIG_IP6_NF_MATCH_RT=3Dm<br>
</div>
<div>CONFIG_IP6_NF_MATCH_SRH=3Dm<br>
</div>
<div># CONFIG_IP6_NF_TARGET_HL is not set<br>
</div>
<div>CONFIG_IP6_NF_FILTER=3Dm<br>
</div>
<div>CONFIG_IP6_NF_TARGET_REJECT=3Dm<br>
</div>
<div>CONFIG_IP6_NF_TARGET_SYNPROXY=3Dm<br>
</div>
<div>CONFIG_IP6_NF_MANGLE=3Dm<br>
</div>
<div>CONFIG_IP6_NF_RAW=3Dm<br>
</div>
<div>CONFIG_IP6_NF_NAT=3Dm<br>
</div>
<div>CONFIG_IP6_NF_TARGET_MASQUERADE=3Dm<br>
</div>
<div>CONFIG_IP6_NF_TARGET_NPT=3Dm<br>
</div>
<div># end of IPv6: Netfilter Configuration<br>
</div>
<div><br>
</div>
<div>CONFIG_NF_DEFRAG_IPV6=3Dm<br>
</div>
<div># CONFIG_NF_TABLES_BRIDGE is not set<br>
</div>
<div>CONFIG_NF_CONNTRACK_BRIDGE=3Dm<br>
</div>
<div># CONFIG_BRIDGE_NF_EBTABLES is not set<br>
</div>
<div># CONFIG_BPFILTER is not set<br>
</div>
<div># CONFIG_IP_DCCP is not set<br>
</div>
<div># CONFIG_IP_SCTP is not set<br>
</div>
<div># CONFIG_RDS is not set<br>
</div>
<div># CONFIG_TIPC is not set<br>
</div>
<div># CONFIG_ATM is not set<br>
</div>
<div># CONFIG_L2TP is not set<br>
</div>
<div>CONFIG_STP=3Dy<br>
</div>
<div>CONFIG_BRIDGE=3Dy<br>
</div>
<div>CONFIG_BRIDGE_IGMP_SNOOPING=3Dy<br>
</div>
<div>CONFIG_HAVE_NET_DSA=3Dy<br>
</div>
<div># CONFIG_NET_DSA is not set<br>
</div>
<div># CONFIG_VLAN_8021Q is not set<br>
</div>
<div># CONFIG_DECNET is not set<br>
</div>
<div>CONFIG_LLC=3Dy<br>
</div>
<div># CONFIG_LLC2 is not set<br>
</div>
<div># CONFIG_ATALK is not set<br>
</div>
<div># CONFIG_X25 is not set<br>
</div>
<div># CONFIG_LAPB is not set<br>
</div>
<div># CONFIG_PHONET is not set<br>
</div>
<div># CONFIG_6LOWPAN is not set<br>
</div>
<div># CONFIG_IEEE802154 is not set<br>
</div>
<div># CONFIG_NET_SCHED is not set<br>
</div>
<div># CONFIG_DCB is not set<br>
</div>
<div>CONFIG_DNS_RESOLVER=3Dy<br>
</div>
<div># CONFIG_BATMAN_ADV is not set<br>
</div>
<div># CONFIG_OPENVSWITCH is not set<br>
</div>
<div># CONFIG_VSOCKETS is not set<br>
</div>
<div>CONFIG_NETLINK_DIAG=3Dy<br>
</div>
<div># CONFIG_MPLS is not set<br>
</div>
<div># CONFIG_NET_NSH is not set<br>
</div>
<div># CONFIG_HSR is not set<br>
</div>
<div># CONFIG_NET_SWITCHDEV is not set<br>
</div>
<div># CONFIG_NET_L3_MASTER_DEV is not set<br>
</div>
<div># CONFIG_NET_NCSI is not set<br>
</div>
<div>CONFIG_RPS=3Dy<br>
</div>
<div>CONFIG_RFS_ACCEL=3Dy<br>
</div>
<div>CONFIG_XPS=3Dy<br>
</div>
<div># CONFIG_CGROUP_NET_PRIO is not set<br>
</div>
<div># CONFIG_CGROUP_NET_CLASSID is not set<br>
</div>
<div>CONFIG_NET_RX_BUSY_POLL=3Dy<br>
</div>
<div>CONFIG_BQL=3Dy<br>
</div>
<div># CONFIG_BPF_JIT is not set<br>
</div>
<div># CONFIG_BPF_STREAM_PARSER is not set<br>
</div>
<div>CONFIG_NET_FLOW_LIMIT=3Dy<br>
</div>
<div><br>
</div>
<div>#<br>
</div>
<div># Network testing<br>
</div>
<div>#<br>
</div>
<div># CONFIG_NET_PKTGEN is not set<br>
</div>
<div># end of Network testing<br>
</div>
<div># end of Networking options<br>
</div>
<div><br>
</div>
<div># CONFIG_HAMRADIO is not set<br>
</div>
<div># CONFIG_CAN is not set<br>
</div>
<div># CONFIG_BT is not set<br>
</div>
<div># CONFIG_AF_RXRPC is not set<br>
</div>
<div># CONFIG_AF_KCM is not set<br>
</div>
<div>CONFIG_WIRELESS=3Dy<br>
</div>
<div>CONFIG_WIRELESS_EXT=3Dy<br>
</div>
<div>CONFIG_WEXT_CORE=3Dy<br>
</div>
<div>CONFIG_WEXT_PROC=3Dy<br>
</div>
<div>CONFIG_WEXT_SPY=3Dy<br>
</div>
<div>CONFIG_WEXT_PRIV=3Dy<br>
</div>
<div>CONFIG_CFG80211=3Dm<br>
</div>
<div>CONFIG_NL80211_TESTMODE=3Dy<br>
</div>
<div># CONFIG_CFG80211_DEVELOPER_WARNINGS is not set<br>
</div>
<div># CONFIG_CFG80211_CERTIFICATION_ONUS is not set<br>
</div>
<div>CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=3Dy<br>
</div>
<div>CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=3Dy<br>
</div>
<div>CONFIG_CFG80211_DEFAULT_PS=3Dy<br>
</div>
<div>CONFIG_CFG80211_CRDA_SUPPORT=3Dy<br>
</div>
<div>CONFIG_CFG80211_WEXT=3Dy<br>
</div>
<div>CONFIG_LIB80211=3Dm<br>
</div>
<div>CONFIG_LIB80211_CRYPT_WEP=3Dm<br>
</div>
<div>CONFIG_LIB80211_CRYPT_CCMP=3Dm<br>
</div>
<div>CONFIG_LIB80211_CRYPT_TKIP=3Dm<br>
</div>
<div># CONFIG_LIB80211_DEBUG is not set<br>
</div>
<div>CONFIG_MAC80211=3Dm<br>
</div>
<div>CONFIG_MAC80211_HAS_RC=3Dy<br>
</div>
<div>CONFIG_MAC80211_RC_MINSTREL=3Dy<br>
</div>
<div>CONFIG_MAC80211_RC_DEFAULT_MINSTREL=3Dy<br>
</div>
<div>CONFIG_MAC80211_RC_DEFAULT=3D&quot;minstrel_ht&quot;<br>
</div>
<div>CONFIG_MAC80211_MESH=3Dy<br>
</div>
<div>CONFIG_MAC80211_MESSAGE_TRACING=3Dy<br>
</div>
<div>CONFIG_MAC80211_DEBUG_MENU=3Dy<br>
</div>
<div># CONFIG_MAC80211_NOINLINE is not set<br>
</div>
<div># CONFIG_MAC80211_VERBOSE_DEBUG is not set<br>
</div>
<div># CONFIG_MAC80211_MLME_DEBUG is not set<br>
</div>
<div># CONFIG_MAC80211_STA_DEBUG is not set<br>
</div>
<div># CONFIG_MAC80211_HT_DEBUG is not set<br>
</div>
<div># CONFIG_MAC80211_OCB_DEBUG is not set<br>
</div>
<div># CONFIG_MAC80211_IBSS_DEBUG is not set<br>
</div>
<div># CONFIG_MAC80211_PS_DEBUG is not set<br>
</div>
<div># CONFIG_MAC80211_MPL_DEBUG is not set<br>
</div>
<div># CONFIG_MAC80211_MPATH_DEBUG is not set<br>
</div>
<div># CONFIG_MAC80211_MHWMP_DEBUG is not set<br>
</div>
<div># CONFIG_MAC80211_MESH_SYNC_DEBUG is not set<br>
</div>
<div># CONFIG_MAC80211_MESH_CSA_DEBUG is not set<br>
</div>
<div># CONFIG_MAC80211_MESH_PS_DEBUG is not set<br>
</div>
<div># CONFIG_MAC80211_TDLS_DEBUG is not set<br>
</div>
<div>CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0<br>
</div>
<div># CONFIG_WIMAX is not set<br>
</div>
<div># CONFIG_RFKILL is not set<br>
</div>
<div>CONFIG_NET_9P=3Dy<br>
</div>
<div>CONFIG_NET_9P_VIRTIO=3Dy<br>
</div>
<div># CONFIG_NET_9P_DEBUG is not set<br>
</div>
<div># CONFIG_CAIF is not set<br>
</div>
<div># CONFIG_CEPH_LIB is not set<br>
</div>
<div># CONFIG_NFC is not set<br>
</div>
<div># CONFIG_PSAMPLE is not set<br>
</div>
<div># CONFIG_NET_IFE is not set<br>
</div>
<div># CONFIG_LWTUNNEL is not set<br>
</div>
<div>CONFIG_DST_CACHE=3Dy<br>
</div>
<div>CONFIG_GRO_CELLS=3Dy<br>
</div>
<div>CONFIG_FAILOVER=3Dy<br>
</div>
<div>CONFIG_HAVE_EBPF_JIT=3Dy<br>
</div>
<div><br>
</div>
<span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks<br>
</div>
</body>
</html>

--_000_MAXPR0101MB14681590CE13BB4E2ED97CFEEEE80MAXPR0101MB1468_--

--===============2004566515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2004566515==--
