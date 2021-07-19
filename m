Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E00B3CCDD5
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 08:20:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 520C13C63AC
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 08:20:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A702B3C18F7
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 08:20:56 +0200 (CEST)
Received: from esa8.fujitsucc.c3s2.iphmx.com (esa8.fujitsucc.c3s2.iphmx.com
 [68.232.159.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C891714010EB
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 08:20:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1626675655; x=1658211655;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zOX+77MvpJyhORhxc6gqvYp3Lm1VkX8X3Ic0ecySReo=;
 b=wppFTvQy+yp4+T4g1D4T2Gc+GtWIaGgaliLrXr4kfKs8UltugDSaakrp
 ZIAbWojbBqbvjcDBR7H27J2b83Xm5hUnWPvU0AYrW8p9qxkD4sCyV8/1c
 03vhgKJtp5Dgi/HA6XxUcZQtUaB15sjvuM5sxAIwyHIYfnVlCPL/sLqqb
 JZy6W0BeXzZBHg31BYQKT+SIvW2L5WKWLSYso6AcaBpRthhnUA9i8ta9X
 42NERpijZ2LtMPVFlp6bNedOjjC0RbZ8x4pH9L++VxufKmH7WugpXynYv
 hezYMlJT8MkL2BUYNlYzAlMLRWVuQmvoS2+bk4DeKnGy5BL10qscE8tWp g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="35168437"
X-IronPort-AV: E=Sophos;i="5.84,251,1620658800"; d="scan'208";a="35168437"
Received: from mail-ty1jpn01lp2050.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.50])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 15:20:51 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRzUI3kJpOaEMVMPX+15PcxLNdzvtb/mY2TPfhLvBAyNRdlWqzpr585lKnMQeRIC08jW7iQKFgvLqokmawd95M7sOAE7CpdOuVQKEw4CwCBtPy1gxJ6BqUaaGnaAiqXmP7ku3DjghaCtAEYQH84oOTNuEgwunZorkODLUP2D+eMGa17tcX5K6eRdcCZS9agOvBI3zrpbA/jTX52U6PQE3p0CErbN2aiWIdBpMR2685hdziZTKo7m9uUL3VJLmjWAGcy6WvloDmOJLzjlVoHZBHORCYAur8o2UOoglCYK4cbqXkzoxMEz9XV1HfxiEbVAELE42GRdQ3f/QeGn28axTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOX+77MvpJyhORhxc6gqvYp3Lm1VkX8X3Ic0ecySReo=;
 b=cZ/cpbZ2zhjHCnF9g+EVJ0ZEkG4Zai6xG3WsqO8Sn0P7unU6aKP3DhFeZWs2obM3klg1oQInNvWCHOav9KZ2THWKuy9+8IcK+SklGRu0KbitRdzvjrk/eUG5/numtcykCA96gIqL/o/81uFSv0QzmCOmVSxkQP2nKK40bUdnyMHDDxiOylCYRO4gUB45yxr7H0NS7QgG+rCGg5W/c31Rz4DoUZ9sMlXugVe+WbBqu7Nuy+Ny4YHuPRGG/TDkkZCJFd4EYC/eGNoeqXGDODCyCksCchz8cD7OrcWszrijAWJ/NiNqtdA0RdCIYUBfBFehEYAYJrRq9L5Q+6NtCO4c8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOX+77MvpJyhORhxc6gqvYp3Lm1VkX8X3Ic0ecySReo=;
 b=SDZwcBCn0T0Ul3QgpYpvfnB0r8iTSoIVokIgpbU35C9fCsfztUJbAJ/ey3xMWiR/LKFrIOKSdMPRXmGG2Y3s96hL/GJkAAqWxJx+Jy65S/xxyouIjDRVz+NSgiGFGCuKUZtBPjdyJXhWzAruBooanJRSvW0zZeFINNtHhG6kFnA=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYCPR01MB5662.jpnprd01.prod.outlook.com (2603:1096:400:43::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 06:20:47 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:20:47 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP][PATCH v3, 1/2] lib/tst_test.sh: Make tst_umount work with
 argument that has trailing slash
