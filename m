Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE1F37F146
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 04:27:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED2D43C8AA2
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 04:27:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A1AFF3C1D73
 for <ltp@lists.linux.it>; Thu, 13 May 2021 04:27:46 +0200 (CEST)
Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com
 [68.232.152.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 942FE1A01227
 for <ltp@lists.linux.it>; Thu, 13 May 2021 04:27:45 +0200 (CEST)
IronPort-SDR: R0mZ6DR1bbsmVnX2ewSCaUcT3yhS50+y7972eqNAkogcwPHdviVuoNYSBumEghostYmq8MrpQo
 jKRTri2AswVBAHC1JGISdskzcoHWDZELWkVnT3IfakAsAtAq+sSMlUfqIkyYtsZR89iEme67ep
 ZtdfYSmbU0B9cGBpTFmwwR7v9W3w6LEn8BcMG1I6K9DtGNcAieI+cV75gHXrtmq4gFGp/Jpy30
 G8kceEtHbH5Oy+RpbBfnu/AcuOG5iaTYKQlgMLpS62Y10EIt17jcW+JpBlx3Ms6D+Hen3pRVIM
 VN0=
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="39426620"
X-IronPort-AV: E=Sophos;i="5.82,295,1613401200"; d="scan'208";a="39426620"
Received: from mail-ty1jpn01lp2051.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 11:27:44 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEeFg0dBflMfN3PW4F+e1TodfBP0fESBzTbQ/J2BM/C3nYzFZ3+LcoH958qMfnrZe3x47TKuJ991xTBqcnX/KJAxPw5VIlWG/xfNbJm7KrbeSklsr+NLGJvyznuZOeN6Nja7KiE2Za+zDRK6+YiNoVGZdu8N92GMxk7aPlZu+kxBrfOdXJYiWWjPWwC2sQLKigS+mHtBw3R0sRvMi/oPX4fTEhGg42PzkMs8/dB3kDpM+neXXOmByMI+2Nf+T2tb79hlPSXLFFcVOAvFSXrQJwDmUew4u/8vzYKDSm85untmulcHehgAhSUUM5dQfujIFtoBOyhB1l+W6Lqeie8dpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwd3Hzng2zZdAVik1i3UzRYuwqZbfyLBqMfcL1mhIY0=;
 b=lOfsC/lFdmdOiKbBN2RjocStcvNaHBEXcGOpnrUwxUMqaeaeeS9EblK3lEotn+9hVAoRTv2bZ9aynbOjRQZM8bYodwN8rZcc6iZ4UvGAmj3AFivlFjbU/qeTHaPnXj7CYxSQToE8Sr1TyPMw+fozO0MhrvkSUpygw8b5Wqp3DhoY0k84yqTFwfrLTMbnG+4JItjD+vDAY7eb6m8tGj/+XSg+HtPILhV+m8ZkodSFxro306FxKrTxmeNjnTINYBtXC+vMbdl+lGEE4Fepu6cK8VCZFXm4bXRaajGc07wYgWHkHuaHvNeZOk8DAZdyU8ImlfZaRw5i1HQ7LAJFRQoinw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwd3Hzng2zZdAVik1i3UzRYuwqZbfyLBqMfcL1mhIY0=;
 b=kwT20c1GTCICplUE1eBOaOh7xSlMLiX853IpXR29Ke+ttucZbxGVA/B/zuLdvsQg74C1+XFVlQrNDeiWfWCENUxAozwSbmh+odEyEazZgjslyK3kZ/QBXzZglaFVgwRE0yYuXSoEcRIBYP6x77FHzD+XJFovpPwWAS8dGvmVeTU=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB2800.jpnprd01.prod.outlook.com (2603:1096:404:81::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 13 May
 2021 02:27:40 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531%6]) with mapi id 15.20.4129.026; Thu, 13 May 2021
 02:27:40 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>, Martin Doucha <mdoucha@suse.cz>
Thread-Topic: [LTP] syscalls/mallinfo01 test is broken
Thread-Index: AQHXRzmG+8nzbcYnJUqZyW5mSZTaOarf4CUAgADQpQA=
Date: Thu, 13 May 2021 02:27:40 +0000
Message-ID: <609C8EBC.80409@fujitsu.com>
References: <9d5d4dc9-ab51-7218-23f3-2ec835210fcf@suse.cz>
 <YJvftrFCueG3TXPf@yuki>
