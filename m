Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8DB8A591A
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Apr 2024 19:27:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1713202059; h=to : date :
 message-id : references : in-reply-to : content-id : mime-version :
 subject : list-id : list-unsubscribe : list-archive : list-post :
 list-help : list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=4BgnfLd6zbc2kX/JuK6OdlbFgY+v1Ql52lK1PtZfiXI=;
 b=XTnz4ZNDVZ6hgA9CLJNKul7Hze9cD1eoF7JMtBxClf3meiub0wuHnJOmRmwp8nAmsRAQT
 9+LphpwDut/tYn6/4oSQsQF5Q/x/v2qaupXrOXLNSZYMTOk1nPzFFphdxmI2AF1cUp4BJ7j
 0tEQa5pXkLCmTht2SGWkypj6aW4hkmM=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 988243CFA24
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Apr 2024 19:27:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3C50F3C02FD
 for <ltp@lists.linux.it>; Mon, 15 Apr 2024 19:27:37 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=chuck.lever@oracle.com;
 receiver=lists.linux.it)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2EAFD200761
 for <ltp@lists.linux.it>; Mon, 15 Apr 2024 19:27:35 +0200 (CEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43FDY6wQ017816; Mon, 15 Apr 2024 17:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=TzG4mVVzwDl5MCTwGOLaVxjMqmK/1yCqs5qMRXvwms8=;
 b=lUDauyzjb9g9LAXT+i3hGvCxTUL6aWgc5idG18Ni7uBX9tj7X9aVgF40bYK52v0g6D25
 RLGHX0ycsxDCDu+FyPZaPbKyVQNMiXsMZDoP3nQlqFA6ioEqqyDJJWUF95QdFvLHgMBi
 AXdEIrAO41cCXSKx8Mw5wFUpfQWwI6tyCxCOt19IFxvMYlCBB9wNEpMCrCrHofBKRV+i
 BDA91EM5524zTwlYxgxxlRvgYthM7oe2ELu+wrzzzkgVhIrkKIfRUdEQTZypJoBDVYCp
 b3Dgpyuw2lxa7xW9yNw1vS+H5AeDuyhUqyBLDtxQjJ/6XXQdkbG8Ock545J7oXncAJU3 0w== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xfhnubdc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Apr 2024 17:27:31 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 43FG1UZV028851; Mon, 15 Apr 2024 17:27:29 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3xfgg63a9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Apr 2024 17:27:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvkJZj1SjH6JsNclgjMcnGDMdhPp//mCbjl1+LWc1rF7moL2wcOmC+1rruPZO7u/j5FqJwp2wnQZhf/ij8Qe7LwjakD9L1ukzdzcL+XMUKFq20MbnMm0QQ3vYSM4X8HCLDzU166twLUx5CUBwZZHuf4T6VlkAX4WgSy2CcD2yuFMsnqN5my4RfOSj9rcyApPhJN4kQ4dYd42mbyANyzMWMQoS8zr7wdiv0ZUNbVXPAZgILZGuuxLwUeHhGhBDlAVKXpmkbaNlsoo5Z2P/mt0jN/VOxCcoKDkHAhwmc9sF8QKNl6QI9+EAZ40Px9ZNCWVvwQGlWMziBWjfQj998rUUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzG4mVVzwDl5MCTwGOLaVxjMqmK/1yCqs5qMRXvwms8=;
 b=Ei4sH98Ew125Fzi0R/ChVTDBLIB7hh5wN2q9i3i6Jpd6FWBr+YmKPM9MV/Wxr5RGo5TA89qq1GEx//kqj0k/jfQOOg0tX0lPKy/xcPZ6s01ZI4kXrxheObRmouoHLxNr4mPrNMY/G1WbeqFb1CtVPax7DkS11RMhkn7HwntwxmHlThf77sdprChwiHORbV7YjUGvswQp3FdEUB66PmWjTO8D6uP4z+Q0lt7i1lU+oLjnyiX7RIPAMpPmj/FYNFv8xGChop0tu7WPnTTM5TEnCALJisjynJGcqD5DhgeUV0sw5tymAhIVrv4hu/8APt9Q8ldetvmVnOsuGIptH5+jbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzG4mVVzwDl5MCTwGOLaVxjMqmK/1yCqs5qMRXvwms8=;
 b=yANheThc+drcQncC5EhXpyLr9W2bXIWVNIvALpzMm0GK3KAvk/OtBjEXyzgdiAa8P/FIArn/izYgWZ6eP31v6Xdoo9lX0fP4dZyRlMVO/NApBrMN7T8QFLIlSuaMIIZ0xKBVVHgeIGVJuHP+0gYOnNQ0etd75XKEkZqkoVVB+3M=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BLAPR10MB4817.namprd10.prod.outlook.com (2603:10b6:208:321::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Mon, 15 Apr
 2024 17:27:27 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 17:27:27 +0000
To: Petr Vorel <pvorel@suse.cz>, Jeff Layton <jlayton@kernel.org>
Thread-Topic: [PATCH 1/1] proc01: Whitelist /proc/fs/nfsd/nfsv4recoverydir
Thread-Index: AQHaj1lsRxICZAWslkS4frAkXqLFYbFplaCA
Date: Mon, 15 Apr 2024 17:27:27 +0000
Message-ID: <7A48C70E-BAAB-4A1C-A41B-ABC30287D8B7@oracle.com>
References: <20240415172133.553441-1-pvorel@suse.cz>
In-Reply-To: <20240415172133.553441-1-pvorel@suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|BLAPR10MB4817:EE_
x-ms-office365-filtering-correlation-id: 5f00899b-e205-4e4b-4b5c-08dc5d7152a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: skpnQXkOd6zuajYkopFdn9cl9XwATT8oNa/APdHmQuMABo0wvnqz2cpf0V8ew6tun403QLOKRU/lXN/5iScwlNisApifHe08DMfos13/93psiH+EGmKnndvNFFON2id4LWfCcayc7dXO4pEDHFE4pfYJ54pow3yuYCY1Yru0muwIg0eHm3PoK4nJIz2ptrW0dZZZFYrLB6X4EbMgbhuTGu8+IVjaBv1lAyN3IHx8PQF8rn+PGZ+2VNqIE69VJy1XeCMGEP03HREBWqmj5kJvhW1ea6K7ZwGpgoPWyyexQSLkAI9dC+3ntv2FWDOAwhonW5RCWYCGUU5JPEBgV5Yc/tdQLRuDVnPB0bMtRtBwiIMiZhM53hedV/QbICIku7uzFBfXQUxjC+ChtA3RN+P3JowklOyMgvEOSn9vOgwphRAuMqExhNc/1MUqz38rcwSkqdZD+9/FZSXk2WO3zbPLTXXxkClvNeYtbNPoZTdSmdUWADVHkPfeV71Sp01CZa6LPb5Bx2tF4m6DUF6zRG3/iN4icBUFDpOjBn0Ydp7Ps+Aq297C9rw4MRh4oroOhNMBAgVjpryZznBf9uhWeLvzkuauE7JATPPw9EYzeLmyTm1j+IVSFPPWcQpkHLqnvArPZWPr+7scaKJZ7zNwHfuZmcsPho+rJ2txRmP+gtSPeSKD3++iEcha4ciyKDbsCy5xroqYqSHerif2UyL3aW5i+aQzxlJ3N8d8cSlD7pWcQxs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5128.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGxVdTNyOTFjTUE4OHlUM0JkTGwyR3pqU05Db1Q3cHFYd1F1MW9oY2NZU2dU?=
 =?utf-8?B?SzlCN2xTZ0tsdjhvSWhzd3k0RHgrTUpjZEx5N0RLcUhKdHdlVXN5c2psQkc2?=
 =?utf-8?B?UG9jMEdmbWZmWGRHaXRENU5vUVdFbFZ1SU5WYUZhNmZQQ1RRdWhxM3crTFRS?=
 =?utf-8?B?cGQ3cUg0RE8raWdNeVF3b3pCTHlCK3AxM1dkUThpdjZwTll2K1E0ZUN3RWNn?=
 =?utf-8?B?TE82aXBEQjhNRVkzbWhKeTRRR2haUjFmci84dVFXaThWVjBJK3RRZlZQUVE4?=
 =?utf-8?B?VUtzZ0VpYW9mZGIzYk9PVitGMWE4TEMyWkxsRFB2Skt2N0F4NnZ3d1FPejJS?=
 =?utf-8?B?VzNEako2SzFkakVNUHo2TmRCVUhkbHh2R0lKWWlxVDIxVmplR2xRQ2NPeVFM?=
 =?utf-8?B?RTdLcGFtUjl6d3hnSGJBUFlmb3NtTkVKNEFXeHl5aHpRUmhZdDE1Q01WQmk1?=
 =?utf-8?B?U3hwdC81ZGd1OW9TQTZUbHJMck9wUGhXREpLT1FBNHEvNG1wc1pWcFg4UUJ4?=
 =?utf-8?B?em8ydjM3RE54bnVVaGJQRG05V3o3OGpENmY5dHh2ZXJQWFlBVUFlYjlUZDVE?=
 =?utf-8?B?U0ZsM1pEQmZHN2h3aXp4RmxHWHBGKytXdGR4NW5RUTJXNWJPVlR5VW1oT1Y4?=
 =?utf-8?B?d2tXVGtNcjV2SEhaQVd2Zk5rejdyTEs0Rng1d2I3YlB1ZldKdUh4NXJ1YVlt?=
 =?utf-8?B?eS9DNWE0YXJ6NmZ1TUd3YkJCNlZpWGJXMmp4alJCV05CZGZaQWxRaDNkT1lz?=
 =?utf-8?B?b1VOM3V4Rm9wSS8rVnpOQ1VMWkRxbjdaRE1relBnK2MyTk16OTJWTndBN2t4?=
 =?utf-8?B?bjJZbEpUNENRODZhK0xZaFBLaEFPYys5YzlTUitoMHM5bXVXT0xzU1AwNE0z?=
 =?utf-8?B?YjQrZnZJZkM2cWJNNm1Pek9yb3Q4eStCSVhmdjdNakRjRk02YnI1OVFJeTc4?=
 =?utf-8?B?VDdFekFObnFsQnl0bndKU0VyeDBVUDRGb2tlY0svOUR5aUhZdVBibmgyVWRo?=
 =?utf-8?B?Mzh3ZlVpRzJQQ0w5RUlkc3BIczFIV3c5U0QvWWhCdWI1UlpkYy9yY3pEb2Jy?=
 =?utf-8?B?TW5TaXQvWU5sWGFTWURQUmVRUFFqZ0ZQQmdyU0FXcE9Sd3BTdVhtVEpkRFhk?=
 =?utf-8?B?bkpEbzRUM3kvMkFaTnkzcGhlQ3Vlc2RJdG5JUHRTMFMwOWRxakxxRWVDUmFw?=
 =?utf-8?B?MGhkMDI4aHJZWE5PMVIyb0lIVXZXcFNEQ2FtOXdsNkZpSzhYencxU1QvRHJU?=
 =?utf-8?B?S2k3bG1yS1BxTVlMNWxGVW02UmZKYmEzdDM4Z3hIWWNvMjBYVmM3Uk5GWG40?=
 =?utf-8?B?ZXNreFJYNHBvckxock1ST0VEdzNpcUJFcHU4eFdGOXJqN3l5bWpmekFkYjRE?=
 =?utf-8?B?WFBNZG9jczI1a0dLYm8vUTVUNm1jZGxzVVhiMENRZVRteFZjWXVkZ3VZYTU2?=
 =?utf-8?B?ejV2ZWh4TFhxOVJkcDR5VU1QREJHNVVMR1hMRFNrM1kvVnhTMDIzRlRPeWEv?=
 =?utf-8?B?M2VVQTZGTS9ZYzU5U2hTZC9tOEZzNXhZYUJkOW54Tlk3S2Q0YVFWakxxUk42?=
 =?utf-8?B?amNScjJKTjd6UXp3TjA4L0hSSHJWSjR2MGRUcWpXdmpuTytSY095ais5Njds?=
 =?utf-8?B?NEpYcDZDYjBvY0pCT2F6MVFWNWhHOUFTbTkvRjVXRFpMRFNrWWpkbUY3RFhT?=
 =?utf-8?B?UXhwOGZoWUJiV0lXRHhZMUxsTVB5YzlPc2M5b1p4cWFsVnAzcDlEd2VPdFlj?=
 =?utf-8?B?VEFvQ283SDQ4bEFlNm5nZWo1U3BwZER0am9xbHRvMDVLTmZvVGlKcHpSNVRY?=
 =?utf-8?B?Z3NsR1dlTUZnUWpJSWRwZ3RKOW9PakNUTWVMcHJSSTNZbEU0L2I3WXhPdXFF?=
 =?utf-8?B?TnI5N1Q1bC9KQ0lxb0wray9GTFEvN0hRN0l1dm5hSjBCOVQ5dk9zMStHMlBy?=
 =?utf-8?B?ME53SjBIeXpZeFkxMHJtSUp3Z1ViNTNTYjNSTDgxc284UUZjUWp0N0Zab3h5?=
 =?utf-8?B?YllaSkFzTENHbnAzZDJISjBQQlhDc2g1Nkx4UEI3NmJWRHZGKzUycWtRWmtu?=
 =?utf-8?B?OUxQVkc5OXlMdlJucWZnY05Ba1kvOHRERmpac3MrYlJpbEtjU0FrcnhKUXRE?=
 =?utf-8?B?V1RBRE94SUNOTXhyRHdvZCtxaUlVcXlNUWJDd2RJUVpob0x3bkd6dFJrTTk4?=
 =?utf-8?B?TlE9PQ==?=
Content-ID: <0683E1EA5F31C940BD6290D1824E8DB8@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: FWa+NYPXB7CLpuUgl5E9+UgD94EeWF+uGtuJXxBBiLVvnwGrvYVu5SyxON8tgmPKr6mBvzzjJeVqOas2H9WNye7z/D6RrKyvRGmhkQJHDX6HX2OaC0u19iJ+ah+sJRc54pfhPAmZkLOj/jVzmTYx9/gdXMXH/hgmvZJ7o0I1jj4+ed0CU3tSKFqw0mdMd4l6aAfbTxjLAg+HkRzoavxjc2BAnxl2a9hzbS83+v5FVqJwscrIC2L3Ns6+F0Afp/iIBRFJMTqZY72Hvxf7xykN85XCMoYaxhA2vW/tFG8+iBASHoXL5myeHPDhAFTUGm6auza49ipO/SVmv+RHzFLuRFAAXGKgSdXMmCeQVEISuYqSEhLDEfqZQcmaoKUGbX3FlitKNbOtuc9WRBuTqj2XwpFE6+2IKPfr/bXP4jj3BNAJtUe+A+qRamPc1eW5i2CVHXiNe6wKX6PiYJ4sVXIXO0V820h2bIRmFEeMMcZ+i7+52pzIji4QrgW9eoYuytsHfYuy4GdtXl/15ppEFSdWngA0ieJFuV01eX4PN9A2BHu8FdMbJoDHG0aRN2gsl62ybi3Z2YMF04s+MzjNNCJaV/UP7BPIxxoyVLGLENQyu5M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f00899b-e205-4e4b-4b5c-08dc5d7152a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 17:27:27.8269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jMgxz6z6t0hFU3OC6tUPknQToz2XHrDE3mEbQV4J6e43FUUe8MknhxmIubjBI0LzVt0PkQTmb/2JL/OqZA8tXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4817
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_14,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404150114
X-Proofpoint-GUID: QypMg4uVNqPjVNQEg4ySTiwEt-8kKjNZ
X-Proofpoint-ORIG-GUID: QypMg4uVNqPjVNQEg4ySTiwEt-8kKjNZ
X-Spam-Status: No, score=0.1 required=7.0 tests=ARC_SIGNED,ARC_VALID,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] proc01: Whitelist
 /proc/fs/nfsd/nfsv4recoverydir
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
From: Chuck Lever III via ltp <ltp@lists.linux.it>
Reply-To: Chuck Lever III <chuck.lever@oracle.com>
Cc: Neil Brown <neilb@suse.de>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

DQoNCj4gT24gQXByIDE1LCAyMDI0LCBhdCAxOjIx4oCvUE0sIFBldHIgVm9yZWwgPHB2b3JlbEBz
dXNlLmN6PiB3cm90ZToNCj4gDQo+IC9wcm9jL2ZzL25mc2QvbmZzdjRyZWNvdmVyeWRpciBzdGFy
dGVkIGZyb20ga2VybmVsIDYuOCByZXBvcnQgRUlOVkFMLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
UGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+DQo+IC0tLQ0KPiBIaSwNCj4gDQo+IEAgSmVmZiwg
Q2h1Y2ssIE5laWwsIE5GUyBkZXZzOiBUaGUgcGF0Y2ggaXRzZWxmIHdoaXRlbGlzdCByZWFkaW5n
DQo+IC9wcm9jL2ZzL25mc2QvbmZzdjRyZWNvdmVyeWRpciBpbiBMVFAgdGVzdC4gSSBzdXNwZWN0
IHJlYWRpbmcgZmFpbGVkDQo+IHdpdGggRUlOVkFMIGluIDYuOCB3YXMgYSBkZWxpYmVyYXRlIGNo
YW5nZSBhbmQgZXhwZWN0ZWQgYmVoYXZpb3Igd2hlbg0KPiBDT05GSUdfTkZTRF9MRUdBQ1lfQ0xJ
RU5UX1RSQUNLSU5HIGlzIG5vdCBzZXQ6DQoNCkknbSBub3Qgc3VyZSBpdCB3YXMgZGVsaWJlcmF0
ZS4gVGhpcyBzZWVtcyBsaWtlIGEgYmVoYXZpb3INCnJlZ3Jlc3Npb24uIEplZmY/DQoNCg0KPiAk
IHN1ZG8gY2F0IC9wcm9jL2ZzL25mc2QvbmZzdjRyZWNvdmVyeWRpcg0KPiBjYXQ6IC9wcm9jL2Zz
L25mc2QvbmZzdjRyZWNvdmVyeWRpcjogSW52YWxpZCBhcmd1bWVudA0KPiANCj4gSSdtIGFza2lu
ZyBiZWNhdXNlIEl0IHdvcmtlZCBmaW5lIGluIGtlcm5lbCA2Ljc6DQo+IA0KPiAkIHN1ZG8gY2F0
IC9wcm9jL2ZzL25mc2QvbmZzdjRyZWNvdmVyeWRpcg0KPiAvdmFyL2xpYi9uZnMvdjRyZWNvdmVy
eQ0KPiANCj4gSSBkaWQgbm90IGJpc2VjdCBidXQgSSBzdXNwZWN0IHN1c3BlY3QgNzRmZDQ4NzM5
ZDA0ICgibmZzZDogbmV3IEtjb25maWcNCj4gb3B0aW9uIGZvciBsZWdhY3kgY2xpZW50IHRyYWNr
aW5nIikgZnJvbSB2Ni44LXJjMS4gVGhlIHN5c3RlbSBJIHRlc3QNCj4gKG9wZW5TVVNFIFR1bWJs
ZXdlZWQpIGhhcyBub3QgQ09ORklHX05GU0RfTEVHQUNZX0NMSUVOVF9UUkFDS0lORyBzZXQgYW5k
DQo+IDc0ZmQ0ODczOWQwNCB3cmFwcyB3cml0ZV9yZWNvdmVyeWRpciBzZXR1cCwgdGh1cyBpdCdz
IG5vdCBzZXQuDQo+IA0KPiArI2lmZGVmIENPTkZJR19ORlNEX0xFR0FDWV9DTElFTlRfVFJBQ0tJ
TkcNCj4gICAgICAgIFtORlNEX1JlY292ZXJ5RGlyXSA9IHdyaXRlX3JlY292ZXJ5ZGlyLA0KPiAr
I2VuZGlmDQo+IA0KPiBLaW5kIHJlZ2FyZHMsDQo+IFBldHINCj4gDQo+IHRlc3RjYXNlcy9rZXJu
ZWwvZnMvcHJvYy9wcm9jMDEuYyB8IDEgKw0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2ZzL3Byb2MvcHJvYzAxLmMg
Yi90ZXN0Y2FzZXMva2VybmVsL2ZzL3Byb2MvcHJvYzAxLmMNCj4gaW5kZXggYzkwZTUwOWEzLi4w
OGI5YmJjNzUgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvZnMvcHJvYy9wcm9jMDEu
Yw0KPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL2ZzL3Byb2MvcHJvYzAxLmMNCj4gQEAgLTExMyw2
ICsxMTMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1hcHBpbmcga25vd25faXNzdWVzW10gPSB7
DQo+IHsicmVhZCIsICIvcHJvYy9mcy9uZnNkL2ZpbGVoYW5kbGUiLCBFSU5WQUx9LA0KPiB7InJl
YWQiLCAiL3Byb2MvZnMvbmZzZC8uZ2V0ZnMiLCBFSU5WQUx9LA0KPiB7InJlYWQiLCAiL3Byb2Mv
ZnMvbmZzZC8uZ2V0ZmQiLCBFSU5WQUx9LA0KPiArIHsicmVhZCIsICIvcHJvYy9mcy9uZnNkL25m
c3Y0cmVjb3ZlcnlkaXIiLCBFSU5WQUx9LA0KPiB7InJlYWQiLCAiL3Byb2Mvc2VsZi9uZXQvcnBj
L3VzZS1nc3MtcHJveHkiLCBFQUdBSU59LA0KPiB7InJlYWQiLCAiL3Byb2Mvc3lzL25ldC9pcHY2
L2NvbmYvKi9zdGFibGVfc2VjcmV0IiwgRUlPfSwNCj4geyJyZWFkIiwgIi9wcm9jL3N5cy92bS9u
cl9odWdlcGFnZXMiLCBFT1BOT1RTVVBQfSwNCj4gLS0gDQo+IDIuNDMuMA0KPiANCj4gDQoNCi0t
DQpDaHVjayBMZXZlcg0KDQoNCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMu
bGludXguaXQvbGlzdGluZm8vbHRwCg==
