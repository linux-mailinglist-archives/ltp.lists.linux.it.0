Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7C8390F09
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 06:00:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 483913C94F6
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 06:00:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4F60E3C2B2E
 for <ltp@lists.linux.it>; Wed, 26 May 2021 06:00:17 +0200 (CEST)
Received: from esa9.fujitsucc.c3s2.iphmx.com (esa9.fujitsucc.c3s2.iphmx.com
 [68.232.159.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 358AB2009AA
 for <ltp@lists.linux.it>; Wed, 26 May 2021 06:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1622001616; x=1653537616;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tD31vjD3yDlkK49Duz24XBUFgdS/emd7Q9rKctTBT4I=;
 b=GB4dIjJFf/+DYKeVU1qaN5O+gfeNc36NFTo8rCd5fB1crgR610SoS8jE
 jeRk0Sk8CMnlBnvqu2DslnIxJNEYL+A+v0ujAPHE67FXZxpM5npUz23Qz
 dMNQFwfGd290KGN+X1Dy028NCPeP0v5UzKw8viH4Pir8PCUTeUzU8jYrR
 naOFzZufDEPkt0DobFmsDHKdxRbwp0wd3cJkZISdUNmxAVruaHA12Ddzm
 2+X0wmsjP3eQmsQIhsUv/bv7HMaY9fvyeU4ALRj9zWAJOPPXvWvA8l1fr
 CEkA+iSxer+Sj0/mpfFNxZRtOWEUW2l4GEdwkYo4oHRd2ll6mkEg9D4el w==;
IronPort-SDR: 30bTyTvny+VPKTEJgYfGv85/fXesaJ5A6lYg8UXRfvweq7j2FoymTusGWPbkBBdTIXpQjonuWX
 3p+vbJ9e3ypB/TNAFdxYw9qMrWYVCG8kt1iD4O0VLVV+g9Mk/1RUty9ndsVhYbkwVvlIWsCojw
 wv4iY6F4+GG6I8wHfnU+zkQwgWz7EX6qzvaEi/IbLahxSZoFL/EtpjW7EbQwkcV4vSeW8yLKEU
 ANZbEljXAqDzh6i90FoYuw0sCrlioAP6u2P9ktT8gRfUtCpdqTf2QmOK1J1PqyQIbuGkymgKb6
 i7o=
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="31976662"
X-IronPort-AV: E=Sophos;i="5.82,330,1613401200"; d="scan'208";a="31976662"
Received: from mail-ty1jpn01lp2051.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 13:00:13 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+D4t+SelfSnMx8+O23fjibL5jiXsnkvQh0/Bs7C3LYG5A2ZtcgUIEwsibDQmoMwV0j6DkblzOyJLdPprorU189rYHgUTXkNV1DztWgW9roWm2n9ygTxWBEoaEybAgzgSJn/8elOujDIsVqxQrHF+03WS2zD047jiU1/CZOlBgNeZAwOAqqC5+ID5r/QziKtmAwEl7g3X/UPXFaMdrjPUfL4tcckThBFOqXGjoNIUwD3aoGvoaUqXImqfY4hAid+dUNoClybJAHUBrufrs1VSenOPxmCesM4Sq4zQhI0UMiliE9xXfOwa9P7iEGahQMqHuc6AIj2MXOx7R2XxTVhUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tD31vjD3yDlkK49Duz24XBUFgdS/emd7Q9rKctTBT4I=;
 b=NOCJ3zvlP8kSlbtg3RNMbNUqHEopsu2Zk2AmAqLPlbOe0mzxpxRKWKlVtsO36aEdBqK0LeYKerSdM5MvshT0MLsCxhblunHgJ/WPs9wJi+p9Akd0agOzNsTWu98DdQBzQOQZMQbWDq895g+O+rGJFe7pN73efytAo9G5tt7EU0Pcdo2lNLlARTJRMM3Tm8EhAc1X7aWQTx3dVqfA+jMjcu3gJXn0RYwrfK2DLsk7YbH2SQ+7klqf4OnsowcCMrVMD6BuLVs4rp11efu+6U2HomWThtvJ/eUzvdp5ibT67lNKNZ4ei2X6YOnmzgcq7K8cSA2GghAgdkZnbp2bWa78mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tD31vjD3yDlkK49Duz24XBUFgdS/emd7Q9rKctTBT4I=;
 b=kbesGSy/6RSvSRRzD8MkfNQPIDTGLbhEn1HJ4WE6AuBeEvuYq+9KjHRVNj/wXaCW4Lfof/2FnUUnq8mUvBvW2dJiCzRf85ZV6wgbB6zOxck/s2rbdtVzoSx77VB7K7E6uifKHmuTurq6e+OsSM8AYr/x0Fups2tRTpclFOrhpU4=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY1PR01MB1769.jpnprd01.prod.outlook.com (2603:1096:403:1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Wed, 26 May
 2021 04:00:09 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531%6]) with mapi id 15.20.4173.020; Wed, 26 May 2021
 04:00:09 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] syscalls/statx04: use stx_attributes_mask before
 test