Thread-Index: AQHXeksy/aUA5f4WEkm0AYWVHABozKtJxryAgAAJCYCAAAGzAIAABnOA
Date: Mon, 19 Jul 2021 06:20:47 +0000
Message-ID: <60F519D1.9040508@fujitsu.com>
References: <20210716140142.GA7113@andestech.com>
 <60F50B67.4000807@fujitsu.com> <YPUS+/YZgAxUAlDn@pevik>
 <YPUUaOMUjRMy43ZH@pevik>
In-Reply-To: <YPUUaOMUjRMy43ZH@pevik>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fb80085-d985-408f-9a4b-08d94a7d5947
x-ms-traffictypediagnostic: TYCPR01MB5662:
x-microsoft-antispam-prvs: <TYCPR01MB566226228B5BBAACF2A7A242FDE19@TYCPR01MB5662.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PPtJ3RjBPHaCRKNzrdBdiOujSAuXs7RASKb9HUsl0mWHx6PcIffUcALepRajfd0q2vsAzLk7tO89IzZfunUbjjTkU0HFlR7j2FJJmG0bLZANSiliaMCNDpA2JnIq6t+6E7QPTbH1ROkICFMGyXRUizET7mm9KZX7st3hDEPy2oCCg940rMeF4zcYxxZEDYRLC8Pa2m58nppuv499AUmvLz367tDHRzQggFUC/YdhXufBcKv71BpufmhQhOFVlv3E36lUjgTM4aAGK3c8jv53QGp2xTirqkI+zrGZKnwwDzDuLbvIhHe5s44wEeYlW0hAuy+90y+FUelJt3im4iPDm7G5uRvej8q9fgD7lPmQUXqVMevn9R7zznfuaBxQYuSJwOLlQGX7dIFCML30BNd2IJ3ILl29yaDl5pl4xY/6d2554OwEpb0QVUY1XBypbXFbZEIUppDVxvvaRU/DuAaroxns/Nf32yjo8gBSZD0WAZwnGtWYv0kXehYn0+YYNA5Bc+Fq9BG8+MqkBT1wqeJK3hf0oRle+BZJAim96w+7r5lNUsxZXlM3JnM5obkBDb2Uaks+YN14qnbzKGPZkkNJakIggvo6avIKyuOrzwJXz75sod4WUAZxsEdT2cSG2hMbFIF2aVwdTvug+/nAWD6xFitNM6kyd5o7FlnGkEpbGjXdKjFJwdXV5SLt5bEzmBU5fnTNBI3hTo5GQZP68Aq8tOOKkt1yFoaL10YbEHpBG6s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(83380400001)(54906003)(2906002)(8936002)(478600001)(186003)(76116006)(122000001)(8676002)(64756008)(66446008)(6916009)(85182001)(316002)(66556008)(6506007)(6486002)(26005)(91956017)(66946007)(66476007)(4326008)(86362001)(5660300002)(38100700002)(71200400001)(2616005)(6512007)(87266011)(36756003)(33656002)(21314003)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?S2JCVFBYdnRHY0FEcEN1UlhLblFwN3grcEVsNWlZNGtRSWNMSjZ4cC81SEVL?=
 =?gb2312?B?Nk9CdmcyYVN0STk2L1gzQUY2TmpnZjB4N0lUNlZ0ZHVWVFkrbDdVSXRPSGNj?=
 =?gb2312?B?OTB6UnpPZmw0WDR6QUtKTjQwY3NiNkc3TnhjSnR4aTNmRE52dmZJUUxOejJt?=
 =?gb2312?B?cS9zejlhdnc0SlNyUVFDYUNPcnp5a1VXbmtpRWVxYTBzV0c4MU1tRy9VUHVG?=
 =?gb2312?B?dDMvSHhUTVVJajF6c0x5clhEaDEwZkdBUlNsSGJGdnkvTzR0R0JQZjdTOSs0?=
 =?gb2312?B?VlNaeGpTZFVwMDZlMCtjQjhJNWZ6WlM0Z0s2bVppUkdNdFRSRktpOHJ6VE5m?=
 =?gb2312?B?SVRDMy8vU3Rva3M3SFJuYzBseElITHhkNUlSUHRnUUEwTzd4OHlhOEpVNUJH?=
 =?gb2312?B?MXZvOHo5cTN2L3B6QnA1cERWbjhWNHdhTTRmM3ROb0pETitRMCtPQjFjWUlL?=
 =?gb2312?B?dVU1RDU1aWpyOVJ2K1hWUTlRcms5NC9FMmhpUGdLU0dRbnZwdkR5VUZPVmxE?=
 =?gb2312?B?Mm84aTUzek9NdkFuTDBLWllNeFlNZnFSdUpJWHI2T3pOczljWmNONVF4YVo1?=
 =?gb2312?B?UW9RdjZhTkp0Z0szalpWWXBTNU05dVltYjFJZUhqblRLNFdCUXZkOEQ3UjBn?=
 =?gb2312?B?RWlwRGpLQ3poT282UmM4alFGWHB4d2xFOEpTeFVBbjZRZ25wb3dCcjBaTlhv?=
 =?gb2312?B?NzcyOVNrZ0QxWGJ4N1JNNHlSWkJ5dUgraFVZSE9WZGswVi96cCtuME9FMTJn?=
 =?gb2312?B?WVE3ZEpDUnkrNWdYMmNiR2xBd05hUUlCZGsxQzcvaUtzYW1XdWtmdDJFTVds?=
 =?gb2312?B?Z0txNFgxa1dLbGZwbWlLT1hCbjdNRlRLQW15QTlSS0JsZnZ4R2Z1SGU5QUFz?=
 =?gb2312?B?SjRLa004NVIvdVNNSzk3V05YdnFmUG0rQmZBRGx0a3RjS1R6K0NRWXBJcHdL?=
 =?gb2312?B?MVM5RVM4L1FuNDRvNmZxc2Z3RGN0UzI2d1dnNW91OGxKR2N6UlZWbndvbVUy?=
 =?gb2312?B?UTF0S1FWaGkrNnEwcVBzMU9HR216bDY5UlVic09ZREdwRXB4SVJJekJ0UnB3?=
 =?gb2312?B?SkxMWnAwQnErWnJ0VG0yNkduZ0d0U3JTRFpYT3RzNXBINlYyajM1WEFsVDZw?=
 =?gb2312?B?bFkvblBlMXNVQlB5TjYzNDJ4OTc3SkR1dDdtbTY5Z1JjMy9OdTRkQmQ0NkQ3?=
 =?gb2312?B?S0NYNEtnaTNnWGlBMHNjclhvRkpGRWViaTJ4VTd3RU0zek4zM2NQSldjVjVH?=
 =?gb2312?B?NW9wRlNoVjVDZWlHZlA3eWw2NTA0dDIwd09EWCtkMUhlM1c5dWlvVkNuUFhh?=
 =?gb2312?B?cXA3V20yV1pCSlRPakpDSFJqRUtWcFd3SzMxMjNDWVZ2QjJVNkpGU0VrREJj?=
 =?gb2312?B?em12T24wRXJYcVhiWUI3NjdQS3BQbStsbVk1SW9qcW94RnI5NUd0eTBOY05W?=
 =?gb2312?B?eXdyTjFuMEtDUHk3di9UZ2hYS3dmRlROSExkU0RyQ0ZCaWw3bEVZVGdHRi9t?=
 =?gb2312?B?ZUsyZG1EdVkxTkZuME5lOVlld2RHb1VWcXNqdWJEcmFjOVc1emNSZzh4VFZS?=
 =?gb2312?B?K04wc002bkFZQ3FsQ0NBUHZzRXR6MWJ1ZzIrK1lNeHRLSTRSY3hORjY5bUp5?=
 =?gb2312?B?SUpVaVIrVUVQQzRmaHF6NS9iNUZNbWwza3hNaEt0WnJ2UzdEeW5zYWh1QlNZ?=
 =?gb2312?B?REtRbi9OUmxTMWN3OEQwV3Q4MnVHTkxxMW5CQTZIa0ZSQnJVUWxyWVpaWGxE?=
 =?gb2312?B?YmZxS1UyQTZTM0Z1STRLRVhyRmFYVWRrZS8vem44NStUandldjZvTmpFVURk?=
 =?gb2312?B?cTBKeHJzTWRlVE1MNXhLZz09?=
