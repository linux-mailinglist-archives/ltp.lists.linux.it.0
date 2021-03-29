Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 083FA34C1F4
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 04:31:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA5DB3C2B75
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 04:31:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2C1263C1A24
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 04:31:38 +0200 (CEST)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com
 [68.232.151.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 519591A001BC
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 04:31:37 +0200 (CEST)
IronPort-SDR: LkFJ9Fm7cI7+fe3w2uk1N+YszFx7CqOBMs3gZIPnRmskdVA3yN4td5CDIB7vQL5Dl79e0+qsJn
 98AtkcFlaLbS4SppW+w2J6rZ9byKR/zpvUwZNK4Bj8YdE6sBQXOMkX8VQId1iFYow/wXaRqBL0
 kLtm9f7E1J5tc/ei4Njn1kLkuu70zuMEsjC0xz5ixgMK7QG5MIN0F0E0RrBOMHB/k7kW50qlUO
 XY08+a7exBx9s767i+LCE8qUEnB2DFtm492hPjEzn1l4klP5JJff9zYlk0gaB6N5fpA2BfnMoP
 hVg=
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="36746919"
X-IronPort-AV: E=Sophos;i="5.81,285,1610377200"; d="scan'208";a="36746919"
Received: from mail-ty1jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 11:31:34 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brSzVhEZ1IA8/WyYUUPfDnlZFUyBOK+tqf2Aem4zpHu6liTvXWYBFJT8s4QtbJIpoF3HwHgN3AJTlv3u01Q+50r2BNYWKR5k8BNAGnDTWH4aOaWfL8xfhPH8v/Zkzrnyteq5DyRtl2hsHt+rBmqyPLxbdYQgAyVYd1AU7/KLxzbsf5DUDaOJ+0228PJT4oaruprVRc1Z0E0pGN5OsA5LgH4SQ6zGM5CazWOlOjvmH3eRPspt0YIZFwpoAx2uet7L64ylpUyqYkRsBB4b/8SHK0KaYkCcCVVBx4NHIYWp3HnU+CDOepDqCY7P1yUS0y7e8IFnzEs/HCC46OoS82yxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RxAEwzqjp3I3g/AI6gFJM2+OS8V6upPiu7QHw8EDJo=;
 b=bh6d5L2cHg/M6ofTn/EmMOFzvwaVgRKPIHxxfzkTppEVV2vtsRv8txBS6Lz7w936kBmzlTi/s1EIgVXPzwv48GqTh4lkkn8/MB7u/oC6CQ96cOHoxJbgcmYsgYAuuLFFgg4RgBrOsEZkN20YL6vteW/Oa0lS0bjTNE8NX67qWHZVug0OCCxmy0FpALjCbu9YqcW6oxsHKI9GW1kzPFYilXT9omgS+OskWLxdMcK+JbxdxbJZr5P0NLGHtoWfa64wWMUKICz+Z9ijd+yRGZBL6hF2VKB6DSltiyY7rDhP6mn5ELaICfzkiHlELuYW8yEEGfFncbrmKuRi4SRWIIU3Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RxAEwzqjp3I3g/AI6gFJM2+OS8V6upPiu7QHw8EDJo=;
 b=TaEl3/mUxqG6TGmIX9Wbvnv9dEAusjlSpR44pnJbK8oT7z1l0q9LfazhZyavKPxq3AX+3q4h+tqwU3VEV9r8iEqF63IUBGUVAPjNUAaPzbzVj5dVwqenlrfU+RGuSuJfTc8NtJhliBQkDFqJPQOMDdCZaGikhvqZOJyLxEHp03U=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB3919.jpnprd01.prod.outlook.com (2603:1096:404:bc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Mon, 29 Mar
 2021 02:31:32 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 02:31:32 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: zhaogongyi <zhaogongyi@huawei.com>
Thread-Topic: [LTP] [PATCH] syscalls/shmctl: Using TERRNO to macth errno
Thread-Index: AdckQlvOWhQ18NbSSPuI/PQeH5semwAAUnGA
Date: Mon, 29 Mar 2021 02:31:32 +0000
Message-ID: <60613C0B.4000604@fujitsu.com>
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389DCCF@dggeml531-mbx.china.huawei.com>
In-Reply-To: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389DCCF@dggeml531-mbx.china.huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 454756f5-1af7-4205-0a7a-08d8f25ac3f8
x-ms-traffictypediagnostic: TYAPR01MB3919:
x-microsoft-antispam-prvs: <TYAPR01MB3919BAA69E3CA2F9739FFC32FD7E9@TYAPR01MB3919.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LNYqgnOuzfu5rq71qU3sXl7tYIZGRcLFAm2G/KqUZxTVY6KbtPsr/YeRC/WzgR2P0y0p2RcwMJqWe/wunq4ltbYOIBimNzYXoEJrnNNrXu+AKq+2HfOqDb3RCfonSq3T+iC8JrDu3kVS2SIdK3XUdkEcyC2OIZUzkUYefeJ1iMFkav8vV/exDEeq5B9VICaGzEmP8WiKb9YB6/RKzMc9PXjjrahneR1L4JVIMfarxAuaFEbG38ROpq4oS7YwH/kycStuFzQ9Un0boOugP+DKT2CDOU2Ug7SmmEKgQ34POHhnXqWJee+rJoFjn+8FwJhgTo/qULXoef8Ywyp8577J8udghK92+WNhdsfykMtTl/T14XO3B/u/lDmb2wEaXtPP+jnyQ2/F29/EM4RJcKg9EzfrCjdgXhqEIODlMgqmA15HtvukPNtscYtZEka7cdufXYmdBYkTjFUrFIMa98zoHTx/cvO36dDUuBBcf5yxiJ4U7kG1KeIVMso177b8R7MrDJl5TZAgLWSIBDRu93iosbQbxun9sVbgzNbOeLrZ6USepJBvlga2sNJ57UDHaXlg38YuAxIN+Fq+ND+aVclc9IPiwk17bXnhire5lMNaj6Mx04bnIZrzIm6cafRWVOPPK9PFmQRQmVxEFv6yZfoyl31qyoD72/ZgWpsmNEaE0Yw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(4326008)(6916009)(87266011)(8936002)(26005)(6486002)(54906003)(86362001)(91956017)(76116006)(498600001)(2616005)(33656002)(2906002)(66446008)(66476007)(66556008)(66946007)(36756003)(6512007)(83380400001)(64756008)(6506007)(71200400001)(5660300002)(38100700001)(85182001)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QXE5UmpBcjFuRXd0N1lNdVlDVWxMRjVITzdQY09Fb2NhY0pOdnkxRFFPb2Zk?=
 =?utf-8?B?UkdtU1NnZUZMaWZ6NDdBQmVnV043a05hSEs5T1JJRWJJWm4vc2kya1QxaUkr?=
 =?utf-8?B?S2IwMldGZEFOa0Myajc3TXIzdWtoSTBIaXhlbVNaMFBQWnJPeTF5S1ZpSmFB?=
 =?utf-8?B?VnVKaEpjRnlPWnBDM3BtRjVvMnpJcDJlU3Jvbk5ka0tSV216ZVJGYXdhR0JB?=
 =?utf-8?B?T0JRWUxkUDNYWGJTaEwrU29EaXBSZ0xKdXZ3U2VjM2RsWHJYWXllYXNjY1k5?=
 =?utf-8?B?Y0pvRUQ3SUR6a2NQaWk2dTREYzEralcwQ1MrQ1pkZFNnNVFGZUR0YmlOR1Zs?=
 =?utf-8?B?OEFkcmNaMzRvbktDQ0gvaHQ4eEtxekhsTkJpem5CRnZkMktNaXRYT0VSZWFa?=
 =?utf-8?B?RE5OSXAydGhBM2ZBMkc3TzNzcEZZUXVFUG1PM3Y1bThqaFdyeDl2cmp0WG5I?=
 =?utf-8?B?NFlKL1VLd1RFUnpWeU1zYytRRkl1cnBBTUZZbHZRaU5kOXJFMU9BSVNFdzM3?=
 =?utf-8?B?Ry9mbGZyaDFkYVFuSE0vUXlyWXE3eEVWRmhDbnZxby9OTFU4VVpnYitPQW9Y?=
 =?utf-8?B?NnJTUVFMNzdwZWFJb0N1elAvbEtSREpiMkZ4V2NsRk5OV1hOOUkrdnNUSTd6?=
 =?utf-8?B?UHU3a1ZoVmRtcXBmMFRiaGUzZDVhMkxrRFRBOVNEM29FOVdMRnZmWllWN0dn?=
 =?utf-8?B?WDdmOHk0VVFLSGdLdTRld2NLRFpDZWhpQVdiSlZGR1Z6ZVBFeW9OR09jMjFj?=
 =?utf-8?B?UWpzWm9BeHlJajYza0QrR1I1TFNYV1BFazZPS2x4K2dQOENkcFBYVmJNVGhp?=
 =?utf-8?B?bno5WVJFZ2hNbnZnbjBUcW1lVlZtbllWRkh5cnh6UmxBVDFRcDNxUHNXNFhQ?=
 =?utf-8?B?bDJoemJjdU90enJuTksxOENRVXBlQ1U5UStnaTE3bzNUUWJtRjk3WUROZVBt?=
 =?utf-8?B?UUtTaFFmbFE0S0N1TCtIa3RXTzRJUXF0UXAxSC9GVnlnRjNmeWpJOU8wRGsx?=
 =?utf-8?B?NVgySXo0cjlrTWt3ZHJVc3NGWU1Kc082K1ptY1JnR2VQTm1iVVRzd2J2VWl0?=
 =?utf-8?B?NFZINnJVRW16RTZGYXRlZ3g0ZG4zaXBqVjU0ckk5Sk9ub0VKRmJ5WXFEUW9Z?=
 =?utf-8?B?cVRmRlkycFJzM1NyNDVGMHdnOC9iUS9JNEI3TEQ5UGtkVjBBVlJCNjQwdnpv?=
 =?utf-8?B?ZWhBU01lQkdUbHh3c1dVakNGd0pMM2dIMERmOU5EWkhPTXM2SnREUTFTQ0Jp?=
 =?utf-8?B?b3A2NUxYR2lBL055NmovVCsycDRUOUFmc2RCNTdBN2g4QVdSN1R0Tm5ROFhq?=
 =?utf-8?B?bERxMGUxU3hTTmF5aVJiQ3h1QjdrSDFydUg3NE94ZWdSR2twZnVObG11SThU?=
 =?utf-8?B?UGVUZ1RrZi9XbmdFMXRVakhZejAveUplU0pvUFZ0RDZJbnRaaEI2bVlPWTVx?=
 =?utf-8?B?d3ZVNG9hTy9CaGpubTZjRktKZXV0SlVvSllUT1RHa2J6SHQwVzZCM1JlbnVT?=
 =?utf-8?B?OUZINGdoeUM3MVAwOFlIRmwyTGIzYnBla1V2cEpEOEg1QlJ3Z0IwVHRqTXRW?=
 =?utf-8?B?YVZoQkZxZVAwUHJiaHFST0o2aDhnV1MvUFpqclF3YnpLWXJpN3Q0eE1MRnEy?=
 =?utf-8?B?QXp2RUc1cDgyeWt3bjNhcFVUdDFaRERsT1M1SzFyMWNaNUQ3d09NY1dJR1Zk?=
 =?utf-8?B?dnpmaEpMQmR3dmV3RUpTQUJ6YnNjV0FmVi9mQUZZWDBVdmJQR1BJdGtwU1B5?=
 =?utf-8?Q?LyopcJEVyjEp0Vu5XyfMi/qL3Jmk86CGAvp3rdP?=
x-ms-exchange-transport-forked: True
Content-ID: <07CED2DA77C753428FFF2B3EC3B0466B@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 454756f5-1af7-4205-0a7a-08d8f25ac3f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 02:31:32.0810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +kcPdi/ImIpX1nMLLKk/+TXnsKvgLl9wBRRl8LoGvEkX7U/pM7y78CPI09xDkbRZGiPsAj/Gm9CXcLUryFYPBwFxSX3vSoaedJje6F5pt9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3919
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/shmctl: Using TERRNO to macth errno
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

Hi Gongyi

The SHM_STAT_ANY cmd was introduced since kernel 4.17. I guess we should 
add check for it.
> Hi Li,
>
> Yes, I find the problem in my testing of qemu with kernel version 4.4
> and the config is vexpress_defconfig.
>
> Specifically as follow:
>
> tst_test.c:1294: TINFO: Timeout per run is 0h 05m 00s
>
> shmctl04.c:119: TINFO: Test SHM_STAT_ANY with nobody user
>
> TST_RET: 0 SHM_STAT_ANY: 15
>
> shmctl04.c:134: TFAIL: SHM_INFO haven't returned a valid index: EINVAL (22)
>
> shmctl04.c:150: TFAIL: Counted used = 0, used_ids = 1
>
> shmctl04.c:85: TPASS: used_ids = 1
>
> shmctl04.c:92: TPASS: shm_rss = 0
>
> shmctl04.c:99: TPASS: shm_swp = 0
>
> shmctl04.c:106: TPASS: shm_tot = 1
>
> shmctl04.c:119: TINFO: Test SHM_STAT_ANY with root user
>
> TST_RET: 0 SHM_STAT_ANY: 15
>
> shmctl04.c:134: TFAIL: SHM_INFO haven't returned a valid index: EINVAL (22)
>
> shmctl04.c:150: TFAIL: Counted used = 0, used_ids = 1
>
> shmctl04.c:85: TPASS: used_ids = 1
>
> shmctl04.c:92: TPASS: shm_rss = 0
>
> shmctl04.c:99: TPASS: shm_swp = 0
>
> shmctl04.c:106: TPASS: shm_tot = 1
>
> Summary:
>
> passed   8
>
> failed   4
>
> broken   0
>
> skipped  0
>
> warnings 0
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
