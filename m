Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1368239144F
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 12:02:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1D4A3C7779
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 12:02:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C87DE3C2AE3
 for <ltp@lists.linux.it>; Wed, 26 May 2021 12:02:40 +0200 (CEST)
Received: from esa15.fujitsucc.c3s2.iphmx.com (esa15.fujitsucc.c3s2.iphmx.com
 [68.232.156.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A5CBC10006AE
 for <ltp@lists.linux.it>; Wed, 26 May 2021 12:02:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1622023360; x=1653559360;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=32Ib8mEjtJgYoRc1fgQaqwyUvXT4tQlY3oX3VsmaZ/s=;
 b=XZriJnpie7UP42FogGVgsKEpTEqzxJjao6JYCthtU1CKgznChr57WiwO
 9y1lqS5g5p6+No5Gqt71fVyCazBvwo9xRd5M4ekOazMVo3ut/HiuRBLps
 +Pb0iNvaMIy7EQDBujzcx5UwVJvBXO8lwjUOQ4xtBPz2UyvLB8I0oMtZv
 CJg1D0n/h4Zs4Aa8B3bzqOdrBFjypyuPJtkoxLnIm5SQ+9cKVaBMPobL6
 mWp94bwaQvLZW09JR2I1Wxp3r7ucDHNIftvF/zNrM9KJnWZqDGw5XeImr
 WeF9+SdZApP6BXH4/37YeIFG4+IdjJ7bq8WRZvDr59xgEZW3TaM4AjoUs g==;
IronPort-SDR: 7BA4CLM1y6FiMbbBjnC7UuE1Ix/FMHteEoKCwmuEn5QIdt7a/k5+slWr9Vr0f8hvVjkWWesCAN
 eS+23j3yS+VOcW+Z9ly9wUfdWdgtRL1v8xPEJBkzFAGTGN7DnYxpEXgl5pQ+fb2b36mfDoFyjS
 aTFsl82nFH/p/vK2KS25IDGNdYllrOiGUuTBpBYkt659lqgx3CFYIJ4LvwsK247ff91xP6CBzC
 L2ZdpJfE/sZYekzJ02hkJu4W5iduV4AoA2gOSgal97UxYDP6Mv8mPmZTEXGenlL/T2eE9K79vN
 aOo=
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="31867702"
X-IronPort-AV: E=Sophos;i="5.82,331,1613401200"; d="scan'208";a="31867702"
Received: from mail-ty1jpn01lp2054.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.54])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 19:02:38 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rn7s7OAC4oI9DHIJVRR2s64ZauQaxQoI8OBQLZKz3ZRsiR5W3CfnPhJfxS1cwJzHd9AZPAFX2yulaOQkmdp4FJ1QlIeCcnLMpu+J6qoVIVrnMbnu7aHZxFpiHb3zfj5hVsSoAxKOM0lyoai2qpcsCTVN105yI62Fh2+zgunnuINdoRTnfMIWfQIHtwnmmCgfIjBG8Sa+hDFIlNfdbyL+eo2C+G9/3GRICgNrVvjSsCL9WTFoyaMXIxpQ7sz1MNBjrdNG57c8SD9aNzVSaJIMAgDsoODzvj5OBOgyoiS3ENQ1t9Wprl9nwQDeG+99QjOSIzXgsihPvqpah+AzRWEl9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32Ib8mEjtJgYoRc1fgQaqwyUvXT4tQlY3oX3VsmaZ/s=;
 b=gTAoi0odXGgf3sdca/DLtjCHDkKVLngSkUdq+nUZnwh4nr3e5ycLs2bhTG5Vsc/kmKOAv34lGGWr9wKxQHeFaey0ri0of98PKxMcyU1AK5onpdrpDGC8RVh7d2CLR87vyJcsGbJd57OSo3uavV89lKs6NRDNu4HxbrRMjZtPcar7LnSxqUpLPOqy7S+HDzsGNgPtzzk0mPoshjRrdsgtTTWl80VFzNicm316Bgq14CVKdAzb79pJRzwXhopxP62Ijk9iaydb0DdLc2oQHDWzWg3tou1Pmwm4/6RkbHbciSB/OPbwGPP48qONMk0mAjAJLyPo0mgPXdmifeS6Xmjzgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32Ib8mEjtJgYoRc1fgQaqwyUvXT4tQlY3oX3VsmaZ/s=;
 b=YYKU1KDjjNv7Ry8ZSyQvIG/ab/h5j6EtkNrdH8JFqjnvy0Mj9rb7krtCdY4TUEOIynNpL8MSQu0CprjqdNLQ8JbkzcC+LPi3B6UN8eEdClJ5V3p4aq8DadNQeC0/d8b2dzaE/MIrezArQsnbpGn9iUDq1I7B2LFUMp1zbiuIyqo=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYCPR01MB6318.jpnprd01.prod.outlook.com (2603:1096:400:7a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 26 May
 2021 10:02:35 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531%6]) with mapi id 15.20.4173.020; Wed, 26 May 2021
 10:02:35 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Li Wang <liwang@redhat.com>