x-ms-exchange-transport-forked: True
Content-ID: <3854887F72E5814F8FC2416D7D06ADCB@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb80085-d985-408f-9a4b-08d94a7d5947
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 06:20:47.8569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5zV8EaOevnpEJdaSGJiLCP1MaMuJI8Dx1342Ss0Ebsbfhff+y26hIA6DjJ8JGM6XvPvtikD0A88kyKy9ULgDr+jHDqXYGJMyXx+k248q1kM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5662
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3,
 1/2] lib/tst_test.sh: Make tst_umount work with argument that has
 trailing slash
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
Cc: "richiejp@f-m.fm" <richiejp@f-m.fm>,
 "alankao@andestech.com" <alankao@andestech.com>, "metan@ucw.cz" <metan@ucw.cz>,
 "ycliang@cs.nctu.edu.tw" <ycliang@cs.nctu.edu.tw>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr
> Hi all,
>
>>> Hi Leo
>
>>>> /proc/mounts shows the mount point without trailing slashes, e.g.
>>>> ~ $ cat /proc/mounts
>>>> xxx /root/cgroup cgroup rw,relatime,cpu 0 0
>
>>>> So current tst_umount would not work with argument that has trailing slash, e.g.
>>>> tst_umount cgroup/ would give "The device is not mounted".
>
>>>> Fix this by filtering out the trailing slash before grepping /proc/mounts.
>
>>>> Signed-off-by: Leo Yu-Chi Liang<ycliang@andestech.com>
>>>> ---
>>>>    testcases/lib/tst_test.sh | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>
>>>> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
>>>> index c6aa2c487..f132512e7 100644
>>>> --- a/testcases/lib/tst_test.sh
>>>> +++ b/testcases/lib/tst_test.sh
>>>> @@ -282,13 +282,14 @@ tst_umount()
>
>>>>    	[ -z "$device" ]&&   return
>
>>>> +	device=${device%/}
>>>>    	if ! grep -q "$device" /proc/mounts; then
>>>>    		tst_res TINFO "The $device is not mounted, skipping umount"
>>>>    		return
>>>>    	fi
>
>>>>    	while [ "$i" -lt 50 ]; do
>>>> -		if umount "$device">   /dev/null; then
>>>> +		if umount "$device"/>   /dev/null; then
>>> With removing this(we don't need add "/" here), this patch looks good to me
>> +1
> Actually we need to keep / for next patch, right? (cgroup/)
I guess our ltp tst_umount api should support  to umount cgroup or 
cgroup/ like umount command does.

>
> Thus why not just changing argument for grep?
> -       if ! grep -q "$device" /proc/mounts; then
> +       if ! grep -q "${device%/}" /proc/mounts; then
Yes, it is more easier. But I think it still existed the problme when 
we only use "/" parameters. I guess we should reject this situation.

code maybe as below:
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -282,7 +282,12 @@ tst_umount()

         [ -z "$device" ] && return

-       if ! grep -q "$device" /proc/mounts; then
+       if [ "$device" = "/" ]; then
+               tst_res TINFO "We can not umount / directory"
+               return
+       fi
+
+       if ! grep -q "${device%/}" /proc/mounts; then
                 tst_res TINFO "The $device is not mounted, skipping umount"
                 return
         fi



>
> Kind regards,
> Petr
>
>> Reviewed-by: Petr Vorel<pvorel@suse.cz>
>
>> Kind regards,
>> Petr
>
>>> Reviewed-by: Yang Xu<xuyang2018.jy@fujitsu.com>
>>>>    			return
>>>>    		fi
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
