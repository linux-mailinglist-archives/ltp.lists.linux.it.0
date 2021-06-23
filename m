Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BCF3B16D4
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 11:29:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F7A53C6FF1
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 11:29:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 00D4D3C21DD
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 11:29:10 +0200 (CEST)
Received: from esa16.fujitsucc.c3s2.iphmx.com (esa16.fujitsucc.c3s2.iphmx.com
 [216.71.158.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D1F071A01142
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 11:29:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1624440551; x=1655976551;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2vEgTgwysFATBsX7zjrgByxcAZcMP8ko+uknhVAKlSY=;
 b=kEEVGF6IAvOqOw+cGpYEHv2j3yAGUROcvuLPEVT/XpO3Bc9/n2O5DJp0
 JtVpGzD5y2BL0ruk4xgje7C2BCQ8r5Z8eKtYFiu7JAOZ238iD4vrJfzly
 BuogNmqax0eJ5tw9iKJNbjilv7afu6efCiwYpXkj+F7CBLq9A5qX7wruv
 zjDUj+AnsCRE/hEjHKcL2hM82lZTNyvCdHHSjJXRoGtDewnewm1cCh2+V
 3lpQCVFEdHtt9jSFwrYcZ5lSXQ8xSUnGYz4tDzqpECkOfd08sy500XDO1
 zfJnAwSkWNVmJVLotu8tSuEMmhLUyjy4gc3vpWf4jOwtGfyB4j2Za+b8j g==;
IronPort-SDR: BRr/yquJVUGWa3l0pGLEa+eZdSS2OPq/ap2wcUogBlhim6a3bfC1in7/wXSrREamyxWUDYNF7Z
 FPCCDUtCfZjhpk1GNgAdTwi/hQOgPz0DAyuTQxYHu0fBvgwG+YFNmRPBtmjLSdXqr3g+YmbdL0
 NoRV237+CY59DA3EoJLSc26PZeZ7cPixaRJF5uO3OPm7Xm85sMHivEg0zur3WMeCPM5ic4vvgp
 oPPkWUk3kgQjzO0isxmJY12AVbkJr7XhHU0u76t85JZb5NkwQXkHseSa11RBozp6WdwUOqWVnR
 MiQ=
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="33657708"
X-IronPort-AV: E=Sophos;i="5.83,293,1616425200"; d="scan'208";a="33657708"
Received: from mail-os2jpn01lp2054.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.54])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 18:29:08 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcOTmHiYaGT5Thuhcr6gTniENjZSB+D0M7hIPIwouJHD0vbgo1E77vwrHfIQrhM4wqlY7y2yJW+xb70Kt1WLOop7E7eimGQgWjTF2hJD9UTgI3YpxYK7Kv3gwdAXkLQOVW4pOBTd5jdm/ST1pYvd5Xby6Ma6Ik5HwXEzRqgaxVkSzblrS8ORwAt84nne7fXetgkMlwUVzOorMAoXhSuwVnBJdsYlA5HcwNyVsVThYZebaPhoeXlyFfMoQ4oShRH6/zR7kOaPDN4k5mKIEWlW104d58qfpUqifyI0Gzzt1dZYpe7eYXW2bAtf6IFu32U+FnjpNtX+lfqsWhJaqCXObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vEgTgwysFATBsX7zjrgByxcAZcMP8ko+uknhVAKlSY=;
 b=njlIIia4snsVwXWM78Do4PcrcS/BYcRxSgi+1FxZfaMO7YPy9R3u1ce4cGhmyv69Ms012kFiKIRloi9bgFci6mjA5/RH87oLegwJTVWYQ+db2xIROJuvY2AFvD1IGLxHeZeAIXksxZbOl9Gc9PpvMr1Ie1HL/e33cFwMNFkcdbNJaW/12YeGmB4bs2iHJ6+wT+WUonXEzv4yg3XeN+fBa06PKyhR746wzSd0FducSGCZiK4BZyxuejUBrDx5ag7Zu7qDPiuiFlgXsgdmcdbhFbeX5zJ4mhU2KH7tv7qs9YFmCLo/wEB2e3OJTAZLvFylH8eN3Y2DELeXwtiKpkgOsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vEgTgwysFATBsX7zjrgByxcAZcMP8ko+uknhVAKlSY=;
 b=mJp5PaJYwafwHn+Dz5X1Sw90jehZ4qwwKqUehxJt4PQfPTecHyTKbVYM4AUcJFWJvtQzCqXe7Sdo7QJpz0k1ceq9tgBFrJfNEzurS2MYW//R5/GfCs2QbdcSg+G8/BjKeu2ExThe/2c+9Fwm2nsJLmmPLSR8kvoopBoay79Qnoo=
