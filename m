Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3C6596B63
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Aug 2022 10:36:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80AAB3C9AD4
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Aug 2022 10:36:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 93FDC3C9737
 for <ltp@lists.linux.it>; Wed, 17 Aug 2022 10:36:05 +0200 (CEST)
Received: from esa18.fujitsucc.c3s2.iphmx.com (esa18.fujitsucc.c3s2.iphmx.com
 [216.71.158.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EB9CE100099D
 for <ltp@lists.linux.it>; Wed, 17 Aug 2022 10:36:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1660725365; x=1692261365;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nxIKzwvKIyp6/Nip4EIPM0IEkbi2IfJsGV0wJTwrwtk=;
 b=vBcQDeUA+kMCFV+6OfC71oamETcvrKvmPr+OvTq5aeYo+jPJc7NsZAkl
 HggXbbZyF1ABzqclMeasjxPUaLJ9szrrGnpOzPlqZWFoS09UqYYbhhDmQ
 bylRomhkZhDhiwPsTk5N/La2VTDFj6Ku8ErCGw23oPRHYDKhAwHQWX997
 9YruGfNPkQQX6OTCN74xy6e6kqgZeFLFR2Fk5LbD+87CU0ggiWEyitrP+
 isppo7h8Ott7d6GXfs3kSrdS0tylzWb6guF33hJrDLh7T5n0KBiKq1k5Y
 7wp+Mv60VWOV72Kyfd3+Yy+Yux+9RpeABfzBltZSFgyOvkuw96WD2mLYu w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="64452137"
X-IronPort-AV: E=Sophos;i="5.93,242,1654527600"; d="scan'208";a="64452137"
Received: from mail-os0jpn01lp2111.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.111])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 17:36:02 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEiwbUw78rgbBWS64Pt1Brapsb/iqEWHhABlqvLvmxKeUCfqOsfFfBJWcNN1B3dlr7THi7r5nKnkr1IB2ZR1xFh4yNeCwqv4DERqPtL2Nl+XoCboJwTiW1rV5Q9mzWv5LSBltllwTS8sk9avY9JiIC7sbLe0SLADIa0e2ndN/PmGycEz2NFgqewWMRBo/dc5QcNnflZkesJRaT20MwhGzMfpwtwLnDsOwMEe8cwc34wi8p7zMVbyFIKit5CvB0NzgbXCfiAOPi0U8WCHviP/ZpwLCdrEIvh/16xsLtCskpKjjHlnJWiXdeCq+hUHTsT7SPSZLGX0trwVYHXw18/bBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxIKzwvKIyp6/Nip4EIPM0IEkbi2IfJsGV0wJTwrwtk=;
 b=H8GqjO1HKzILWSNgpPQeEuP39gL0BV/M/fbSBJH0h9gWB6j82UJ7LA8PZPM6Zszyyn0PtroQOJYZWktI7yVkCpYAfNXHXVK/cqdSLG1iHr3I+FiPhED2jlhBPjkrjOtll5kR7tTN6kyimFTFQTL3dAWdvQvlIOWtvZC5SRalYn4Ft4czvslaSi8wgx50cS7QqjD9BseK7eX3ymNOsd/kGwzLMexRdU5TMn/wJTyr4GDuRDyiA9ifEwIuPDvAkmV2C7kawkg4jZGJIe/nXejOrN+PCcqlp6BkUHLW54VSUfVDEy6SJmW7VEke6Chie81jEnf2ozrf+vF1tAXshh0QHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB10061.jpnprd01.prod.outlook.com (2603:1096:400:1de::9)
 by TYCPR01MB5726.jpnprd01.prod.outlook.com (2603:1096:400:46::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 08:35:58 +0000
Received: from TY3PR01MB10061.jpnprd01.prod.outlook.com
 ([fe80::6df6:c041:39a8:5702]) by TY3PR01MB10061.jpnprd01.prod.outlook.com
 ([fe80::6df6:c041:39a8:5702%6]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 08:35:58 +0000
From: "liaohj.jy@fujitsu.com" <liaohj.jy@fujitsu.com>
To: "akumar@suse.de" <akumar@suse.de>
Thread-Topic: [LTP] [PATCH] syscalls/openat01: Convert into new api
Thread-Index: AQHYsUXXGfirZLAVr0aQnZsFa95D062xd7iAgAFOeoA=
Date: Wed, 17 Aug 2022 08:35:58 +0000
Message-ID: <ed30ce08-11bd-140b-5fcc-4fe4ca08823d@fujitsu.com>
References: <1660636622-5252-1-git-send-email-liaohj.jy@fujitsu.com>
 <1862883.hHHqqg6b1x@localhost>
In-Reply-To: <1862883.hHHqqg6b1x@localhost>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c559f3f-d0bb-4c23-6fc0-08da802b8271
x-ms-traffictypediagnostic: TYCPR01MB5726:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0Ybn3zYz1ZmhGI/QzV/Jox3DASRIicTKUcgHOcyU+w8rTEOAYvQGXk6DhdZKcjGcma8caa0YLszb80HOY++fifEesIBBr+b30u/ThDfuBVrXX3RjDRiH0Vz21Hcgrtb981fqA2h/5tYaikR/fOJrGyV6p79dhbVTpYkxr5LHaRctDQzGtKLu1hndO7q4nIcFQzAc35HMg5u1AxQuOIIY6blmdyvlDKk8xqT7xv28DOnrcBGKDhRRxi1AnJjNRXM3PwU7TnDAcyWKQ7oN4Bq/maCSXUj/auuMAto3clWgU+c2T6CBlLEAd6mT24ZtEBeZ+JyWhfZqfcPMmzt9x0+kBApFNf46WbxuD3ixD5sNg+6D1QHdwoYioVPYb7Rq1DKaKMSI8/42wVnsseLqp1eYc25+NVaexCv8jDPN8Z95CtjiQBaSmM9/xKMDfHHwmOeMuYXZuX/+xXXDpwB9kvdkfYFXltGTWjaRJL2VqIrwtJUU7JaliSyKSQaDdHK+1pgms9jZPCujvnwRECz7RiTrBO5KwbwAA9kxKZQsciioSFfwfACFEwOX7Nu0+f4kmZNnTIPelz6FfxVI9UvTb5lcYIkIWNvEnr4df91RyHRUMB68k7iJ9HnH2bjCZtAP/Xl+6D1KcyqChmZPN3KZeXnCiVink7uPl43S7pm/8S7MLpBtaJtOXRzI9KLVJleR9Ax9S13xNmRqObB2sHQkCzZ3kAn2GsQ024HWbBB5N3RPBONfXbQ64RW+NJiwAVjJrWHRjKntfZy4PIGVmiK/yV+tffc2SShB09hY8zpKqw5wtQzYSL6lQc07+huLKK/fcuC0YgGOwfCVnP9DB0FsS02kg59hceEKlN183EkrdR9S+7aQck8ukiDTgiL/spfI2/D8OXZP4ZT8AN5jmkOZPKhxeA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB10061.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(38100700002)(53546011)(966005)(4326008)(316002)(64756008)(66556008)(8676002)(6916009)(83380400001)(478600001)(91956017)(36756003)(31686004)(66946007)(66446008)(6486002)(76116006)(31696002)(86362001)(26005)(5660300002)(8936002)(2906002)(6506007)(6512007)(82960400001)(2616005)(122000001)(1580799003)(71200400001)(41300700001)(66476007)(85182001)(38070700005)(186003)(2004002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXVOQjUrakY0MUM3MjQvNzBTemtQdnByanNwQ1p3S0hoelFEamg4dlJ1b3NZ?=
 =?utf-8?B?YnRsWHVtRDEwYy9rUk53N0dQS3d1bVIvTkhuaHI2alVYbTFJN3F1eXRMWFVU?=
 =?utf-8?B?ZXFyWDRZcUt0Z0VHVC9veExXeFdrZS9ycHJQcWtSZVgvNDJiUmVKZUR6L2xn?=
 =?utf-8?B?cU5EbDZRSkhtWGdrOVJOQjd5aHkzWUltYml3aXhRUFdadGFaODc3d3JEOXZ1?=
 =?utf-8?B?M0tvZHNFY2RuZXA0ZHA1RDlTNmxmbzg0cE5LT2k2bHBVRWxKTGl4YXh5UXl0?=
 =?utf-8?B?eWVOTTViYzRWaEV1QXdVNHJ1SUtBdFF6N2FPaTUzVnFLb20vTjhXTU13UFN1?=
 =?utf-8?B?QWk5T053M2N3WUNOejJ5VU5MTmxJVFU1NXAwZ0xpYXFKbUFiSnhodm00NHZT?=
 =?utf-8?B?QXQrbzBocXNVQnlsTTVpYzU2ZjB6NlNHTlMzM1BQNmR1VnovTHFlN3ZMVG1F?=
 =?utf-8?B?UFlwWDgvZG0rNkswc0lmM0dvUURxdTVQaEtwYTg2M2dsRW5JVEwyWlpjL1o2?=
 =?utf-8?B?RkU4UjVzZUJNL0dCajJZVmNjVnl4YzFTRUluWm5OOTEzeXZkQ09TYWFJV2Jj?=
 =?utf-8?B?aldtcXdaWkt1c1k4NnEySU1XOTg5cHpsZzdxamhtK2NUUTFZN2RxQ25yT1gw?=
 =?utf-8?B?UWxneFovYjE4MVROZHZhQTdDK2dBaUNWYUJtNTY2bXJ5eTFJbVFuOU1zQlRP?=
 =?utf-8?B?ckc4MklLUzBkaVY1VnY4Zi8zeThLV1M1MTA0WWc1U2NFeTBlSW41MXZvRHM0?=
 =?utf-8?B?SWkyVUNmd2xZcGdnTkFxTjR2Q2huSmhIOXE3L1FsdzlpT1F5SXNHUEFhdm5x?=
 =?utf-8?B?bkNoMllPSFRzcGNHNThwTHhkbHFnUGxScGRYbm1TSlVEOC9EeGNFUFpwdnU0?=
 =?utf-8?B?clVyUzBqK2hBdzQxOWx3WC9SMTdHZlYrYjR6TFVLY0xSYlJibC9acEVYcmdu?=
 =?utf-8?B?Y2l4UVpoalViNzltazBUVXpUd3RlSVZ5V3NrTXdoc2Z2NnJRSlVibGNUbCs1?=
 =?utf-8?B?RTA2Zklqc3NTRkwxWjlxdWdsQmlaMmprWXAzNDl2YkZSR05RelE1akZNN2tT?=
 =?utf-8?B?VlZ3MFVZZDh6MExxNG1acjZ6bnc5UUVDeG5xRXpiS1hQL3VmWWNZU2NZNFNU?=
 =?utf-8?B?eDJiUHBaNEI1RnFwY1pWRVJCNUgxUUR6eDltVmtTRm5uOGt4WW9UY3R6MTBV?=
 =?utf-8?B?cWxJejM3SCtuZjVZcVdWTm1DamlFeTBGUldLTkRPNStLYUZVT0FYVlBEcCs1?=
 =?utf-8?B?YVQraGczcUozMUNxTjZZTnhSTkxiT2M0VEdZUFNWUUNucUk5SHppM2g2YjVD?=
 =?utf-8?B?RTdJb2tnWWVhYW1hVm52cFBkdzBvdTN1N0xQelIyRU9GWkFRd0xiV3FGTVVp?=
 =?utf-8?B?TnZxQkJEcDVVUnYzWW5VUmpubzErZ3ZCcjJCTjhvcEcyVzJYakkvNURzWEls?=
 =?utf-8?B?ZGlSSWJYOUhXUGcyNmNNYVprQnhoL00rY3g2alQ3cVVTbTFKczJTY01TK1NS?=
 =?utf-8?B?MGJhZE96ZjM2QkU0d1RhQndSU1ZJVzRMcUJnY3lyU2RsU0NESHhLZWo2R0pM?=
 =?utf-8?B?eEhINUtEMmJ4RGVxUnNoSytzTlVwNE1hS0ZKdXZ5alVKSUc3SkRZVUxjMFI0?=
 =?utf-8?B?SjNkSGRScUN4SzY4UEdMRkJ3UGI2bEFXL05Zd3dzWmNQMEtRbmdNQzNaejBu?=
 =?utf-8?B?b2RqZUl2WThMcldUM2lmY0twRFNFR1FpczhZN2I1cElhcDBMaFhDVEFmZUlv?=
 =?utf-8?B?eXZ3SUpvUCthVHovTXlhSFBFa3pEOWtzWlpQQ0RUbUZXV1hwanR2K3grSzda?=
 =?utf-8?B?UVhYUTNjNXJWSTNXWFJta1M3ZXNPWDcvMjJac2d4eVplb3ZPa3ZOKzNjS1ZC?=
 =?utf-8?B?M2ZPYkJGTTVZMFlsaDdIeGFwVG1CNmRRb3Z5L1FBYUQzNXlVeDh2c1g2amZC?=
 =?utf-8?B?YjN4d1NnNmd4V3pvNFZIT0xyYWx1MkpVdzYwczE5cmI2bzB0SENVT2tuZjAr?=
 =?utf-8?B?T3gvbnFvTngzT2UvUUllbFFjZmE5Q0RsVlZPVEdEQUo3M2xiMC9na21uY1pk?=
 =?utf-8?B?S0lJMjFVK1hzcWhmVnhwTlkvVEJsSExlN3pvQ1ByR1U0dWRaOG4wSDQrY1Bi?=
 =?utf-8?B?eVJjdUNZbmdBeWsxRmtOSERmMEVzUWg3SHFoREJndk9EdHdBUTRTSjRTbGZy?=
 =?utf-8?B?Qnc9PQ==?=
Content-ID: <484F2E4530C1AA468068752AE7FDB68C@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: v0PnrfQ9isrt0iGE7lHiyyTJbdT6FyRG3ltwkxXehhmUtH+VKnnkuP6KMZyWKJMTenJbj7BOduUE+CqRiRATtWhQdYZiOAzZIbzm13xz+nyClH37L+MKvR5PopY5DWWPBDw0jkYUwBhycd7DDkqI/TlGkx1c+by2SPbAldDYpfOIx+RgNl0S5Yyaczmf7b51wYtoj5pC0UYDrNrdxMJLf4NX3cEQyCHSQqg0yg4Em1XXn9lOs5SNfI7uK7JSlIAIR3WmNvYEiyX9E8bYqEtFg3ZoZqENToAQ+Yast1f4UgCeBNehtaScvf4NuyJ0s/4gMklU9wNanUeT9GGvOuZEZMem1vHYNiP7Vnalh1KmPRRu/p8FtgU/Pdc2LKL5IgGGnlCwgq9LjQKXQGfGH7I958aQBA+XJ28BPQJ5Qi2ax5IDf9SI25EZgM0DrUj0t6PHpdZTrrX5eF/gmbeKa9cVX3Bu0MKRmvkXRIty7DotYBG7bT7eXJgwPkkhugYKCUQCZHQvhHTpfQBpsTWJh3u0VN23m55q97XPqzIBXY6+uFHAGQjjAA636eXqwfJuL7CgNY48Dd0qOTFikIPmeb6mSJ+Vfc5ieFulkf5fMcnnQZlU/vJZS856D7vWea5IiyZiG2fpSwehZKxP2fykHGCVzuOO9OREvuZtLTKebEEzGVNoaP1+oh/ctetwT4eoUn4/T5TMy22T8COHhYLpHTMkU9XgRngp7P0MsIy4t33ToWQQCR/GPCOc+bciHL+CVXxY
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10061.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c559f3f-d0bb-4c23-6fc0-08da802b8271
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 08:35:58.6299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kp43A7QAnshNtOkkkosHp0OsS/qQxkOvccQ91nFnUOKJPxDJjJdylLG0beSWtRWbYzX2h7JyNw83H+pljjJPrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5726
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/openat01: Convert into new api
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQXZpbmVzaA0KDQo+IEhpLA0KPiANCj4gT24gVHVlc2RheSwgQXVndXN0IDE2LCAyMDIyIDE6
Mjc6MDIgUE0gSVNUIExpYW8gSHVhbmdqaWUgd3JvdGU6DQo+PiBGcm9tOiBIdWFuZ2ppZSBMaWFv
IDxsaWFvaGouanlAZnVqaXRzdS5jb20+DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSHVhbmdqaWUg
TGlhbyA8bGlhb2hqLmp5QGZ1aml0c3UuY29tPg0KPj4gLS0tDQo+PiAgIHRlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvb3BlbmF0L29wZW5hdDAxLmMgfCAxNDUgKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgOTQgZGVsZXRp
b25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvb3Bl
bmF0L29wZW5hdDAxLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL29wZW5hdC9vcGVuYXQw
MS5jDQo+PiBpbmRleCBkYWVkNDE5Li4yNWIzZjgzIDEwMDY0NA0KPj4gLS0tIGEvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9vcGVuYXQvb3BlbmF0MDEuYw0KPj4gKysrIGIvdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9vcGVuYXQvb3BlbmF0MDEuYw0KPj4gQEAgLTEsNTUgKzEsMzAgQEANCj4+
IC0vKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqDQo+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb3ItbGF0ZXINCj4+ICsvKg0KPj4gKyAqIENvcHlyaWdodCAoYykgMjAyMiBGVUpJ
VFNVIExJTUlURUQuIEFMTCBSaWdodHMgUmVzZXJ2ZWQuDQo+PiArICogQXV0aG9yOiBIdWFuZ2pp
ZSBMaWFvIDxsaWFvaGouanlAZnVqaXRzdS5jb20+DQo+PiArICovDQo+PiArDQo+PiArLypcDQo+
PiArICogW0Rlc2NyaXB0aW9uXQ0KPj4gICAgKg0KPj4gLSAqIENvcHlyaWdodCAoYykgSW50ZXJu
YXRpb25hbCBCdXNpbmVzcyBNYWNoaW5lcyAgQ29ycC4sIDIwMDYNCj4+IC0gKiAgQXV0aG9yOiBZ
aSBZYW5nIDx5eWFuZ2NkbEBjbi5pYm0uY29tPg0KPj4gLSAqIENvcHlyaWdodCAoYykgQ3lyaWwg
SHJ1YmlzIDIwMTQgPGNocnViaXNAc3VzZS5jej4NCj4gT2xkIGNvcHlyaWdodHMgc2hvdWxkIG5v
dCBiZSByZW1vdmVkLg0KDQpPSy4NCj4gDQo+PiAtICoNCj4+IC0gKiBUaGlzIHByb2dyYW0gaXMg
ZnJlZSBzb2Z0d2FyZTsgIHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkNCj4+
IC0gKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGFzIHB1Ymxpc2hlZCBieQ0KPj4gLSAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVp
dGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yDQo+PiAtICogKGF0IHlvdXIgb3B0aW9u
KSBhbnkgbGF0ZXIgdmVyc2lvbi4NCj4+IC0gKg0KPj4gLSAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0
cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLA0KPj4gLSAqIGJ1dCBX
SVRIT1VUIEFOWSBXQVJSQU5UWTsgIHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBv
Zg0KPj4gLSAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVS
UE9TRS4gIFNlZQ0KPj4gLSAqIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9y
ZSBkZXRhaWxzLg0KPj4gLSAqDQo+PiAtICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29w
eSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UNCj4+IC0gKiBhbG9uZyB3aXRoIHRo
aXMgcHJvZ3JhbTsgIGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlv
biwNCj4+IC0gKiBJbmMuLCA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24s
IE1BIDAyMTEwLTEzMDEgVVNBDQo+PiAtICoNCj4+IC0gKiBERVNDUklQVElPTg0KPj4gLSAqICBU
aGlzIHRlc3QgY2FzZSB3aWxsIHZlcmlmeSBiYXNpYyBmdW5jdGlvbiBvZiBvcGVuYXQNCj4+IC0g
KiAgYWRkZWQgYnkga2VybmVsIDIuNi4xNiBvciB1cC4NCj4+IC0gKg0KPj4gLSAqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKi8NCj4+IC0NCj4+ICsgKiBUaGlzIHRlc3QgY2FzZSB3aWxsIHZlcmlmeSBiYXNp
YyBmdW5jdGlvbiBvZiBvcGVuYXQNCj4+ICsgKi8NCj4+ICAgI2RlZmluZSBfR05VX1NPVVJDRQ0K
Pj4gLQ0KPj4gICAjaW5jbHVkZSA8c3lzL3R5cGVzLmg+DQo+PiAgICNpbmNsdWRlIDxzeXMvc3Rh
dC5oPg0KPj4gICAjaW5jbHVkZSA8c3RkbGliLmg+DQo+PiAgICNpbmNsdWRlIDxlcnJuby5oPg0K
Pj4gICAjaW5jbHVkZSA8c3RyaW5nLmg+DQo+PiAtI2luY2x1ZGUgPHNpZ25hbC5oPg0KPj4gLQ0K
Pj4gLSNpbmNsdWRlICJ0ZXN0LmgiDQo+PiAtI2luY2x1ZGUgInNhZmVfbWFjcm9zLmgiDQo+PiAt
I2luY2x1ZGUgImxhcGkvZmNudGwuaCINCj4+IC0jaW5jbHVkZSAib3BlbmF0LmgiDQo+PiAtDQo+
PiAtc3RhdGljIHZvaWQgc2V0dXAodm9pZCk7DQo+PiAtc3RhdGljIHZvaWQgY2xlYW51cCh2b2lk
KTsNCj4+ICsjaW5jbHVkZSA8c3RkaW8uaD4NCj4+ICsjaW5jbHVkZSAidHN0X3Rlc3QuaCINCj4+
ICsjaW5jbHVkZSAidHN0X3NhZmVfbWFjcm9zLmgiDQo+IHdlIGNhbiBnZXQgcmlkIG9mIG1vcmUg
aGVhZGVycywgd2hpY2ggYXJlIGVpdGhlciB1bm5lY2Vzc2FyeSBvcg0KPiBnZXQgaW5jbHVkZWQg
cmVjdXJzaXZlbHkgZnJvbSB0c3RfdGVzdC5oDQoNCldpbGwgcmVtb3ZlLg0KPiANCj4+ICAgDQo+
PiAtY2hhciAqVENJRCA9ICJvcGVuYXQwMSI7DQo+PiArI2RlZmluZSBURVNUX0ZJTEUgInRlc3Rf
ZmlsZSINCj4+ICsjZGVmaW5lIFRFU1RfRElSICJ0ZXN0X2Rpci8iDQo+PiAgIA0KPj4gICBzdGF0
aWMgaW50IGRpcl9mZCwgZmQ7DQo+PiAgIHN0YXRpYyBpbnQgZmRfaW52YWxpZCA9IDEwMDsNCj4+
ICAgc3RhdGljIGludCBmZF9hdGN3ZCA9IEFUX0ZEQ1dEOw0KPj4gLQ0KPj4gLSNkZWZpbmUgVEVT
VF9GSUxFICJ0ZXN0X2ZpbGUiDQo+PiAtI2RlZmluZSBURVNUX0RJUiAidGVzdF9kaXIvIg0KPj4g
LQ0KPj4gICBzdGF0aWMgY2hhciBnbG9iX3BhdGhbMjU2XTsNCj4+ICAgDQo+PiAgIHN0YXRpYyBz
dHJ1Y3QgdGVzdF9jYXNlIHsNCj4+IEBAIC02NSw4MCArNDAsNjIgQEAgc3RhdGljIHN0cnVjdCB0
ZXN0X2Nhc2Ugew0KPj4gICAJeyZmZF9hdGN3ZCwgVEVTVF9ESVIgVEVTVF9GSUxFLCAwLCAwfQ0K
Pj4gICB9Ow0KPj4gICANCj4+IC1pbnQgVFNUX1RPVEFMID0gQVJSQVlfU0laRSh0ZXN0X2Nhc2Vz
KTsNCj4+IC0NCj4+IC1zdGF0aWMgdm9pZCB2ZXJpZnlfb3BlbmF0KHN0cnVjdCB0ZXN0X2Nhc2Ug
KnRlc3QpDQo+PiArc3RhdGljIHZvaWQgdmVyaWZ5X29wZW5hdCh1bnNpZ25lZCBpbnQgbikNCj4+
ICAgew0KPj4gLQlURVNUKG9wZW5hdCgqdGVzdC0+ZGlyX2ZkLCB0ZXN0LT5wYXRobmFtZSwgT19S
RFdSLCAwNjAwKSk7DQo+PiAtDQo+PiAtCWlmICgodGVzdC0+ZXhwX3JldCA9PSAtMSAmJiBURVNU
X1JFVFVSTiAhPSAtMSkgfHwNCj4+IC0JICAgICh0ZXN0LT5leHBfcmV0ID09IDAgJiYgVEVTVF9S
RVRVUk4gPCAwKSkgew0KPj4gLQkJdHN0X3Jlc20oVEZBSUwgfCBUVEVSUk5PLA0KPj4gLQkJICAg
ICAgICAgIm9wZW5hdCgpIHJldHVybmVkICVsZGwsIGV4cGVjdGVkICVkIiwNCj4+IC0JCQkgVEVT
VF9SRVRVUk4sIHRlc3QtPmV4cF9yZXQpOw0KPj4gKwlzdHJ1Y3QgdGVzdF9jYXNlICp0YyA9ICZ0
ZXN0X2Nhc2VzW25dOw0KPj4gKw0KPj4gKwlURVNUKG9wZW5hdCgqdGMtPmRpcl9mZCwgdGMtPnBh
dGhuYW1lLCBPX1JEV1IsIDA2MDApKTsNCj4+ICsJDQo+PiArCWlmICgodGMtPmV4cF9yZXQgPT0g
LTEgJiYgVFNUX1JFVCAhPSAtMSkgfHwNCj4+ICsJICAgICh0Yy0+ZXhwX3JldCA9PSAwICYmIFRT
VF9SRVQgPCAwKSkgew0KPj4gKwkJdHN0X3JlcyhURkFJTCB8IFRURVJSTk8sDQo+PiArCQkgICAg
ICAgICAib3BlbmF0KCkgcmV0dXJuZWQgJWxkLCBleHBlY3RlZCAlZCIsDQo+PiArCQkJIFRTVF9S
RVQsIHRjLT5leHBfcmV0KTsNCj4+ICAgCQlyZXR1cm47DQo+PiAgIAl9DQo+IFRlc3Qgc2NlbmFy
aW9zIGluIHRoaXMgZnVuY3Rpb24gc2hvdWxkIGJlIGNoYW5nZWQgdG8gdXNlIFRTVF9FWFBfKigp
IG1hY3JvLg0KPiBTZWUgZXhhbXBsZXMgYXQ6IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0
LXByb2plY3QvbHRwL3dpa2kvQy1UZXN0LUFQSQ0KDQpXaWxsIHVzZSBUU1RfRVhQXyooKSBtYWNy
by4NCj4+ICsJDQo+PiArCWlmIChUU1RfUkVUID4gMCkNCj4+ICsJCVNBRkVfQ0xPU0UoVFNUX1JF
VCk7DQo+PiAgIA0KPj4gLQlpZiAoVEVTVF9SRVRVUk4gPiAwKQ0KPj4gLQkJU0FGRV9DTE9TRShj
bGVhbnVwLCBURVNUX1JFVFVSTik7DQo+PiAtDQo+PiAtCWlmIChURVNUX0VSUk5PICE9IHRlc3Qt
PmV4cF9lcnJubykgew0KPj4gLQkJdHN0X3Jlc20oVEZBSUwgfCBUVEVSUk5PLA0KPj4gKwlpZiAo
VFNUX0VSUiAhPSB0Yy0+ZXhwX2Vycm5vKSB7DQo+PiArCQl0c3RfcmVzKFRGQUlMIHwgVFRFUlJO
TywNCj4+ICAgCQkgICAgICAgICAib3BlbmF0KCkgcmV0dXJuZWQgd3JvbmcgZXJybm8sIGV4cGVj
dGVkICVzKCVkKSIsDQo+PiAtCQkJIHRzdF9zdHJlcnJubyh0ZXN0LT5leHBfZXJybm8pLCB0ZXN0
LT5leHBfZXJybm8pOw0KPj4gKwkJCSB0c3Rfc3RyZXJybm8odGMtPmV4cF9lcnJubyksIHRjLT5l
eHBfZXJybm8pOw0KPj4gICAJCXJldHVybjsNCj4+ICAgCX0NCj4+ICAgDQo+PiAtCXRzdF9yZXNt
KFRQQVNTIHwgVFRFUlJOTywgIm9wZW5hdCgpIHJldHVybmVkICVsZCIsIFRFU1RfUkVUVVJOKTsN
Cj4+IC19DQo+PiAtDQo+PiAtaW50IG1haW4oaW50IGFjLCBjaGFyICoqYXYpDQo+PiAtew0KPj4g
LQlpbnQgbGM7DQo+PiAtCWludCBpOw0KPj4gLQ0KPj4gLQl0c3RfcGFyc2Vfb3B0cyhhYywgYXYs
IE5VTEwsIE5VTEwpOw0KPj4gLQ0KPj4gLQlzZXR1cCgpOw0KPj4gLQ0KPj4gLQlmb3IgKGxjID0g
MDsgVEVTVF9MT09QSU5HKGxjKTsgbGMrKykgew0KPj4gLQkJdHN0X2NvdW50ID0gMDsNCj4+IC0N
Cj4+IC0JCWZvciAoaSA9IDA7IGkgPCBUU1RfVE9UQUw7IGkrKykNCj4+IC0JCQl2ZXJpZnlfb3Bl
bmF0KHRlc3RfY2FzZXMgKyBpKTsNCj4+IC0JfQ0KPj4gLQ0KPj4gLQljbGVhbnVwKCk7DQo+PiAt
CXRzdF9leGl0KCk7DQo+PiArCWlmICh0Yy0+ZXhwX3JldCkNCj4+ICsJCXRzdF9yZXMoVFBBU1Mg
fCBUVEVSUk5PLCAib3BlbmF0IGZhaWxlZCBhcyBleHBlY3RlZCIpOw0KPj4gKwllbHNlDQo+PiAr
CQl0c3RfcmVzKFRQQVNTLCAib3BlbmF0IHN1Y2NlZWRlZCBhcyBleHBlY3RlZCIpOw0KPj4gICB9
DQo+PiAgIA0KPj4gICBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQ0KPj4gICB7DQo+PiAgIAljaGFy
ICp0bXBkaXI7DQo+PiAgIA0KPj4gLQl0c3Rfc2lnKE5PRk9SSywgREVGX0hBTkRMRVIsIGNsZWFu
dXApOw0KPj4gLQ0KPj4gLQl0c3RfdG1wZGlyKCk7DQo+PiAtDQo+PiAtCVNBRkVfTUtESVIoY2xl
YW51cCwgVEVTVF9ESVIsIDA3MDApOw0KPj4gLQlkaXJfZmQgPSBTQUZFX09QRU4oY2xlYW51cCwg
VEVTVF9ESVIsIE9fRElSRUNUT1JZKTsNCj4+IC0JZmQgPSBTQUZFX09QRU4oY2xlYW51cCwgVEVT
VF9ESVIgVEVTVF9GSUxFLCBPX0NSRUFUIHwgT19SRFdSLCAwNjAwKTsNCj4+ICsJU0FGRV9NS0RJ
UihURVNUX0RJUiwgMDcwMCk7DQo+PiArCWRpcl9mZCA9IFNBRkVfT1BFTihURVNUX0RJUiwgT19E
SVJFQ1RPUlkpOw0KPj4gKwlmZCA9IFNBRkVfT1BFTihURVNUX0RJUiBURVNUX0ZJTEUsIE9fQ1JF
QVQgfCBPX1JEV1IsIDA2MDApOw0KPj4gICANCj4+ICAgCXRtcGRpciA9IHRzdF9nZXRfdG1wZGly
KCk7DQo+IHRoaXMgYWxzbyBzaG91bGQgYmUgcmVtb3ZlZCBhbG9uZyB3aXRoIHRzdF90bXBkaXIo
KS4NCj4gIEZyb20gdGhlIGFib3ZlIGRvY3VtZW50YXRpb24gbGluazoNCj4gIklmIC5uZWVkc190
bXBkaXIgaXMgc2V0IHRvIDEgaW4gdGhlIHN0cnVjdCB0c3RfdGVzdCB1bmlxdWUgdGVzdCB0ZW1w
b3JhcnkNCj4gaXMgY3JlYXRlZCBhbmQgaXTigJlzIHNldCBhcyB0aGUgdGVzdCB3b3JraW5nIGRp
cmVjdG9yeS4iDQoNCk9LLCB3aWxsIHVzZSBTQUZFX0dFVENXRC4NCg0KQmVzdCBSZWdhcmRzDQpI
dWFuZ2ppZQ0KPj4gICAJc25wcmludGYoZ2xvYl9wYXRoLCBzaXplb2YoZ2xvYl9wYXRoKSwgIiVz
LyIgVEVTVF9ESVIgVEVTVF9GSUxFLA0KPj4gLQkgICAgICAgICB0bXBkaXIpOw0KPj4gKwkJCQl0
bXBkaXIpOw0KPj4gICAJZnJlZSh0bXBkaXIpOw0KPj4gLQ0KPj4gLQlURVNUX1BBVVNFOw0KPj4g
ICB9DQo+PiAgIA0KPj4gICBzdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpDQo+PiAgIHsNCj4+IC0J
aWYgKGZkID4gMCAmJiBjbG9zZShmZCkpDQo+PiAtCQl0c3RfcmVzbShUV0FSTiB8IFRFUlJOTywg
ImNsb3NlKGZkKSBmYWlsZWQiKTsNCj4+IC0NCj4+IC0JaWYgKGRpcl9mZCA+IDAgJiYgY2xvc2Uo
ZGlyX2ZkKSkNCj4+IC0JCXRzdF9yZXNtKFRXQVJOIHwgVEVSUk5PLCAiY2xvc2UoZGlyX2ZkKSBm
YWlsZWQiKTsNCj4+IC0NCj4+IC0JdHN0X3JtZGlyKCk7DQo+PiArCWlmIChmZCA+IDApDQo+PiAr
CQlTQUZFX0NMT1NFKGZkKTsNCj4+ICsJaWYgKGRpcl9mZCA+IDApDQo+PiArCQlTQUZFX0NMT1NF
KGRpcl9mZCk7DQo+PiAgIH0NCj4+ICsNCj4+ICtzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3Qg
PSB7DQo+PiArCS5zZXR1cCA9IHNldHVwLA0KPj4gKwkuY2xlYW51cCA9IGNsZWFudXAsDQo+PiAr
CS50ZXN0ID0gdmVyaWZ5X29wZW5hdCwNCj4+ICsJLnRjbnQgPSBBUlJBWV9TSVpFKHRlc3RfY2Fz
ZXMpLA0KPj4gKwkubmVlZHNfdG1wZGlyID0gMSwNCj4+ICt9Ow0KPj4NCj4gDQo+IFJlZ2FyZHMs
DQo+IEF2aW5lc2gNCj4gDQo+IA0KPiANCj4gCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