Thread-Topic: [LTP] [PATCH] syscalls/statx04: use stx_attributes_mask before
 test
Thread-Index: AQHXUWh9k5TE3JSfn0mFCO1roAjLIKr0PjEAgADmZACAAEuDAIAAGcuA
Date: Wed, 26 May 2021 10:02:35 +0000
Message-ID: <60AE1CE7.3030002@fujitsu.com>
References: <20190911124714.GA21670@rei.lan>
 <1571975625-6322-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2dxhzBk+fbR8YnxAKqQSYhsb=HW2B2rov18yOjk9a+5Uw@mail.gmail.com>
 <YK0GqLg9AUrOxPdx@yuki> <60ADC7EC.5080706@fujitsu.com>
 <CAEemH2eSmf+7kGcq3rZS4_RPZ7W58hSyLqdx=zrzJUsEMQf8og@mail.gmail.com>
In-Reply-To: <CAEemH2eSmf+7kGcq3rZS4_RPZ7W58hSyLqdx=zrzJUsEMQf8og@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f7deeb0-a2c6-4fb4-2ec3-08d9202d62e2
x-ms-traffictypediagnostic: TYCPR01MB6318:
x-microsoft-antispam-prvs: <TYCPR01MB631824AC1B59A5E7748FB799FD249@TYCPR01MB6318.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sbshAhdBom/TxWYH/RhYF45CYKDVFBH0pTl2KOhzX6dsIU7/gC+pOB2Jflmn1QnwX/ckG9B3HdJ9VyQo3q2J7H/Q2DSZ0/I8w7M34nsq4vvIy2mXTm0hwQtJTimounnpdWjPuYBmpQ4D44u9BiGcR966ZRHot7l6QYEh6JTidVo7FXx+u5jPFQ8lwtQJ22jHiaYcpzmUldjlpz71jgf477uC3DvaKmWEGdJybnX6vAr/68v6e5PMABE22u6r/fyGeX3FDHFCu8sLaCYhW+2wFcGO2DnKr6x8LkifPXzfdk4cS5ww2zei0kZdBalOyU3al4k7NC5KgrbtESWM7c91eo3GXrkBFzNU7xH+FXAIGdjmzqD0OkTkk6N6sS88oh2YxJGll0JkMj4kjQxsNmSR6rcyJu+vfA6M/rA+PenXRSbEiymjzzGr8EVk14PVNvbnQUMbciVj82miIkAV5cFMN2UPLmx3aeqsjiZwzCKFxeVtIPrtBghCJAk/Soxg/uyNklv9MNtejUot2PdDloG/AzAGst1WAYfWDPW0QmssNWXRXYSx0LqzV8S86iCEd2jlBWEPe0ZUY3HLT0J4gB1cY1LpM0jbxCyNvdRnmphtc0SPAUlXzkzsGZFM8ZYF1ccvKWL8L2vxbfegc2LR4O7ZJoHWlFHA6XXTT54KphHYztwVxziwxtmcUScwoghSwEmkrQl8CmnGDsCINSbl7n7a01L1BdtUKPW1lzIy+ij4qys=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(83380400001)(87266011)(122000001)(6512007)(91956017)(76116006)(36756003)(6506007)(4326008)(38100700002)(66446008)(85182001)(66476007)(8676002)(33656002)(2906002)(8936002)(186003)(6916009)(86362001)(2616005)(316002)(64756008)(6486002)(71200400001)(66556008)(5660300002)(26005)(54906003)(966005)(478600001)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Zlh2cE9XVm1saEtScGVNZXNwL1RoMTlXUmlDSGw4K3drMGZwTjlDWms4YTdp?=
 =?utf-8?B?WmxwOG1JVGFQZWRBS1dCTkdXV2phYnppYWgreDlSbGxOK281Tk9TL0p0QVdQ?=
 =?utf-8?B?SXhCNlBSOElnbFpwOFUrcEd3aE5nS0VHdkdoUXNKYTU1Zk41bW1DOElFUEE3?=
 =?utf-8?B?bkpaaG82UUlCMVE2YUk1alhXT2ZOZGJOc1FrRURPT3NVbU5sVWVhL2dWVDhD?=
 =?utf-8?B?MVJ0THgrU1ZPWUtySWtVWm16STdRYm1HcnFnU0lXcGZ3dE5pSWRRV0NCSW1X?=
 =?utf-8?B?QS9wazVMV3djTEsyak51S2UzS1FkV0ZJLzBJQkVBVCtmUks1c1FZMkJDK25p?=
 =?utf-8?B?OUw5Zm5KV1JKalJvN1g3QXJtWGljQ1BYWHFuUFl1MitCcEt2eUxkTmI4K2Fv?=
 =?utf-8?B?VXErRWJCYlVrdmRLVEVEeVZVdUdEZDdCd2V5Q0owZThuWWNiUGszeHdSb3Ux?=
 =?utf-8?B?c3FFZTdSNUsyZWlkVXFuQmkzcE1Wdmdqa29zS2RDRU1ETDExSU9Sb3Vqb2Zw?=
 =?utf-8?B?SEYvR1VOODg2UlMxdzR0bzYxRUZyQUtQVVZXMTgrVDdab0gxYnNtbkpUQUxs?=
 =?utf-8?B?eXgvM1hhc0l3STFxNktpcGNDbHBKeVZFNGE5RnBJQ1JTd2hPQlN5S2I4NTBJ?=
 =?utf-8?B?eXl6aDVUMUJhTnBRc1NNWEhnSnY1c0ZRbDBsR3BOME1vdG1QM0tUZFRtMmQw?=
 =?utf-8?B?NzRLWTI4SXk3b2RnYzNQbjdKV2NOUmZTUVRiVnVERGU5UmJRZUc4OHlTcHFl?=
 =?utf-8?B?NjBiOG4rTHJ5R0lTVmxSVDd2VUZNSmE4cVN0SzZCanl5N1c5MGRvR2FOVW5P?=
 =?utf-8?B?VHhObXN2Szg5UndtaFRQZ29YQVpjbElicDJTaXNYRUhFL3Q0bnBQSkV6NFBx?=
 =?utf-8?B?V2NGT3dpREVoYWN3Vm44ZVQ1RjRRWHZ0T1dwY0x0TWg1R2ExalM0MHI0TWY5?=
 =?utf-8?B?cncyVWJCTkVRSkEyakhPbjJKZFZlOWNlSy9qZHZ3Zk9DM3llcndDcVB6UkU3?=
 =?utf-8?B?bzVOSVNZQVluL0dOV3hEQU01UnUrZDI3RTEvVlZ2TmcvQUVUdUhSWURBaEhC?=
 =?utf-8?B?YU1hUmp0L0dhcEdqNVB5WHRrajhzZ0J1ZW11amJNSkR1WG5xWjJWWUJDRzdB?=
 =?utf-8?B?Y3VHNEM5NlllZnluQkxXVjk4TGdoNHVETHIyaTFjaldMMDI5RThvYVF5M0tu?=
 =?utf-8?B?Z09RdE9iY25uZXBqSjFMMlk5VUM3cXZEUkR3dnpTeXcxano0SnB0WThwR1lK?=
 =?utf-8?B?STdoNFUxeTRyZXJHUDQ4T3RQR3FXL1o5UFdRSkRyRzFrK2k2aU9hK1dIZlhw?=
 =?utf-8?B?SWZYTXF2UzlBanExaDlNZk1MNkJCNS8rWTUyLzdWNktkdzcyamoyMG91VEVI?=
 =?utf-8?B?MDFlOVJxSWMrRHFBeG1iN3AyWnZnS043aVVnQVhwOWlmN2pTSm1vdWlncEFK?=
 =?utf-8?B?ZjBPcTlEQU4yVVo5clh6WmxSN2xiT3o1QnZUajdNOXBTSFlVVlBRRU5yWnJv?=
 =?utf-8?B?Nm9ENnk4cEdrQlZiYkZlRnBHTmZKcmdPQW1sdDN0REZ2OXpvY0xUbTVobnh4?=
 =?utf-8?B?ZlEyOEVxSWFkM1VIVGVpYXJEazFjZ2FsNUZ5RHlDNFBaT2hLUlo1S1BnZ0RY?=
 =?utf-8?B?QXBoQTU3WlJDZm1OZUwvenBXb1JDeXdzNTIzdksvaERTakJDWGhlaWJEaTNn?=
 =?utf-8?B?bzJEbkN0eEliRVlqdVd2K2hYelhYVXhkTTFHUUo1c210MzRWT1ZGSk5uL1p3?=
 =?utf-8?B?bTN3RnJkRVg1RjQ0aTFITkRHMjhLYTNqbHY3dVFLbDViZDB5b2FOcGVqbEhX?=
 =?utf-8?B?UHdrOUNEY1RHZUdsdWFFUT09?=
