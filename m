Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1477F986AD0
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2024 04:02:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1727316168; h=to : date :
 message-id : references : in-reply-to : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=+arxiZMN2CkAGJ10o2X/zrtnUR/SNDnNWg4Qn791Zco=;
 b=pj5FIrS7uhjoo32sR67y8vAR+NiTYxqjXqFVhc0z//U1teZoBxxspO6bs1Pzsr6tSoH2j
 pfX8hkOxEB6Xca5m+TX/ajbPaNKxsdiTVxICjkzvOZFIeKOoveRZH1VBF2iW8+Uny/6JGaP
 z/4MxLIF37dCRWyXBWEFFP5flc+rjA4=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F84B3C4E17
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2024 04:02:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B83CA3C0E03
 for <ltp@lists.linux.it>; Thu, 26 Sep 2024 04:02:46 +0200 (CEST)
Authentication-Results: in-2.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=fujitsu.com (client-ip=68.232.151.214;
 helo=esa4.fujitsucc.c3s2.iphmx.com; envelope-from=maxj.fnst@fujitsu.com;
 receiver=lists.linux.it)
Received: from esa4.fujitsucc.c3s2.iphmx.com (esa4.fujitsucc.c3s2.iphmx.com
 [68.232.151.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B6287600297
 for <ltp@lists.linux.it>; Thu, 26 Sep 2024 04:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1727316165; x=1758852165;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WTN/7IkIVgpL/gWUR5HOwCyyyUuyE+CPBfYq+kZNkWg=;
 b=hdIxD5lVVyxte5RW9ZSZOE0cqNrcX9Se/Hv1U1ezhNXYQM7lBU552Xnx
 DS2dlS50pClwkcP1CfV1RdXbkAKRew0Dlqdje4flQJHle63uPaGGZCrC8
 iv38K5icKhu4atH0L+LSQ52YmiVCxKBstCILVUJpKNc/X/szd3JS0Ob02
 y5Fng9hkYdq2ZjqYoOfxwYcVPFh83L3h9pkf7QaB8dqmUTLggW/Mkys5P
 7AfZu9XttFRcjGivI6qOOpPKk95xcsfsbuPkp7w9PZMjtphDIFtedotfF
 v1v5Qo80QQY6yGPHT77dYZ3z96D1OTCmj9BRvb98SLQ/1ZiIjhBGamkjS g==;
X-CSE-ConnectionGUID: wndPXYHcQSCPe4p+rCckmQ==
X-CSE-MsgGUID: u5C3Yd3iQmOgqDaJUBM9sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="44841936"
X-IronPort-AV: E=Sophos;i="6.10,259,1719846000"; d="scan'208";a="44841936"
Received: from mail-japaneastazlp17010007.outbound.protection.outlook.com
 (HELO TY3P286CU002.outbound.protection.outlook.com) ([40.93.73.7])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 11:02:41 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=axjSuquiDBfxEm+6EBUYivQZcvicd+XuIxkk4mngCj48fok+eXEimWefIskVuhqluIx1cKftvW3p0X+9bcaL7CNubRmz6ALKX0qY34lggBHW/+lY3oPmw3GU8PmFbu7bOsIBSrmY4REHL/hOb/gXsd9STNuZvNWxpU6hvpCTwSlhJsb65dH5VBGuhwPb7TbP270CmnFcfblBpykCvGWeexwzecGwlJ/Hi9GUS1r/+42tzmLd1oIs5tUQbDL8C/M4Or0pLLxFUnZj3NOosMUZ5tpBKvDeRDHrbg9cSvgI9+T0FxW5MgQA/UWc/sRc/sEj9w+8TmF4IH3s6+mAqHkDWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTN/7IkIVgpL/gWUR5HOwCyyyUuyE+CPBfYq+kZNkWg=;
 b=hNMZWN3Rq1JZO8stc9fUhcJoIu6itihAmJTd91eYfEZvcHs3bijhhbRdDxAVFFP7iFNzwxK+STHJiGFpH1wJdmpxMtsug1RNI5Lo15gtla1xLbLNDnlrULAh7JRZ0vtpjaVzSaAvv3y6FhYtOpQX1MmomPRoUHQ/d0pOi5mFJ4hBQFcJ3G9MsTpdEjaXGgypOSksH+SbP2WJ2qsKEI4doWvWwwy146UMcn9eCRmdMi8NaTi0IJjHhi/t/VYH6NSccTp/39BXikpLGY4squ42rbTfhpeH2uGJcRR27MRfMjACn8srplyUgUMGGZPbNPkTeiSz5Abm7y8bIT/vZaxaiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB12071.jpnprd01.prod.outlook.com
 (2603:1096:400:3cc::12) by TYYPR01MB7021.jpnprd01.prod.outlook.com
 (2603:1096:400:d9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 02:02:38 +0000
Received: from TY3PR01MB12071.jpnprd01.prod.outlook.com
 ([fe80::479:9f00:f244:9b9]) by TY3PR01MB12071.jpnprd01.prod.outlook.com
 ([fe80::479:9f00:f244:9b9%6]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 02:02:38 +0000
To: Chuck Lever III <chuck.lever@oracle.com>, "Hanxiao Chen (Fujitsu)"
 <chenhx.fnst@fujitsu.com>
Thread-Topic: TI-RPC test failures; network configuration related?
Thread-Index: AQHa+kqUwHC9Nu16i0Wh/dCilVxUmbJUYksAgBQMtXCAALJSgIAAWB3Q
Date: Thu, 26 Sep 2024 02:02:38 +0000
Message-ID: <TY3PR01MB12071A34C89D84F4F06FE70B7E86A2@TY3PR01MB12071.jpnprd01.prod.outlook.com>
References: <662B8BF1-099A-4CD0-94AB-267BE738130F@oracle.com>
 <FB5CBAAE-D2A4-42A2-93D3-FE2C893871AD@oracle.com>
 <TYWPR01MB12085B32EDB006F5C99DD8E95E6692@TYWPR01MB12085.jpnprd01.prod.outlook.com>
 <4BFE3BC1-5ABC-4924-9F53-ED87FB0D680C@oracle.com>
In-Reply-To: <4BFE3BC1-5ABC-4924-9F53-ED87FB0D680C@oracle.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9M2UzYWI4YmItNGY5NS00MWRmLTliN2QtMjI2ZmI2YThm?=
 =?utf-8?B?ODA2O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI0LTA5LTI2VDAxOjU0OjQ5WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12071:EE_|TYYPR01MB7021:EE_
x-ms-office365-filtering-correlation-id: 24d875ee-e52d-456c-1f5c-08dcddcf4c50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|1580799027; 
x-microsoft-antispam-message-info: =?utf-8?B?UWlVN2paa3p4ZkFORjkzQ3oxd3dMcjNKZHlYb0dnOXl6QzZ3UzlMOW9oeFZH?=
 =?utf-8?B?Nkh6U3BMWS9mUTFVbitVWmMvUlUvVDBLNEtLS1dNUkZEZDVFNllzUEdOUjVn?=
 =?utf-8?B?aXBCam1QK0xnZVpiQzU5R3I5MTg4UzZ6a0VmMEhPZGp6UTZrWjJrVThkYUZT?=
 =?utf-8?B?S3dxVHRla3NuQk5URVo4MnlxZCtOdEJpbHh2YmM1SzdCeHNiNWE5ajZ3SFpC?=
 =?utf-8?B?eDdaVTVGcXdjRnJWSk9WMHNUcmREZDhCTkl0T3lDa1ZVUGpuSzVQSUlUeW9D?=
 =?utf-8?B?QVJaM1V2Wmc2dTdFU3IydlhRVTB0NTRKVVJVYWRUTE9WSnBBVUxtVU83WFNm?=
 =?utf-8?B?NXdKV3RpbWNjRGRqNnAwYWp6cXNSMUREcHpwSVhKUEt6ZUsyQW5qc1B0MUMx?=
 =?utf-8?B?YVRheTZDVW9XSHc0QWtvREJtME4yVWN5L01ZTVVmbTAwVDRkYXVWdDhYRUcz?=
 =?utf-8?B?OVhyV2h6bGx4SVdrcjEydW9naGEwbnVmTGUvbll3KzFYa3FqSjFOUzlka2t2?=
 =?utf-8?B?TWxhYlJ4ZS9TaXdFellkYTh2OXBmWGJhaUVlZTdCRXhXVXMyYjhCS2tMcXBz?=
 =?utf-8?B?bUpWNHZ2bHpjWWFIMTlVcnA1WXFHWHhtaGdCcmFxMVM5blNpV2dkUlF3L0VR?=
 =?utf-8?B?NENQUDhHMkVUTkdSbHZKdktoSEFkQW1jdnYvVmVRaTFjL3B5WlVkVVF2YlZX?=
 =?utf-8?B?SkVwakNzRnFKNThVdWxjL1FpWnM5aTk2L0lRWnp5QmdRWkZGSVlLMysrbGJr?=
 =?utf-8?B?QTZpOXk1cS9HNk44TzAzVjlRb0krMTFIc1pWWk5rQjlKYlhvUzY1dVBJSlB1?=
 =?utf-8?B?dVF3R1g1RkpYWTVReGpUREg5YThlbjRXQlNlZWE0UTJRdU5GTmV0bzdDbEtY?=
 =?utf-8?B?cUFoYUcyOEErNTdweGsycFVpendRMVVEL2hzMGIzTVhNbmtBakMvL2IyQ2x5?=
 =?utf-8?B?TzZGeUZkZlJ5NmJYalpwMHkyV0UrN2NZWGRhaEs1Q0pnNmpycmdRZDVUcjc3?=
 =?utf-8?B?MHpPaTVsVGhSd2Z3eTVYOWFKdnB5TUFaOUlkVVJZcUJvV0xqTDVjeFVodnJZ?=
 =?utf-8?B?U2d1Q3JhVGpQUWZmNjc2RzF6ZmZ6dTBsTHdtY0lLUkZ0cUFiYjJYREk4cEp6?=
 =?utf-8?B?TWg3ekZybDllR096S3VYaXdNWElhQjNydTFQR3JId2hQWHpFOGdML21XRDlr?=
 =?utf-8?B?WThlbkRXTGJBUGJkTU9uamhOdTBQUGZ2cm12ZVhzTEdPYy90N09YUUkrL1ZF?=
 =?utf-8?B?MEVIMmVQZGlXWmpsV1VLQ1lSYXd4SjBKWTRSSVJLcFhQS0hlTFBTaEY3dGUy?=
 =?utf-8?B?M2lyMGNwQVdIRHVEelpiNW4wcWdIc2NrK1VmSWlydEpkaUl2dHorR3RFdW8r?=
 =?utf-8?B?ZFQ3UEdwMHNoNU91dy82TzNTY1p5VWM0a3djV3MvU0tjUmV3bTRiSXpSUnVQ?=
 =?utf-8?B?VHRsVzA3dUlidkQzcFlvY1JVTGZhTHY3QkV4MXNFVnhUWWh1SmZNZlIvOGdo?=
 =?utf-8?B?bDJjeTIwUHM2c0NaNUFlbDUvSUM2MXhzMHBuOEtHKzcxekE2NDI4UnVNeldC?=
 =?utf-8?B?Z2NvR3BHbkR6RHYvaUFtQUloVzhKYXhVWkxUdWcvbUkyQyt0K09lQzFsVVo1?=
 =?utf-8?B?K0kxRkFDQjQwS0l4MSt1Ym0yWjl0TEtNanZSZXZ3YkVvcG5WUWpUUDdPdThB?=
 =?utf-8?B?alI3Umh3Ri9KcCtDLzlIdERJbGJEZlMwQmRJWGluZWZ2Qkt3YzBFZzJFT3lV?=
 =?utf-8?B?NDJvU05LbW9jK1FCd2NKTDlCc09ibEdubzdqS3F5bHJvN2RsNmxEKzY1UXEr?=
 =?utf-8?Q?czz265NXxkqv28ln2CAVCEuigbCNJlEUMVPwU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB12071.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(1580799027); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXg0SEFVZUduYllTclZxZnk2S1BUT3BxM2h5ZysrNS96aFBPYUhtVDhMSWVM?=
 =?utf-8?B?VEVOYTg2UUhRVEVNM0NZZk1SSGVKcFdhQm1LZkpFNFVjUFVmUjFhVlVoY2xV?=
 =?utf-8?B?U2tMUHFsQStoTUlHV1FvVDdGVVZTeGRBV1pCYmZSN0E1aGtwa05oU0IzUFFD?=
 =?utf-8?B?SUlNZitoUkRkMDFPbXkzRUttSXA5SXJTYnR1MjkxMVZGcXZHU2JCeW1PK2E4?=
 =?utf-8?B?VURMV09tMFRVb3RWem42VGF0VnVrVnNZRGxqeG5EUTdoS1lIQytlaDF3ZmZF?=
 =?utf-8?B?RG40b2NTR2lCTjNiaE5tSzVIVURlOUNTbkRJdE9Ua0V1cUdYRmhTb2UvWCsx?=
 =?utf-8?B?c29QdlV6WmNXSFJMTlNndkpJbDJMMm5aeGRhR3puc1hDenpOSEt1RTcwYytj?=
 =?utf-8?B?c3BJZ0hrTHZWMU15T2JjRDR6QlE3TXdrWkk0M3Q2cEdkQW9KaW8xalY3ZFpn?=
 =?utf-8?B?MlZmNE9qbEtUQ0xnblJwdHZ1bzdSSWlrS1NQNGFWai9DZEIrVUlxSk9VUUtW?=
 =?utf-8?B?Yzc3dmxZT0NmOCttUTdiSXc5Y0NwMFJBY0lzQnMvc2cxSzJZdTdNTHJkWlNR?=
 =?utf-8?B?UTB3NS9ieU90Zytha1FBV3V1YWEwVHgySlVOc1d6RFhGVURlTmRyMC81T1Ra?=
 =?utf-8?B?L3pzc21pNkZ3cEw2TjNqZnhoVjJJWjlnN0RPN0RaQytuUmgzOWtBbTVpOFdo?=
 =?utf-8?B?azhBMzluUkNzd3dSTzZENzRvRnAzajllK3Y5d0UyNkdRSFJsSkRyQ1dsYlpa?=
 =?utf-8?B?QXNIbHkxeVZ3U0g5V1k2OWt5Y21vUzdiY3JITm5kNE4zZmtyYWI3bVZHaGR1?=
 =?utf-8?B?eUltTnhEOTF2WVF6b203WjdLYnpSS3RxZmF0dEpoQUk1ZldGMVkvUmRlcGVy?=
 =?utf-8?B?R1Q2YWhzNWc2anA1QnhZR3lSM3pibnducnBYQlRBczJBdElsQ1B4ZVUxbFZL?=
 =?utf-8?B?anoyZkcxWEUwcDA0d3B0RzN6OWRxUDY1V3ZMeUpNMEJiLzBQUDY0WHFoYzlM?=
 =?utf-8?B?VlUrWVFjeXdMbHVFYlBPaHNLUVZicTVEbkZlRnBNd0FRTHl5WUZvcytvYlBX?=
 =?utf-8?B?eFpaYklhOVIvTmlFS0xFdy9PNGtTUENQczRYNlZaMnQ0R2VRamdsbDBDY3JZ?=
 =?utf-8?B?cFJWU3BzYmpoQmFSeFZPSjVaeWpuS2NjdENBenR0TVh5RGM1S1JJb0FhbFZY?=
 =?utf-8?B?RTN3SlRyd1RSd0V3MmFzY1JXQ1NSMnFYdE5aeDV6NnhMM0laU0JvdEI3Z1J5?=
 =?utf-8?B?bkg2QWN0NHY1STY4V21YY3BCQmVLd0tOMUlzNFhnTjZjVjVvWmVJdFk1OStk?=
 =?utf-8?B?aUhIdklUYzllbG9ZU3VxdlR6a0YzVThyMUFwV2RvZzcrR3VVUGNBbi9JNXZ2?=
 =?utf-8?B?ajlWbDZSNlBrd0RNaExhei9FZ0ZUYS9EVGF0WDY3a0x6WEF0Z0dFYXpFQnUx?=
 =?utf-8?B?b0FteUhrTHJPQ0k1U21GUFAvNXJIREhQSmwvSlFzZ0pXUFliZEFITnRSSklJ?=
 =?utf-8?B?M2R4LzhYZXdxWGhkOFBrMzJPN1F4QlRLZlJuNkRxcWN2OW5TczdkVWszTktt?=
 =?utf-8?B?UGd6SGxWemVsNExSMHdYWnZLVDIxOG10cktLdmxMWFd4TkY5Q2xFUEs4dXVs?=
 =?utf-8?B?Z3hwaW8ySEptRXYxQUVWREtnQXJLUURzNlZIYjhuS2g0c0JKL1JSclRqZFZO?=
 =?utf-8?B?U1RLZmVReE0ySFVxZ2FHSmswTy9BZHM2eGgyMzJOL0hSK0VsTDcrNkNQQkVW?=
 =?utf-8?B?R2pVdXVOL1doS0F3b2ZmZGVoeTJ3MlVOQjZrZHNvSEVpN3c5RndkMXdLb2dD?=
 =?utf-8?B?ZG83dDNQM0w5MkZENHJNTSt1R2c2OTRyU3JaYU9DN1ppYnByZmxNN1VJMGhl?=
 =?utf-8?B?cUZZSDc4bDZOdHFwVkJZeS96eEtwemEvZXNZV0NkVEJEMC9DSStCUHN2c0Q2?=
 =?utf-8?B?TzgwUnFaZ3krTzRVVUFwaHY3WHQzUDB1azRPVnF4Vk4zaHhiM3ZnM2JiM2VT?=
 =?utf-8?B?QTcrYXVuOGJWODh2d0wvUUl5Z3NPUlZhcDh5N1dKMmJPVWFCQ1FTcE83cmIv?=
 =?utf-8?B?eDYvd1JSM0daVFNOclFoYTg4ZjNDelVIVWJqbDFjOENkRSt1OFJ3amUzWG5z?=
 =?utf-8?Q?bSvPP8xcCoerSOx7IKQN/LReR?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: w6z1jiglRSqwxC+7z4wKN/KGzA6F2uozFGeRD1sHKbDpbnLF/ULbFF/d1ZZtqd7/5SUSF6Tsl8hjQ89ZwDXZqgik7VJlkBi61ZZj2kBRCl4zhFNdeq5E2LrqFfrJ8lXIlMmX5BBi5sxkNpo4DZjyDhAeu/O+cBuG7G7Z7lJD1kzHlb9YwVQNCZwGt9tUeksMb+Dk57k7B/clbZtYmuc6aOHjrgccZ99GB8XairrCyckmEx7+lFV76R31IsUUKyeidx7ffOMpYe4IwcFwGGIBXVNsF558HRLXMxjr4+B4B8KiimSCvNnz4wAZOh/nqotM7zNnhp+fbBkNwwK1JSCtFv4ciAP1VQ5RQlQ3gF/aBwuq87l/0j7OYr2Ea45U3Z+KDbIOCBZCo/8TQlG9Xn9n2L741Sx/hIyiDxuYlEX4sXrUoEErifAobmMeW8+BbS5VthPThA+mb7jm5WQfmNCqPfdx1riHY/EQ5rMkwhCxW+fTsC1ll9Ho2sDVy/iYTsr3YwGYkF5CJd5IZOK2ndE1WyCDS1GyspAYwkDNpN8SnUaS7nA1DzX/FGEwlciiJffSG6eKKdmf02p0z+jnAZQIvUWGciLxpAq84r79LKqom3LtRcleSupheCXFAZGCYBPd
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB12071.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d875ee-e52d-456c-1f5c-08dcddcf4c50
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 02:02:38.7606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cpHyaUnY3jasfJB+ko4LKX3/nktVeJ6Jz8atEf3brIfxzIRBzKY/6tV7H/OI7Y+fgxXabtkagLNTiLZbXc1NVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7021
X-Spam-Status: No, score=0.2 required=7.0 tests=ARC_SIGNED,ARC_VALID,
 DKIM_INVALID,DKIM_SIGNED,DMARC_PASS,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] TI-RPC test failures; network configuration related?
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
From: "Xinjian Ma \(Fujitsu\) via ltp" <ltp@lists.linux.it>
Reply-To: "Xinjian Ma \(Fujitsu\)" <maxj.fnst@fujitsu.com>
Cc: Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Steve Dickson <SteveD@redhat.com>, "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQ2h1Y2sNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaHVjayBM
ZXZlciBJSUkgPGNodWNrLmxldmVyQG9yYWNsZS5jb20+DQo+IFNlbnQ6IDIwMjTlubQ55pyIMjbm
l6UgNDozOQ0KPiBUbzogQ2hlbiwgSGFueGlhby/pmYgg5pmX6ZyEIDxjaGVuaHguZm5zdEBmdWpp
dHN1LmNvbT4NCj4gQ2M6IExpbnV4IE5GUyBNYWlsaW5nIExpc3QgPGxpbnV4LW5mc0B2Z2VyLmtl
cm5lbC5vcmc+OyBsdHBAbGlzdHMubGludXguaXQ7IE1hLA0KPiBYaW5qaWFuL+mprCDmlrDlu7og
PG1heGouZm5zdEBmdWppdHN1LmNvbT47IFN0ZXZlIERpY2tzb24NCj4gPFN0ZXZlREByZWRoYXQu
Y29tPg0KPiBTdWJqZWN0OiBSZTogVEktUlBDIHRlc3QgZmFpbHVyZXM7IG5ldHdvcmsgY29uZmln
dXJhdGlvbiByZWxhdGVkPw0KPiANCj4gDQo+IA0KPiA+IE9uIFNlcCAyNSwgMjAyNCwgYXQgNjow
MOKAr0FNLCBIYW54aWFvIENoZW4gKEZ1aml0c3UpDQo+IDxjaGVuaHguZm5zdEBmdWppdHN1LmNv
bT4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+DQo+ID4+IC0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCj4g
Pj4g5Y+R5Lu25Lq6OiBsdHAgPGx0cC1ib3VuY2VzK2NoZW5oeC5mbnN0PWZ1aml0c3UuY29tQGxp
c3RzLmxpbnV4Lml0PiDku6PooagNCj4gPj4gQ2h1Y2sgTGV2ZXIgSUlJIHZpYSBsdHANCj4gPj4g
5Y+R6YCB5pe26Ze0OiAyMDI05bm0OeaciDEy5pelIDIzOjUwDQo+ID4+IOaUtuS7tuS6ujogbHRw
QGxpc3RzLmxpbnV4Lml0DQo+ID4+IOS4u+mimDogUmU6IFtMVFBdIFRJLVJQQyB0ZXN0IGZhaWx1
cmVzOyBuZXR3b3JrIGNvbmZpZ3VyYXRpb24gcmVsYXRlZD8NCj4gPj4NCj4gPj4NCj4gPj4NCj4g
Pj4+IE9uIEF1ZyAyOSwgMjAyNCwgYXQgMzozNeKAr1BNLCBDaHVjayBMZXZlciBJSUkNCj4gPj4+
IDxjaHVjay5sZXZlckBvcmFjbGUuY29tPg0KPiA+PiB3cm90ZToNCj4gPj4+DQo+ID4+PiBGb3Ig
YSB3aGlsZSBub3cgbXkgbmlnaHRseSAicnVubHRwIC1mIG5ldC50aXJwY190ZXN0cyIgaGF2ZSB0
aHJvd24gYQ0KPiA+Pj4gYnVuY2ggb2YgZmFpbHVyZXMgYnV0IEkgaGF2ZW4ndCBoYWQgdGltZSB0
byBsb29rIGludG8gaXQgdW50aWwgbm93Lg0KPiA+Pj4gV2l0aG91dCBtb2RpZmljYXRpb24sIGFi
b3V0IGhhbGYgb2YgdGhlIGNsaWVudCB0ZXN0IHByb2dyYW1zDQo+ID4+PiBzZWdmYXVsdC4NCj4g
Pj4+DQo+ID4+PiBIZXJlJ3MgYSBzYW1wbGUgdGVzdCBmYWlsdXJlLiBJIGluc3RydW1lbnRlZCB0
aGUgdGlycGNfY2xudF9kZXN0cm95DQo+ID4+PiB0ZXN0IGNhc2UgYW5kIHRoZSBycGNfdGVzdHMu
c2ggc2NyaXB0IGFzIHNob3duIGJlbG93LCBidXQgSSBzdGlsbA0KPiA+Pj4gZG9uJ3QgdW5kZXJz
dGFuZCB3aHkgY2xudF9jcmVhdGUoM3QpIGlzIGZhaWxpbmcuDQo+ID4+Pg0KPiA+DQo+ID4gSGks
IENodWNrDQo+ID4NCj4gPiBJIGNhbiByZXByb2R1Y2UgdGhpcyBpc3N1ZSBvbiBteSBDZW50T1Mg
MTAgc3RyZWFtIG1hY2hpbmUgd2l0aCB1cHN0cmVhbQ0KPiBMVFAuDQo+ID4gbGlidGlycGMtMS4z
LjUtMC5lbDEwLng4Nl82NA0KPiA+IHJwY2JpbmQtMS4yLjctMi5lbDEwLng4Nl82NA0KPiA+DQo+
ID4gSW4gbXkgbGltaXRlZCBpbnZlc3RpZ2F0aW9uLCBpdCBsb29rcyBsaWtlIGxpYnRpcnBjIHJl
dHVybnMgTlVMTCB3aGVuDQo+ID4gTFRQIHRyeWluZyB0byBjcmVhdGUgY2xpZW50Lg0KPiA+DQo+
ID4gOTM3IF9fcnBjYl9maW5kYWRkcl90aW1lZChwcm9ncmFtLCB2ZXJzaW9uLCBuY29uZiwgaG9z
dCwgY2xwcCwgdHApIC4uLg0KPiA+IDEwMjMgICAgICAgICAgICAgICAgIENMTlRfQ09OVFJPTChj
bGllbnQsIENMU0VUX1ZFUlMsIChjaGFyICopKHZvaWQNCj4gKikmdmVycyk7DQo+ID4gMTAyNCAg
ICAgICAgICAgICAgICAgY2xudF9zdCA9IENMTlRfQ0FMTChjbGllbnQsDQo+IChycGNwcm9jX3Qp
UlBDQlBST0NfR0VUQUREUiwNCj4gPiAxMDI1ICAgICAgICAgICAgICAgICAgICAgKHhkcnByb2Nf
dCkgeGRyX3JwY2IsIChjaGFyICopKHZvaWQgKikmcGFybXMsDQo+ID4gMTAyNiAgICAgICAgICAg
ICAgICAgICAgICh4ZHJwcm9jX3QpIHhkcl93cmFwc3RyaW5nLCAoY2hhciAqKSh2b2lkICopDQo+
ICZ1YSwgKnRwKTsNCj4gPg0KPiA+IFRoZSB1YSBnb3QgIiIgb2YgbGluZSAxMDI2DQo+ID4NCj4g
PiAxMDI3ICAgICAgICAgICAgICAgICBzd2l0Y2ggKGNsbnRfc3QpIHsNCj4gPiAxMDI4ICAgICAg
ICAgICAgICAgICBjYXNlIFJQQ19TVUNDRVNTOg0KPiA+IDEwMjkgICAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKCh1YSA9PSBOVUxMKSB8fCAodWFbMF0gPT0gMCkpIHsNCj4gPiAxMDMwICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogYWRkcmVzcyB1bmtub3duICovDQo+ID4gMTAz
MSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJwY19jcmVhdGVlcnIuY2Zfc3RhdCA9
DQo+IFJQQ19QUk9HTk9UUkVHSVNURVJFRDsNCj4gPiAxMDMyICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZ290byBlcnJvcjsNCj4gPiAxMDMzICAgICAgICAgICAgICAgICAgICAgICAg
IH0NCj4gPg0KPiA+IE1heSBiZSBycGNicHJvY19nZXRhZGRyX2NvbSBvZiBycGNiaW5kIGJyb2tl
bj8NCj4gDQo+IFRoZSBwcm9ncmFtIGlzIHJlZ2lzdGVyZWQgb24gb25lIG9mIHRoZSB2ZXRoIGlu
dGVyZmFjZXMuDQo+IFRoZSBycGNpbmZvIHdvcmtzIHRoZXJlLiBUaGUgdGVzdCBwcm9ncmFtIGlz
IHJ1bm5pbmcgb24gYW5vdGhlciB2ZXRoLCBhbmQgaXQNCj4gY2FuJ3Qgc2VlIHRoZSBmaXJzdCB2
ZXRoIGF0IGFsbCAobm8gcm91dGUgdG8gaG9zdCkuIFNvIHRoZSBjbG50X2NyZWF0ZSgzKSBmYWls
cy4NCj4gDQo+IFRoZXJlIGlzIHNvbWUga2luZCBvZiBjb25maWd1cmF0aW9uIHByb2JsZW0gb24g
bXkgdGVzdCBzeXN0ZW0uIFdhcyB0cmF2ZWxpbmcNCj4gbGFzdCB3ZWVrLCBidXQgSSBoYXZlIHNv
bWUgdGltZSB0byBsb29rIGF0IGl0IGFnYWluIG5vdy4NCj4gDQo+IA0KPiA+IEhpLCBNYQ0KPiA+
DQo+ID4gQ2FuIHlvdSBmaXggdGlycGMgY2FzZXMgdG8gbGV0IExUUCBnZXQgcmlkIG9mIHNlZ2Zh
dWx0Pw0KPiANCj4gQWxsIHRoZSBSUEMgdGVzdCBwcm9ncmFtcyBhc3N1bWUgdGhhdCBsaWJ0aXJw
YyB3aWxsIHJldHVybiBhIG5vbi1OVUxMIGNsbnQsIGFuZA0KPiBzaW1wbHkgcHJvY2VlZCB0byBj
YWxsIENMTlRfREVTVFJPWSwgd2hpY2ggc2VnZmF1bHRzIGluIHRoZXNlIGVycm9yIGNhc2VzLg0K
PiANCj4gSWYgdGhlIHRlc3QgY29uZmlndXJhdGlvbiBpcyBub3QgY29ycmVjdCwgdGhlIEFQSSBy
ZXR1cm5zIE5VTEwgYW5kIHNldHMgY2Zfc3RhdC4gSXQNCj4gd291bGQgYmUgaGVscGZ1bCB0byBk
aXNwbGF5IHRoZSBjZl9zdGF0IGVycm9yIGluIHRob3NlIGNhc2VzLCBhbmQgc2tpcA0KPiBDTE5U
X0RFU1RST1kuDQoNCkdvdCBpdCwgSSB3aWxsIHNlbmQgcGF0Y2hlcyB0byBnZXQgcmlkIG9mIHNl
Z2ZhdWx0IGluIExUUC4NCg0KQmVzdCByZWdhcmRzDQpNYQ0KCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