Thread-Index: AQHXUWh9k5TE3JSfn0mFCO1roAjLIKr0PjEAgADmZAA=
Date: Wed, 26 May 2021 04:00:09 +0000
Message-ID: <60ADC7EC.5080706@fujitsu.com>
References: <20190911124714.GA21670@rei.lan>
 <1571975625-6322-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2dxhzBk+fbR8YnxAKqQSYhsb=HW2B2rov18yOjk9a+5Uw@mail.gmail.com>
 <YK0GqLg9AUrOxPdx@yuki>
In-Reply-To: <YK0GqLg9AUrOxPdx@yuki>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06b0a843-8840-422d-825d-08d91ffac164
x-ms-traffictypediagnostic: TY1PR01MB1769:
x-microsoft-antispam-prvs: <TY1PR01MB17693B5BD73A0EFC2847FBCBFD249@TY1PR01MB1769.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aUOtrbDiKGXtxrvkbwSbCnXvvz6/iAIj7PvQZdK+co3GcyabbzVkYeK6mNvOtqCIYUbl094sc4AifmWd3vMF+O1ky5oSIoLjbNiocXDuD/V8RSE2n8pcD4nFKgA3cQIEg/4/fxVdXVv3tKRJC5yR4T/ZaJwH0rxurc66/NNssPPpYN5Q8KDOWw6CZQr1375MHkC8dWvJIAbxkDN4f3DGlfNC83c3YCk1kNhuPx33XBFSgY8l/K2aMuqFv/77IBJMbpute2+LZkgYSRgg+809Ys2qQHXcb9+nTed8vIqOXkzUcnGKZExXDM7wMAiaGk65GhRy/Y01WoBuzCQQbJ6L+OusqggZQIO9tu6sx3+bW8E5O/3Zzl4l2KjR6jBQna8wOhwQI3lNnHu01f+eeEYfSM2MfnVKw+toSPoyywT/554J2EJMo77q7sK2rAS/91HqOO9d3D56fjRSn/17eTnQysUivQA43sVZb66Ew496dZ3T+1oQF7VlZOwIkVAFadMknkjPzwIbRZ1MRaTxCcTVjk8mSqlMBvc6XElZGEA8MenI4EPfUG4TXpBLswDYvcc3YK4ZtUsQ6Q7o0abcKVSgVTCIT5QOwmjBblCYj2LXeM59pegOXRabR8V7RiYe5+Ij0eK2tVFTrEocFVQIaGaVlcDJmfU8evAgZYy6Hpq/UpgWaFhTC7vuEaDmHFt2mTfK0JayBYe+/R67wtRO1pgkDQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(4326008)(6506007)(87266011)(316002)(38100700002)(2616005)(54906003)(122000001)(186003)(5660300002)(8936002)(8676002)(966005)(86362001)(83380400001)(478600001)(66946007)(36756003)(76116006)(71200400001)(26005)(33656002)(66446008)(6486002)(66556008)(6512007)(2906002)(85182001)(91956017)(66476007)(64756008)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?TGJnZ1h2dUsweEh0TDVYZ2w2N0JPVlpqRkRhNHVYeFpzWHYybEVnRkpJQnQr?=
 =?gb2312?B?eVNUbXM1N1psd1dEK29KMEZDVmNvRjMxa21qRGttMzRRM2tqb3RRWmpoZVNr?=
 =?gb2312?B?a2hZMVFKYzNPOGNCS2JQaklKTi95WnlnZnViMjB3SHdzNDJieStOL3Y4Tngx?=
 =?gb2312?B?QW1KREFFdDUyNUFEc3RmUkkxb1plYWdjUmw0VWtTQzhDM0JGNDFCbE5SU2F5?=
 =?gb2312?B?VWhHemxXcTdGOTdtY0FZVm8ydncrODJ1TzRRM2hKRitIc3JVb29STUlyNjgr?=
 =?gb2312?B?NTBZLzNkQUJUb2lnTWdhRjJveUw5SjRFazRFM3ltRGRWSVZOazM5WVdzSDR4?=
 =?gb2312?B?eGx2TEUxMVljZzlBTnJBQ0dZZkZWM3U0MkNkVHJTRjluUHhtSlByUHMwaUhN?=
 =?gb2312?B?ZzU3cm5ndzFKVSt0QXljNlhsZGlIQStUKzFYOE5EZVF2TUR2cjdiWG9Kb3ZP?=
 =?gb2312?B?eTM4WkY1ZTR2YkNrVGwreHcxbGhxcjV4R3B6UlJVRmtrRmx1bXdodU10RFcv?=
 =?gb2312?B?QWNmWjNWZU1IUHVHZ0FxQ0ZJY05PTUFoMnEzR3AzR016SGc2M1FnL1FNcGNn?=
 =?gb2312?B?UEEyZDkxWFgvcDdUaCtKb1NQS2dMRmhxY0NTL1hQZWRlOGl0a3RWWXlubUVC?=
 =?gb2312?B?Y085aEloQ1BLUHJWOG1HcjEzSGkyWjFWbTRBR0pGT3k2OHRId2NnTkU4UXBE?=
 =?gb2312?B?UElPWDRYa0pkTytOZEpXZFdURy92MUVMTFdlTXFyM3VwUnptSmRITXlkbHpS?=
 =?gb2312?B?aSttY0QrR1VpMmRSTXlybkJZaTI1bnRKOEsyalplYUdSMElBOEhWNk1iRlcz?=
 =?gb2312?B?aks5dTFOc3lSM3p3aHZFdThkeTcxOTN5VkxkNU5IeUo3YmNWMGhWK2c3eTVM?=
 =?gb2312?B?RVRncGNmUDlxZEFFdXpXRUxKb3JIWWNSZzQrK2ZHa1ptZUJKRU15VFBXaUZz?=
 =?gb2312?B?UGxxcFF5YTRRaUNSTHdQRGNrNTlnMGU2TzNzWGVTQjZnTlNpUmlMOW16b2JD?=
 =?gb2312?B?RmdpV1pDbmErZllZSEFkVGluTkNEdFVTbGM5bFZIZTBJV2VVcWl1azM5dEJi?=
 =?gb2312?B?WUY2Sm5GNytDYlF4OXJUSytpMytJYzIzZ3VPMkg3dUFaRnlrSUF0TFNXUUEy?=
 =?gb2312?B?SlZjd284U2xNNXdwalBQNm9DV25SRzFxYnEwN1o0amJWeGlwZnRZVS93R2lw?=
 =?gb2312?B?MkN0elNqOXZWNXFueXFkZ1VOV21ONGRRZ3Z3M1JaWnF6WTIzeFZzK1lsWXQy?=
 =?gb2312?B?ZFYySDZQMFg0MHBZZ1lTU2RDN0JLcUtvaEJjSCtweWpneU5QeEgvaHNYSzBs?=
 =?gb2312?B?QlowYmU2T3BrQ3ZaSmNxc3hLdGpzU2FYTWhFWUY5bDV2UnNuakZSQmtpQ1pR?=
 =?gb2312?B?ZFlBVDViM1ZockhJSDQ0dnBwS1dNN2pTcTR3UUtORzhYNlZRZ3E4TThvcWtM?=
 =?gb2312?B?aWVleExPbmU0Zmo4dGF1aExvbmRrRDkzaGRycEN0YmdRRG8rVFBSajFielZR?=
 =?gb2312?B?TnBpZTlzR3J5MW00Y3A5UVJiWUN5WkJ2dHRqQUcvSnQ3K1VCNUxVZGRvYnJC?=
 =?gb2312?B?R2d6REpGVUdYTXE0V3d3bzZFZDhxckFnSWsxckRHdkhONEloeFhjeUlHNVpP?=
 =?gb2312?B?dnhhRzBlQ0VkY20vdTN1dWVRYlV1NDFmV2ZQQlI3VmxIOWxtU2ZINmthL2M4?=
 =?gb2312?B?NGliamFYS2ZCNUcxMFZUU0crTlEzRVVUcXp3VktWcTdkMGtSMFdTVjJFRENG?=
 =?gb2312?Q?2YyVOrRU6hUevJ19pi8F5nkj5Pmv7dr6Hy3Ue+U?=