In-Reply-To: <YJvftrFCueG3TXPf@yuki>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92d522ee-4da5-48aa-995f-08d915b6ae59
x-ms-traffictypediagnostic: TYAPR01MB2800:
x-microsoft-antispam-prvs: <TYAPR01MB2800553D4DFD263F67E47B93FD519@TYAPR01MB2800.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rKNG28YOpmWc73ncWq7W2LTX4k/iLWmfe80Jlnf+rF8ndyguFx7ydq4Dq8Lpi+yGVCMWbYCSwdptaekZlvd24U9/XPqYs19PgMNTGXW7R+Ki5bzEbpBsQLThetfHcBE/owsnNm9bTVc0Qj8vLW8tCFLYebI6bSAPfVfl3B7o7JAODgTnyf/c6oKUwr9xbEKmDQakUbiZxOUP6suSkjhPtl2UNj5OOJQwTXcOzt34hTX1cvYQ5rtfs0DMRSglfUn+08x+mmVtKtgFWYc5s9976gOo7Y7l8l9tpvSMuVyorquac/0DBYnJ/XOL3ZNHtzpfFTZoyDQ31t3Wz+lk2bhTqvPHQh4zt2alsPcrZiEdccHixoN8RrCQhw8Zr3HUFtA9qSKhx4ylOLEg+NmkddsIR2kPo4SA8HZf9hyQE7zNQhl+KD4PdbXpZLEsCJmKBg3Xa4JDiPW3Hx2QdTEjj6hSiEDZke7YfzAJ1QXAfga148LIznbxiOKPl5jiZcXBSmsu3PgZ/r123B54Eh+1230GMyUszfCxfRK0we9Wjr6WaMvVDzdIMZ+ZjHJPPga2LoW0vXeFETXZalheLTJ+/U55uOrFJeF71jN4eLV8YcfKur4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(36756003)(38100700002)(66946007)(91956017)(316002)(64756008)(66476007)(85182001)(66556008)(66446008)(76116006)(83380400001)(478600001)(110136005)(33656002)(6512007)(71200400001)(4744005)(5660300002)(4326008)(8936002)(26005)(186003)(86362001)(6486002)(2906002)(2616005)(6506007)(8676002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?ZTBJRzhNMGE4OE00aU93Z3RNbmI3eUt4TWg0N0dzWWppRFRZdVZIZEcxOFYw?=
 =?gb2312?B?Z2RNa0c2Z0tYU2FLUWlUWDRBR0I3eFZXc1BiMVlNY2c3VG1IRnI4QU4xd0Jn?=
 =?gb2312?B?UVk4d3BNeVFON1VuV3dwa2p0UEpmV0NIcGwwc1ZQR0d2Y1MvNFlDSnk3clc5?=
 =?gb2312?B?UFhvRkh0S096MnY1WnBBSXZYdHFHQTRNSDAvaWpDQmp1bGRFYSs2elVicGxF?=
 =?gb2312?B?OGFUMTRBZTMxVEtSblBVTmltUlFKSm1SSC9zU0sxcm9sNm1wUDhubEhRRVpJ?=
 =?gb2312?B?M0l2RzJoZlJRTDdROXFDTFRjQTUyRE95MHk2UXBSbVZPVDg4eVUyRCtnUWVm?=
 =?gb2312?B?dWFPWi9oQTY4d0JHYTBoT1JxNFFIUlQwRFpJVlBmTXEvZ2hkV2NTWHZxdldG?=
 =?gb2312?B?dFlnVHUxNUs5b3l1SnVqVC8ra2pCaVZqU2lLbVErbmZyMWdpN2JhUXNBcWU4?=
 =?gb2312?B?dUNWV2RPMDFqU2xMZU8wR203ME9QQjVUbkhFRzMyN09lT2dYUGI2ajM1T1NS?=
 =?gb2312?B?Q3VQVXY1R3oxbGFxbWpCMTZodHlDZDZrVDJEYjdCZEdXM2p4emt2dnNSUUdL?=
 =?gb2312?B?Z3VBYU9BM0FuSStaSE13UDY0VzhuZVJxMGlkWFFjdkJpK1pPS0NWeks1UWtv?=
 =?gb2312?B?c01XK2hVUHAwNG0yMHM0TkI1ajQ5K2hXbnJyQnBYcXd5NUVsQXhBbytpZE0r?=
 =?gb2312?B?djZ3NGVvZHlkeFRRMlAwZHNKaWFhSEtSbHVYZHBsYVFFUUl4YUpsL0lxRFJE?=
 =?gb2312?B?WjlsS253ZWxVazY3OFdBRVZPMTVOdTVEUTcyVDhUN2hEOW9sdEhMLzAzektD?=
 =?gb2312?B?bE94NUFCSXZmZCtEVFRnMGlDNTBleklXVHZ4U3pCVVhLaHYrT250WVNlVzVQ?=
 =?gb2312?B?NGR1clVyUnNJWXNYUnowRUZjWDczVmE5NU5SN1NXTWlDZTlLdFZ5emFiWlFx?=
 =?gb2312?B?eklDVnA1UlJzODN1bUV2cUdIRktWTzlZNEYvYjgzQVBuSnRYK0pKKzgrLzNx?=
 =?gb2312?B?RTVVSTdkNWx1REMxa3NFR3hLMTRUb3V1U1JJdmdmVDNGVHVIbjlkRCtaaHph?=
 =?gb2312?B?SWt4enNxR1pXc0NBTE9IcVBuWHE1L29JMkhEV3pqNmhRSWZ0WVVNT2k3clc5?=
 =?gb2312?B?a3NWejZGWC9pQ0E0R2lxVmdoZU5hamNkcTBqS1gzaFRRUzJIKzl4UFF5V25u?=
 =?gb2312?B?VUxVK2pCZGFYOW9qZENKT1lUbEFYNEF0eng0RWlSZHdmVjkvemRGTkQvU3l0?=
 =?gb2312?B?QzFZK2E1RjhUZUVGakpoc1RyTXFyWENObGd5MFdlQjRaWXdkcU12clFCZ3hF?=
 =?gb2312?B?R2xyRFlsK2R2bk0vbUYvSEFZdURFQ040ZGUzajA2M004MHlBT3pJcWYrMTgz?=
 =?gb2312?B?Zlc5WUgrL1pvdXdKQ3VIMEJlWkdmZ0s1a2JneGdKQks2eWduL09JVHFoQXQy?=
 =?gb2312?B?ZjR4NldSTVIwdjJJVjQvU0ZuS0FLaVErNHFpOTBlVG82V1A5TG44ZUxJR2dC?=
 =?gb2312?B?ajN3OG05L1ZyVngwekhLT0h1ZG1MU3JFbUJPR2dYY1UxRm95S0gwZGd2M0Zk?=
 =?gb2312?B?MDZzaGs0VzZOa1hEWnVqMXdqM0JUT0JiTUZST2N2MWZ4TVJUZC9kdEgwNU5X?=
 =?gb2312?B?VTcySENMaTFid3ZRLzN5Zks1am1XVU9WLzNPRVhzZWx1R1crbGFvd2k4VWl3?=
 =?gb2312?B?U0hXS01hVzdZdkxGcWZPdEtFNVVucUl6Ry93bG13NW8rWHcxWmZtNmQrZHRz?=
 =?gb2312?B?N3B5aUpvNGVXNHVVU0llVWozbnVJL3hLZEw3WkVxOTRSWVlJRk1SZFljdzY1?=
 =?gb2312?B?VGFkdEhxamVEeTlwdmNOdz09?=
x-ms-exchange-transport-forked: True
Content-ID: <371F8360D0621543BF9338DB3ADD9FAE@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d522ee-4da5-48aa-995f-08d915b6ae59
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2021 02:27:40.2417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sM1iY8Gv8pPzrN53JKLZwYkc8I/Jb6h0NtMEIrQfeLu0uZjTWRRLmN9R35fvtsYSufhjzyS52dzGUUEwbxgqY1cIkhqSlvIyF3X7ZbYbBqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2800
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] syscalls/mallinfo01 test is broken
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril, Martin
> Hi!
>> the mallinfo01 test is failing on some of our test machines because it
>> makes wrong assumptions about how malloc() and free() will change the
>> number of free chunks (ordblks). I recommend we remove the test from
>> runfiles before the upcoming release and fix it later because part of
>> the test scenario needs major redesign.
>
> I've started some pre-release testruns and I've seen some failures as
> well. I guess that removing it from runtest file and fixing it after
> release sounds sane at this point.
This case fails because malloc uses fastbin blocks.
So the fix has two ways
1) disable fastbin by using mallopt(M_MXFAST, 0)
2) use another mallinfo struct info3 to get free chunks, so compare 
info3 and info2 ordblks member.

Best Regards
Yang Xu

>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
