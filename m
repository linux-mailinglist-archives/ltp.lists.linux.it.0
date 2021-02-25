Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4B832500F
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 14:00:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 98F043C5A46
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 14:00:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 473573C0E76
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 03:11:18 +0100 (CET)
Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com
 [216.71.156.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D2B2A1400C5C
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 03:11:17 +0100 (CET)
IronPort-SDR: WwO1JMMr+VUj6UXvVcAIM9dVbx3eeK6X8jF0kS5+73aN/lAg6MU2Bw14093UhhrpMXejsKxTKM
 UmWnKxJzGPuP7qu/hv7euMkYCsPLK9lgfBEKJ5bN9f6AvrgIKbDDR9AF+iD3YFxUR63YOWE4bj
 DH8tgwgPXGXoxzKKC+pCBbJv7vOKOdqGBIn2Ar4YZ1iEdtvkevAdgmem0Q+fz+UbzvSBj/v9JG
 LfvHgTTjmMtQmaG3dGg1et8uDTbdZg2sIxrh5K+TWlqUcPrKdIwBO466pu+3KjS/8CduAWoiqk
 hw4=
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="26810012"
X-IronPort-AV: E=Sophos;i="5.81,203,1610377200"; d="scan'208";a="26810012"
Received: from mail-ty1jpn01lp2055.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.55])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2021 11:11:16 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISLuFd7uI6C69H7v9mUz5LGgFShW6gEu0yTA4orBB7Rs2JnvbsAXS3zR6DLjA223B4mCJhvYx0x/NiHUX587e16DZeizn9Gwq/5CQLNcIcBlZe3/YgyRcUQmuTZA72vF7kGTsWp+MFxsnchEnjxdQMTCHTURR1nnOC6wrbOohTjWz8Ljoi0P4eCHOyKjHzXKzZS8lwrmLNqQ7yBMzpMlaYjVFUoCXapCS0J1GN8guAflTg524DRYS9ecY19uL29MMukAf3zzTtgp3Lkoi2KDifw020WnUrbhP7I3oTEkHFQnOpa5om1lZzH+0I8slHVTPCba0BU7kurtJyXarBVPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ap/X1OQeDbF/kzlCpEEtSmH6UFeXT4GjoxxpfudqRS8=;
 b=Ilk2sAFUhxvd3E64tn7hSHMW3MxXGlvCfE5jY6Ha2DE6P/Uu03Ku/HWHH4idc8Z6whnXVS+EYg5HDgFDImtJH/XEj3tqaLaCjtK9jlT7k67NTX3BaCBSRATEDcWc7ZdhQl4DwQs5MXgQ5oWFnv++Ir6LF9ceWl1lM2PRmIFe/0m+0i+qjst90XQCOOfbxwTOvsip06D8GeyKsywpHRfP0oe19C4VqTdDYC4Poq0O25i8hc5g1xLLMQO3IN5XASeXnGFiEU9ElSAUhIAzMc+luRWOWeaYdrK/zuVe0NNknUm6tih4h+CdRmh/W1mn96nzt1wj5W6Efowi/UvcjjwaJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ap/X1OQeDbF/kzlCpEEtSmH6UFeXT4GjoxxpfudqRS8=;
 b=LJwH8x/lBq4LB/Il3PiMSlxJiOIfs2uef6/vkxXhawEH3Gb3+ZW1Jd3580db8tBjLu7AgvRmes4fZYVIkq99gvElKHzPkKP4oFXyHrbJi5P9+3HL+xxvRnQPkR9NaxUBoWN0IUj/xnTTRxJ4xhVoI0yezY4rMcU8cCc3oFFOjMs=
Received: from OSBPR01MB2920.jpnprd01.prod.outlook.com (2603:1096:604:18::16)
 by OSAPR01MB3748.jpnprd01.prod.outlook.com (2603:1096:604:5b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 25 Feb
 2021 02:11:12 +0000
Received: from OSBPR01MB2920.jpnprd01.prod.outlook.com
 ([fe80::7de7:2ce8:ffc0:d098]) by OSBPR01MB2920.jpnprd01.prod.outlook.com
 ([fe80::7de7:2ce8:ffc0:d098%7]) with mapi id 15.20.3868.032; Thu, 25 Feb 2021
 02:11:12 +0000
From: "ruansy.fnst@fujitsu.com" <ruansy.fnst@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH 1/2] syscalls/getpid01: Convert to new API
Thread-Index: AQHXClvixbACJskSvkeMFvTwx/75xapnGvkAgAEHJ40=
Date: Thu, 25 Feb 2021 02:11:12 +0000
Message-ID: <OSBPR01MB2920DF74B48CA7A680A03257F49E9@OSBPR01MB2920.jpnprd01.prod.outlook.com>
References: <20210224031227.151844-1-ruansy.fnst@cn.fujitsu.com>,
 <YDYqZMYBVfh8oiYH@yuki.lan>
