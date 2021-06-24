Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 108B73B2667
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 06:41:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC1993C6F29
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 06:41:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2AAB13C1D49
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 06:41:39 +0200 (CEST)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com
 [68.232.152.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3592020034C
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 06:41:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1624509700; x=1656045700;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Cdg+fxhfiVfp0ME01DVxtQdYHaV6uoJTUzfZyfM+P78=;
 b=HqrSPxze/LMY5jtf2JIPpGUgzaCa2oVazW9GGVYq4mkBoB9kBx5f8/Et
 q1limKeLc+21IyzY6/RZuKQEdwRilOAAg9Zf65at7lDQul3EkogBB9wTn
 8lNToN1yBMUsav9PhpwM751P4Yo9CpNFYUa5KN4/DUrxhtCXWpM1sBCG7
 rQ95miI+/K67yJCE3Tv2SZsllg8CeaYzkldzLDwYncjTclNe6qTTb59/t
 VotOicN0CO0iS0u2xGbxa9TM0gG/nOLoHGOzfFT6/JfBtG53bmop3rDBy
 a0wf7xSJFWMXibwUEwLFh8vA7IP+xQ3URIgJIg0PFKLSUuEOVOH6zex2H w==;
IronPort-SDR: DNEQ0/ywfSX4950jCMTR6+v2uzpauTI0g2Gk73YWa2VQI4jF3DG8q4E5vr8h8qsIfb7NIZLvYU
 6gT/7bT1CCX3kxaQ9EQ7TdsHXO1vL2vNwQYRAnM12eDm3MF319E4iNjMlQcD7EO++rd/EMeIGk
 xBAgiBQJArklT6kQCNK0pTvvLhtWMaNw5iXAEv8F1rxVooIPjDTRBwr+Tl+xUqzhUf9LIM0hbB
 nMjwWQLu5UHsr6Cp4pjfg72sV3q46yyJ5LbCwjykxTeqnw0KcP7KJcdm2RymnkG+zmdL9Nqp2c
 OK8=
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="41874090"
X-IronPort-AV: E=Sophos;i="5.83,295,1616425200"; d="scan'208";a="41874090"
Received: from mail-os2jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 13:41:38 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qe1ul5NKI4P2VFPEriVZxGxpsWuPv9Ujd1LWBASjt500s0zwTu+/IrcJzbVOoMFAiGgATqmL2eoquf9cbhHwddgA0H+7oMPgKwCmm3dgfOoTlmlUnRlsW+r/zc05NZW+54AkZrfjcdn7APi0Gz0f2sX17MLt/Nb5h1tLSSBzP9NHhG6RdwcHs5a9jBY5H89JoFzt+bD56MCGUA/Cnwr1Q5/NO2pxXb8nwN8fch6X3CzN1f4Ma3OxZUtg8glZd9g3xrmIZbthwnUmbTV+Pxx4jOwbsiY1bZ7S6kGBdrc79cxBgqlY8B1SSwxWiWr9NTmMFXMf07oYq5Gu9+CB0WkSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cdg+fxhfiVfp0ME01DVxtQdYHaV6uoJTUzfZyfM+P78=;
 b=jBUfq9Ha9AbnmgRUPwEdBno7D3n3Maba6eSxD2iLN91aSfSGXyFdsXD8tlv/7exVQjt4ykItnr0nR4Jt4AdbWWuhRrFI6EGxx8/TldxBKSU8fAYw1Vm1L/0748s5HGLVRKhl3G+zwuLxaErLFp1UK21oZNFT0ShWdINkwvs89lMsn5UWbqDoLr+y9Phf8jxOxGvBsnTl2PMlL6BObbWVLHidNlU2BhcyCZjxY2xw2RCZPpp7T3evLpawXsGmezEBSlFnIxPUBGimnUAbbWwEIuc+rn0UH96NcXo4GINGZHKsfuOeTheKjIWLmUlQNEdIhAzO3+aHipyxnpd1dn+09A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cdg+fxhfiVfp0ME01DVxtQdYHaV6uoJTUzfZyfM+P78=;
 b=INn+lp9GGfxDdqy0aha4gYzBACvSsqNvN4eU/kAgX42pP0X20zepkqJFb5361z3cG9vjkTQFClU71js0u7ZS1FSGrHDhXXhTqLaFjbCeYQ5xeaiPvo4yntF4lLznqxw9UquyJ5tUn+HRiQkdWjUGLOcwX7gihOYr5ufem+6Fw9M=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB2319.jpnprd01.prod.outlook.com (2603:1096:404:8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 04:41:32 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4%9]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 04:41:32 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [RFC] syscalls/ipc: Make use of TST_EXP_FAIL macro
Thread-Index: AQHXZ08ayddgpMKDYkaEjEEIKLWXuqsf3F2AgAK7mwA=
Date: Thu, 24 Jun 2021 04:41:32 +0000
Message-ID: <60D40D22.8050200@fujitsu.com>
References: <1624356737-508-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <YNHCQ8qWSBdHIAra@yuki>
In-Reply-To: <YNHCQ8qWSBdHIAra@yuki>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80a807e4-c097-4ef7-9465-08d936ca5769
x-ms-traffictypediagnostic: TYAPR01MB2319:
x-microsoft-antispam-prvs: <TYAPR01MB23194D68CC68D0560EB44E8BFD079@TYAPR01MB2319.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0lsiSc0yWaURklHQSiPx4EJ6gkJGongZg6VfqYrBfxvcQXoCljQFBttTV0m1sZr3nuvDFW9rEYzcIk/hB3AWTvlPCQb2R3sh9emAeFlivaTRPZnbJm9EHz+HQZgZ+ThcIXPUrA9kUgljLcbXdiBntBT5PeUufRyNVGJvsU2nzpd8ibffj2ZlqzM0eaKvJmwJHNFO7xghpgQ0Dz2XvlBI0Ms6fTfpvujRbI7EzxHJVQHx0CmuxRCBjWbmhEtfc8gNGB2L2tIzKcQoroXLa0Rin+3ImRwYriWBJP5gdrDm/PThoTcmAd0J16tJXUIAPElhZE/HFvwQQYRsDhUvu4jcLqC9DzToC3Kjvf58ShRYX+Y5NtFB7SBQ4R9lR65wbufvwfSfv+rroFQFFr8JtxwIrwIs2jS1d0I1tMALzORVsOjbF15wqaIueqRaEIh0cqfkIXJ39B1YaA/zNzg45dzB4V5eMKT1hvecXfmkoyqDAeETHKMHJ9Npu5uIS83X0DtuSWhxOre5WsorXfGLjACtkHY9VyPgEzfgA16sWZwclv/cuDx5zjfBlAuY17unCuc/LThz2knZolsktS0LReKZiq5ACcuTJIEo3rBk0kWcOhw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(33656002)(4326008)(76116006)(91956017)(122000001)(6486002)(38100700002)(66446008)(66946007)(6916009)(66556008)(186003)(66476007)(5660300002)(64756008)(316002)(86362001)(36756003)(85182001)(26005)(6506007)(2906002)(478600001)(87266011)(8676002)(71200400001)(8936002)(6512007)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?Rk10RUFaV0VJMlY1aXNQaW5ORktjdGZiUkpPeERDcWVXbzhTd01JTXpyYk4z?=
 =?gb2312?B?R3N6WmVQOHRrVW0wNkNvK1RuWTVDV2FBOEpzT2sxb1lPZEs1bkJ1M3Fad2hK?=
 =?gb2312?B?eUJpWTlXTUVvU2c5aTI0Wlk0aWZQTklEcU5PSGUrQ3YxcWdVbU9XMmQzak1J?=
 =?gb2312?B?RDdvcWZGa2Nnc052aU94QllzUmI3UHpBcGdoZ1BUSHhaZmNtdkZXQVljUm1K?=
 =?gb2312?B?eUZXaUlKREx6eEo2QXZLV05XK25QQnRXZURnYUQwRlpadkVVWmk2TVpyc1Uy?=
 =?gb2312?B?bk5URWI0OC9WKzJJRUVmbzUzUVdseHVDcFF5RkpYZERmbFQ2TmM1K2ZmNDBl?=
 =?gb2312?B?QVN2V3JDdXRzclhYcURyenFUTThCbVRoUzFSRTFyOXlEODhyeTdEU3krWlpF?=
 =?gb2312?B?VzVIcGI5ZitCTEtDRG5NeVY0dFZ4WFFYL29xU0dndk1vOWJNN3NFMXkwY1Zp?=
 =?gb2312?B?VXNINC9nc3pCUkoyZzZwVDFrWVRhNVYxVU1QVURoQXhoR0hlY01tcnQySEZr?=
 =?gb2312?B?NDhFRXJWN3haaHRkNWl1eWtGL2JpZGxRVzBscWNHSEZsWnFYM3FCSXduMkx5?=
 =?gb2312?B?L2Y5T3lwL0g5OEdtakh5dHpINkthaTBDZ3VtM2JVZHdRYUZ2NkVRZVVQakRu?=
 =?gb2312?B?YlVra1Zxd0dWamt2Tmo4ZmZJZWhZQTVFOXF5MnI2WStmYWExdVorZWVhazRi?=
 =?gb2312?B?aHNFRWd0TDNzb3owZkVyenVvTlhQMEpESThpZTVqTHhYVENPNGpSYWRDRW1t?=
 =?gb2312?B?WDJUUVZJN2dMUHZqbk1VRVRENE1wZ2duUElBSWdNQ3BzWlN0SUh6QTh3Q2J1?=
 =?gb2312?B?a2NjUG1vTFdCUThsbTBWRW1sdUkyMnYxdG9tWUlpN0pWdk91R1QzMlhOL1Bl?=
 =?gb2312?B?WENtejhpbHJPMVZuaEE0M2c1TGpZVjlkMTVTR0tBL3hDeEFuSlhtLzFnd21E?=
 =?gb2312?B?MGN1ZFA3b0pCaDZlSDdrcitDSllGSURoL0oyVnlCNzdOeUY5QWk2MnpQZ1lk?=
 =?gb2312?B?Tml1NHZFYUdESndycjI5bWpDeDRpWUtnbnNyMm84aXFwQy9FMTl5YmJiamlS?=
 =?gb2312?B?aklVRDVtSmRiQjBTWGxZZXVIYmNrZGRVTDdGY2c0dXBRSWlXRmJHR0E1TUEr?=
 =?gb2312?B?amVmYTRQNGlkY2hrTmlweklDekxBT2RibzVjbnZzK3dXeTE0ZUtYS0hvajJu?=
 =?gb2312?B?WjlzN2FJTk9NY2RTdWRkMjU5cjhIVWhMQWk5VUY3VU9JWjR1TkZtZnpBUWdG?=
 =?gb2312?B?ci90YzFmUGwwSHhVeTR4bmhqeDJOK3ZtejJ6NHRqQzNFbGg2bE5pTVVsRUNy?=
 =?gb2312?B?Z3hZK056T25qQkxBWEFpOERCZ1hIZWZIQlBTM3JRQXhIcXgrU0oxV2RmWUdJ?=
 =?gb2312?B?ajV1UVhWcEwwNUxSblQ0OWNBUkNnaHhnbEkrNFJxTzZ3TzdaRVZFSUl0dVF1?=
 =?gb2312?B?NzBWYlFFN2FUVHhJSExvQVRPMlVwSThpK0p3cGFwRFJtbFJkRGVwcE5MM2dY?=
 =?gb2312?B?OXc3RVFoUmVWMng4ZU01VWpEM0hGV3JnYjlpLzJ6Rll3N1gwdzdqRHlENnFL?=
 =?gb2312?B?SU9vNUZTWlVJZURNVTVzczE0L1cvRjZNY2VJakhqem9UUlV4QUVYakdDclpi?=
 =?gb2312?B?Y3NMUWVLcVB3VFRxYTI3SFQwZ29lWHhjQTZwcDczbnJyU2Jxd3R6ejcwOGVI?=
 =?gb2312?B?MFZTSTRLc1VHRmJsYjRxSjVFU0VpNUxkbWtxbVpMdzAvS1hkZjgzWFArN0tu?=
 =?gb2312?Q?rDmvAF7JOcGNLNyF/miToRJMH0zCSOA42TKFaiP?=
x-ms-exchange-transport-forked: True
Content-ID: <4F2C09A0DCB02A409CEC1D594E43B622@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a807e4-c097-4ef7-9465-08d936ca5769
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 04:41:32.6331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q6ZbHcINwhIuMV7MBRVC0bNCzYzaBkxd/DbVt/YVXNIS//ksUr/snraW54BA0SZog5Vk4gXDPImva15dmLLx/RB8Nvvaaa4NbIe1ws797pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2319
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC] syscalls/ipc: Make use of TST_EXP_FAIL macro
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
> Hi!
>> Since TST_EXP_FAIL macro only recognizes sycalls succeeded when syscalls return 0,
>> Can we use this macro directly for the these syscalls's error test? It may result in
>> invalid retval value and print errno when syscall succeeded. I think it
>> is a nit and it can improve this api usage range. Is it right?
>
> I guess that it would be slightly cleaner to add more generic macro that
> allows us to pass the condition for succeess and build TST_EXP_FAIL() on
> the top of that. Maybe something as:
>
> diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
> index 89dfe5a31..4d41741a4 100644
> --- a/include/tst_test_macros.h
> +++ b/include/tst_test_macros.h
> @@ -120,13 +120,13 @@ extern void *TST_RET_PTR;
>                          TST_MSG_(TPASS, " passed", #SCALL, ##__VA_ARGS__);     \
>          } while (0)                                                            \
>
> -#define TST_EXP_FAIL(SCALL, ERRNO, ...)                                        \
> +#define TST_EXP_FAIL_(PASS_COND, SCALL, ERRNO, ...)                            \
>          do {                                                                   \
>                  TEST(SCALL);                                                   \
>                                                                                 \
>                  TST_PASS = 0;                                                  \
>                                                                                 \
> -               if (TST_RET == 0) {                                            \
> +               if (PASS_COND) {                                               \
>                          TST_MSG_(TFAIL, " succeeded", #SCALL, ##__VA_ARGS__);  \
>                          break;                                                 \
>                  }                                                              \
> @@ -150,4 +150,8 @@ extern void *TST_RET_PTR;
>                  }                                                              \
>          } while (0)
>
> +#define TST_EXP_FAIL(SCALL, ERRNO, ...) TST_EXP_FAIL_(TST_RET == 0, SCALL, ERRNO)
> +
> +#define TST_EXP_FAIL2(SCALL, ERRNO, ...) TST_EXP_FAIL_(TST_RET>= 0, SCALL, ERRNO)
> +
>   #endif /* TST_TEST_MACROS_H__ */
>
> The only hard thing is to find a good name for TST_EXP_FAIL2(), I'm out
> of ideas here...
I think using TST_EXP_FAIL2 directly is simple and clear.

Best Regards
Yang Xu
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