Received: from OS3PR01MB6535.jpnprd01.prod.outlook.com (2603:1096:604:100::7)
 by OS0PR01MB6065.jpnprd01.prod.outlook.com (2603:1096:604:c8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 23 Jun
 2021 09:29:04 +0000
Received: from OS3PR01MB6535.jpnprd01.prod.outlook.com
 ([fe80::fc72:e334:e2b9:f68b]) by OS3PR01MB6535.jpnprd01.prod.outlook.com
 ([fe80::fc72:e334:e2b9:f68b%4]) with mapi id 15.20.4242.023; Wed, 23 Jun 2021
 09:29:04 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Thread-Topic: [LTP] [PATCH 1/2] syscalls/msgstress03: fix fork failure on
 small memory systems
Thread-Index: AQHXZ1feMKlhPB5qZEaTXrx7GG/6YqshVdsA
Date: Wed, 23 Jun 2021 09:28:58 +0000
Message-ID: <60D2FEFC.8030706@fujitsu.com>
References: <20210622111440.74722-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210622111440.74722-1-krzysztof.kozlowski@canonical.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcea3628-d63e-47f0-3aca-08d9362957d7
x-ms-traffictypediagnostic: OS0PR01MB6065:
x-microsoft-antispam-prvs: <OS0PR01MB606531666F7EE9CD653244B7FD089@OS0PR01MB6065.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XVGxIDH7RcLQcr+qfo8bQeEqn6TZc4+HVj19rHd5eNzhDWeVNzvh/fig7/UxlZH+J6vQMhyH3q8AaZaO1NlWSyORFgQEr5YKx3GzKx6kY6tLjZ1ybz7DVx3ePfq9Ev5EiNigHH4OJ+lLuIarJzf9X4ezXvjvBjNpAiZrCW6hE3Gu759ai6qy+64YraIZVBAeHToTwRPx6qujDKrvk/23WHVs4MNt766UWwEEfk53BjXB1ITMp0ccctVFUFRpeXqjyzlyM6UPzghM5NbdbNw3BG0DfJ+oL5stMsbwcfqO1SQ6ZiLKsqVgctbHMS4fCVUADMlpzZivlGV+PfpWWQ4DsL1erSGfPnIIFIZg/xUPEOMtxp1iNkrsUjHVhFwWAgvwOWag3IfINyJxcn4lQz0Pqq3zt3/928yj/RAuaFbvkgd74FLf46ofj1Nt6Nedaq/v1IyZ+TTOQtzojlQff71MUctDvytPME7iIthviDuDSLWDx3mjATBbSVQncXxxp8OpJkE+C0o09TCr9rxA3CGonQSiECMQJSP9XRBhGZU8TOGW3isVdxBkERN+zECXPwbL3GCYBq0080IP7jpePMBT9BWNjoPDqnRvol7FAOeQDQdRCQGMHUUP8PE6ht5HuUb12cyk7bPrImJTyJ/5iVIQuDgzWeEMVBT0rRVb28vUy1kvCSl77fpar67Mjpx8cgSx11ynb8FpIFJcbaEJAUeRM+sAFeyx5f43AJfe+Oun8vw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB6535.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(2616005)(316002)(5660300002)(91956017)(2906002)(76116006)(66476007)(87266011)(6506007)(66446008)(64756008)(66556008)(83380400001)(38100700002)(36756003)(122000001)(66946007)(478600001)(26005)(71200400001)(6666004)(4326008)(85182001)(186003)(6916009)(33656002)(6512007)(8676002)(8936002)(86362001)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?NGp4cThUMTg2a3FxQmFjcC9ITGxVQk1qRUk5ZzVuUyt4bzFSQ1N0Vkk3QVcr?=
 =?gb2312?B?Z0tJdHJyRU9EOGhXb0QwQXQ2QjNvSDVnQ3pIeUp6bVptNW5SajlxSnZaTjBw?=
 =?gb2312?B?TEthNnI3dUZBM09KUFd5TWFaM29FbEFXSjBwMFQ2RmJRcGJwSjFDbGV6Uk42?=
 =?gb2312?B?OW1wK2VEREhUWnpxcTUzek41d25YNVkwemMzY2pESFJyQmpjbW8yNTFOTnJW?=
 =?gb2312?B?aWRsZmZOVmZLRENPVHAxVkNsRG5EN0JtYVQraVYzcXVuaEx2OStLOGhzYTFu?=
 =?gb2312?B?TDlxRXY2a09QTThuNXdPNWpFTHFQdi9OU08za3ZiSTBmaWhTeHJ5ZXd3aktz?=
 =?gb2312?B?WWFLRVFlVW9aVDh4MU50Mk5OaE1td1RlWlRIdTNNN3JxRHc3TUNDbWJ6TVJ0?=
 =?gb2312?B?WDJvczlwVEFBai9YNDhPd29UMWc5QmJZQ25wQUpCSW1zZHA4SDltWnBIZGxH?=
 =?gb2312?B?SGFaelZMVFFucmtuMWFEajh2dTRlVElvYlA4dmxLUnlyeEtyQkN0TFU5OFpT?=
 =?gb2312?B?V0pLc0lkeGNGOUpXU05DTlMxR2pBV0ZlUWxvcmxEZCsyYjlZQ1dPWkdaNGMw?=
 =?gb2312?B?RHhhclBKbE5PZ2o2WURTR1pTZzlBQll3Nzc2UklxLy9PY0Y3eGVSNG1QdlA5?=
 =?gb2312?B?SitXL1ZjVU1uNWhUNU5ONC91RHFFcGRUa2c1T1I4eFQ5NS9DVlJMWVAzSWkz?=
 =?gb2312?B?M1NUWWlFZm1nRXhiTm43SWNCd0hNYWxDWnAxY1BwL3RJcFFOcHBjdXBJdTlH?=
 =?gb2312?B?ZXkvSU4zMWpsSmdWempISUxDakNxUC9lYkFRT2JVWDJRTmgyajRqTlZ3Nnhi?=
 =?gb2312?B?VEhMWC9FdmUxNTVjQWhwYzQvM0JtNjBhYmpXa2JzT21aRVZnUE0xSFNhZ0sw?=
 =?gb2312?B?TzFHa3k0OEdEQndOQzZ4OXVxR01vY1ZvYU92RWg0SXZ1MVNxNjJMelQya2xH?=
 =?gb2312?B?NzhWVm1jUGR0Ni9FNVJhaFBvQXlEVldxS0p4S1ZOQk5kRmVDR09nbTlLeG5y?=
 =?gb2312?B?ZlVkR2R5RkkzNnB2cTBRZ0xsbmJBVldXaE5BUWRNV0FrMVIxMW00NzEwNUxp?=
 =?gb2312?B?N1V4RFJ0bHVMZUxVVnFCenlrM1VCNjRjTytiUDlBcERpeGxVc01OV21YSGF3?=
 =?gb2312?B?TzlmdUk4SXFUSk9Iekd3YjF1NHl2YjFKWE5IQ3FMLzB3WDQ3eVZQZGpxTVBo?=
 =?gb2312?B?aFhiaXVRTFhLOVFiV2N3aXZXLzBFeTVrY0dkWTY1dUNSM21hRWQvMTJ2SmU3?=
 =?gb2312?B?cEdYQStLWUpoM2RRMnRTcUNIYVZ4MnBreDN1L0pzYm9HdVprSno4c2VoUzky?=
 =?gb2312?B?MmVXVG50MGg5am1USFRXNUdGQW5nU0VrRGZlWkFNdnYzeml2WTYwKzBXRUg4?=
 =?gb2312?B?bHZWaUpKckVzajZpTEIvSk02VHp4cDVQeW1VRjN4OTNKZjBFcms4ZXQ2WjM0?=
 =?gb2312?B?Q3E1SW1KUVA1RzlkZXRGemJhNExCL3NTK01UMzZ1WGlYVzJSc2NDR2c2dUxO?=
 =?gb2312?B?TDBRWTZZVlNPSTUrbXREN0lRVGQ4ZUNMQnBKNExGZDlIYlcrMFpaZ0xSVmVR?=
 =?gb2312?B?ZmJvdWJ4ZUV4QjRCZFdRMFllZ2JaZm8ycjl6c29na2grK0F0ajBsTThrb1o5?=
 =?gb2312?B?TDRYaTVIbjVhWTB1ek40dkp6eGgwRzhCVkwvbC95Z1BEK0FFRGJrUW1GNGpI?=
 =?gb2312?B?bzk4S3paZ3RlYXBwR2VaSUVlUXJxZDFmV0JRYzdvNVhWb2JBbVVmdjhBeXBo?=
 =?gb2312?B?cTQ3ODNvdUlJNzk4YWJLaEM0azhoUjdxa0FSSlM5SEtEQkJUdEc0MU0xdGFh?=
 =?gb2312?B?YzZ3RFJNQlZBZ3h3cVc0UT09?=
x-ms-exchange-transport-forked: True
Content-ID: <195C9661D0A1F6478C07BADA362E7E13@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6535.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcea3628-d63e-47f0-3aca-08d9362957d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 09:28:59.1492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O0BTg550HovQKZDshQ4BUhbGnRoG6CWKtLOpIlpudTcVRpsp2lM7e6zoHzJAN+h+FAesYfyFE2TwsjculjzOqL6V0QmbODOcN7LP1YW8U84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6065
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/msgstress03: fix fork failure on
 small memory systems
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

Hi Krzysztof
> Running syscalls/msgstress03 on a system with less than ~4 GB of RAM fails:
>
>      msgstress03    1  TFAIL  :  msgstress03.c:155: 	Fork failed (may be OK if under stress)
>
> In dmesg:
>
>      LTP: starting msgstress03
>      cgroup: fork rejected by pids controller in /user.slice/user-1000.slice/session-1.scope
>
> The reason is cgroups pid limit set by systemd user.slice.  The limit is
> set for login session, also for root user.  For example on 2 GB RAM
> machine it is set as:
>      /sys/fs/cgroup/pids/user.slice/user-0.slice/pids.max:5207
This file only exists on cgroupv1 and cgroupv2 should use
/sys/fs/cgroup/user.slice/user-0.slice/pids.max.

Also if some embedded system doesn't have systemd, do we have a generic 
way or fallback way to calculate the pid max?

For this problem, I have a calculate way in my patch[1] at this time 
last year.

[1]https://patchwork.ozlabs.org/project/ltp/patch/1592298082-21792-2-git-send-email-xuyang2018.jy@cn.fujitsu.com/

Best Regards
Yang Xu
>
> Read the maximum number of pids and adjust the test limit.  For 2 GB RAM
> machine with systemd this will result in:
>
>      msgstress03    0  TINFO  :  Found limit of processes 5056 (from /sys/fs/cgroup/pids/user.slice/user-1000.slice/pids.max)
>      msgstress03    0  TINFO  :  Requested number of processes higher than user session limit (10000>  4556), setting to 4556
>
> Signed-off-by: Krzysztof Kozlowski<krzysztof.kozlowski@canonical.com>
> ---
>   include/ipcmsg.h                              |  2 +
>   libs/libltpipc/libipc.c                       | 58 +++++++++++++++++++
>   .../syscalls/ipc/msgstress/msgstress03.c      | 15 ++++-
>   3 files changed, 74 insertions(+), 1 deletion(-)
>
> diff --git a/include/ipcmsg.h b/include/ipcmsg.h
> index d89894b726cf..b73b72d6d172 100644
> --- a/include/ipcmsg.h
> +++ b/include/ipcmsg.h
> @@ -61,8 +61,10 @@ void rm_queue(int);
>
>   key_t getipckey();
>   int getuserid(char *);
> +int get_session_uid(void);
>
>   int get_max_msgqueues(void);
>   int get_used_msgqueues(void);
> +int get_pids_limit(void);
>
>   #endif /* ipcmsg.h */
> diff --git a/libs/libltpipc/libipc.c b/libs/libltpipc/libipc.c
> index d94880f54b64..cd3480ed9f21 100644
> --- a/libs/libltpipc/libipc.c
> +++ b/libs/libltpipc/libipc.c
> @@ -151,6 +151,31 @@ int getuserid(char *user)
>   	return (ent->pw_uid);
>   }
>
> +/*
> + * Get the effective session UID - either one invoking current test via sudo
> + * or the real UID.
> + */
> +int get_session_uid(void)
> +{
> +	const char *sudo_uid;
> +
> +	sudo_uid = getenv("SUDO_UID");
> +	if (sudo_uid) {
> +		int real_uid;
> +
> +		TEST(sscanf(sudo_uid, "%u",&real_uid));
> +		if (TEST_RETURN != 1) {
> +#ifdef DEBUG
> +			tst_resm(TINFO, "No SUDO_UID from env");
> +#endif
> +		} else {
> +			return real_uid;
> +		}
> +	}
> +
> +	return getuid();
> +}
> +
>   /*
>    * rm_shm() - removes a shared memory segment.
>    */
> @@ -218,3 +243,36 @@ int get_max_msgqueues(void)
>   	fclose(f);
>   	return atoi(buff);
>   }
> +
> +/*
> + * Get the limit of processes for current session configured by systemd user.slice.
> + * This also applies to root user.
> + */
> +int get_pids_limit(void)
> +{
> +	int real_uid, ret;
> +	char path[PATH_MAX];
> +	long unsigned int max_pids;
> +
> +	real_uid = get_session_uid();
> +	if (TEST_RETURN != 1) {
> +		tst_resm(TINFO, "Cannot get UID");
> +		return -1;
> +	}
> +
> +	ret = snprintf(path, sizeof(path),
> +		       "/sys/fs/cgroup/pids/user.slice/user-%d.slice/pids.max",
> +		       real_uid);
> +	if (ret<  0 || (size_t)ret>= sizeof(path))
> +		return -1;
> +
> +	if (access(path, R_OK) != 0) {
> +		tst_resm(TINFO, "Cannot read session user limits from '%s'", path);
> +		return -1;
> +	}
> +
> +	SAFE_FILE_SCANF(cleanup, path, "%lu",&max_pids);
> +	tst_resm(TINFO, "Found limit of processes %lu (from %s)", max_pids, path);
> +
> +	return max_pids;
> +}
> diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
> index 294b401b1b38..9cf96db7956e 100644
> --- a/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
> +++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
> @@ -78,7 +78,7 @@ static void usage(void)
>
>   int main(int argc, char **argv)
>   {
> -	int i, j, ok, pid;
> +	int i, j, ok, pid, max_session_pids;
>   	int count, status;
>   	struct sigaction act;
>
> @@ -109,6 +109,19 @@ int main(int argc, char **argv)
>   		}
>   	}
>
> +	max_session_pids = get_pids_limit();
> +	if (max_session_pids>  0) {
> +		/* Clamp number of processes to session limit with some buffer for OS */
> +		max_session_pids = (max_session_pids>  500 ? max_session_pids - 500 : 0);
> +		if (nprocs>= max_session_pids) {
> +			tst_resm(TINFO,
> +				 "Requested number of processes higher than user session limit (%d>  %d), "
> +				 "setting to %d", nprocs, max_session_pids,
> +				 max_session_pids);
> +			nprocs = max_session_pids;
> +		}
> +	}
> +
>   	srand(getpid());
>   	tid = -1;
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
