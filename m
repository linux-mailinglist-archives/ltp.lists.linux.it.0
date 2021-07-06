Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A633BC62D
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 07:45:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC86B3C799F
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 07:45:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CEE743C1939
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 07:45:43 +0200 (CEST)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com
 [68.232.152.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CD71C1A007FF
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 07:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1625550342; x=1657086342;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/IyX2Z+ivnMjDY5Z+mSdqSjrL0CjfkTjx2u7JYnk2Dc=;
 b=uEcxo07Bc0IOCYz+ZK6OQelW/d/W3KU0fcYJzUU7Ix2hNiGOvnLpx9Qs
 n936gJWeZBBjVwilXlrbQ3K/THtqy+kP5XqNqMLdUQStuQtK3txro9cLs
 +4ysVbvVI8okkja5/y7aYfrBFHcoAdlEIn/+IpbDP9W8Ef8ynDfoPL5fr
 w4MeY/YohngNVDN6BjbyEXkNUwI7Obpm5Ka9BE4XlKW7OZW1TAHgg33U7
 dzta0d01LyHbnraaujAp5OepJEpG02mTBBCb6hHw54l4A0VDyJxhkbamD
 t/lDc6RVdF5bM6xHVW+7I1JyPl+JC57jkE/SNimw35SdVk/fq1+sb1SdB Q==;
IronPort-SDR: o9XN4YaI7N6gR6I2F8cJhtT4waaL0ZiL5z8RooCHsSRQ//DC2YsdSMTAHAnGhs5ToFfZznZhju
 KeWsLMe3Q08fmSCghXD7ewmWCj25uSDCIc8iaUWpLEVoL09ZQgxww07hRIVdIQKnRVJMLuQSFy
 06fT3PPKe8uqgDZ5ywR5mRx1Xu82OXfM0DA/EaAs1iV+QMeHa4954vwb4yI20NIj4W9F0THa5O
 ZV8yNUU574CqVjqoTguBrLSX+rgG3nWjOObNqsdVP5fyimWjwtkWYaX3w3J/0iv4RF+zBf5fDY
 v6g=
X-IronPort-AV: E=McAfee;i="6200,9189,10036"; a="42564376"
X-IronPort-AV: E=Sophos;i="5.83,327,1616425200"; d="scan'208";a="42564376"
Received: from mail-os2jpn01lp2051.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 14:45:38 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGGv6BLlcnzj2VllsqYfIu7+LMMQ9ilvWt1n+rPGkX8qpgcK9Sxfe9keclSxgcUJRiNbtKjFkLIDuut5Ag1BA4mIP319MfBH6W5eeiSa0TXPLbWoHdWN2uHvR3ISvX3xH0PgeevJ0W3rI4s/aH7P06YtsMBRFx3vJvUpRqlUgfIr5bS13Rn0CH533SkulHvsMZH+5VGVM6s3uAz7ew+KBO9LjktHHA6JXTaF5loKzobPopjPvxiUnDKWBUWwEtnM9yL3nrKKZX5YeAtXj+FZVu4Nb9RINx6R4iAIxrssg7cYk40z1sTD+bX6QgIw0rGoRsvTe6obpDU1R2+uMkqTcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IyX2Z+ivnMjDY5Z+mSdqSjrL0CjfkTjx2u7JYnk2Dc=;
 b=ahHOjrP76p/fhAKtb+uzZQkBgtTkmqeQWXQgmhfd7vzEnpbjFEn5GzadD/FJ09rw6w4ntpfCjqeP6dJA39QM0+NKtBY9L/wRA0Igkohdj/Gb78Kfj7jXa6cVNlzsZ9Yau5Dm3LmvtaE5JMhJgCPW+uUKijKP0mrAXzGRYknpqMvN07+Wm2UQisabsznDe2z2X7mcq2C80jkkETYHnZRhNtwtzHNfRRvQv9FRLDzPU9em0Whx9v16DCXHCAJuIagDqmHK4OcUzgp+MlGlwzxZyG6BQRaLcMqZAKSxrggprvYnIp7mNimk6Wi+zFEGolyXSTMtXxiMxftfDwv1MCOfGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IyX2Z+ivnMjDY5Z+mSdqSjrL0CjfkTjx2u7JYnk2Dc=;
 b=qy+2kPUDJvQHwRYfOJuq4n+fjWuHiffZV+BvklDYcz+vU2Qf5GY/7ypEby24FoPcD+BiDNL4GY34qsx7yToVPXq42P5WH9h24Xj4QflI/1zfEcp0KL5PXVKCpKsn7MnArZBEOmkvGnSmVZRYXtld1sHR8AHLtsuZmGV9zrgRo0U=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB6537.jpnprd01.prod.outlook.com (2603:1096:400:95::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Tue, 6 Jul
 2021 05:45:32 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 05:45:32 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Leo Liang <ycliang@andestech.com>
Thread-Topic: [LTP] [PATCH 1/1] cgroup/cgroup_regression_test: Fix umount
 failure
Thread-Index: AQHXa84B22xFiKlYW0CK3TkDJ6WjbKspCO6AgABc4oCAC/BdAIAAJqKA
Date: Tue, 6 Jul 2021 05:45:32 +0000
Message-ID: <60E3EE1D.2090800@fujitsu.com>
References: <20210628033002.GA1469@andestech.com>
 <caf1bb46-5212-3c3d-f180-e722ef2cf8dd@jv-coder.de> <YNnJ18Q+cqb8zM5K@yuki>
 <20210706032748.GA16346@andestech.com>
In-Reply-To: <20210706032748.GA16346@andestech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: andestech.com; dkim=none (message not signed)
 header.d=none;andestech.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60fbb389-5753-4acc-afb3-08d94041451c
x-ms-traffictypediagnostic: TYAPR01MB6537:
x-microsoft-antispam-prvs: <TYAPR01MB653778156E9982FFC2809E17FD1B9@TYAPR01MB6537.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d3UN1FuUkConphJ7JoogEaL6/hNz0Wi5nig0v+MGChnr5weXfTN9ffhASvJmCyOGCTQY94TQHTcuw0NrpzfScarksixXMWoA3nxXVwDyizUsNNemF1doLqKDdM+IpbDzHG3nveYKpVj9lVP9vYbCP2952Mq6qKgL7khp8rCUNzlN1uUCjcTqH8fw08v30f7S/uViGaqx0DR8xio2G8bG634ebyqFwK29hozJ4FoIkEZqC37ZS8cJCuANSYVJTSvi1eGQkHeWXSFBH/Mz3W6gn71eS+H+shkpYckfuqcPtvcKAFeT7V3EVRAotX+CL+ZTqn3BApQfU9yw7S+W5w0SNrLg0m4P/J1U5EFV4SNrAnBZw6tjfDITAUG/D+qImMUFjNZPUk3pLbIhkXfzq9oSvSNrTY1WAsb49FKEN1WfnjcvuK6Bwxl0CSnckq7nKeEHJ1oBemkfLc4URiXHeRPpqJC4DN1y+XL54fFQdlE3oFIMwQ48wkXZoFzYWxNm6Zi3cQPLG7UHAmkvqauhgl+Nim5+Awn7JZyVmF004bf5OQQmMvVcfca99VVDmXH0MYyjZxc1yPAZf5W7wO1IJs+GjIeUx0f032f2MDZNR1s5+CYm857GfrMTsLECjGTzBk5vFJW/UtE/isHMOivUXFnEJXCRXzVfUfwSAjS3scafI9wBZKYM+lkABo7USOG4/UG131FZJ8Zsqpv7UEFIwUmD5bJskUqxkOcW691iOvdcgSc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(4326008)(2906002)(6506007)(66556008)(966005)(64756008)(36756003)(76116006)(8936002)(66946007)(6512007)(122000001)(186003)(38100700002)(54906003)(91956017)(66446008)(66476007)(8676002)(5660300002)(478600001)(85182001)(26005)(6486002)(33656002)(87266011)(2616005)(6916009)(316002)(71200400001)(83380400001)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?L0xTYzZzdS9lWDZydkNYMXA4NlJsWlV5STh3TkxUeEdRQmZmTFhKUjZ2aUFD?=
 =?gb2312?B?QkJ2WUROamxxV0NZdnNYVGR0czQ3dHNsNEVHZHJTRFl4S3FyK2Z3d1FUcmVa?=
 =?gb2312?B?cDltdVQ2OXNORFEzK1J4QVorVS81T2Z5cW1yYWZNYXNaVHJhNFkrSW16ODJw?=
 =?gb2312?B?Wmo5M0dIdUhDeTFHUnNqOGZUWHdEWmx6TlErNXFieG9yWXJHM1RHYzFyVTlj?=
 =?gb2312?B?UUVaVTMvTndqbTBySmlET2lTQkliSTl1L24zaTZuT0hEaFdVcHZJaXlvTC9B?=
 =?gb2312?B?YVNYNkFRSG5UVkpjYmVjaEk0cjBsbzZ3RjNhSS81NmREUWp0dDJ6YzI3U2kx?=
 =?gb2312?B?S2hPb0JacC91ZUY3L0tJYnYvY01uTk5rSU53KzlCWGVoa2RMUjc0c3lUN01y?=
 =?gb2312?B?UmNMOThUZ0hDSTNHNUgrVjk2RUlGTkRLVkFRL1RpNWRxRXU2WjAybENiOXVi?=
 =?gb2312?B?b1FhelhySWM4eTVEUnZ1MTRqYXp6ekJqMWNmN2dGZG9UcWdSdERmQ085YXFJ?=
 =?gb2312?B?Z2syRytleSt4cVNpdWswK3Fiak54SDhsdUNMWjd6QUxLeUZickhMNUJ6QVZX?=
 =?gb2312?B?ZTBZNmRhV0pvbHBNYnNwTS9zMmhVZFhPOUgrWnlMbzRBeEpWNEx2R1N2RmNa?=
 =?gb2312?B?a1gwcHVFY1pWQWF1L2IwZnBZM3RoQnJlcEJMWi93WDByc25iRWFieHczcE5L?=
 =?gb2312?B?RzFhNVNNU1dYQTl4dzFubjZ4SU8zQzliTWJ0eWU4VlFWeGE5dlJkRXE0ekRr?=
 =?gb2312?B?THplVEliL28xWXFBcElLdVI4Q2x4S2VTSmpxc0xXQlArYzJNb1VBWGpFUW5F?=
 =?gb2312?B?Sk9qZzFGMzJCRGRPcnJlK01XQkFjSVRyVXhCM2ZHTGptRVV4SVJzeGxjeXlF?=
 =?gb2312?B?TGlYWVJkcTJXM1ljNHJ3L3VqdGk1aFM2ZXVnbnBSc1RjODhlaW1PNEhrQVZX?=
 =?gb2312?B?UHFaRngvTTF4QUZldTk1Smt4Y0p4ZncxQUpaOFd3MGc0U0xVanIvQk1ZSytu?=
 =?gb2312?B?b2dGQWZva1ZteUk5OTdJNHFaUVV0c0ZDRFd6SWFlTXpwS29UdlcrZ0R0UEh0?=
 =?gb2312?B?R3QzdnRQOXYxKzZUTEgzMXNaR2NkOHVERVNCVXQ5Y2FRRzJFVldnM21mcVpG?=
 =?gb2312?B?Z1BlSnlQaWlJWHlZeWdEY21XYVowZENNb3Y0YnZaMm81MEJ1dUcvQmtTWlFp?=
 =?gb2312?B?d0JDNHU1Tks5cmYzYUNvcTI1d2JlSVlsMGloL3B2cEkxa2R3bmlVL2FMMG5M?=
 =?gb2312?B?TlF3aEgzbUtlZEpJZFhxYnRmZWw2RUkzYlZqNzZjQ1NSd1d6blRYV0YrcVBY?=
 =?gb2312?B?YmErVUd6Zy8razBzdFZzU2NZS0RCOUNFWFF4SWhVSTAzcUZMa0VkWmxXRmFK?=
 =?gb2312?B?U1RpUEtkaTEzNC9KR2NmdWVLVE9XMnFtZG1RT0EzaUhZWXF1NnkrTkFyWXkx?=
 =?gb2312?B?NGw4R2FyNGI4N0dTV2FkR0IzTDhBbEFCVGkwMHdSRUdyaWIyTTlPbVBSRUNO?=
 =?gb2312?B?Nm43c3ZFTTJkWkpESkpQYksvUk5SUzZUcDNFT1RPK1o3TkdxSFY5SW05V0Vn?=
 =?gb2312?B?MUlkVGhhMzV1RkNmeG5MWlMwd3FneEFwNVJtV3I5ZWE1K3dYYnZ1WUdOdi9G?=
 =?gb2312?B?bVJhd0xUbG40L0U0aTJJMjNMeTRZSWVkeHRyOW9LQ1ZxUUFhMzhrV0pNaWxR?=
 =?gb2312?B?aUp4Y3FXV3hnWnhtTk1nbm05SHlrY3hhY0VTeWpoMG84Zlp6OERRdkhmWGxE?=
 =?gb2312?Q?9v+vTUvxWCR76VTlXb9WQmu8eCPNRcJ5v/ijlXH?=
x-ms-exchange-transport-forked: True
Content-ID: <B5C3D5E8296E244AA26D0099A68EB4B9@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60fbb389-5753-4acc-afb3-08d94041451c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2021 05:45:32.5648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G6OaKxVP4DrCwOzG2ApgbQykFAWhmjJew9BlkrdVVW4DeFJurgCTtyri0wpxhZkx8iswe6AMoo0u8rXz0IHD49vX168iO7b03cvkwNk7Y60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6537
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] cgroup/cgroup_regression_test: Fix umount
 failure
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
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Leo
> Hi,
>
> Sorry for the late response and thanks for all the replies and suggestions.
>
> I am running on a rather new RISC-V platform (Andes/AE350) and with 5.4.0 off-tree kernel.
> The umount in cgroup_regression_test mostly failed at test_2 and test_3,
> so it would show FAIL result (mount not successfully executed) at test_3 and test_5 (test_4 shows TCONF on my platform).
>
> On Mon, Jun 28, 2021 at 03:08:39PM +0200, Cyril Hrubis wrote:
>> Hi!
>>> I would like a short comment close to the syncs. When I converted
>>> cpuset_regression_test.sh, I would have removed the sync in there, if
>>> there wouldn't have been any comment.
>>> Most of the time syncs are not required and just added by paranoid
>>> developers, but if there is a real reason, I think it should be stated
>>> in a comment.
>>
>> Sounds reasonable to me, can we please add a comment there?
>
> Hi Cyril and Joerg,
>
> Sounds reasonable to me as well,
> will send a v2 patch with comment.
>
>> --
>> Cyril Hrubis
>> chrubis@suse.cz
>
>
>> Agree with this. Are all these sync really needed? Or just some?
>
> Hi Petr,
>
> I've written a script containing only the following sequence
> 	" mount 'cgroup mntpoint' "
> 	" mkdir 'under cgroup mntpoint' "
> 	" rmdir 'under cgroup mntpoint' "
> 	" umount 'cgroup mntpoint' "
> 	" mount 'cgroup mntpoint' "
> and it could trigger the fail.
>
> But only bumped into the umount fail when doing test_2 and test_3 in the cgroup_regression_test.
>
> I am adding syncs in every sub-tests that execute the above sequence now.
> Should them be added only at the places where umount failure did occur ?
>
>> Kind regards,
>> Petr
>
>
>> IMO, Even we call sync, this umount may fail because sync ensures
>> nothing.  Why not use tst_umount?
>
> Hi Yang,
>
> I think this might be a timing issue and a little delay could fix this problem. (e.g. 'sleep 1')
> Using 'sync' here IMHO would be more descriptive and has a semantic meaning.
Yes, it is a timing issue.
I also met a similar problem because of sync to lead EBUSY error in 
xfstests log time ago.

https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/commit/?id=b536de2a042484bb241cca120ce55c974309513a

So, I don't think using sync is a good idea because sync will make 
metadata into disk but no ensure it. So if we have other io work, then 
sync may push other's metadata into disk firstly instead of here's data.

Since we have tst_umount api to avoid EBUSY error, why not to use it in 
here to avoid your problem?
>
> Speaking of tst_umount, do you mean to convert this test to C code ?
No, we also have shell api  for tst_umount.
>
>> Best Regards
>> Yang Xu
>
> Best regards,
> Leo

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
