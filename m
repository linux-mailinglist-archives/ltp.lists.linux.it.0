Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8778E9E4DBC
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2024 07:49:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1733381375; h=to : date :
 message-id : references : in-reply-to : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=WSNaX7shpZpFtry42WOuUGJd29tu8yp68l/FJmEprb8=;
 b=gKGkIti3ecu7eVS4hhZbS1+/GtgDnt29+rdJh24UzZtZ0mvkZ+73+deLDTMf+7hqlHrgr
 9rDylumc8kjx0GJZTs3i+SC7b11od0iSFuWU1I1jpuuC3bx5sTQtnf15wRgPmGDAuHLOHzW
 dI92FnXsZp42T08KD+fOyzbvlJqmL3U=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB8103DF317
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2024 07:49:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5131C3D7CEF
 for <ltp@lists.linux.it>; Thu,  5 Dec 2024 07:49:32 +0100 (CET)
Authentication-Results: in-7.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=harshvardhan.j.jha@oracle.com;
 receiver=lists.linux.it)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 511BD200AEF
 for <ltp@lists.linux.it>; Thu,  5 Dec 2024 07:49:29 +0100 (CET)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B52MufY032402;
 Thu, 5 Dec 2024 06:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=Ozuv0lL1jLRKq+Mflt
 ViZ+n+KJhAygbc07aMEb1JMa8=; b=E+y6fuaU0CGG1c+ef5YylxSW21E15n61HF
 TUPNcFx1LdoSszyUDcQdpFvN0STcQywXiTxp1rmQLnihrPC2HWG2Ci1+rmiVSsyC
 OAS/vVJFa6P+M7Jyec/dKiAH2WfjymXCmw32S2eb3a0cU/oAyv4mCJdPDiH/eNB3
 24cSHClSb1KbjMjXGuTT/feGAmxVtz0CeGsw0nfR+KrXUvbFgCAfwJxNtRgeqmW8
 6rA8UhSC5wysmbqsdY/hOhnAYXUU75DC/LNkh4EQk23uqxOEHxabIFSCLeim41Yt
 pcCKiQvLrt0FpRKhCcPnn/cJtvjFh19F+2ztHSl9rzGcC5qhHSxQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437sa0298h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Dec 2024 06:49:26 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 4B55woVV040142; Thu, 5 Dec 2024 06:49:26 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 43836wdmx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Dec 2024 06:49:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UspHrHUWjFUI019i3oR+EGjitULRXlq1W1Fm0ztV8URsL0veJ2lSunCtM62z8YblXF2G6rYXYekFiizlam8s3zr7KcPMfkhi24DugPpaHUCUxhLC2oX+X7h8rbkN5/Ppigv1goPuiZyFXobpIXoLLGZ8GmrBg4ZKAtHWnivTP7vTFEhQgkIYmgM+G2/P2umsdFGO4cGyfOzPFDItmJBaHr//hEFaE50+JU8RCkrhl386IxqV0llrdUjMYzAb3/vKZyOyybfITAsatc/HxbWiwCeCqdRExmgmEgPol8eOqApzii+siEtWYDdNmU/iZs/04OubDI5SbfwdMVv0wGkJQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ozuv0lL1jLRKq+MfltViZ+n+KJhAygbc07aMEb1JMa8=;
 b=nxAVdeYNMl3R5EfuiZtNGZMbj/SRhQE5a9TFqOT6hVTIRtvkcVCyt/iyK0KyUJmhbNtP+gXqYJ0bd/syyth0/Xdd3gOaDi1BZSWUn4fOt7n7vCFyBdrvjgoyUutTnxb5vfeTsEvYliXHEO+hPbZ2mm+3tCqLU98O91Jhhs1nIlrAyQ54bI2MlCCq5fUJ5uiSLqRY2xgDVRZbJSaHLmShXpcD7lXZREZzoLaEwPXEHEU3KQp2EQgJFgWmf0zokP3emHiNlWEhhXr78MeyzR57v3WO+32bpYB9f6PA5E1ja6Hewm8MzYsOXWe+sMjYGEe9oVywK65mZCrGTZ2rJRUoQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ozuv0lL1jLRKq+MfltViZ+n+KJhAygbc07aMEb1JMa8=;
 b=SYgrIj8oR6zF4dg/K/7tWM4tHDlERcNvKtU9DNOIUJ9sADXvde7Uw7Ic4f7wxtc+hrZPx64pI4bnmuGE5Jw9UG8BgADbny4aBtRl4wfn4FWUihcOkoWfBxZah35p1AmgEsQS+b7NHcq1bAzpbsDitCejxy6Oct3RlCBtbBCVCg0=
Received: from PH7PR10MB6505.namprd10.prod.outlook.com (2603:10b6:510:200::11)
 by PH8PR10MB6576.namprd10.prod.outlook.com (2603:10b6:510:224::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Thu, 5 Dec
 2024 06:49:23 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54]) by PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54%3]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 06:49:23 +0000
To: "ltp@lists.linux.it" <ltp@lists.linux.it>, "pvorel@suse.cz"
 <pvorel@suse.cz>
Thread-Topic: [LTP] Issue faced in memcg_stat_rss while running mainline
 kernels between 6.7 and 6.8
