Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2C63B712F
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 13:16:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19F093C6CC6
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 13:16:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 573853C6C8B
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 13:16:09 +0200 (CEST)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com
 [68.232.159.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 366EF140053B
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 13:16:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1624965367; x=1656501367;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=76BOTvTGXyUl1eOvmz2swe/1nIT2Wt7kCcpRi8BrT7Y=;
 b=L1N6qCyi6RIILG0lXFD7Zk5zEshZ0Ms89U5mBRqcqsrIiPouNevVRXx+
 k8Acc8glFUy9Gt35GIb0CKJL2oHmJvZvi8y2Up1mkBKQZjrNTiLgtV5yR
 kpCjzc6mm+VMCiyq8kO6+7xNBPmD0TreEXMaaSFtOxu/KH9joE24tIR8R
 uIgYcGgVwU4qxIJu+MUMxWi80IFX10cqb3EDBuxmt1AHIj/RmrYVSBjxJ
 BJG+nUVCU2RmtGvxyWEk/dVibLtRdoEWYsVXZ49LpVsnPxkvW2MlA/uCt
 wXWCc/AbrU5Y1OLUJzaiNbwxmEbS8gSxV277fNSxNNwIR3M6Vy4Izf5iW g==;
IronPort-SDR: /BX3Xd2f8tih/dqvqfpR8wKuh8IRz7IM8I9dKcu4FX5lve+36DIuSmjWXnRi2Ded4SSX9jzytM
 4nBTsADK/LZSCyCwPOXrbl+G4zj2ANtjah0GdW/CN4Ni94MR7oaNlINmXwNa0cp4j66p04zX4s
 EyP6PyWr1NcSEYDhiWsSpM2/oCG9tjS8WTKFaDkHMS8+gFKMRDrhWiSoaQe6WBJwfDU02/bcQk
 anZ2pU8KSQoiWvVhPyu9ZSVwnaJ8GiV9/455LZFTUspsrbSNrHl7OvbkxhGJvLyV91kzWe3SlE
 BHM=
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="34023337"
X-IronPort-AV: E=Sophos;i="5.83,308,1616425200"; d="scan'208";a="34023337"
Received: from mail-pu1apc01lp2050.outbound.protection.outlook.com (HELO
 APC01-PU1-obe.outbound.protection.outlook.com) ([104.47.126.50])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 20:16:04 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EI9ve4vKGJLO33iIr8io09p/jTFsmTF7oZ08p5/DPRjzMf36c3/T7sRwYZ1QvKLJdcHmWDvC8BeC0dRiCrqagbdpjtNJ0tqw6CQhYXUIa7dv8gL6Usdekuhy+0VJFUmnaNNUlKvDC0GjFzYlvZQ1lhG4T6uSemCHNC8hLo1RhrQRBtlbpYwKG+njdT51impi5OLwGvtox2RbQCIsNdu3zNGoSoSPxDeiG9Kcdrwa5VFOGoiDpdfj/CviFrNFREz/jGx0bgAGsZWOF2iDsLsbMcHt4TwvMpeK8kHySdnex3z4E191i1rHOuzrg0sZB1TVe9HOE/c+yAoDdnuTnlU8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76BOTvTGXyUl1eOvmz2swe/1nIT2Wt7kCcpRi8BrT7Y=;
 b=ITCoOshpZt3bhaFAD+Ov8amkh2KcTr3B1H4OmGQywiEZ9cwGptU8zzuc84ycaT9jCVci0T6i5YD6G+MDcRbHXQXOr9br/mKrB6D1++H+M+sK7ytGXgcJmPoir/Ws5zoD3u8N8J+nqbRM7BpuY+OG1pbX0GySEmAffAjOlBZl4P8+fv0Bn4V5E2+KsuimMb66nF01F1J3gM9oMs9ROmRezjVW9hEm0d77LfW5rRCxM+h0TgINs+9yGE1k9F+MJxFfaR6sbphJDrctsSyV8mZTONdLd3pSs2W1q8dJZG0z59TJATV7ITNmhcw+5us4KxaheXB5c2CqmE0mRLO+Gct4tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76BOTvTGXyUl1eOvmz2swe/1nIT2Wt7kCcpRi8BrT7Y=;
 b=P7cKSp6s1H0WBlxYBqOXfjrGoQHrZS35AGz0GApIqa61ffsb5ahT3HFWd9XCh3IIfBQo6ElJid/7A79Fy3ls9ILKmUGvwtSrH3jQEo0p21R6OZmiWMGORR6OlZ7Ut8liTYKh5TQgeqdC4np8cW2biZ7IXUSAAbz/kGlmFfrpjso=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB3115.jpnprd01.prod.outlook.com (2603:1096:404:6f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Tue, 29 Jun
 2021 11:16:02 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4%9]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 11:16:02 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: "chrubis@suse.cz" <chrubis@suse.cz>
Thread-Topic: [PATCH v2 1/2] syscalls: Use more accurate TST_EXP_FAIL2 macro
Thread-Index: AQHXbNPHth+W0ztdnkuUYSSNQQDYlasq1tqA
Date: Tue, 29 Jun 2021 11:16:02 +0000
Message-ID: <60DB0121.9000404@fujitsu.com>
References: <YNHCQ8qWSBdHIAra@yuki>
 <1624963486-6614-1-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1624963486-6614-1-git-send-email-xuyang2018.jy@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dcf5e065-bc85-490c-3d46-08d93aef47d0
x-ms-traffictypediagnostic: TY2PR01MB3115:
x-microsoft-antispam-prvs: <TY2PR01MB31155EBB1C6DA394515117ECFD029@TY2PR01MB3115.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:67;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CMJfc5DspGwFECU4o/4DRaHftjnuub4KwaO7Ch+9hDtdlV0OiJsa72ZKn2zNoc3pHUoHoiF5keJAhp9gAZ+OJCn9jG2O36olaex4oWJFjcHnBlmiJXnl2JDihDj11WVPxkHfmX8Df8e9Fz0deVHsQ96nNQzNU1d1lCamskeHfDsUyiDmzivKlnL1SXcIAGkThhvVSddIjBdhJ+cFxVJ9bhWsmMqCZ8TtcoblewcYlPeyUrRE0J+CFIBVoZfojQ14WrWa6Oy2Vz2SwmIoCdSZTB8OAsk3+sj19O5AN2weuzxUdnEmLM1jxOxoM1WX+tgqXclsCjcEUu0FAHVeJRlwyY5CkWsuwY9eyMpc05Y9FyDu4LVYbzQccWQhblJCPKP7zeTbQ44SKX+j77e7APTPpo6MRNqedmjIuelI+zDmf/XPkkSpQJ/dGj81gHkbB3/+LXAHV96ILr+GhmgmzhwmeceIwbs4Qnc4RAeTr7Ke+IavwH3Wldwx/R+Nuh2qIeTnSHo+OCxLgKIo13nKAC/RHokXEcqM9uty6O0sWwyWylG48JDL56HC6dws5Ch6vbW02+K7ZHplETC+amQN8kc+G8WYdLPRcht78+0poCF21vXbqPmzTOC+7TZMIQ5UNsUL6h2BqfcIg1KZbxZeJvRkC23JoykJbACxNUUKF9z3JZjng4GXpGp6KQfC1KsskGPGmO0mAgzWdSJbUmiNv7SV5kUnjYTZEajrzYlxwW3oFdn6vZ+xQ6YxU1T4vyfHK52/X7iK22zaHVBBhZXOYzDdRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(966005)(85182001)(87266011)(38100700002)(122000001)(2906002)(6916009)(66476007)(6506007)(66446008)(6512007)(86362001)(66556008)(26005)(5660300002)(83380400001)(64756008)(8936002)(2616005)(4326008)(8676002)(478600001)(33656002)(66946007)(71200400001)(91956017)(76116006)(186003)(36756003)(6486002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?SVpEZS9vTW55MnEwTWNlR3NwTElZYkJ2ZDdVZ1VuVVVXblQ0b0xOQXFZeXZo?=
 =?gb2312?B?aGRWaFRPMmZUMWFuajhHb2haWEZvUFhtVWtjMld1eVc3VzVOaGZRNklGNFhh?=
 =?gb2312?B?SVVsLzBUOEJhcUpLTnY1S1EwTFc0enQ1N2EzK3RJK0xPcW5QZWVrUGNmMGwr?=
 =?gb2312?B?ZStHRmpOOHBYMGJEL2trSWtTMnZzaHJHdnovTU5qS0dNQ3MzdzJzcUFBL3lp?=
 =?gb2312?B?WFVuYkZSbHhQeGNReUlWcXRXTGM2R3k3WVgrcEN0ZW41Vnk1YWp5Q3RSbEtU?=
 =?gb2312?B?UWRyNUpLRU51OUZ6cUNYeE4zSHQxMmJWYlJ3cFQvN2g4MElLQnladlZDWFZt?=
 =?gb2312?B?cjV5K2Z1Z1VENXJYN3F1b1VyS3B1ZU9QdWR3Y05hSXZ2MG11Z2l2RVZxbkhu?=
 =?gb2312?B?cnExc1kzYmNPOUFLc2lTRVIwbmdtVnh5YyttVWxjQVptNm1UUDRFTkJrdTBN?=
 =?gb2312?B?V3dlUFpOemZoZ3ZOT1Q3TVVyc21QRnVHUzdaMEM3NFBOU2lpakxPL0FFdUdZ?=
 =?gb2312?B?K3NZS2tHZVpKaE1OVWJyQTBJb2c1QzVqN0NKNUZTWndJaFBEazEyVkxhWEpp?=
 =?gb2312?B?RHduWXhKYWNIejA0WGJYRUM3VFN2ZmRRMjVpdHV1T3hHWUY4Z2FpRzlDSkYv?=
 =?gb2312?B?SVZRREVsemV4ajMwQ21qaFc3UC9sMTViTndFT09nQnhqRGtJaDJRVUFJbmw0?=
 =?gb2312?B?ZkJ4V1FsNWord1JzOWJyeU82TXdJaTBVdi9xelh6d1BYZm9EVzhjTlhBL1lW?=
 =?gb2312?B?TzZKUElaWTVQL0llWWpwQ3RXMko2TTJwSlhYUUYxMWR5TUpiTzAwV00wMm01?=
 =?gb2312?B?eTdERFN5UWtWYXN3bUh4c1gvaGl6ekNGUlNhTmJ0TUxyZTVHY0ZiK1UrQkd6?=
 =?gb2312?B?M0tVRk5vMkw4TTRqT1BZbThEOE5vaUxjN0ZNS0pkNmJJc1VGUVZ1QzJqaVFv?=
 =?gb2312?B?bWt2dy9ERFZWM1Y5eWg4NUlSQmdEZXlpU0JHWEtqZGxKczAxSngvYzRjUTVL?=
 =?gb2312?B?NGwvSWtKbHFteG94Y1NsNTFoUEpXa0crbEdvWjJheE14Q0wrajEvRlVpMzIv?=
 =?gb2312?B?UDhiQTBlS3BqSWRIc3NYSEtQdkUzM3JXcmZiQ0krNno5VTJrVnFKQzVhb09Z?=
 =?gb2312?B?OHFnanNZNWdzeGEzKzNZOXpNTWR0WThrdkxpbjF0eXNlRWxBR2ppWG01T01i?=
 =?gb2312?B?L0lYekVManAvbnM5OXZCWXAvckZ6NFh5VzduWmZZSmZsZ1hiVnAzV3Fqcks3?=
 =?gb2312?B?cDFPcnNGeTNSRENjR0xQZzErZWN6NU93Rk5aNDdYV0NsRmxGOVp1RVQ1bFhN?=
 =?gb2312?B?NkFxQlFoVkFMQlpKb0xoOS9DZDVpNlJVTVVUZkNLNXZzcmFUbzYxV1c1a2Y2?=
 =?gb2312?B?c0hyQkhMMWhqQkRsblh6bDMrQ291clRSWWpRK1ZVZGFORmtZdldlT1IzSUVj?=
 =?gb2312?B?OWUzSHdKWHhUTytjYW4zVlJnckFBR3lWMEJMOXRoemFTYWVjSERjcjlyT1Fk?=
 =?gb2312?B?cmx2V3JkL1ZPWkt0Qy9iY2VPVXdkVkI0UDN0dW4wdEk3S1JCSjBZSkMvRzA2?=
 =?gb2312?B?ZWJUV1FuUWdSLzYxS2plSDBPa01KUm1SWDY1WFJwSWdjNUR5cDl0S2t6L05J?=
 =?gb2312?B?RDhOM0R4Z3dNS2ZEUEQ3NTF1TDRJcUZ4TFdwTjNLYlBjTDRvSVJSV1dha3JU?=
 =?gb2312?B?bmdhNEZycEZOb1BCTTJhR2pqSmcrckV5d1Z5Wm16ZUttZC9WMGZ3ZkpkODFU?=
 =?gb2312?Q?IsVXcxRjAX15Sngn3pOiq8XUqq5NGjoMP47i70m?=
x-ms-exchange-transport-forked: True
Content-ID: <14D1A28931091D4894A507C4CF36CEBF@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf5e065-bc85-490c-3d46-08d93aef47d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2021 11:16:02.4895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mpRonKybwfV1FDbY+dt1BEdJVSFiba/3x+p95AjZV5Xzx2BDiTS6/Tk0Ny0k/YMW2ns9yPQBwB/59p+J0X12O7t3IyWIyRneGtkzvLBMZ80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3115
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls: Use more accurate TST_EXP_FAIL2
 macro
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

When I do this patch, I found a tst_res usage problem in sendfile06.c.

see https://github.com/linux-test-project/ltp/runs/2933366481#step:10:3797

Best Regards
Yang Xu
> For these modified files, the return value is expected to be non-negative integer
> if call passes. So they should use TST_EXP_FAIL2 macro.
> 
> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
> ---
>   testcases/kernel/syscalls/accept/accept01.c             | 2 +-
>   testcases/kernel/syscalls/adjtimex/adjtimex02.c         | 2 +-
>   testcases/kernel/syscalls/io_getevents/io_getevents01.c | 3 ++-
>   testcases/kernel/syscalls/io_submit/io_submit03.c       | 2 +-
>   testcases/kernel/syscalls/open/open02.c                 | 2 +-
>   testcases/kernel/syscalls/open/open11.c                 | 2 +-
>   testcases/kernel/syscalls/recvmmsg/recvmmsg01.c         | 2 +-
>   testcases/kernel/syscalls/sendfile/sendfile03.c         | 2 +-
>   testcases/kernel/syscalls/sendfile/sendfile04.c         | 2 +-
>   9 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/accept/accept01.c b/testcases/kernel/syscalls/accept/accept01.c
> index 52234b792..85af0f8af 100644
> --- a/testcases/kernel/syscalls/accept/accept01.c
> +++ b/testcases/kernel/syscalls/accept/accept01.c
> @@ -97,7 +97,7 @@ void verify_accept(unsigned int nr)
>   {
>   	struct test_case *tcase =&tcases[nr];
> 
> -	TST_EXP_FAIL(accept(*tcase->fd, tcase->sockaddr,&tcase->salen),
> +	TST_EXP_FAIL2(accept(*tcase->fd, tcase->sockaddr,&tcase->salen),
>   	             tcase->experrno, "%s", tcase->desc);
>   }
> 
> diff --git a/testcases/kernel/syscalls/adjtimex/adjtimex02.c b/testcases/kernel/syscalls/adjtimex/adjtimex02.c
> index 5d8d7019b..747d83254 100644
> --- a/testcases/kernel/syscalls/adjtimex/adjtimex02.c
> +++ b/testcases/kernel/syscalls/adjtimex/adjtimex02.c
> @@ -110,7 +110,7 @@ static void verify_adjtimex(unsigned int i)
>   		}
>   	}
> 
> -	TST_EXP_FAIL(tv->adjtimex(bufp), tc[i].exp_err, "adjtimex() error");
> +	TST_EXP_FAIL2(tv->adjtimex(bufp), tc[i].exp_err, "adjtimex() error");
> 
>   	if (tc[i].exp_err == EPERM)
>   		SAFE_SETEUID(0);
> diff --git a/testcases/kernel/syscalls/io_getevents/io_getevents01.c b/testcases/kernel/syscalls/io_getevents/io_getevents01.c
> index 9dba4addf..e8a426ab6 100644
> --- a/testcases/kernel/syscalls/io_getevents/io_getevents01.c
> +++ b/testcases/kernel/syscalls/io_getevents/io_getevents01.c
> @@ -23,7 +23,8 @@ static void run(void)
>   	aio_context_t ctx;
> 
>   	memset(&ctx, 0, sizeof(ctx));
> -	TST_EXP_FAIL(tst_syscall(__NR_io_getevents, ctx, 0, 0, NULL, NULL), EINVAL);
> +	TST_EXP_FAIL2(tst_syscall(__NR_io_getevents, ctx, 0, 0, NULL, NULL), EINVAL,
> +		"io_getevents syscall with invalid ctx");
>   }
> 
>   static struct tst_test test = {
> diff --git a/testcases/kernel/syscalls/io_submit/io_submit03.c b/testcases/kernel/syscalls/io_submit/io_submit03.c
> index 052b0c8cc..90780c0e4 100644
> --- a/testcases/kernel/syscalls/io_submit/io_submit03.c
> +++ b/testcases/kernel/syscalls/io_submit/io_submit03.c
> @@ -103,7 +103,7 @@ static void cleanup(void)
> 
>   static void run(unsigned int i)
>   {
> -	TST_EXP_FAIL(tst_syscall(__NR_io_submit, *tc[i].ctx, tc[i].nr, tc[i].iocbs),
> +	TST_EXP_FAIL2(tst_syscall(__NR_io_submit, *tc[i].ctx, tc[i].nr, tc[i].iocbs),
>   		     tc[i].exp_errno, "io_submit() with %s", tc[i].desc);
>   }
> 
> diff --git a/testcases/kernel/syscalls/open/open02.c b/testcases/kernel/syscalls/open/open02.c
> index ca9839c2d..67bf423ae 100644
> --- a/testcases/kernel/syscalls/open/open02.c
> +++ b/testcases/kernel/syscalls/open/open02.c
> @@ -49,7 +49,7 @@ static void verify_open(unsigned int n)
>   {
>   	struct tcase *tc =&tcases[n];
> 
> -	TST_EXP_FAIL(open(tc->filename, tc->flag, 0444),
> +	TST_EXP_FAIL2(open(tc->filename, tc->flag, 0444),
>   	             tc->exp_errno, "open() %s", tc->desc);
>   }
> 
> diff --git a/testcases/kernel/syscalls/open/open11.c b/testcases/kernel/syscalls/open/open11.c
> index ded384fa8..3c3c11b84 100644
> --- a/testcases/kernel/syscalls/open/open11.c
> +++ b/testcases/kernel/syscalls/open/open11.c
> @@ -278,7 +278,7 @@ static struct test_case {
>   static void verify_open(unsigned int n)
>   {
>   	if (tc[n].err>  0) {
> -		TST_EXP_FAIL(open(tc[n].path, tc[n].flags, tc[n].mode),
> +		TST_EXP_FAIL2(open(tc[n].path, tc[n].flags, tc[n].mode),
>   		             tc[n].err, "%s", tc[n].desc);
>   	} else if (tc[n].err == 0) {
>   		TST_EXP_FD(open(tc[n].path, tc[n].flags, tc[n].mode),
> diff --git a/testcases/kernel/syscalls/recvmmsg/recvmmsg01.c b/testcases/kernel/syscalls/recvmmsg/recvmmsg01.c
> index 10eaa3dcd..fb21ea1e7 100644
> --- a/testcases/kernel/syscalls/recvmmsg/recvmmsg01.c
> +++ b/testcases/kernel/syscalls/recvmmsg/recvmmsg01.c
> @@ -89,7 +89,7 @@ static void do_test(unsigned int i)
>   	else
>   		timeout = tst_ts_get(&ts);
> 
> -	TST_EXP_FAIL(tv->recvmmsg(*tc->fd, *tc->msg_vec, VLEN, 0, timeout),
> +	TST_EXP_FAIL2(tv->recvmmsg(*tc->fd, *tc->msg_vec, VLEN, 0, timeout),
>   	             tc->exp_errno, "recvmmsg() %s", tc->desc);
>   }
> 
> diff --git a/testcases/kernel/syscalls/sendfile/sendfile03.c b/testcases/kernel/syscalls/sendfile/sendfile03.c
> index dda651703..85a3b0f35 100644
> --- a/testcases/kernel/syscalls/sendfile/sendfile03.c
> +++ b/testcases/kernel/syscalls/sendfile/sendfile03.c
> @@ -50,7 +50,7 @@ static void cleanup(void)
> 
>   static void run(unsigned int i)
>   {
> -	TST_EXP_FAIL(sendfile(*(tc[i].out_fd), *(tc[i].in_fd), NULL, 1),
> +	TST_EXP_FAIL2(sendfile(*(tc[i].out_fd), *(tc[i].in_fd), NULL, 1),
>   		     EBADF, "sendfile(..) with %s", tc[i].desc);
>   }
> 
> diff --git a/testcases/kernel/syscalls/sendfile/sendfile04.c b/testcases/kernel/syscalls/sendfile/sendfile04.c
> index 8ebeb3c10..9a8ec08b9 100644
> --- a/testcases/kernel/syscalls/sendfile/sendfile04.c
> +++ b/testcases/kernel/syscalls/sendfile/sendfile04.c
> @@ -58,7 +58,7 @@ static void run(unsigned int i)
>   	if (tc[i].pass_unmapped_buffer)
>   		SAFE_MUNMAP(protected_buffer, sizeof(*protected_buffer));
> 
> -	TST_EXP_FAIL(sendfile(out_fd, in_fd, protected_buffer, 1),
> +	TST_EXP_FAIL2(sendfile(out_fd, in_fd, protected_buffer, 1),
>   		     EFAULT, "sendfile(..) with %s, protection=%d",
>   		     tc[i].desc, tc[i].protection);
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
