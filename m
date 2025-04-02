Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DB0A78671
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Apr 2025 04:35:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1743561327; h=to : date :
 message-id : references : in-reply-to : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=vhZajhCjVInro/8xJMtLgpAXjoUWnh8SE4D4/0FMXck=;
 b=a4tsQY7iE+u0dLyWXiufi7MpjOPban00wouuU6IgwHmQ2dMfgZx1n04acYP8MBYyAy+Xb
 9TYVdPkRfJnCOa4QYFnZ4J5teIafSAlNRVZ6f1HuV4UQZrh0jXSgITkTe6yOf5/sgGOlHk1
 6qApZz2GubnPQ5bNCwrbYp9VT1ekY3s=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D761B3CB08B
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Apr 2025 04:35:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8D3833CB07B
 for <ltp@lists.linux.it>; Wed,  2 Apr 2025 04:35:25 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=fujitsu.com (client-ip=216.71.158.65;
 helo=esa20.fujitsucc.c3s2.iphmx.com; envelope-from=maxj.fnst@fujitsu.com;
 receiver=lists.linux.it)
Received: from esa20.fujitsucc.c3s2.iphmx.com (esa20.fujitsucc.c3s2.iphmx.com
 [216.71.158.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5045360057F
 for <ltp@lists.linux.it>; Wed,  2 Apr 2025 04:35:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1743561324; x=1775097324;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1cuB6d4L01HClYR9/bUJ9AyeQl0xmVTdIJ0vkqb/rkc=;
 b=pBlPrdRfySt6Y+ba3F6gh8D+edF1iXlHTqHk2ucPsh13qNB7jsYQmpW/
 ESY48zup/GMcz7JKrmRR7XNVMOdvght/h5ec8k9ykyBTpahyn7+iDGavJ
 ElqZOMunGpET9qDHlTQzxAUGozp+nYU5mZZDmV+7S3/rn8uJ+OTBl+jcR
 3FII0aqKZzag20ogDUNnhuMJN5u2saFatTE33uOIiZ1aYb5EyEHtYMVbL
 NgdLX01iMLDVZcBWfBCrFGG2tSRofBcvyrCwV/X5PYLFPPVNxkpohclPB
 1bYmJYGPky6nfT9QDsEhAUagWZbC1kzZlPggQDVor4sqeaJklHazcalDH g==;
X-CSE-ConnectionGUID: NT2K1gMZT2GJB2niB01LRw==
X-CSE-MsgGUID: 243Sg3goRqiIYwtk1gOCyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="151346428"
X-IronPort-AV: E=Sophos;i="6.14,295,1736780400"; d="scan'208";a="151346428"
Received: from mail-japanwestazlp17011027.outbound.protection.outlook.com
 (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.27])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 11:35:20 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnx4NWc895ZQO6UXGQWXnkm+wMlv0lm/7T9itNNSoU+LIYLdL5auJY1LlwCaUvpAAMVA2lcCJGOI7lDfsgTr7p7d1obxdUTaYpqMjRGIrgTAKro0O6wZc9MADWxSaei/Rb3yccRaDdOjSIcY5Fksasrqi+pETv3HlQYwKjJdemnr3b3JqHlGomVqPMJcK5QTXO2fzZd2uw/YcG/WwWV0E1b2vGHGRyDSvmzKi31Xrt1gq4dN+UyBSt9Q/ihft33BJ5+SoWBr7Bl8oEqje2GFEaAeW6l7WtTrXBYilfkhkOAy6IIDe0fcxJnNiNDB76RZQQ4JRmyHnkenP+39VehhHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cuB6d4L01HClYR9/bUJ9AyeQl0xmVTdIJ0vkqb/rkc=;
 b=kKrpFdSOlitdTDFfuTr9xYbXCMqAJY0C/uG7F6Z35QnT2YPHnQNK6c9HfbBV6k3KC9SIrmBjgxMUpRhzlakq/1QA23ZhsIglcgdLGAwfyaddmGa/ih/uU/PHpN9kqYLfTtBAOBHaJQs8zGXMksJaLmCHvKthDu3B3S+Zhy8bQMbA95EORnxQtAcWEl7pijS80uKX9NH6fmnOl2xByI/ytYpTFmhNzZ/UMOk2ko7tLVrrsjGZc9q3Wul3K3RT6430X12Cx+TKxiVDTXoD03d28ljeyszUmWVA1bbB2+CUH57kHJDvpEtm3w57j1401HYGWq8pkBNErNvD/M0PxBtX8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB12071.jpnprd01.prod.outlook.com
 (2603:1096:400:3cc::12) by OSZPR01MB6767.jpnprd01.prod.outlook.com
 (2603:1096:604:134::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Wed, 2 Apr
 2025 02:35:13 +0000
Received: from TY3PR01MB12071.jpnprd01.prod.outlook.com
 ([fe80::479:9f00:f244:9b9]) by TY3PR01MB12071.jpnprd01.prod.outlook.com
 ([fe80::479:9f00:f244:9b9%3]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 02:35:12 +0000
To: Andrea Cervesato <andrea.cervesato@suse.com>, "ltp@lists.linux.it"
 <ltp@lists.linux.it>
Thread-Topic: [LTP] [PATCH] move_pages04: Fix the doc to fit RST format
Thread-Index: AQHboujCfkwUKMp00EKmSMi9VqX7erOOrPMAgAD877A=
Date: Wed, 2 Apr 2025 02:35:12 +0000
Message-ID: <TY3PR01MB1207138B56801633191996B04E8AF2@TY3PR01MB12071.jpnprd01.prod.outlook.com>
References: <20250401092913.135745-1-maxj.fnst@fujitsu.com>
 <54c380d2-7221-4302-8fa1-ba280610cc4e@suse.com>
In-Reply-To: <54c380d2-7221-4302-8fa1-ba280610cc4e@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9NGExMWE4YTgtMWFjNi00NzUxLTgxZDEtNzc1OWU5OWYz?=
 =?utf-8?B?NDYyO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA0LTAyVDAyOjI1OjQzWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12071:EE_|OSZPR01MB6767:EE_
x-ms-office365-filtering-correlation-id: c3dc7942-91ad-420a-ea69-08dd718efeac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|1580799027|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cm9neVE5Zk83UkJpTHNvYnl1dWpHdmdzVEYvZnZkOGI4dENJbktBODlIWEF6?=
 =?utf-8?B?TEVIbmsrVXR6cFBCUnQ5STBoMkd4WDNVQ1prMHdEd2llc1F2Q3YybWkrT3d0?=
 =?utf-8?B?S2E5cWJCUCt3UHAvRUFyZ3VvUkFxMDI5azBxUURaSGFFSUFUdU94OFZBamxY?=
 =?utf-8?B?andnVXhFZkRLWjZyaXlZK1hmMXVmMWU0T09rUDNVY0pwcUVyUUdDMjduT2pU?=
 =?utf-8?B?cytwNDZZTDFkZ0tWaUlwQ0tHWHZpbm5mZjkxOFU0YWpVWGZsb0FkSzh3Z2Fr?=
 =?utf-8?B?NTJuUll3T3lMQmVNTWJIWnZLZThwL0VUazhxcDduMEk0T0RmNFVlUTROVFpQ?=
 =?utf-8?B?SWNFMmh1ZzlvZVRXb1UzenUwREJ6SFkyZFMrUFYrVHA0MTNSY1A4cHRsTitJ?=
 =?utf-8?B?cFpFcWtlWVJDRW80Y3UwNGV6MWdnVGFzc045Y3JsRDdBZHhPN0R4bUxMNGtG?=
 =?utf-8?B?VEFlM1ZCc3dzRjg1dWRtbXhWcmlrNW1lbWtVT09walJWT3RJVGQzQzg0bFlB?=
 =?utf-8?B?dTRDajB2aytGcklORXFDU1d5TVRmM1FxOEttZmxRSXJtckdtM1pqU0JHcVRu?=
 =?utf-8?B?OVQ3Q29rOFVqWHlhV3daei80OUw1QnM3dVBFbmtXT1NmdWR6bnFiY0I2QTJG?=
 =?utf-8?B?WmZkaUl5RzZuMEdNZlJVM1ZucGtzQ1dBN25iYWphTmNaK0JWdHJNR2VFOUJ6?=
 =?utf-8?B?YmFNSmJTZTJISzdHSEV2NjlUUjJ5dnRGbDY2SGVYaXJUcG53UFArajdhL3VE?=
 =?utf-8?B?WFBmbC9ET2s1TmFtOHNZMWxTTDBob21VcFZwcjhBejBNQlJtc042S0lrTkdx?=
 =?utf-8?B?VEM3N3hDQ3lpdGF2dHJodks1UkRtWEs3UDNSM0VqQkMvU3JVRzlmREFicDVo?=
 =?utf-8?B?WUtiU1FITVJ5Y2toOUFtVmVJWlpzUkFvMEErdFBhdDhrWElWVWRhMnhPUlRJ?=
 =?utf-8?B?MnlBS0NNVERKV1FpeUtwK2dWa2tHWFVUUVVoNHJ5MUoySzRxb2dsaHhvbW5X?=
 =?utf-8?B?RE1sYlFmL1VCR3JtdzB5aGZFRS9ib25WNVc3RFkwa1pHTXJYM1h0REE3U1VV?=
 =?utf-8?B?NlVWSUtxWnMybXViYTJid1NjK1hIMFVWcDJLUGhsa0huZ2pxYWl0SmtwTFZI?=
 =?utf-8?B?WXg4dGlwSU03aFJGbTQxcHZVc29QM2NmNnBqODZyWU1oZFhpLzJYVHRRbERI?=
 =?utf-8?B?Ync3SjRGQktweitCaWNPclBNMTh6c2hRanJmNXF2MVNVbVpQZFdBak1rU0ZI?=
 =?utf-8?B?Wnhvb094QzBJWWZ5RERaZWhrR3hROFdscnlNdml0Z3NETnhmMmFVVzlhcW8x?=
 =?utf-8?B?YWx6S3pBZk1Yd05wbTZGMktvQ3U5TDltMkMyT2gvb0VrTTB1cytaWloraUhi?=
 =?utf-8?B?NUNjN3lSc05EM1lPWjRqT2Z4L0ZoTk5FVkVNZ0NTalZJT2t5ZDMzNU1pMmVk?=
 =?utf-8?B?WldnZHltWjhXblloeC9tYm1xWDIvU0QvWnBSeGRGT05JYWxaMWhPb2R2MENI?=
 =?utf-8?B?TUFoWjE3a2p1bjd1S3dvTVBIMUxUenA0bkJVLzlMRXpnTllMd3FLMElPN0pK?=
 =?utf-8?B?aFFzTDgxeFovVERtUlk2VnA0Vk1VOXRCVEthcHJMeUhFa29SeFZBVFpwcytD?=
 =?utf-8?B?NHovMUZBWGhOaDgwTktwWE9FTGVUMExHczAyWElRZzJiNS9uUlZ5a2NHbnhw?=
 =?utf-8?B?NER0aEdxN2hlQk5yczZQNXBxNjJvRDVNdUJTRTEzak5JTXdXL25LcjB5bkJC?=
 =?utf-8?B?d24xWDJFSy8xRWt3QU80dzZNSDVwUEdwdmtOV2pYQzlDS1N6U2t4Z3JUd2lZ?=
 =?utf-8?B?bmVwZDQ3ZWQ3ZDJFcmFSRlg1bFRaSE4rdjJUVnduZ1F5c1pXOW5xNmRGOWV1?=
 =?utf-8?B?QnFYT1h6YW1WR1hyVzN1QUJVRXhHMFVnUi9LOHhCL0N6OXJoai9MQ3doTHVO?=
 =?utf-8?Q?/nMQ5V6qVUkH7QPI0755B2229y6QhV+o?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:TY3PR01MB12071.jpnprd01.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014)(1580799027)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3lyR0xORXVyRDdmRWdRMUQwWTJmN0tnZW1jc1lHVTlYc21makJ1Tk1nNGRE?=
 =?utf-8?B?NUw4VVJOOWV6Y3dSditSK01jUnl6c2g5Z045bWd2OVFXdUdVTDRwMFltSHh6?=
 =?utf-8?B?NFEyTzEvU015eThpRlZoeHBMTldWSEtCSnF6anQzTlVybUo1N1p6UDAwZkox?=
 =?utf-8?B?dU9HK1ZHdkVMSVcrcnpOZGg5RWYzWVRFYTZsbjdrcUtkTmlNdU16dElBdUlO?=
 =?utf-8?B?S3dtN0FkK1hOODFOc3ora2FESFpqaFJhNTFKK2lGNlpycS8vQUtTQ0tQZEla?=
 =?utf-8?B?T2RtNUI1OTlGVXE1NWFpL1JlVVdpcG1DeTdvRW9LS3ZrZlpqaFlYQXFaRGU4?=
 =?utf-8?B?ckZCZTBpVGNnaHZjTzIxK1VIanVJMGdUYjg0bjhnenh6UERvSVd2eW9iU3h6?=
 =?utf-8?B?RU5RUW1CL21uWXg0NHczRHZmaTJuL0cwa3AyRG9mazBnMFpPWkJBS1docjFi?=
 =?utf-8?B?b2J1Zy8rdDhkbWczeHFDN2FTZVpmK0hoWGRHQm1lWlZEK2dGYVVFaFZ2bk9K?=
 =?utf-8?B?VEplblZRb3VXNUU4Wjc3NTMzd1orVmxtYTh6SXBrdVJtZENNU0xwd25oMytS?=
 =?utf-8?B?MHBmMzNwTmQ5ZnR4MHhaWlE4UnFUNFVaVU9pSXc2RUxCWGNaazNoNUNsbjY0?=
 =?utf-8?B?TDA0OWtMNGt4ejRDckhpd2t0cGREV2FTQ1JZdWUxMzlsSC9iZVZrN3EveHFN?=
 =?utf-8?B?QllrUHVVd2pMb1VuTC8yY0xsMktpZVJYSjFQaElpMmZwUlpkS2lKeHZ3WTZn?=
 =?utf-8?B?NmJVQzFMZlFpOGRvcloyamREYldFZnZ0Nnp4NytQdGE4Nkx6VGR2WnJtV1pK?=
 =?utf-8?B?V2trT1BmVWVoR0Z3a2xOdXd0d3JqVEppRVZyc2txbXh5cGRmV1Q0VEFwWDh4?=
 =?utf-8?B?S0JoZG9OS1RteEpxKzR6QUZ5Q2JmM2NuS3ZHQU1PSDR2K01mcldXU2tTdTVx?=
 =?utf-8?B?Z3ppRTJmR3NOL2N4QzdoVVJ4S3BkU0UyTzVhSWtoSjlJT3FKaVV4YTNiR0tt?=
 =?utf-8?B?bHFkbFY2YW1PclRDOGVhVHpqTzlZQTh5K0xQQXNqN2tRdXJXaUZGRWI5WVd3?=
 =?utf-8?B?N1Ztc0JzQnE0dURRakdFRlh1QnNtczhoeUQ1L2IxQ2pLc085L0VleVZxMmFH?=
 =?utf-8?B?TDBoUkZTYkxicS9qSk1kSGNBZU1laGppZjdORkIxQTRXT2QrZGtSanNoekps?=
 =?utf-8?B?c2UvdTE5N25iMGRHa2VBZGlKZHJSVmhsbXAyT3BYSzd0Z3BvZDNkQ3Nha2tm?=
 =?utf-8?B?VlVBQlErcWlia2VJanhxUVJEV25RMC9RaEtjK3ZkcEgwdEd5TDIxMjRjL0lr?=
 =?utf-8?B?dmxQcGNwZHk5eDdkMnRXWCtYbXhOUnZ0NUNweHpmci9OVHY0MkVmR3FnYkha?=
 =?utf-8?B?UlNZQmYwQXQzdXBJSkVJcStrdjMrRVpjUTgvR280S2hSWElkd3gvUkZ6MVd2?=
 =?utf-8?B?YTFLUjRJaHdobExIUWlvMlp1Wi91RE9UZmZrK1Z1bHdlUjZjMmRlM0VIcjVv?=
 =?utf-8?B?QktQQ2V2dlFSREgzblhod0hLV0dOMyt3VHRRRUh4VEFxSWIrSkRIdlB3UVBk?=
 =?utf-8?B?K2pYQXV2Y09DSVptaGQwQktZZ1gvbmMzWFppMk1WYWtGUVZWQTNnWkR2MU1r?=
 =?utf-8?B?OFI5ZE51aE5rUHNwbHRUSG9KMyt2Z1I3NVhZbVMvYUJoZ1dZUWwrbU1PYTly?=
 =?utf-8?B?NVMrdXQxYjdZUUEvTWpERHZpc1ZwWFNwL3pLVnNBeERQc3lKUHpoMERydzdt?=
 =?utf-8?B?ZXg1aGw4NDRwV2hqVjI5Ry9pb1ZWK29UUWI1VjZDRVlOendSMUlsTnNJYzdq?=
 =?utf-8?B?bWlLT3Bidkp1eURjRDFxN0FNcTRWd21ZSjF6TXZCeEtueEN2a0dpTWdNTW02?=
 =?utf-8?B?YWFEUjRKRG1UaHpEUE1tSTNMeEpLWkdKamlmdnMwTjFEVno0N3VKL3VOODUv?=
 =?utf-8?B?QTlicDdZREJjVnEwNjVNUWJ3WEcwUmVDTTNCRUV2TDR2eHR3Z3ZyeC8vMmdr?=
 =?utf-8?B?eG5tSzRsM2YwTHlzUENWSml4YWJWY3J3a3dQSURTdEpIUHNBTFNKK0dwVGVj?=
 =?utf-8?B?c1JyaDVLTndLOHJBcG5EUmJKZUJIdXJPVExvYVp0UysyZnVUQ2l5anhZRkVz?=
 =?utf-8?Q?5ny+K/bhxPC20pTCmb8zzhNl9?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: fvF0zHNX1PnKN8xifybIDzOGGtDUrVa5IfeWIvCW2bmQHkPpIjaZ2riN38UvEFzrEtk07+BXk0SF7wMpiUuuzv4f2dFxv+ipYfS9EBbY0GlcfYb3Z6hoYur6gQiuzz3gxFBA0eKbQSQdPankrpHWDyQSw30dums5o4/QvQBMJ6I7D7P/K1BkYoB2NKW9IFCG35wZl0Gs9lMj32m867bGYlOCpiwVvPXtOHaGkWH1pL3hvupvYu0lD5PFYZltBzgQwYIbEa/W+D6LPpsz7PQ5u7StBMhZpI8cr5zfUbR3lfgQRBqoF7OS1phCaZB2xbeOtIHV7Soe7Arg8UR4f2jxOwSfKVN6S3jIdraVoMf59vzBVaOhFc3H39OrV01Qbx0ffeh2pKVe0HqPyg+1ZVZJMXuobhm1TCElYxU97e4JW/3uEK1tm9YqliOujMQ3pKcjZPe//MNLKcADkh6cRn6bS1vzxDp2vG1aws8EqHqqa4cBPcAvgk3qBUDuF1e9d6/dfqFDcNsW0cymCItIDv3TSP0K26dr3s5YKoAzy9E4FjSKDRFXeMqK22S8eIOI9cCQssUAWEnnmsLXoQJFfcnwlrZVk9yt/o0mTz1kwUDu5gxuK7AZj+EvfnoXbCTx+WwL
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB12071.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3dc7942-91ad-420a-ea69-08dd718efeac
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 02:35:12.7966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WC4GUcqcK3KxBFN4lmkK/eeqK2ksGgmFQ++7NIwpdf2yBA5+1O1iqkZpqNu6PzckenQp2q+4ansOcGi7sa/NYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6767
X-Spam-Status: No, score=0.2 required=7.0 tests=ARC_SIGNED,ARC_VALID,
 DKIM_INVALID,DKIM_SIGNED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] move_pages04: Fix the doc to fit RST format
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQW5kcmVhDQoNCj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IEFuZHJl
YSBDZXJ2ZXNhdG8gPGFuZHJlYS5jZXJ2ZXNhdG9Ac3VzZS5jb20+DQo+IOWPkemAgeaXtumXtDog
MjAyNeW5tDTmnIgx5pelIDE5OjMwDQo+IOaUtuS7tuS6ujogTWEsIFhpbmppYW4v6amsIOaWsOW7
uiA8bWF4ai5mbnN0QGZ1aml0c3UuY29tPjsgbHRwQGxpc3RzLmxpbnV4Lml0DQo+IOS4u+mimDog
UmU6IFtMVFBdIFtQQVRDSF0gbW92ZV9wYWdlczA0OiBGaXggdGhlIGRvYyB0byBmaXQgUlNUIGZv
cm1hdA0KPiANCj4gSGkhDQo+IA0KPiBPbiA0LzEvMjUgMTE6MjksIE1hIFhpbmppYW4gdmlhIGx0
cCB3cm90ZToNCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYSBYaW5qaWFuIDxtYXhqLmZuc3RAZnVqaXRz
dS5jb20+DQo+ID4gLS0tDQo+ID4gICAuLi4va2VybmVsL3N5c2NhbGxzL21vdmVfcGFnZXMvbW92
ZV9wYWdlczA0LmMgfCAyOCArKysrKysrKystLS0tLS0tLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9tb3ZlX3BhZ2VzL21vdmVfcGFnZXMwNC5jDQo+
ID4gYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL21vdmVfcGFnZXMvbW92ZV9wYWdlczA0LmMN
Cj4gPiBpbmRleCBlMWVlNzMzZjAuLjNhNTZjZGFjYSAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL21vdmVfcGFnZXMvbW92ZV9wYWdlczA0LmMNCj4gPiArKysgYi90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL21vdmVfcGFnZXMvbW92ZV9wYWdlczA0LmMNCj4gPiBA
QCAtMTAsMjEgKzEwLDIxIEBADQo+ID4gICAgKg0KPiA+ICAgICogW0FsZ29yaXRobV0NCj4gPiAg
ICAqDQo+ID4gLSAqICAgICAgMS4gUGFzcyB0aGUgYWRkcmVzcyBvZiBhIHZhbGlkIG1lbW9yeSBh
cmVhIHdoZXJlIG5vIHBhZ2UgaXMNCj4gPiAtICogICAgICAgICBtYXBwZWQgeWV0IChub3QgcmVh
ZC93cml0dGVuKSwgdGhlIGFkZHJlc3Mgb2YgYSB2YWxpZCBtZW1vcnkNCj4gYXJlYQ0KPiA+IC0g
KiAgICAgICAgIHdoZXJlIHRoZSBzaGFyZWQgemVybyBwYWdlIGlzIG1hcHBlZCAocmVhZCwgYnV0
IG5vdCB3cml0dGVuIHRvKQ0KPiA+IC0gKiAgICAgICAgIGFuZCB0aGUgYWRkcmVzcyBvZiBhbiBp
bnZhbGlkIG1lbW9yeSBhcmVhIGFzIHBhZ2UgYWRkcmVzc2VzIHRvDQo+ID4gLSAqICAgICAgICAg
bW92ZV9wYWdlcygpLg0KPiA+IC0gKiAgICAgIDIuIENoZWNrIGlmIHRoZSBjb3JyZXNwb25kaW5n
IHN0YXR1cyBmb3IgIm5vIHBhZ2UgbWFwcGVkIiBpcyBzZXQgdG8NCj4gPiAtICogICAgICAgICAt
RU5PRU5ULiBOb3RlIHRoYXQga2VybmVscyA+PSA0LjMgWzFdIGFuZCA8IDYuMTIgWzJdIHdyb25n
bHkNCj4gcmV0dXJuZWQNCj4gPiAtICogICAgICAgICAtRUZBVUxUIGJ5IGFjY2lkZW50Lg0KPiA+
IC0gKiAgICAgIDMuIENoZWNrIGlmIHRoZSBjb3JyZXNwb25kaW5nIHN0YXR1cyBmb3IgInNoYXJl
ZCB6ZXJvIHBhZ2UiIGlzIHNldCB0bzoNCj4gPiAtICogICAgICAgICAtRUZBVUxULiBOb3RlIHRo
YXQga2VybmVscyA8IDQuMyBbMV0gd3JvbmdseSByZXR1cm5lZCAtRU5PRU5ULg0KPiA+IC0gKiAg
ICAgIDQuIENoZWNrIGlmIHRoZSBjb3JyZXNwb25kaW5nIHN0YXR1cyBmb3IgImludmFsaWQgbWVt
b3J5IGFyZWEiIGlzIHNldA0KPiA+IC0gKiAgICAgICAgIHRvIC1FRkFVTFQuDQo+ID4gKyAqICMu
IFBhc3MgdGhlIGFkZHJlc3Mgb2YgYSB2YWxpZCBtZW1vcnkgYXJlYSB3aGVyZSBubyBwYWdlIGlz
DQo+ID4gKyAqICAgIG1hcHBlZCB5ZXQgKG5vdCByZWFkL3dyaXR0ZW4pLCB0aGUgYWRkcmVzcyBv
ZiBhIHZhbGlkIG1lbW9yeSBhcmVhDQo+ID4gKyAqICAgIHdoZXJlIHRoZSBzaGFyZWQgemVybyBw
YWdlIGlzIG1hcHBlZCAocmVhZCwgYnV0IG5vdCB3cml0dGVuIHRvKQ0KPiA+ICsgKiAgICBhbmQg
dGhlIGFkZHJlc3Mgb2YgYW4gaW52YWxpZCBtZW1vcnkgYXJlYSBhcyBwYWdlIGFkZHJlc3NlcyB0
bw0KPiA+ICsgKiAgICBtb3ZlX3BhZ2VzKCkuDQo+ID4gKyAqICMuIENoZWNrIGlmIHRoZSBjb3Jy
ZXNwb25kaW5nIHN0YXR1cyBmb3IgIm5vIHBhZ2UgbWFwcGVkIiBpcyBzZXQgdG8NCj4gPiArICog
ICAgLUVOT0VOVC4gTm90ZSB0aGF0IGtlcm5lbHMgPj0gNC4zIFsxXSBhbmQgPCA2LjEyIFsyXSB3
cm9uZ2x5IHJldHVybmVkDQo+ID4gKyAqICAgIC1FRkFVTFQgYnkgYWNjaWRlbnQuDQo+ID4gKyAq
ICMuIENoZWNrIGlmIHRoZSBjb3JyZXNwb25kaW5nIHN0YXR1cyBmb3IgInNoYXJlZCB6ZXJvIHBh
Z2UiIGlzIHNldCB0bzoNCj4gPiArICogICAgLUVGQVVMVC4gTm90ZSB0aGF0IGtlcm5lbHMgPCA0
LjMgWzFdIHdyb25nbHkgcmV0dXJuZWQgLUVOT0VOVC4NCj4gPiArICogIy4gQ2hlY2sgaWYgdGhl
IGNvcnJlc3BvbmRpbmcgc3RhdHVzIGZvciAiaW52YWxpZCBtZW1vcnkgYXJlYSIgaXMgc2V0DQo+
ID4gKyAqICAgIHRvIC1FRkFVTFQuDQo+ID4gICAgKg0KPiA+IC0gKiAgIFsxXSBkODk5ODQ0ZTlj
OTggIm1tOiBmaXggc3RhdHVzIGNvZGUgd2hpY2ggbW92ZV9wYWdlcygpIHJldHVybnMgZm9yDQo+
IHplcm8gcGFnZSINCj4gPiAtICogICBbMl0gN2RmZjg3NWM5NDM2ICJtbS9taWdyYXRlOiBjb252
ZXJ0IGFkZF9wYWdlX2Zvcl9taWdyYXRpb24oKQ0KPiBmcm9tIGZvbGxvd19wYWdlKCkgdG8gZm9s
aW9fd2FsayINCj4gPiArICogfCBbMV0gZDg5OTg0NGU5Yzk4ICJtbTogZml4IHN0YXR1cyBjb2Rl
IHdoaWNoIG1vdmVfcGFnZXMoKSByZXR1cm5zIGZvcg0KPiB6ZXJvIHBhZ2UiDQo+ID4gKyAqIHwg
WzJdIDdkZmY4NzVjOTQzNiAibW0vbWlncmF0ZTogY29udmVydCBhZGRfcGFnZV9mb3JfbWlncmF0
aW9uKCkgZnJvbQ0KPiBmb2xsb3dfcGFnZSgpIHRvIGZvbGlvX3dhbGsiDQo+IFRoZXNlIHR3byBs
aW5lcyBjYW4gYmUgcmVtb3ZlZCBkdWUgdG8gdGhlIHByZXNlbmNlIG9mIFRhZ3MgdGFibGUuIElm
IHdlIHdhbnQNCj4gdG8ga2VlcCBpdCwgdGhlbiB3ZSBzaG91bGQgcHJvYmFibHkgbGVhdmUgdGhl
bSBpbnNpZGUgYSBkb3R0ZWQgbGlzdC4gUGxlYXNlIHRha2UgYQ0KPiBsb29rIGF0Og0KDQpUaGFu
a3MgZm9yIHRoZSByZXZpZXcuIElNTywgSXQgbWlnaHQgYmUgYmV0dGVyIHRvIGtlZXAgdGhlc2Ug
dHdvIGxpbmVzLiBUaGlzIHdheSwgdXNlcnMgY2FuIG1vcmUgaW50dWl0aXZlbHkgbWF0Y2ggdGhl
IGtlcm5lbCBjb21taXRzIHdpdGggdGhlIGRlc2NyaXB0aW9uLg0KDQpCZXN0IHJlZ2FyZHMNCk1h
DQo+IA0KPiBodHRwczovL2xpbnV4LXRlc3QtcHJvamVjdC5yZWFkdGhlZG9jcy5pby9lbi9sYXRl
c3QvdXNlcnMvdGVzdF9jYXRhbG9nLmh0bWwjbW8NCj4gdmUtcGFnZXMwNA0KPiANCj4gS2luZCBy
ZWdhcmRzLA0KPiBBbmRyZWEgQ2VydmVzYXRvDQoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