x-ms-exchange-transport-forked: True
Content-ID: <C0D83EB37B37C043B60FC8E5355376B3@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7deeb0-a2c6-4fb4-2ec3-08d9202d62e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 10:02:35.3327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C7PciEqafouLItfTV7H4c+cugPN0DDCzf6ptOe4EUuO0dtBNxE3iKXzw8Y8YGBfV0Ombv+baQWDE12pEWW7wt/6Ssb4/OF7rLFUDloAePp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6318
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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

Hi Li
> Hi all,
>
>  > >> This patch makes sense to me, I'm not sure if any blocker issue for
>  > >> holding the apply process. If _no_ I would help to merge it:).
>  > >
>  > > See:
>  > >
>  > > https://github.com/linux-test-project/ltp/issues/557
>  > >
>  > > Basically this change hides a kernel bug.
>  > I don't think it is a kernel bug and it is only an non-supported feature
>  > before linux 5.1 when not using ext4 driver for ext2.
>
> Cyril hopes to have a reproducer to cover the bug [1](though
> you think it a non-support problem), but that is responsible
> advicefor FileSystem:).
Yes, xfstest is more situable to do this.
> Actually, the worth to say, there already a separate test
> (xfstest/generic/424) for reproducing this problem[2].
Yes, this fix is found by xfstest/generic/424.
> See: https://github.com/kdave/xfstests/blob/master/tests/generic/424
Usually I see xfstests case on offical repo repository
https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> I believe FS QE/Dev will run it for all filesystems regularly.
I think Theodore Ts'o may do it on xfstests-bld[1] and other 
project(like lkp) may also do it by using really ext2 driver. So having 
generic/424 is enough to find this kernel bug.

[1]https://git.kernel.org/pub/scm/fs/ext2/xfstests-bld.git/tree/kernel-configs/x86_64-config-5.10#n114
>
> So maybe we can safely apply this patch in LTP without
> adding a duplicated test?
+1. With this patch, we can also run this case on xfs filesystem.
>
> [1] https://bugs.linaro.org/show_bug.cgi?id=4012
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=93bc420ed41df63
>
> --
> Regards,
> Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