x-ms-exchange-transport-forked: True
Content-ID: <EDDEEDAAB7F08B4987CB3B193A408EE5@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b0a843-8840-422d-825d-08d91ffac164
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 04:00:09.6201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z748cNIaBcguHYxEwRAuzsJJjwn1G0cSTs4Ach2xYJ0dpSodqMDPlwJt/bq/TQvVmJKe2tBhZa24U2demy68Fb5kzfzMvMlGJuAVBOLlHaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1769
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/statx04: use stx_attributes_mask before
 test
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

Hi Cyril
> Hi!
>>> stx_attributes_mask shows what's supported in stx_attributes.
>>> Set supp_{append,compr,immutable,nodump} attributes only on filesystems
>>> which actually support it.
>>>
>>> Also merge duplicate code.
>>>
>>> ---------------
>>> v2->v3:
>>> 1.add kernel version check for stx_attributes_mask
>>> 2. use test_flag(int) instead of test_flagged and test_unflagged
>>> ---------------
>>>
>>> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
>>> Reviewed-by: Petr Vorel<pvorel@suse.cz>
>>
>> Reviewed-by: Li Wang<liwang@redhat.com>
>>
>> This patch makes sense to me, I'm not sure if any blocker issue for
>> holding the apply process. If _no_ I would help to merge it:).
>
> See:
>
> https://github.com/linux-test-project/ltp/issues/557
>
> Basically this change hides a kernel bug.
I don't think it is a kernel bug and it is only an non-supported feature 
before linux 5.1 when not using ext4 driver for ext2.

> I've proposed to create a
> separate test for kernel that makes sure that all flags that are
> supposed to be enabled are enabled for new enough kernels, then we can
> apply this patch.
But not all fs support all flags, like xfs it doesn't support 
STATX_ATTR_COMPRESSED flag even now.

[1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/xfs/xfs_iops.c#n611
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
