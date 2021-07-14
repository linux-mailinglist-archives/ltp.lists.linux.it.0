Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC323C8299
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 12:17:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80BE23C7525
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 12:17:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B576B3C2E33
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 12:17:13 +0200 (CEST)
Received: from esa8.fujitsucc.c3s2.iphmx.com (esa8.fujitsucc.c3s2.iphmx.com
 [68.232.159.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B0496600C2F
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 12:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1626257833; x=1657793833;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Rjh7BAZv5VJEhRzJbnc5bJC7o790bVSlwh5AynhEcq8=;
 b=UlHuvK6dnWYZlLe+eMELxCpV9r142oONu2lGjoEOfGUKb2eHLBlGjZEk
 NrZb2RievPiZUt1bqjnKLCN/eyeQMYr+MUHI2zDbpVaYdfGhz5HCsHAAQ
 EECkc2hz6faYUfiQff6J+Qx9veMTGwp2R2JBHGVGonvhFhAvF7jLB4i2T
 qJdymwZrP9kfiJc7WbDHaYvfvOEAfmdrGtjWMugKVxA35OMoqaEQagxzw
 +GQMDvl48Vak/63FkvqJuxLGHL9enuJfovEv8WT8T2oGscERqN7B/asQ0
 y3xqJrjt2UTG26Rvg2YAuzQuFM4IST/l/2mm4kTkjv9pLcEvnPUrvdJnR g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="34912598"
X-IronPort-AV: E=Sophos;i="5.84,238,1620658800"; d="scan'208";a="34912598"
Received: from mail-hk2apc01lp2054.outbound.protection.outlook.com (HELO
 APC01-HK2-obe.outbound.protection.outlook.com) ([104.47.124.54])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 19:17:08 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ko/Gk9aa8BC8u3oCZIN7m6ztpTQBDkKlFaIT0P8G9KLOiQzmlmSg/Auq0CjQgdZnC5GCt9rWq8ss0Fo3Pjrg/yA1IA6a5TWW7vYelG8Gp/48xYzli7ppefxge5a2XNHLT+e0W4VsZK8/Sdb9xn1aszaKmLWERFRhkbc4ZVgeq/eo4t/uMt8vvNMnae5XMPje8YlUfM5iMvr8ZXOzIuHCOq1rQohObc7a5kuKOkFchIp5Rb5tNBv3rDOaDyKBpt7Wpad3lxhPL9HbvopsDKteRLnhjPlBdDLvCu1QVTb/oNPfemGF1UeYrsUgxaE6PMqhvXgiohu7WVwVK472eX9vCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rjh7BAZv5VJEhRzJbnc5bJC7o790bVSlwh5AynhEcq8=;
 b=HH4rW9uBWDP+Q8H6SaLTKMiLsxcHXWxE4hoYkPXyoiG1J5pxC20Lo3e2OGCUA5NU6LjSNHKBj20BUIM0AvxOhpQZ+2L7tT9OVUFkEyFBlsObq7JuBR/mTT/VikMpgujT3N3Nlgso01Gjk5TmfYLsVfedYPfAISNMjf9Hv6n+teR04AGMfEceJvOmpjolJgfai6jlhiYKOa6LWcbVsQiWgu51vWlZvmZynDvr7rkW4buOPmu8OanEEcNCo7oWCc8CkHPjhdfWZc1DtiGJF0k19zMWsipagx1cN15vW/NPrMuHCcFuba0pu+JQ3/HhKurNpVEHYAGU0w+nHDTTvoFUzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rjh7BAZv5VJEhRzJbnc5bJC7o790bVSlwh5AynhEcq8=;
 b=KnvUSXQXM1Ybr8/UmdtUWUTZORTxtnZ7H7E5Iobg+4zI525IgKN6G2NVo/4MEkejRcMaIIGr69NASk7F7zr6uwCu8FdYTV4SO+mfFEf57/YeB2oJ6gZMTDRYGoPTqTQeUnWAcgpx61AnIrH89KtsFa833ZCHNcTOQOT1cyBNp3c=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB3275.jpnprd01.prod.outlook.com (2603:1096:404:7c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 10:17:04 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4331.021; Wed, 14 Jul 2021
 10:17:04 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
Thread-Index: AQHXclX8FtNVc6CAyUCt+wJTvZ4uTKs15fuAgAAPCoCAAAnXAIAAupwAgAAJiQCAAimsAIAAENaAgAWqKYCAAFfYgIAAD04AgAABZYCAAzGyAIAAB4WAgAAE5oA=
Date: Wed, 14 Jul 2021 10:17:04 +0000
Message-ID: <60EEB9CF.7040001@fujitsu.com>
References: <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
 <CAEemH2fcubrbMpeoeSJJoZtD+xaiRrs_upG_+KQXB_8C9m3eQg@mail.gmail.com>
 <60E50AB4.7050404@fujitsu.com> <YObbKCNKUoC7lSxd@pevik>
 <YObpRzTjx8T2GAZn@yuki> <60EBA9C3.4050103@fujitsu.com>
 <c81eee80-6cea-de14-aeff-8919495c4396@bell-sw.com> <YOwASqNKNXBl4lqe@pevik>
 <0b622e21-453c-5dc2-214e-c9c0a5d48f44@bell-sw.com> <YO6vZDRj4C15sg7K@yuki>
 <YO61swgamAEnoAFj@pevik>
In-Reply-To: <YO61swgamAEnoAFj@pevik>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3912b526-b328-43a6-c5e9-08d946b08755
x-ms-traffictypediagnostic: TY2PR01MB3275:
x-microsoft-antispam-prvs: <TY2PR01MB327551E03F54A909E387EAA1FD139@TY2PR01MB3275.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0sQgHvae6G3izoL811qR0pPR72MqhX8arNpk3JI/zicPKPE3grFzhO5r2n7BEIkccwH4A1PNfKjP3+jVSffT9hnz1Nd9dSnaml5HX0O4KRPTh59Js+l1oqMEzVNKGO6EhMYfNp7o+AbXz92nQBqgEjmBd74OqiO9pjN0mDNcL4qtM1VLcQ3kmeobyehPpq7A/QHjoaFw7LJTeohIF29O797A2kL+kPe3nnRDgf/6Rct88D5kaKGDcsFinHKkYPZbwqsza/fDXI3ZQ3SR6zRuxEACrOQU+9+aM9GFJFuLxlANBGjS+vtW66kOp0bE+DgGk+LG0XGYmV2+n07ZO9uHb2pl7RNenXMGDfri1xoaFkndP2cW6QfO4j+Zh2gJP8MrNpS8fD0y86KGFG9IKOWInUF488dwsN8wcXoLngem66v0OPpNAs2dAWEwqRv2/05IyEHJGazgikw/F/dPqPRNwziS/02MNr4+ui2A+z2KewWuDt2UDNs4npZnuivVuj1W53YyraXbVh7xJWODE0sEwLTK3twbxZCL/4iXYCUA2o6ny/yP9tswgBBZ2vtboWzbm8ZKoFVy9+DIY21NWfIYO6Ew4AXcQqUyStVL83Z2Y06WpZD5xvNVgAaCpFMJ7MCkc7H3sJAQSYesM670qHmjyFdSyuibLYnSVPes6dnnLB6L3IMxQy6IoSIywnoKVrW6XScEntU/bayUSNbmfjlI1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(87266011)(71200400001)(86362001)(36756003)(478600001)(6486002)(5660300002)(4326008)(110136005)(54906003)(2616005)(6512007)(186003)(38100700002)(8936002)(26005)(122000001)(85182001)(76116006)(91956017)(2906002)(6506007)(33656002)(316002)(8676002)(66946007)(64756008)(66556008)(66476007)(66446008)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?dkpybE5TYlpUMldNUTlVMUJDSUk2ckdRMWxLQ01aQ0dkbmhRSlNqYlBJYUpr?=
 =?gb2312?B?dXIxWFFsV0RXRG9zSnE5TmYya0JzN0tjeUFqMVJNcWJqLy9acjhydVJ0MHlv?=
 =?gb2312?B?d3NuNXR1TVFIVG8vMzE1VEZjMkVMUVVMOStwVTdIZmVRMVR1VHVWUE5qaG5i?=
 =?gb2312?B?TXBKOFYzU28wZ1RzdStvNS9XdVpuaTErUDBWdEVIMkZRTWRSSGdtc08wSHBm?=
 =?gb2312?B?YWRRT1V3cXBUWUliNlBiYkZlcVI2ZVIva1R4Y2NFdlo2K1RBWTNnd0VPZmFR?=
 =?gb2312?B?TXV0L3lNU0cvM3FoakkrbmFXaEp5RWc5bGVvOVRUSi9iRWJEYUs1bzNKTzR3?=
 =?gb2312?B?VE9FMmtvelB2aVpGaGxvd0hadUw1OTJxRWJrNVZPekFxYkVUeHluNjhQemti?=
 =?gb2312?B?V2tHNHRWMFlLREt6SmNuZ0ladHU5cGhnNjZGOUpNdnZDWGM0M0NtVi95K3lx?=
 =?gb2312?B?dUhsZjEzQ2N5bkF1NTFSVDJWNGZ0dXM0Y1hGcFV0MTNQRVpsYTJHamdpTGdQ?=
 =?gb2312?B?UWVYYmo2Ym9TSnhBZEw1WUNrSlNYbHU0djFzdGJaOGl0MlRTa0xGd0xURjh0?=
 =?gb2312?B?TkJ4bTFYLytaeGFhNENGR2pCS2dnbjhpQjN5MTZUd3NHS3pSSlJSNVlsdlBB?=
 =?gb2312?B?RzNOcjgxeXY5REUzQUJmajNkbFdua0tSUGpmN0VlWUNtYjFEbHlNRStLbnhJ?=
 =?gb2312?B?T0x5dVpKTlVBVFBEWmVqMEx3bnRFVXp0VVptTUZjS2ZiclhLUVRYYit6REpv?=
 =?gb2312?B?eUl4UmlYVmpRL0hRL1UwWUhjMFBZQWhFd1V2OTN2UFYwNXpxa0ZOREpQdHRV?=
 =?gb2312?B?Z3JZUkkxQi9YSDVvWXJOVyszUFc5SzBiSDdRZG5STzhHUEh2TUFQVnFTTC9k?=
 =?gb2312?B?dHg5NkZkQ3JhcWZSUUZIODRZNWRaRXQ3YzN6b0IwclVGLzZRMmNoYkNGcWZQ?=
 =?gb2312?B?ekZWUUl4b2gxbnJlc2tkNm5YcG9kK3VkQVhjOXpmcWtFYzJ4R09WTlpYQU15?=
 =?gb2312?B?Yk80YnV6bU5CK1I1VytBSDNYZ0lEclRRNHY3OEM1dUhWRmFFQ2pnTGV5NkVL?=
 =?gb2312?B?eExoTkJad2ZOWVk5RzRzMVBzVjlSd3FmemNPOGJHSEkrOUJXWUVkSk9GMlBl?=
 =?gb2312?B?Z1FFVzRYREJrUVVHREk3dWZZZmR3czVjZEx4OFFBdGF4NmRCL0ZWZFEzMnlu?=
 =?gb2312?B?R0dFVmwwdFFVWWJ4cGsyeS9QSW1mN05zMTJZR2RNa3YzRnV6L05OZUwyV3FR?=
 =?gb2312?B?Wm8wdkh1V25hUHNuaHlJayttdmJYSk1rVDVCU3lYLytoQk55MnZHdGpuK2N0?=
 =?gb2312?B?RThpNnhuYzMyYndkWGxUWEdlUEl1MVZHNU5WbExSR0tOa3lDSGM1REZ6S3J6?=
 =?gb2312?B?U2hIdHpHZHJQayt6SU5UN21DeXRzelJnWWtyeXNjeElGTWlZR0t6T2Z4UGNZ?=
 =?gb2312?B?eFkzbGpNOUdZYUlKL2pkZFpWTkxyZUJqQm15YVFyNnptYlFVQW5oaTlZclF4?=
 =?gb2312?B?RGhSM1N5T3l5OGFPcldPc1pIQWtrK1U0NHVEenYxR0pVR1lweDZIWS9QcHcv?=
 =?gb2312?B?RFo2VE5ERGtkaWsvV21NSStqSnhDSTVqTWZCTUx6MDh3VHZuNDZCanRwdGpU?=
 =?gb2312?B?RTB2amVLMmR4Y3JWY2U0UUhHY1Vnc0VMelp0b1NLdDdkWE5xQnBGUTNyMUZJ?=
 =?gb2312?B?YjNUSDdVbkovZ2hrL2xReDVHL05jcVhsTnZIK3k3S0U3amxsSUllNXZya01o?=
 =?gb2312?Q?jiMRfULid4o1aRZM3F20PZhY2Z+rraDQgd+qHHK?=
x-ms-exchange-transport-forked: True
Content-ID: <DF058BD58296D843B0804175E15B8218@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3912b526-b328-43a6-c5e9-08d946b08755
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 10:17:04.7453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HtG7rbPk31GgW5K5CXdRhBWtl+3QwbKnT5uUh00QJfRePeUgaecmLO6/ZUUV2OEdG58rfP4GVZ3PAN2o5cYM6pBUsD/EQ+EvWGAkw2ihE3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3275
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>,
 Huanian Li <huanli@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril, Petr
> Hi,
>
> ...
>> We will need to have some kind of flag that would tell the testrunner
>> that the test is using/modifying SysV IPC anyways as without namespaces
>> these tests cannot run in parallel at all.
>
>> So I would say that we should:
>
>> * Write these tests in a way that they expect that they are the only
>>    process that modifies these resources during the testrun
>
>> * Mark all these tests with .sysv_ipc flag in the tst_test structure
>
>> * Then we can easily add support for running them in a separate
>>    namespace in the test library
>
>> Does that sound reasonable?
> +1

+1

Since now ltp test libary uses fork_testrun, I wonder whether we should 
add clone_testrun. So test's setup/test/cleanup function are all in new 
namespace.

Maybe we should support two ways for running test cases in 
lib/tst_test(fork and clone)?

And we can add clone and flag argument(the value can be 
CLONE_NEWIPC/CLONE_NEWNET/CLONENEWPID or more ) in tst_test struct.

ps: Just a initial idea

Best Regards
Yang Xu


> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
