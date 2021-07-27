Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE15B3D6BD1
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 04:13:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E10A3C9230
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 04:13:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CD6FD3C5FD8
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 04:13:37 +0200 (CEST)
Received: from esa16.fujitsucc.c3s2.iphmx.com (esa16.fujitsucc.c3s2.iphmx.com
 [216.71.158.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A5C891000A61
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 04:13:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1627352016; x=1658888016;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YE7LxRFzm8DWoWBOGN4v/lrcTW6GuPGiP9+1LGP3Fhc=;
 b=kC++7hwDmDqfTx5NwgeaIK0OYIhot5PFS4kVKvRm9vZn6xG6OyqdqZAH
 ccVdBqY7+j8DLAA/48+8SPT57SViZJDcWJ0ijNmHWMwvd1kYXpXZQyk/k
 YQy0N7V7c/Y83AJzE5XXB8XSHncFR+i14g9fvhDMx4P+mxmbD6709YYEU
 PYN6O5lv7bsXw7UwAqVM0t6Ys/ipapBFW6rCtZBE1I+2G2cjVvY4Q4ec7
 XWtoxQH/x+M5Any/rJTqyjPhpn3w6kvQQFFwhvYaKQ9dANS0rElY4IHz1
 eAjolwcS/U89Wmg9cSPSiknGUjUUbgYc3r4rmnx18k9h+SjpbACt+g5pS Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="35594620"
X-IronPort-AV: E=Sophos;i="5.84,272,1620658800"; d="scan'208";a="35594620"
Received: from mail-ty1jpn01lp2057.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 11:13:33 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsCJgO/SaLDMvLCAsHnnJsRtdaWeQl9IAAaCIYmmfhPlobQSJW/H7kPGGowh450NIeYIKnrgOMTUZjdP+3E52PZ8rB4IX3sH7iXIiJcFHDDtFmwN8g7BXvmqlVC230s1Bo/y61f9W9pKftqFVIOFMY0FcjppQX/WcwwVWKSRUxeONx8HKJ7+tXhPA4ZB9xIXr56v1PhiBtbQ+vDP/IqXaC2i2yFJlh7Q8s5FuAlLoFsFejU5BUgKh+lJrl9xw4OPSLI3VjbT/+XRhkfJpKtbKtlOq3DzMURNwKGyCg3b6/soif02PLKGu/aFT6gHzSTHuv28/64qEurDtTuya2DDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YE7LxRFzm8DWoWBOGN4v/lrcTW6GuPGiP9+1LGP3Fhc=;
 b=GkTYiiSB/eh+NM5uGWYcCYgv7jDjzRqU85+0GWLXOnMXJKz9WCz0Tf0jfmhASqIL8rauTMuX9B+7bjYx7Ymuv9F0KWQT+vCgtdLEdykOuHj6owXPUtNiDoosCoLIjytU7dvXgYaZFTZDBle1Ukf33hz9mfyIPsluAuVlXI5lfpYX5peo0c9LbQ5bt76dAD7s2Wt092cfTsA7sg80L6MNj1TfWCYvLG5pUTcB98HVCV96zO4iMLI7JYMvfMMHXwpiaODSu28Eq/SzMu/NfSpYowVpnO4m4WJbrCIS64BnIQwrAnT/SSCZ4xwS9qCgYqZ9fkIwfzTtYBBNG9iGMdwMCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YE7LxRFzm8DWoWBOGN4v/lrcTW6GuPGiP9+1LGP3Fhc=;
 b=X6y58CYlPLW/NbQkU/+R48PlC28dRZW1+QoJlr5lBFUI/CnTrqhJgqvWfisDZ4WULsU+cF3oEu5dcW22bbxS1Boohtf60qXzKFkfV+QsZDPKGnTcuvyx7WkD3Y/v2mJrbvVQmHDy0SpLM/gS+QaKbeAttOiwFSQhhkSejrMXLE8=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB3918.jpnprd01.prod.outlook.com (2603:1096:404:c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Tue, 27 Jul
 2021 02:13:30 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 02:13:30 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: "chrubis@suse.cz" <chrubis@suse.cz>
Thread-Topic: [PATCH v2 2/2] syscalls/shmget06: Add test when shm_next_id is
 already in use
Thread-Index: AQHXf6cNmgDbNi3aqkqvKi5TbTFeL6tWGtKA
Date: Tue, 27 Jul 2021 02:13:30 +0000
Message-ID: <60FF6BE9.5040101@fujitsu.com>
References: <YPlftOtF7QxjjDnX@yuki>
 <1627033320-1584-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1627033320-1584-2-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1627033320-1584-2-git-send-email-xuyang2018.jy@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96447a5b-66e7-4cc6-114b-08d950a420b3
x-ms-traffictypediagnostic: TYAPR01MB3918:
x-microsoft-antispam-prvs: <TYAPR01MB3918EC8A648AC4E77C8266C3FDE99@TYAPR01MB3918.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bCzmZkUQ9tUHJeEjl1SJwsrrXfNxXP6mVCskdyO6r6Fmjp9goSBcndIkpiAXBmXD+Qwdx9Ld743v6eKGyqwmFSetb1WVbAr3XjKkpliVEmn5wV7H8fSBWnxnKmDExYlMzYPat+j4kKu/LvH9uiLqbyzvWiIazrwxBeqdV/xX7MnSpqSrXO7bmdZa+uaGqt1v9xFr5W09MZXvxbcVqWPWGpjtnnxqgf5fl5jMRNDFvDh7Xi8/lDm/z//yafZmYpAOHvE9Tl6NxckWsifAh1+P/w/kTa+/1Ohohz/ArG3uO1cwttCb/wTy0NcZJypSZv3LbLrfima49LxBPMvmSTmxuB+/69IXC6xupqzwlgZOJ2mVjFzqBhLmfh2fVKzKgNRlX2172sVbyeVBCSo5dhHXQBe8FHONGQrxKeixAVs7PF94fe32081CL7voGNaZ2VYw4758mdz/NLIyXVQ3tx7Uzv+EFlJYaiOzfZ5pUq7iXgItdDvGGONky5hBXFEQ5Lw7Iyo5pA2bufSoRrGkI2397dmZUG5+kSE4xcHV0RBoYJd4NsqTmnhcrVrnubxNvKwE5SSwuzeBi3QErbz1wphKrsW1Ufb+vWZ0rLC/sbYfRzG40hczpwfk9h55JFLoG5tPJkCK7dUoyfA5kmMcBRLh2ZCHlSW7IuFGtFubqRb9wpWPmWflkdFOZsC74xk1AklDSIk4D0CaSj+PI0O+UyEKzg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(87266011)(91956017)(76116006)(38100700002)(8936002)(478600001)(66946007)(86362001)(2906002)(2616005)(6512007)(64756008)(26005)(316002)(85182001)(33656002)(66556008)(6486002)(186003)(6916009)(4326008)(5660300002)(36756003)(66446008)(6506007)(66476007)(83380400001)(8676002)(71200400001)(122000001)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?Nm8zVlNOSEsyR3dPa3FVbGJIN080S01ZMlNnQ2tGOHk3bDBjT1hBbzdLTktl?=
 =?gb2312?B?cDBPQWFzTmIwazJxSXgwVGVYV0c2NStpK0dwSXpoalgzbTNiTTc5UHZUSnVS?=
 =?gb2312?B?Umplb2NRcW1FMTVvcFl6UUhGRlZkZVU0ZkJURXJDUlhWMkpHQzI2dmNiU3pP?=
 =?gb2312?B?MWtTM0srZTRJSkJRR29BSVdFTStvZTBKUlZGQXhPQ29oN0hhdlhEd3EyOUJU?=
 =?gb2312?B?REtGV3kwa0N1cEJHdHVNT2NnZHczSm4yWmM3YzBIVW4wb3NCRWxzMGpQRGQw?=
 =?gb2312?B?cmphdStYbGlIYlRDTVVHbTBySnF5ZjhieTVZYUFGZi9qMlZDbDR6czJ0ZHBm?=
 =?gb2312?B?RkpzL2ttU3c4c0Fya2RHbTR5Y0tteGo4eDlDVm05TDRxOWlvbjRlM0JSZDZG?=
 =?gb2312?B?Z3ZkU0h1WW1PVUxxYzdzWGwrUHRncUxEN3BXY1Rmd1VWOUdUelRKRVBubGs4?=
 =?gb2312?B?VjQ0Q0ttMkZyOER1MndXYkJUeEEyd3VtL3BxT3VGclNIb1FQWGhoZ0NUYjg4?=
 =?gb2312?B?NnVFOTVCWG96czN2Vm5aSEVvNU1zOXNqaGVmOEdzVnVsSEZDVVdzRXpuSlk1?=
 =?gb2312?B?VVJaNTNhQWwwQnNLRFJwQXJrTFN5ZDhTVkVYdVArTXQ1QTB5Vzllb2tTSStI?=
 =?gb2312?B?RWlBcmR6R1dranF5VWdFcTZuTmZFZFNaMFIzU0h2dnlvcmlCaHRmVGtyYVlm?=
 =?gb2312?B?Vm00dW5PSFNQSk1NQjM2ckhHbzc3Znd6UndCL1VQYU9oUFJGT3NlKzVrYURE?=
 =?gb2312?B?aHltaXBjZVFyTWo5UERJbEwyQ1BiaUx3bUtDY01tZDhoeVc5SnZxLzZDQnFw?=
 =?gb2312?B?bUovTXVacXdTbU9mQTNocVdVTTRja1Z0am84blIxaXZkb2R4TjdvakF2d0xp?=
 =?gb2312?B?bTJWZCt6OGdHa1luZlh2ZHpXUXdMZjgxYzhCeUs5MHBBa3JLOWh6TWpKZkth?=
 =?gb2312?B?c2NGckZ2bFVCU0dBUnVVbnA0Y3JSRFdzTkRVWlFsM0Z3cE9DMXNOc3UrVkN6?=
 =?gb2312?B?RG5kYWtEa0I3dzg5LzJwQnlRazJPaW9HLzYvT2NDK1l6LzJGSDZSeDN3eUNP?=
 =?gb2312?B?SkkrbjhsMnU2SFJsREVsVWJwT2RWaWxGa2k3bWVzK0MxY0FtSzBITHBXSU5D?=
 =?gb2312?B?c21BQS9od0crME43R05iYnB6MllXaW8vcEhXTCt2ZDRiaDlnR1Ywckp2d01P?=
 =?gb2312?B?TUlRUkJDT0Y5UWJMVFk0TG53MGw3Z1R4bm5INFhCRzIyY1NwWGt3eThHbzZ0?=
 =?gb2312?B?OW41NEl1clVjUnUzbnRCTjNXa1JlSXRPN0U1bFhGdXRGaU4zbmNqVklwWFh4?=
 =?gb2312?B?WUZMY2tKMHZqNDkyTk0yVmVIZUpVR0VoNEFyQXJUVFdxRlB0eEFhTXRCcmdt?=
 =?gb2312?B?cTJvWEwyV2hIZ09sRkdDeksxZE81Wjk2VURvc2wrbGlTVFRSaWo4ZTE0djBj?=
 =?gb2312?B?emx6cHZRd2pYaHBObmNUSDIveVFIQWZGTkFPRUVVVytmRHF2aThieXRWYjUr?=
 =?gb2312?B?aFlQRnN6MVMyMlFPd0ZLNGdWd0gwcitwNDJtaEl4MnJWSWc2Q1Z6UW51bE9u?=
 =?gb2312?B?cVkzZE03cTd0a3c4blUxa040RHRKVnMzbVpmWDFQb0d0YkxMdDd2VElQZTZr?=
 =?gb2312?B?NnArTXl0WkxpQ2NCNVpzS0w5RHd1cDh6SDhwQkc4SG9LbmJxbTkyWXJyQ2NG?=
 =?gb2312?B?L3RQc1lQNWIwV1M5TnZKcG0zbkNRZ3oyRVFuOENVSHVkTFhUcTJORWF6ZDhm?=
 =?gb2312?B?R0tlSjNqTXNUOVBsVnA2TitlTlBGSEJJZ1pwOGJwRjFja2JKRVAvdlJES0hn?=
 =?gb2312?B?elhqaElqanVlSDdDYTNxUT09?=
x-ms-exchange-transport-forked: True
Content-ID: <E759C9EA7DB66A4B8D57A7BBE403FA94@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96447a5b-66e7-4cc6-114b-08d950a420b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 02:13:30.2592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d0YJUbLHut2VK09DB9XKLF3Oq1Sp1yhn4VEe76KJG1/QFuk1656eDpORg/ZoCZ/W15Nb2zMY0ZvsLw3cKAK7ca9H2QPQ9X2zGt/B+VLuXT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3918
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/shmget06: Add test when
 shm_next_id is already in use
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

Hi Cyril

I have merged this patchset, thanks for your review.

Best Regards
Yang Xu
> When the identifier of the System V shared memory segment that shm_next_id stored
> is already in use, shmget() with different key will return the another shm id. But
> kernel doesn't guarantee desired id, I just compare with the existed id, if not
> equal, the test succeeds.
> 
> This case is similar to msgget05.c.
> 
> Reviewed-by: Cyril Hrubis<chrubis@suse.cz>
> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
> ---
>   runtest/syscalls                              |  1 +
>   runtest/syscalls-ipc                          |  1 +
>   .../kernel/syscalls/ipc/shmget/.gitignore     |  1 +
>   .../kernel/syscalls/ipc/shmget/shmget06.c     | 75 +++++++++++++++++++
>   4 files changed, 78 insertions(+)
>   create mode 100644 testcases/kernel/syscalls/ipc/shmget/shmget06.c
> 
> diff --git a/runtest/syscalls b/runtest/syscalls
> index b65b18c32..b379b2d90 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -1413,6 +1413,7 @@ shmget02 shmget02
>   shmget03 shmget03
>   shmget04 shmget04
>   shmget05 shmget05
> +shmget06 shmget06
> 
>   sigaction01 sigaction01
>   sigaction02 sigaction02
> diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
> index ff0364704..b758158c3 100644
> --- a/runtest/syscalls-ipc
> +++ b/runtest/syscalls-ipc
> @@ -68,3 +68,4 @@ shmget02 shmget02
>   shmget03 shmget03
>   shmget04 shmget04
>   shmget05 shmget05
> +shmget06 shmget06
> diff --git a/testcases/kernel/syscalls/ipc/shmget/.gitignore b/testcases/kernel/syscalls/ipc/shmget/.gitignore
> index 6f08529f8..768d1c69d 100644
> --- a/testcases/kernel/syscalls/ipc/shmget/.gitignore
> +++ b/testcases/kernel/syscalls/ipc/shmget/.gitignore
> @@ -2,3 +2,4 @@
>   /shmget03
>   /shmget04
>   /shmget05
> +/shmget06
> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget06.c b/testcases/kernel/syscalls/ipc/shmget/shmget06.c
> new file mode 100644
> index 000000000..d91b7b635
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget06.c
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu<xuyang2018.jy@fujitsu.com>
> + */
> +
> +/*\
> + * [Description]
> + *
> + * It is a basic test for shm_next_id.
> + *
> + * When the shared memory segment identifier that shm_next_id stored is already
> + * in use, call shmget with different key just use another unused value in range
> + * [0,INT_MAX]. Kernel doesn't guarantee the desired id.
> + */
> +
> +#include<errno.h>
> +#include<string.h>
> +#include<sys/types.h>
> +#include<sys/ipc.h>
> +#include<sys/shm.h>
> +#include "tst_test.h"
> +#include "tst_safe_sysv_ipc.h"
> +#include "libnewipc.h"
> +
> +#define NEXT_ID_PATH "/proc/sys/kernel/shm_next_id"
> +
> +static int shm_id[2], pid;
> +static key_t shmkey[2];
> +
> +static void verify_shmget(void)
> +{
> +	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", shm_id[0]);
> +
> +	shm_id[1] = SAFE_SHMGET(shmkey[1], SHM_SIZE, IPC_CREAT | SHM_RW);
> +	if (shm_id[1] == shm_id[0])
> +		tst_res(TFAIL, "shm id %d has existed, shmget() returns the"
> +			" same shm id unexpectedly", shm_id[0]);
> +	else
> +		tst_res(TPASS, "shm id %d has existed, shmget() returns the"
> +			" new shm id %d", shm_id[0], shm_id[1]);
> +
> +	SAFE_SHMCTL(shm_id[1], IPC_RMID, NULL);
> +}
> +
> +static void setup(void)
> +{
> +	shmkey[0] = GETIPCKEY();
> +	shmkey[1] = GETIPCKEY();
> +	pid = getpid();
> +	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", pid);
> +	shm_id[0] = SAFE_SHMGET(shmkey[0], SHM_SIZE, IPC_CREAT | SHM_RW);
> +}
> +
> +static void cleanup(void)
> +{
> +	int i;
> +
> +	for (i = 0; i<  2; i++) {
> +		if (shm_id[i] != -1)
> +			SAFE_SHMCTL(shm_id[i], IPC_RMID, NULL);
> +	}
> +}
> +
> +static struct tst_test test = {
> +	.needs_tmpdir = 1,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = verify_shmget,
> +	.needs_kconfigs = (const char *[]) {
> +		"CONFIG_CHECKPOINT_RESTORE=y",
> +		NULL
> +	},
> +	.needs_root = 1,
> +};

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