Thread-Index: AQHbOlyb/wa8WbHpVk2HE2P4oe11fbLXTUlP
Date: Thu, 5 Dec 2024 06:48:53 +0000
Message-ID: <PH7PR10MB650583A6483E7A87B43630BDAC302@PH7PR10MB6505.namprd10.prod.outlook.com>
References: <e66fcf77-cf9d-4d14-9e42-1fc4564483bc@oracle.com>
In-Reply-To: <e66fcf77-cf9d-4d14-9e42-1fc4564483bc@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR10MB6505:EE_|PH8PR10MB6576:EE_
x-ms-office365-filtering-correlation-id: 519a16bb-c070-4c25-b8d6-08dd14f8f3f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?K1U4cXBQS09TSGtTekZZMDZTa29adDlOS2lHazNnb3Q5TTFsUHZUUm12TEhS?=
 =?utf-8?B?amZEeWEwazZGUkFUNWlSVUpvOUM0TFR1QVVJd2RIcjZKN2wrbDY5V3VBNHNE?=
 =?utf-8?B?MGpOaVBXQTdoZ0txNWZMcVQwSWpzc2dMWTBlSVJDYjk1eUZBdmY3WHUyRThE?=
 =?utf-8?B?aXM5cDl2Uk5HVUhHVmQ2dy9FbGV3ZGt6REsrenc4WURzby9CeWRIeHhlTkly?=
 =?utf-8?B?N1hxdlpxSXAvRHgrY1Vncm9lM2hlbUV1amZpSi8zNTh2VlJIcE1DZHEwN1dN?=
 =?utf-8?B?VnJBbEpoODF0UU4xWjFrY0hyYXdQK09vQm00REZEN0FyNzNuTDFLUVArb0tR?=
 =?utf-8?B?UktEQnlkeFRXSXRJbWM4R1dnNktkMlRRbTNqL3JmQWYxb0xDMmtrbEIwb1VP?=
 =?utf-8?B?ekxPdzFqT3FGK1M4UFJ5L2EyOHYwVW9pSlZwbGpZK01Rd3Q0YWR2YjRyQlV2?=
 =?utf-8?B?QTR5bmdvcm9DQ2s1cjNVb0xtZlFqb0MrZ056ZVZEeENQSktYYXBDeDJnNDlK?=
 =?utf-8?B?Wno2UFRhajkzMWFTNDQ2WUFhYk1UMEFBYmdtK2hTQ2hETmxOYUh0TDUwaVRV?=
 =?utf-8?B?YXd5enQ1SWJodzZpTnFZN2dja2RKdmQrT0pRS2RlRkY1dGMxSU5mMitWNUVI?=
 =?utf-8?B?TDFOTG4vRGgvQmtQK1orUHF0dUoxaFRkZHVhOUtTV2xVYVZQMVRFSEdBaTZ6?=
 =?utf-8?B?RVhkM2llRVg3emV6azUxeXB5TkRKdE4zSmczbitCTVpGSE93UGVJVStzcEZV?=
 =?utf-8?B?bEhLOENxNXgyeHpKejVaOGdVUnZHTDBQWTZzajJsTEk0TFl5NW5RVDVsQTJs?=
 =?utf-8?B?ZlkxVWtqZXllc1A3S2VNN2tUTWxLdGp3UlNwY1pPTnhHS09CUVJVcllSWVpI?=
 =?utf-8?B?NjNDU2ZaVVYrU0lINVI2dExHdDk4dUMwaWF1aElxLzdhY21naVcyNkpTa3ly?=
 =?utf-8?B?NjNoazFyc0l1Q2FrRzF0V0Jpb1hHanNTZkJuOFlRMmlCVlRGekI3Z0IySTAz?=
 =?utf-8?B?M2xERjJPYnZhSEkxTEhpREJwa1AxUit4RU5JQWxxZVVSeHFJY2pleGhtU2tj?=
 =?utf-8?B?TGhoelpkaEx2NnZ5UUFkYTJrckx0YUtnMy9tTWN1VDBuajdtNDFOUG1SMUM5?=
 =?utf-8?B?bEJTa21pRFV3WU5taTQ2ZUc0ZktEeit4SEsvcmxVK0p1M0Noa2NpZDMweEpS?=
 =?utf-8?B?dkVJMnZVVGUxWUZTUFFlS1A3b1FDb2kxM2dYNmFoN0lQa1o2THNKRnNZOGdP?=
 =?utf-8?B?V213bXNuNDErb2dxS2xKeE5zK3hmckZUakJQOUtibFNyS1BnWlZhZ0tsM09m?=
 =?utf-8?B?K09EQnp4eGlmczdKZXI3MDNVVzZDOW9VTjQ3TGlKWmtUWVd0VkREcUJYMFp1?=
 =?utf-8?B?b2pKRWNzL1JORXFsOXI5azRtYTVPMXMwdTcxaDdDaXcvN05vWk4vMlRZcnho?=
 =?utf-8?B?eFVUSVMydVAvMjAwdnFndG1pRGNVdWlyMFp6OTdjcDRkbXowSmZkcko1TW80?=
 =?utf-8?B?UDNwL1hLaG9aTEVPWkRqNkJHVVVNMy9BSFM0Zmc0dUhEYUx5WUNZa0trVGdL?=
 =?utf-8?B?b2FWeW5ZQ21vN1p2REU2NkJZeUlDck02UndkOFN6STBpVVh6ZmJDL0NrVTRr?=
 =?utf-8?B?cUFndERCWnp1clZMbGY4MUpKclBQNTNQblhwVDYwNmxva1pJTkI2MFNKbDJ2?=
 =?utf-8?B?SjcwSDlrcTJxU2IzNUwxckR0OGtGTG1qMittQlRqVVk5M0VYZmxMVmFWUVM1?=
 =?utf-8?B?eGNWZXB3YmFLTG1GY3BMeEJzMklWUGQ0WUdLaDJNTkw3dkJ6YVZZRWRJN1Z3?=
 =?utf-8?Q?SVyGNahsUa8joO32e4JiuEBEKhVuDjUHITWVY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR10MB6505.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(8096899003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHJ6QVpOSHk2VmdPQm5oQUxQeHcvWUk5a1lqeDVaT2dOTkpPRGxpMTJzdlNO?=
 =?utf-8?B?SWNvQmZLMHVUcmVBQUwwVXBxaTA4WXV3ZkU0aHgwaEJmZkw1UWJwQ2U5TVVT?=
 =?utf-8?B?WHJMWEw0R0oyaWdDTTBkekhJQTgwVVROOEVxRCtueEhkZGlMWUV2ZGtwYXYy?=
 =?utf-8?B?TlFXRDlocVJWTWdUbWl3N3d1ZE5VQzlCalFNVms1WVBLK0ZGaFFmVmdlemR5?=
 =?utf-8?B?Ti9HUThaOGtmR3hFbWRnUnpaL28xYjc4MkZqM09DRnJEbmR2MnR0MDlBVUJB?=
 =?utf-8?B?cW5SSTNRR1oySFduS1JLV1J3NklVRSthRitEUmQzTkVXV1prUTY2Zkg0TkhX?=
 =?utf-8?B?c2puZEF6ZXBXMmV2U2lwcjgwUERWeFJWZnhwTktudkIxNHRVUDMwRURBL0FY?=
 =?utf-8?B?THlmd3pRN2Ircm1RREMrOHV0OTk3aEt4ZlpuZkVybG9YdnNrS05GZkhKSURz?=
 =?utf-8?B?WHhJZVNad3EwRFNVSHAwMHNaZllnQkIzWi9qSDlBNXNJMkVoZjdhNzhYencw?=
 =?utf-8?B?VWlDWDAwcTBmdkRBOEhxSXZ1VUh6UmM2eHl3Nko0WDBnUENlVk9tNGRrK2h1?=
 =?utf-8?B?d2dkMkNHWFFDQkdDbHVJbzEvY1FKbmVqalR5QVU0SGxRR3hkNGVMNUFvU2xq?=
 =?utf-8?B?VVhLcnRsMjJ6OWhZdUFOQ1Z6VmdzQVpGOTNNZlZRT0tMWGozRWdaYVMrN2pX?=
 =?utf-8?B?S2tWOUxkMW9HMXpzRktJQUs0WEthNGM0WDNQTStEVUgyOG1WOHdWNXZwcmF3?=
 =?utf-8?B?K0tQOVdEWXhERXQxbHN1TC9LODliKzByY0c4aDBPMTlHaGVrVFdQYWhodHhj?=
 =?utf-8?B?dERTOXJJWXQ0c1gxT1ZCYkJndFNWbWs1bVNpbFhoaXFaWGljUGRMdXQ5VHQ0?=
 =?utf-8?B?R3AvUkwwanN4MTBKeFZUWVdGR05jVVlnc0FCTFJWSkFWZDJjME9kaWNJNkQx?=
 =?utf-8?B?OGd0dWlCUVI0U2hNYlF4dCtFMlhmeUxzMThPWG8zZW1IbDZONnlQVU1hK0hG?=
 =?utf-8?B?bDlqeTZuSGxnUnVFZm1CUnJrMjZaWU5XTlhCWEJ0eFJVL2RiNzZmOXF1L0Yr?=
 =?utf-8?B?b3BxMDlId3l2dDk3Z2VuWjVqNVdKMHoxOXdmOTZVdnl2b0hWRytSVEt6eUtx?=
 =?utf-8?B?NzNGS1Q5djRtNW9MMWJvRFNMQm1RK0UveDlTaElxQzVHOGxuNzNUM1MyaWcr?=
 =?utf-8?B?U3h3NVV4ems5d0xWbHo3VXZGb0RwNEtzNGw3UWpWeE1RQkNVT0U3VHl1cHp4?=
 =?utf-8?B?TU40MzhlcVhOcUlHdXl4bTdTOFVUaEJqMHFyOEE1NG41QXpTOW96NGNlV3Zq?=
 =?utf-8?B?VE9yeUM0dnJRaitVR1RSczhBZ1NkRmJvZmhJK1d5QVpSdDAwcDFUditMRWxN?=
 =?utf-8?B?c0QvcldCTGszRGpNU0dSMFdpeEIvWGNUclZublZyczhGRENST1NvQjltZHFP?=
 =?utf-8?B?VHBBTWFHRm9icUtKR05vNzdUS3ZYdjY2NkZUTTRTVnhHRVpKVko3L1lQMnZn?=
 =?utf-8?B?aDQ0YTl5eDNwdWJIalZNMHRHYlZmelBsVDdHeXRWZHNYaXlDWXNWY0MraUpV?=
 =?utf-8?B?aGhYWWg5M2EwUmpZdy9GRWZ3NHpQU3pEOHBZT0djZGoveXBKMlc4bHZSNHFE?=
 =?utf-8?B?bU1ING1tdWpqbGJMUldaY2VnTm5RZll2blZYeXV5YTl0ZHYrbEVrbVBoem9w?=
 =?utf-8?B?TjVHZWdkeGdRNjdVRnNLRlBxSW85dFZwL1ZMbERBOFNaUTM5ZWVWaHVjMkts?=
 =?utf-8?B?ZjN6WTJTSzdFODNubi9DUUc0NDdRc1RIbkpKSFg3SlhNR0VxWUtWYks4NEda?=
 =?utf-8?B?TlZDZGhrVmlLUC9UTDlLanhPNkVnYjVSVlpYbDVQV2NhMTNodExETVd2VEkw?=
 =?utf-8?B?d2t2QTFTdUxaN0YrRDVrRWNEcGg5aFAzREFRb1VudW1RbXoyZHpQY0kzQngv?=
 =?utf-8?B?c0NTMjVtQnoyWURkQ0s2Z1NoNWNraEFXK05HYXFmUzdadUtEZ3cxaXUvYjZI?=
 =?utf-8?B?KzZlSmRSTjZZR1UwQ1VZS1d0MUE2MnkyamFkNitwZnhCa1ExQWhWSWdsa1FJ?=
 =?utf-8?B?U2VPTjNkaTBaaXVKb214RW5CS3Nqc28zVktvbXBsbi81d2FudVpSNmZleTQ1?=
 =?utf-8?B?N2R4MFJQQmFKeHhwTlNFS0dzZ1FRT2VhSkM4ZlBKSC91b3RjckFucDAzWEVJ?=
 =?utf-8?B?ZHc9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: HiT203hN6+c+SC7cvqSWaf2iLxYxI0/rTWguhflbVr059m853r1sFyYAbOguVh4IylaLnvROw4so8VZRGmmBR84OPWRNJ80njX4Odsap67IUouh8ULxowTZug4vp4qAoTUi5AkXHHBMIQ3UWG4XOaKL0yuYucn/DlGwy+6w19g2jnT4iSvWXkQxRCh+6N1YfQScViVWqgBovtXerj+o24PBavwGMqNn4wro2Rfd2896ksPXtGu6YXUusadz6HH09EISEW+cd6KVIOJAUXmA165zmf3dzcZo0CUniwPjhiN9iRu6gT++uypookACcrmkR5G1/Z/MYCZW/VR5SQriACjLE8/DSboPb1wt3NtXnBmCZJSu9F+BOJ64MYD/6cNalWJDJGy+h8bxL/6reaMT35ZwEdgTe59zjcTxix2UtDBQgwFzBb0I2UapnWEXrqdrWiasqaOW8tVa2dH5e2ayMvYd2/cw44n87AdnA142mYPaWKvS63hqMZDh+mB0tExsKDS0LRxNDB35RHkJnTJcApWqvdadyTaj0kPmMzt36HUdNeH+faGZc6BRPw415U1nCMCUkvbHT9G6m23zGtQcWAajj2vKdbc399HJo0xQjaLU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR10MB6505.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 519a16bb-c070-4c25-b8d6-08dd14f8f3f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 06:49:23.3727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HUyIqaREmzEcby1+/KmIwKEzVdi9EUsXeaNNJYddOkk5MlfHuEIM7NsIiFIJYQzshyPZaurwMunIuAWxpFFLhYwYM5+X/GtqUMqVw1TXYqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6576
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_03,2024-12-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412050051
X-Proofpoint-GUID: VxuaUEWCv0JaDGJvIs8g-H-zsUPdBE6g
X-Proofpoint-ORIG-GUID: VxuaUEWCv0JaDGJvIs8g-H-zsUPdBE6g
X-Spam-Status: No, score=0.1 required=7.0 tests=ARC_SIGNED,ARC_VALID,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] Issue faced in memcg_stat_rss while running mainline
 kernels between 6.7 and 6.8
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
From: Harshvardhan Jha via ltp <ltp@lists.linux.it>
Reply-To: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgdGhlcmUsDQpJIHNhdyB5b3VyIG5hbWUgYXBwZWFyIHRoZSBtb3N0IGluIHRoZSBjb21taXQg
bG9nIG9mIG1lbWNnX3N0YXRfcnNzLnNoIHNvIEkgd2FzIHdvbmRlcmluZyBpZiB5b3UgaGFkIGFu
eSBpbmZvcm1hdGlvbiBhcyB0byB3aHkgdGhpcyBpcyBoYXBwZW5pbmcuIEkgZmVlbCB0aGF0IHdl
IGhhdmUgZW5vdWdoIHJlYXNvbiB0byBiZWxpZXZlIHRoYXQgdGhpcyBpcyBkdWUgdG8gb3V0ZGF0
ZWQgdGVzdGNhc2VzLiBJdOKAmWxsIGJlIGhpZ2hseSBhcHByZWNpYXRlZCBpZiB5b3UgY291bGQg
dmVyaWZ5IHRoaXMgZmFjdC4NCg0KVGhhbmtzICYgUmVnYXJkcywNCkhhcnNodmFyZGhhbg0KDQpG
cm9tOiBsdHAgPGx0cC1ib3VuY2VzK2hhcnNodmFyZGhhbi5qLmpoYT1vcmFjbGUuY29tQGxpc3Rz
LmxpbnV4Lml0PiBvbiBiZWhhbGYgb2YgSGFyc2h2YXJkaGFuIEpoYSB2aWEgbHRwIDxsdHBAbGlz
dHMubGludXguaXQ+DQpEYXRlOiBUaHVyc2RheSwgMjggTm92ZW1iZXIgMjAyNCBhdCAzOjIw4oCv
UE0NClRvOiBsdHBAbGlzdHMubGludXguaXQgPGx0cEBsaXN0cy5saW51eC5pdD4NClN1YmplY3Q6
IFtMVFBdIElzc3VlIGZhY2VkIGluIG1lbWNnX3N0YXRfcnNzIHdoaWxlIHJ1bm5pbmcgbWFpbmxp
bmUga2VybmVscyBiZXR3ZWVuIDYuNyBhbmQgNi44DQpIaSB0aGVyZSwNCg0KSSd2ZSBiZWVuIGdl
dHRpbmcgdGVzdCBmYWlsdXJlcyBvbiB0aGUgbWVtY2dfc3RhdF9yc3MgdGVzdGNhc2UgZm9yDQpt
YWlubGluZSA2LjEyIGtlcm5lbHMgd2l0aCAzIHRlc3RzIGZhaWxpbmcgYW5kIG9uZSBiZWluZyBi
cm9rZW4uDQoNClJ1bm5pbmcgdGVzdHMuLi4uLi4uDQo8PDx0ZXN0X3N0YXJ0Pj4+DQp0YWc9bWVt
Y2dfc3RhdF9yc3Mgc3RpbWU9MTczMjAwMzUwMA0KY21kbGluZT0ibWVtY2dfc3RhdF9yc3Muc2gi
DQpjb250YWN0cz0iIg0KYW5hbHlzaXM9ZXhpdA0KPDw8dGVzdF9vdXRwdXQ+Pj4NCmluY3JlbWVu
dGluZyBzdG9wDQptZW1jZ19zdGF0X3JzcyAxIFRJTkZPOiBSdW5uaW5nOiBtZW1jZ19zdGF0X3Jz
cy5zaA0KbWVtY2dfc3RhdF9yc3MgMSBUSU5GTzogVGVzdGVkIGtlcm5lbDogTGludXggaGFyamhh
LW9sOWtkZXZsdHANCjYuMTIuMC1tYXN0ZXIuMjAyNDEwMjEuZWw5LnYxLng4Nl82NCAjMSBTTVAg
UFJFRU1QVF9EWU5BTUlDIE1vbiBPY3QgMjENCjA2OjI0OjIyIFBEVCAyMDI0IHg4Nl82NCB4ODZf
NjQgeDg2XzY0IEdOVS9MaW51eA0KbWVtY2dfc3RhdF9yc3MgMSBUSU5GTzogVXNpbmcNCi90ZW1w
ZGlyL2x0cC1ZNEFFVW1LVklFL0xUUF9tZW1jZ19zdGF0X3Jzcy5rRWhEMFF2dk13IGFzIHRtcGRp
ciAoeGZzDQpmaWxlc3lzdGVtKQ0KbWVtY2dfc3RhdF9yc3MgMSBUSU5GTzogdGltZW91dCBwZXIg
cnVuIGlzIDBoIDVtIDBzDQptZW1jZ19zdGF0X3JzcyAxIFRJTkZPOiBzZXQgL3N5cy9mcy9jZ3Jv
dXAvbWVtb3J5L21lbW9yeS51c2VfaGllcmFyY2h5DQp0byAwIGZhaWxlZA0KbWVtY2dfc3RhdF9y
c3MgMSBUSU5GTzogU2V0dGluZyBzaG1tYXgNCm1lbWNnX3N0YXRfcnNzIDEgVElORk86IFJ1bm5p
bmcgbWVtY2dfcHJvY2VzcyAtLW1tYXAtYW5vbiAtcyAyNjYyNDANCm1lbWNnX3N0YXRfcnNzIDEg
VElORk86IFdhcm1pbmcgdXAgcGlkOiA5MzY3DQptZW1jZ19zdGF0X3JzcyAxIFRJTkZPOiBQcm9j
ZXNzIGlzIHN0aWxsIGhlcmUgYWZ0ZXIgd2FybSB1cDogOTM2Nw0KbWVtY2dfc3RhdF9yc3MgMSBU
RkFJTDogcnNzIGlzIDAsIDI2NjI0MCBleHBlY3RlZA0KbWVtY2dfc3RhdF9yc3MgMiBUSU5GTzog
UnVubmluZyBtZW1jZ19wcm9jZXNzIC0tbW1hcC1maWxlIC1zIDQwOTYNCm1lbWNnX3N0YXRfcnNz
IDIgVElORk86IFdhcm1pbmcgdXAgcGlkOiA5MzgzDQptZW1jZ19zdGF0X3JzcyAyIFRJTkZPOiBQ
cm9jZXNzIGlzIHN0aWxsIGhlcmUgYWZ0ZXIgd2FybSB1cDogOTM4Mw0KbWVtY2dfc3RhdF9yc3Mg
MiBUUEFTUzogcnNzIGlzIDAgYXMgZXhwZWN0ZWQNCm1lbWNnX3N0YXRfcnNzIDMgVElORk86IFJ1
bm5pbmcgbWVtY2dfcHJvY2VzcyAtLXNobSAtayAzIC1zIDQwOTYNCm1lbWNnX3N0YXRfcnNzIDMg
VElORk86IFdhcm1pbmcgdXAgcGlkOiA5NDQ2DQptZW1jZ19zdGF0X3JzcyAzIFRJTkZPOiBQcm9j
ZXNzIGlzIHN0aWxsIGhlcmUgYWZ0ZXIgd2FybSB1cDogOTQ0Ng0KbWVtY2dfc3RhdF9yc3MgMyBU
UEFTUzogcnNzIGlzIDAgYXMgZXhwZWN0ZWQNCm1lbWNnX3N0YXRfcnNzIDQgVElORk86IFJ1bm5p
bmcgbWVtY2dfcHJvY2VzcyAtLW1tYXAtYW5vbiAtLW1tYXAtZmlsZQ0KLS1zaG0gLXMgMjY2MjQw
DQptZW1jZ19zdGF0X3JzcyA0IFRJTkZPOiBXYXJtaW5nIHVwIHBpZDogOTQ2Mg0KbWVtY2dfc3Rh
dF9yc3MgNCBUSU5GTzogUHJvY2VzcyBpcyBzdGlsbCBoZXJlIGFmdGVyIHdhcm0gdXA6IDk0NjIN
Cm1lbWNnX3N0YXRfcnNzIDQgVFBBU1M6IHJzcyBpcyAyNjYyNDAgYXMgZXhwZWN0ZWQNCm1lbWNn
X3N0YXRfcnNzIDUgVElORk86IFJ1bm5pbmcgbWVtY2dfcHJvY2VzcyAtLW1tYXAtbG9jazEgLXMg
MjY2MjQwDQptZW1jZ19zdGF0X3JzcyA1IFRJTkZPOiBXYXJtaW5nIHVwIHBpZDogOTQ3OQ0KbWVt
Y2dfc3RhdF9yc3MgNSBUSU5GTzogUHJvY2VzcyBpcyBzdGlsbCBoZXJlIGFmdGVyIHdhcm0gdXA6
IDk0NzkNCm1lbWNnX3N0YXRfcnNzIDUgVEZBSUw6IHJzcyBpcyAwLCAyNjYyNDAgZXhwZWN0ZWQN
Cm1lbWNnX3N0YXRfcnNzIDYgVElORk86IFJ1bm5pbmcgbWVtY2dfcHJvY2VzcyAtLW1tYXAtYW5v
biAtcyAyNjYyNDANCm1lbWNnX3N0YXRfcnNzIDYgVElORk86IFdhcm1pbmcgdXAgcGlkOiA5NDk1
DQptZW1jZ19zdGF0X3JzcyA2IFRJTkZPOiBQcm9jZXNzIGlzIHN0aWxsIGhlcmUgYWZ0ZXIgd2Fy
bSB1cDogOTQ5NQ0KbWVtY2dfc3RhdF9yc3MgNiBURkFJTDogcnNzIGlzIDAsIDI2NjI0MCBleHBl
Y3RlZA0KbWVtY2dfc3RhdF9yc3MgNiBUQlJPSzogdGltZWQgb3V0IG9uIG1lbW9yeS51c2FnZV9p
bl9ieXRlcyA0MDk2IDI2NjI0MA0KMjY2MjQwDQovb3B0L2x0cC0yMDI0MDkzMC90ZXN0Y2FzZXMv
YmluL3RzdF90ZXN0LnNoOiBsaW5lIDE1ODogIDk0OTUNCktpbGxlZCAgICAgICAgICAgICAgICAg
IG1lbWNnX3Byb2Nlc3MgIiRAIiAgKHdkOg0KL3N5cy9mcy9jZ3JvdXAvbWVtb3J5L2x0cC90ZXN0
LTkzMDgvbHRwXzkzMDgpDQoNClN1bW1hcnk6DQpwYXNzZWQgICAzDQpmYWlsZWQgICAzDQpicm9r
ZW4gICAxDQpza2lwcGVkICAwDQp3YXJuaW5ncyAwDQo8PDxleGVjdXRpb25fc3RhdHVzPj4+DQpp
bml0aWF0aW9uX3N0YXR1cz0ib2siDQpkdXJhdGlvbj0xNyB0ZXJtaW5hdGlvbl90eXBlPWV4aXRl
ZCB0ZXJtaW5hdGlvbl9pZD0zIGNvcmVmaWxlPW5vDQpjdXRpbWU9MTMgY3N0aW1lPTU4DQo8PDx0
ZXN0X2VuZD4+Pg0KSU5GTzogbHRwLXBhbiByZXBvcnRlZCBzb21lIHRlc3RzIEZBSUwNCkxUUCBW
ZXJzaW9uOiAyMDI0MDkzMA0KDQpJJ20gbm90IHN1cmUgd2hldGhlciB0aGlzIGVycm9yIGlzIGR1
ZSB0byB0aGUga2VybmVsIG9yIHRoZSB0ZXN0Y2FzZQ0KYmVpbmcgb3V0ZGF0ZWQuIEkga25vdyB0
aGF0IHNpbmNlIGNncm91cCB2MiBpcyB0aGUgZGVmYXVsdCB1cHN0cmVhbSBhbmQNCmNncm91cCB2
MSBpcyBub3cgYSBsZWdhY3kgb3B0aW9uLCB0aGlzIHNwZWNpZmljIHRlc3RjYXNlIGlzIG5vdA0K
cGFydGljdWxhcmx5IGhpZ2hlciBpbiB0aGUgcHJpb3JpdHkgbGlzdCwgYnV0IGp1c3QgdG8gYmUg
c3VyZSwgSSB3YW50ZWQNCnRvIHZlcmlmeSB0aGlzIGZyb20geW91ciBzaWRlLiBQbGVhc2UgbGV0
IG1lIGtub3cgd2hldGhlciB0aGlzIGVycm9yIGlzDQpjb21pbmcgZHVlIHRvIHRoZSB0ZXN0Y2Fz
ZSBiZWluZyBvdXRkYXRlZCBvciB0aGlzIGluIGZhY3QgaXMgYSB2YWxpZA0Ka2VybmVsIGVycm9y
Lg0KDQpJIHJhbiBhIGJpc2VjdCBvbiBtZW1jZ19zdGF0X3JzcyB0ZXN0IHVwb24gbWFpbmxpbmUg
a2VybmVscyBhbmQgc2F3IHRoZQ0KYmlzZWN0IHJhbmdlIG5hcnJvdyBkb3duIGJldHdlZW4gNi43
IGFuZCA2Ljggd2hpY2ggZnVydGhlciBpc29sYXRlZCB0bzoNCmh0dHBzOi8vdXJsZGVmZW5zZS5j
b20vdjMvX19odHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9z
dGFibGUvbGludXguZ2l0L2NvbW1pdC8/aWQ9N2Q3ZWYwYTQ2ODZhYmU0M2NkNzZhMTQxYjM0MGEz
NDhmNDVlY2RmMl9fOyEhQUNXVjVOOU0yUlY5OWhRIUt5MG1NMlhFR0ZTaUNiY0J2alA1RlY1SVYz
a0dwRHVERWh1RlZBR1ZkRDFtWExRUGlkUmNaTHFIOGswQUZ4U2NqWmdZbmpDZ2FDSVNFZ0RWbGNu
NEJTb2okPGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0Lz9pZD03ZDdl
ZjBhNDY4NmFiZTQzY2Q3NmExNDFiMzQwYTM0OGY0NWVjZGYyX187ISFBQ1dWNU45TTJSVjk5aFEh
S3kwbU0yWEVHRlNpQ2JjQnZqUDVGVjVJVjNrR3BEdURFaHVGVkFHVmREMW1YTFFQaWRSY1pMcUg4
azBBRnhTY2paZ1luakNnYUNJU0VnRFZsY240QlNvaiQ+DQpUaGlzIGNvbW1pdCB3YXMgcGFydCBv
ZiBhIDUgcGF0Y2ggc2VyaWVzIGFuZCBJIHdhc24ndCBhYmxlIHRvIHJldmVydCBpdA0Kb24gNi4x
MiB3aXRob3V0IGdldHRpbmcgYSBzZXJpZXMgb2YgY29uZmxpY3RzLg0KU28sIHdoYXQgSSBkaWQg
d2FzIGNoZWNrb3V0IHRoZSBTSEEgYmVmb3JlIHRoaXMgcGF0Y2ggc2VyaWVzDQo0YTNiZmJkMTY5
OWUyMzA2NzMxODA5ZDUwZDQ4MDYzNDAxMmVkNGRlIGFuZCBhZnRlciB0aGUgcGF0Y2ggc2VyaWVz
DQo3ZDdlZjBhNDY4NmFiZTQzY2Q3NmExNDFiMzQwYTM0OGY0NWVjZGYyIGFuZCByYW4gdGhpcyB0
ZXN0Lg0KDQpUaGUgbWFjaGluZSBoYWQgMzJHQiBSYW0gYW5kIDRDUFVzLg0KDQpUaGUgc3RlcHMg
dG8gcmVwcm9kdWNlIHRoaXMgYXJlOg0KDQojIS9iaW4vYmFzaA0KDQojIEFmdGVyIHNldHRpbmcg
ZGVmYXVsdCBrZXJuZWwgdG8gdGhlIGRlc2lyZWQgb25lDQppZiAhIGdyZXAgLXEgInVuaWZpZWRf
Y2dyb3VwX2hpZXJhcmNoeT0wIiAvcHJvYy9jbWRsaW5lOyB0aGVuDQogICAgICAgIHN1ZG8gZ3J1
YmJ5IC0tdXBkYXRlLWtlcm5lbCBERUZBVUxUDQotLWFyZ3M9InN5c3RlbWQudW5pZmllZF9jZ3Jv
dXBfaGllcmFyY2h5PTAiDQogICAgICAgIHN1ZG8gZ3J1YmJ5IC0tdXBkYXRlLWtlcm5lbCBERUZB
VUxUDQotLWFyZ3M9InN5c3RlbWQubGVnYWN5X3N5c3RlbWRfY2dyb3VwX2NvbnRyb2xsZXIiDQog
ICAgICAgIHN1ZG8gZ3J1YmJ5IC0tdXBkYXRlLWtlcm5lbCBERUZBVUxUIC0tYXJncyBzZWxpbnV4
PTANCiAgICAgICAgc3VkbyBzZWQgLWkgIi9eU0VMSU5VWD0vcy89LiovPWRpc2FibGVkLyIgL2V0
Yy9zZWxpbnV4L2NvbmZpZw0KICAgICAgICBzdWRvIHJlYm9vdA0KZmkNCg0KY2QgL29wdC9sdHAN
CnJtIC1yZiAvdG1wZGlyDQpta2RpciAvdGVtcGRpcg0KLi9ydW5sdHAgLWQgL3RlbXBkaXIgIC1z
IG1lbWNnX3N0YXRfcnNzDQoNCg0KVGhlIHJlc3VsdHMgb2J0YWluZWQgd2VyZToNCg0KUHJlIGJp
c2VjdCBjdWxwcml0ICg0YTNiZmJkMTY5OWUyMzA2NzMxODA5ZDUwZDQ4MDYzNDAxMmVkNGRlKToN
Cg0KPDw8dGVzdF9zdGFydD4+Pg0KdGFnPW1lbWNnX3N0YXRfcnNzIHN0aW1lPTE3MzE3NTQwNzgN
CmNtZGxpbmU9Im1lbWNnX3N0YXRfcnNzLnNoIg0KY29udGFjdHM9IiINCmFuYWx5c2lzPWV4aXQN
Cjw8PHRlc3Rfb3V0cHV0Pj4+DQppbmNyZW1lbnRpbmcgc3RvcA0KbWVtY2dfc3RhdF9yc3MgMSBU
SU5GTzogUnVubmluZzogbWVtY2dfc3RhdF9yc3Muc2gNCm1lbWNnX3N0YXRfcnNzIDEgVElORk86
IFRlc3RlZCBrZXJuZWw6IExpbnV4IGhhcmpoYS1vbDlrZGV2bHRwDQo2LjcuMC1tYXN0ZXJwcmUu
MjAyNDExMS5lbDkucmMxLng4Nl82NCAjMSBTTVAgUFJFRU1QVF9EWU5BTUlDIEZyaSBOb3YgMTUN
CjExOjU2OjEwIFBTVCAyMDI0IHg4Nl82NCB4ODZfNjQgeDg2XzY0IEdOVS9MaW51eA0KbWVtY2df
c3RhdF9yc3MgMSBUSU5GTzogVXNpbmcNCi90ZW1wZGlyL2x0cC1TekU5QURLNk1NL0xUUF9tZW1j
Z19zdGF0X3Jzcy42b3AyOHNNWE8yIGFzIHRtcGRpciAoeGZzDQpmaWxlc3lzdGVtKQ0KbWVtY2df
c3RhdF9yc3MgMSBUSU5GTzogdGltZW91dCBwZXIgcnVuIGlzIDBoIDVtIDBzDQptZW1jZ19zdGF0
X3JzcyAxIFRJTkZPOiBzZXQgL3N5cy9mcy9jZ3JvdXAvbWVtb3J5L21lbW9yeS51c2VfaGllcmFy
Y2h5DQp0byAwIGZhaWxlZA0KbWVtY2dfc3RhdF9yc3MgMSBUSU5GTzogU2V0dGluZyBzaG1tYXgN
Cm1lbWNnX3N0YXRfcnNzIDEgVElORk86IFJ1bm5pbmcgbWVtY2dfcHJvY2VzcyAtLW1tYXAtYW5v
biAtcyAyNjYyNDANCm1lbWNnX3N0YXRfcnNzIDEgVElORk86IFdhcm1pbmcgdXAgcGlkOiAzNDIz
Nw0KbWVtY2dfc3RhdF9yc3MgMSBUSU5GTzogUHJvY2VzcyBpcyBzdGlsbCBoZXJlIGFmdGVyIHdh
cm0gdXA6IDM0MjM3DQptZW1jZ19zdGF0X3JzcyAxIFRQQVNTOiByc3MgaXMgMjY2MjQwIGFzIGV4
cGVjdGVkDQptZW1jZ19zdGF0X3JzcyAxIFRCUk9LOiB0aW1lZCBvdXQgb24gbWVtb3J5LnVzYWdl
X2luX2J5dGVzIDQwOTYgMjY2MjQwDQoyNjYyNDANCi9vcHQvbHRwLTIwMjQwOTMwL3Rlc3RjYXNl
cy9iaW4vdHN0X3Rlc3Quc2g6IGxpbmUgMTU4OiAzNDIzNw0KS2lsbGVkICAgICAgICAgICAgICAg
ICAgbWVtY2dfcHJvY2VzcyAiJEAiICAod2Q6DQovc3lzL2ZzL2Nncm91cC9tZW1vcnkvbHRwL3Rl
c3QtMzQxODAvbHRwXzM0MTgwKQ0KDQpTdW1tYXJ5Og0KcGFzc2VkICAgMQ0KZmFpbGVkICAgMA0K
YnJva2VuICAgMQ0Kc2tpcHBlZCAgMA0Kd2FybmluZ3MgMA0KPDw8ZXhlY3V0aW9uX3N0YXR1cz4+
Pg0KDQoNClBvc3QgYmlzZWN0IGN1bHByaXQoN2Q3ZWYwYTQ2ODZhYmU0M2NkNzZhMTQxYjM0MGEz
NDhmNDVlY2RmMik6DQoNCjw8PHRlc3Rfc3RhcnQ+Pj4NCnRhZz1tZW1jZ19zdGF0X3JzcyBzdGlt
ZT0xNzMxNzU1MzM5DQpjbWRsaW5lPSJtZW1jZ19zdGF0X3Jzcy5zaCINCmNvbnRhY3RzPSIiDQph
bmFseXNpcz1leGl0DQo8PDx0ZXN0X291dHB1dD4+Pg0KaW5jcmVtZW50aW5nIHN0b3ANCm1lbWNn
X3N0YXRfcnNzIDEgVElORk86IFJ1bm5pbmc6IG1lbWNnX3N0YXRfcnNzLnNoDQptZW1jZ19zdGF0
X3JzcyAxIFRJTkZPOiBUZXN0ZWQga2VybmVsOiBMaW51eCBoYXJqaGEtb2w5a2Rldmx0cA0KNi43
LjAtbWFzdGVycG9zdC4yMDI0MTExLmVsOS5yYzEueDg2XzY0ICMxIFNNUCBQUkVFTVBUX0RZTkFN
SUMgRnJpIE5vdg0KMTUgMTE6NTU6NDEgUFNUIDIwMjQgeDg2XzY0IHg4Nl82NCB4ODZfNjQgR05V
L0xpbnV4DQptZW1jZ19zdGF0X3JzcyAxIFRJTkZPOiBVc2luZw0KL3RlbXBkaXIvbHRwLUc2Y2dl
NENrclIvTFRQX21lbWNnX3N0YXRfcnNzLjF6cm02WDAyQ08gYXMgdG1wZGlyICh4ZnMNCmZpbGVz
eXN0ZW0pDQptZW1jZ19zdGF0X3JzcyAxIFRJTkZPOiB0aW1lb3V0IHBlciBydW4gaXMgMGggNW0g
MHMNCm1lbWNnX3N0YXRfcnNzIDEgVElORk86IHNldCAvc3lzL2ZzL2Nncm91cC9tZW1vcnkvbWVt
b3J5LnVzZV9oaWVyYXJjaHkNCnRvIDAgZmFpbGVkDQptZW1jZ19zdGF0X3JzcyAxIFRJTkZPOiBT
ZXR0aW5nIHNobW1heA0KbWVtY2dfc3RhdF9yc3MgMSBUSU5GTzogUnVubmluZyBtZW1jZ19wcm9j
ZXNzIC0tbW1hcC1hbm9uIC1zIDI2NjI0MA0KbWVtY2dfc3RhdF9yc3MgMSBUSU5GTzogV2FybWlu
ZyB1cCBwaWQ6IDkwODMNCm1lbWNnX3N0YXRfcnNzIDEgVElORk86IFByb2Nlc3MgaXMgc3RpbGwg
aGVyZSBhZnRlciB3YXJtIHVwOiA5MDgzDQptZW1jZ19zdGF0X3JzcyAxIFRGQUlMOiByc3MgaXMg
MCwgMjY2MjQwIGV4cGVjdGVkDQptZW1jZ19zdGF0X3JzcyAxIFRCUk9LOiB0aW1lZCBvdXQgb24g
bWVtb3J5LnVzYWdlX2luX2J5dGVzIDQwOTYgMjY2MjQwDQoyNjYyNDANCi9vcHQvbHRwLTIwMjQw
OTMwL3Rlc3RjYXNlcy9iaW4vdHN0X3Rlc3Quc2g6IGxpbmUgMTU4OiAgOTA4Mw0KS2lsbGVkICAg
ICAgICAgICAgICAgICAgbWVtY2dfcHJvY2VzcyAiJEAiICAod2Q6DQovc3lzL2ZzL2Nncm91cC9t
ZW1vcnkvbHRwL3Rlc3QtOTAyNC9sdHBfOTAyNCkNCg0KU3VtbWFyeToNCnBhc3NlZCAgIDANCmZh
aWxlZCAgIDENCmJyb2tlbiAgIDENCnNraXBwZWQgIDANCndhcm5pbmdzIDANCjw8PGV4ZWN1dGlv
bl9zdGF0dXM+Pj4NCg0KVGhhbmtzICYgUmVnYXJkcywNCkhhcnNodmFyZGhhbg0KDQoNCi0tDQpN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwX187ISFBQ1dWNU45TTJSVjk5aFEhS3kwbU0yWEVHRlNp
Q2JjQnZqUDVGVjVJVjNrR3BEdURFaHVGVkFHVmREMW1YTFFQaWRSY1pMcUg4azBBRnhTY2paZ1lu
akNnYUNJU0VnRFZsYndXRDhGaiQ8aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHBfXzshIUFDV1Y1TjlNMlJWOTloUSFLeTBtTTJYRUdG
U2lDYmNCdmpQNUZWNUlWM2tHcER1REVodUZWQUdWZEQxbVhMUVBpZFJjWkxxSDhrMEFGeFNjalpn
WW5qQ2dhQ0lTRWdEVmxid1dEOEZqJD4NCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8v
bGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