In-Reply-To: <YDYqZMYBVfh8oiYH@yuki.lan>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [49.74.161.241]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 149aaa0a-840e-4097-c70d-08d8d9329f90
x-ms-traffictypediagnostic: OSAPR01MB3748:
x-microsoft-antispam-prvs: <OSAPR01MB37485365CC1243975FEC4121F49E9@OSAPR01MB3748.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CHTVA0VLQbX/Q1Rt7zBEsucNSJaNhAWWj6gQwkRqkvyhrTwa5WWaJGGd052GCx2ywTBvJddskHuR/br1Tw2+6ARBxLjLqL84eQa6l7fKMzJ27d8gW5hEDFVXGkJzEg62ZfZPKAoY0GsIWMQRgzxuA857WAnSkiB3x8I157LkBlGQi1GToXA9rEOa+1A/5NjjwPzPgh7J7mLyt0k2l+pYGDOP0tcp5mVW4X8qBEi3J5jc3dFXDZMaKqJaCK9flXYDYXakb2tCyLEnSwe345c+oOBwEScwCnhbVwwbW05oLXYvwQsTt7ZwicYy9M2p+x1+JDTfzoUS4Ec1JWF1LZmKQhkpwkIJrSJVesBUlAbxreweh8x7NdJ9O/Fzc6OG9vZiV/IN74+87acZu9m1XZ3IQIAIWOCn/zwdKvw5bW8V5B1G99aq2SDythCiwb5xpHHvY9/ORc7yOyEIvOpd0BmSqNx7ajyPR4Gr6F8kMvSii6RdPuo1VhR0u86VcrzH7UHSFcqwcJW/Svb4+8c3nXDMKA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSBPR01MB2920.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(9686003)(71200400001)(6916009)(7696005)(6506007)(33656002)(83380400001)(64756008)(66476007)(52536014)(66556008)(66446008)(55016002)(76116006)(66946007)(186003)(316002)(85182001)(2906002)(26005)(478600001)(4326008)(224303003)(5660300002)(86362001)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?V2xaZDBaV2wxQS9PWlR5WkJnVzl4Q29LZk5jK015cklMVzBJT1NqazAwZGs3?=
 =?gb2312?B?c1ZhRk9kSmFkUkxtcjZQMjNLOXFKOHh0eWNPS202VVY2V2NrcHVkN3NsNVQ3?=
 =?gb2312?B?R3BYbXFKZis0dTNJWUZmOVdnWTJEMTBENXcxRjhrNloyeklxWkxTRnpKQkhK?=
 =?gb2312?B?bFIyUEZONVkwNTIvMVBPdVViTHpxSHllWFRvRGljNzYzMDNpUllRZUllWFpt?=
 =?gb2312?B?MGxKMCtQKzBiUmZ6NWNpMXFQNDJTRnlqdjdhbW00OC9CN3J2QnJDQytHeEJ6?=
 =?gb2312?B?Y2Y0dEk2U2Y5NmhUbzBlU3FVemZwaWwxdGlPbEwrRW9yYkZwNDA3ekpqMVF0?=
 =?gb2312?B?d1dNZS9zamhQTGJwcGw4MVpsbXY1M3ptT2VVMEF0M0x2Zlh4ckpUUUwwWjM1?=
 =?gb2312?B?bStoTXhaSzlKVlpMNXBaMjI3dVA2MjNTU0p1QlMxanlobVkxWGc0bUUvcXAv?=
 =?gb2312?B?S2xOOXJ5VTlVMXhGVEF1NElaWmc5dkt0ckN3WkZoUFdrTDRwRXU0RFc4QXQy?=
 =?gb2312?B?ZC81SzhGUDJEUGxLUDRYVVM5Z0lGRm1wZ1Z6dXdNbGo3a0gzVlp2RUdlcFlQ?=
 =?gb2312?B?dDZMV0FyTjhMY2V6YnBCS1UwN00xQVo5WXArbE1uYlRhdUQ3T0M3blNKVlZT?=
 =?gb2312?B?Qm9XWDRPZi9veThvNTNXVGVLZUxLckhFdGxBRCtWTVhOd0RtM1VwOTZ6UExl?=
 =?gb2312?B?SzhKbkprbjg1Z1AwY1ppVXRUd2RvTzBNV2w0UitVZHo2RWc1eEJQN0djWUtx?=
 =?gb2312?B?Ty9Jak43VVpQTEdZTi92U1dvNG1kUkR6ZGVURFpXMzZOMEZMeURqYzB4d0F5?=
 =?gb2312?B?eVl5V1hhc3dqZ085MW9OOEFuYnlpbklJUFFDaDBjeGVRMkdzdzg1a3Fwck9s?=
 =?gb2312?B?Q1VhWW41SWFuNjlqZWZ3VEFWVmx4WTF4NTBmclJnYUYvWkZmVi9od0JTdDFt?=
 =?gb2312?B?eUoraGNPV1l3K1ZEZncyOVM4UmViNHVQeGtsYnNXVVowNEowaHFvME5iaXNi?=
 =?gb2312?B?eHNicnhHMWNIV2g3RzRPUDFlSFNuZEN4ZUVkc3g1cEcvNUpOMUpEdnZ5NjZQ?=
 =?gb2312?B?WEtUQmlTcjdseHFBV1kvKytjdHJ1OVNNSDYyaU9aMjJhUDJKKzQwc1VwWllW?=
 =?gb2312?B?ZHhUc0lOQmtFYjhjK25veTNrZFJDdFhkczhnbCtIOFZYazRWazhlU1lHL1ZG?=
 =?gb2312?B?OU9iQ3VHY09qbm5XeENLbmJtcDNDRG9kTWozT3FWa1h4R2tWbnd6cDk2MVZS?=
 =?gb2312?B?L3c2c0xTU1YyT2dxWnJmdDlJNTZXeEhKMlpmUnNIWHFqaXVFcnJtWS9Vajl1?=
 =?gb2312?B?akdhNjZuZm15cGczdW51a2hReTNhd3lMSDkxbEJoTFF6cUtWengxSjFycit4?=
 =?gb2312?B?VGREb21mUzVqbVRtcC9HVVpRTU92ZU5HN2xleFQycW5tNVhBZ1BBOVZGUDhs?=
 =?gb2312?B?UzhCTW1aZTZEb1EzOFVOSVFWaGN6WXhzVGlCcDl4YTc1QUk4d3RPZnpLeHgw?=
 =?gb2312?B?ZFJGNm5zVElLZ21aRUJoWXptaDBrUDFGRHo3RXZpQ3pXeVRJMGV3V1NMd3JV?=
 =?gb2312?B?RXlnR2JaQWdZMzhBU2FLajFKaHFJZG5yNEVtYkp6Kzgxa2c0U1lxUWZVYmNX?=
 =?gb2312?B?bmRLaXAyWlZDM2hyZS9xbFBTdExLQjE4N3RIdXFJdkVnOXJ3ZUExbkFneDZX?=
 =?gb2312?B?VFlXRTRzTUJiQmovSmZTbUw1M1VzV1BjdzRYM3FYdWhmNjg5aVBBV2JQK2xU?=
 =?gb2312?Q?ged5EvP7h/9vKqEpDY=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2920.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 149aaa0a-840e-4097-c70d-08d8d9329f90
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2021 02:11:12.0643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LOdrlxw5H1X5/ojWJO4lmYV4zjAkrPhYdt8qU3tAWFT79h5z4JOb87axHbmQnvlKEAPsNew2VPcaFezCOcuwJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3748
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 25 Feb 2021 14:00:09 +0100
Subject: [LTP] =?gb2312?b?u9i4tDogIFtQQVRDSCAxLzJdIHN5c2NhbGxzL2dldHBp?=
 =?gb2312?b?ZDAxOiBDb252ZXJ0IHRvIG5ldyBBUEk=?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > +static void verify_getpid(void)
> >  {
> > +     TEST(getpid());
> > 
> > -     tst_sig(NOFORK, DEF_HANDLER, cleanup);
> > -
> > -     TEST_PAUSE;
> > +     if (TST_RET == -1)
> > +             tst_res(TFAIL | TTERRNO, "getpid()");
> > +     else
> > +             tst_res(TPASS, "getpid() returns %ld", TST_RET);
>
> The POSIX actually mandates that getpid() cannot fail and is always
> successful. Given that this test seems to be useless and could be
> removed or replaced with something more sane.
>
> I guess that what we can do is to check if the return value from
> getpid() is greater than 1, since pid 1 is special no other process than
> init can have pid == 1. And the value has to be smaller or equal to
> /proc/sys/kernel/pid_max as well.
>
> So what would I do here would be:
>
> * read /proc/sys/kernel/pid_max value
> * loop 100 times or so
>   - fork a child
>   - check that the pid in child is > 1 and <= pid_max

Do you mean loop 100 times to fork 100 children processes?  I tried in this
way and found that the pid number just increased sequentially from +0 to +100
(Because no other processes were created during the test).  So, I am not sure
if 100 times is enough to test the range?


--
Thanks,
Ruan Shiyang.

>
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
