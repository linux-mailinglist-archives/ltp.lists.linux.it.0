Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 228859D8821
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Nov 2024 15:34:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5DA93DABEA
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Nov 2024 15:34:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 579093DABC5
 for <ltp@lists.linux.it>; Mon, 25 Nov 2024 15:34:18 +0100 (CET)
Authentication-Results: in-4.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com;
 envelope-from=oliver.sang@intel.com; receiver=lists.linux.it)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 53EC3101291F
 for <ltp@lists.linux.it>; Mon, 25 Nov 2024 15:34:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732545256; x=1764081256;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=0PfcMqEE26pyAJv1aw1B4go6mBAZ5WKw4kuAfQ9/ZZM=;
 b=RQVy+Bfezojq3898JiJLUn+GdkaRs7497/QhU0tXAMoRuGnH+UZXw1Hf
 qextbZMOh0RqQGSLdLDXpzr9mdQzOt5sHiy27ZW7Lj/52JePeOQjF10Y4
 XhHaj0oP/5cTFdxhoFpDy/kxGOTQoQFsbkbN5/3ndLk1oro1hMuQxQ5cQ
 ajSQOKig2GF9SDecGbgfqKaAGn0V6KtLhmrZiYMjwVc9s4/9O47ieLp2H
 kecO3gOZ0pKYsXmt4oT7Z0aZAINSZzatuSM2+stmjv1WwGkU1W9QE0m9B
 Q/yK6g3/5f+kKghklu3jlzOTwwepVICOrmtYWa29Klv74Ax/YV1sf5a7y A==;
X-CSE-ConnectionGUID: l9ygN0A4R1qr8fmp+qfO0A==
X-CSE-MsgGUID: KOpRefMHRNq7Sr+QSI1HvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32595336"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="32595336"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 06:34:11 -0800
X-CSE-ConnectionGUID: E6S1BWwxRf+TlMb2P4M9QA==
X-CSE-MsgGUID: KQFGf5n+T7a1Zz5uaBYbEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="90906127"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 06:34:12 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 06:34:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 06:34:11 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 06:34:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n//62M1kiuhaXBbnNm+GT1ZZ1Z76HkLqVyikxpnS7ZK/IfvHPeyRQFa8Qzi1ijlKwKWeriGJYTDQkMEhOAEq1pKeO3PmhYY7Rt2Yrlh0CJrA+x61SYY6wws2KGefAr4l3Kd4wwALIhlCfyonPH/FFqfyUnpgznON0r3MVhOdEh2JnnEmh8IUQVQXN+M/4BapIyxCTOJuPK3Dog8we1PQ7v8nTrNJG/T+M5+aE+Skr2F7OSvNxypO3Y6nOq7T2ZFE0yy90aYOQ2d6fCZq5MujHUkq6ueaooGQsF8r80c8+RnV5k+8T0Oyfo9eL04/ZfMuCx3J6dtThpogV3tbX0qegA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRSdjTmFqAh9xONowZulaTDdP64uSrgwxs2mdF2wZyY=;
 b=ZddRPbDKXVaEwIg15ldxAxv3xCrBAKU8HtM/kvYt8gQyh8rZw1VzJMiOkq8lRR+7uKpVqQ0E7YNTtf35dNFvzVbOL54rpkxVKEMPXqAGYgyATOe5O+uFr+jPpyY0c6ENQzf1udWubrgfW+s944bLyRVpiWYNCE7Z7B1PFkPuUCd9u5J1+4360xlsA/FncpAnktBfCMqdB7TKEYlbgVRMWHbjceZos5bBkXOHYxqx7OaPUJMj2j7Fj7rl/pNUOR47NcvfwgECCbqVuazK33Rzog3d7h/4DWWM6760amkwDGa8EG040cnSUl8mUECFc7zGGXceYy6LJmdtjQKZwQHN5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH0PR11MB5236.namprd11.prod.outlook.com (2603:10b6:610:e3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 14:34:06 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 14:34:06 +0000
Date: Mon, 25 Nov 2024 22:33:53 +0800
From: kernel test robot <oliver.sang@intel.com>
To: "Michael C. Pratt" <mcpratt@pm.me>
Message-ID: <202411252241.2d75c2f6-lkp@intel.com>
Content-Disposition: inline
In-Reply-To: <20241111070152.9781-2-mcpratt@pm.me>
X-ClientProxiedBy: SGXP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::14)
 To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH0PR11MB5236:EE_
X-MS-Office365-Filtering-Correlation-Id: ab90484f-945e-46b7-0e85-08dd0d5e3752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lVBuqjvFBAXlUhP4nD49oa99SKs26P18t/3RkkEuUZnAKkaLonWHHKsCI1dT?=
 =?us-ascii?Q?DCYEncb61FO/FwsH3iehsun5BRNUBX0IjVJvuTFv1356mThTvsYqJpi5YftY?=
 =?us-ascii?Q?5zy9m89CXVMv5cHDifSkZ46+vVQabzn6T3szXatdLDqoc8cqMBnoSH+ePXX7?=
 =?us-ascii?Q?anP+DwMivRW6BwNSQ5mDEuzTuTUGRhtpH3c9uuHk83xASt/fcbYVmEIAiov4?=
 =?us-ascii?Q?00jqXfBAZ8D+FKlC9caEdbzM+xGMZFKN+vdg4jZn59BjmSSO/UfEkF2XTytw?=
 =?us-ascii?Q?xuVei3IPEn9NpZL3Xa+6ZGxv0O4V04gd0svmVUWn9gX2l/Avy9EQckeUCFPG?=
 =?us-ascii?Q?owFQOqlgvA+L0UKAfZZTr/66X6JNkGo8lDlTcC5hlhTaPCU7Jj0AYuDSfb/n?=
 =?us-ascii?Q?uTqPnv3YudueVL3qb6hSTFFeGu6XNNezBo5VzWUEOC5pevU2pMdDbvXSKdtx?=
 =?us-ascii?Q?LuBC8+KOEKsvwjvAXxQdJs+3+0mU/4gYP9gZUL+dxyGiHLTRnoFLVkeTsX69?=
 =?us-ascii?Q?X2E/7hMk2Pro+YEQ7HmvndvuN3mM0mVtFV0adksjj/q1A2ZFpeJMfINxBcrR?=
 =?us-ascii?Q?QCA3oO9Z11XWqVOFNP2CJMC5wK9N47W9woCiXmOBYJ+bAaJ9pQCqQ7s7YhQc?=
 =?us-ascii?Q?9JrqazbWlHyW8z33a0ID9kHVFHYwTMiI+1N4is+AOzzPn9vkLg2Vzr3HxB16?=
 =?us-ascii?Q?cna4d42NXbYQODMqt5zmKouCOiOcjatDuOUdpFYtt8keW1nhau+NrJCkz7xt?=
 =?us-ascii?Q?gtKp6fSQl3p9Gdb49maC4KJ0skCfZlC4i21Nb0OeUtfd7evQRjnrmUmWxYxW?=
 =?us-ascii?Q?1AnKR+Kv3xht9KQOodg7F7nALswe22IIOpqd4AZ7berq66KITMYh3yW+m6Xz?=
 =?us-ascii?Q?1SvZPPBRHd58WsL7U4Jqxre9q/3XGuuMygO3ynBVaOWqJcoTefxaEjrY0iH2?=
 =?us-ascii?Q?w/g9BbC/aVLbOdAOy/7yebTvpnJywAl+wJVzNurGkP4V/ZoM8zjFmiVgOwDY?=
 =?us-ascii?Q?JeEMRa3Wq0a/m4NoHiuyhVPoyHo6oFmfJnoWAabS0dxBnq5oVHFqeGXElynx?=
 =?us-ascii?Q?CEmuL6T7KPJVTVqA6ut2q2BFhe3QQjtd1lQsDQTYwHMKHw2SiTnSj3UK6TEb?=
 =?us-ascii?Q?rKwLCi/bq0nKGFUUPtoGe6we3LFY9twQ892JmGq0f0Yd3hHNSwH895vvcaOd?=
 =?us-ascii?Q?aXSrrR91K++//gteA6/YiyBQrXkS/Uo9+e0ywbqe9k5dr25ukSfjxDs8LwUi?=
 =?us-ascii?Q?IJX8CrLHDulGb+MN0qHioaar2C6MmtZl+pK6Y8KKyR+cHZJI5V/gZ12U2MLR?=
 =?us-ascii?Q?QYg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EOjDLu6hNYwr6n1AxSzCYbnLrsefZmmLa7PdvRnicinecVIbGOtUxOpIsgPp?=
 =?us-ascii?Q?iwrqUxApsOu4qz9sR0ogX23O7Le442suyxPJeOmcW+uJR0hI+6OWv6jNNPS8?=
 =?us-ascii?Q?B5uchDSQXqSxZ5gAfZLYX7OriLmNhjJ5IjpygdayRQQL6Y8GZRIkYAuxC5me?=
 =?us-ascii?Q?m+ETvCBoPJNZS23CS1gAEdl+ZkbWixbJsKDIMruMUA/GhGeScV3hstcP7Qi4?=
 =?us-ascii?Q?MRYcrqtDPs0Zd0OkaOGmPeZ1QVkIODdFuErvpcAe1/Ix4PBsU+6HSvNofndf?=
 =?us-ascii?Q?D60EQ9NCGZBeQYuL98Q8srA44XJPz//DsPnZSzE9AuX+cyxaah8owtngwGwN?=
 =?us-ascii?Q?16I4DFftng4PMk/6lH5GLE7QGZWkrBg8lCL6DnZnVJFNRs4SSoCVuzATZD2/?=
 =?us-ascii?Q?dyxqJJz5QSxToYfDkBIX1W0xN5w1VMwgZ2em8yr8vCxwLQDY/MT/dpdTUPYa?=
 =?us-ascii?Q?Uy3q3qt4Ir/G/xm1Y3/zKp2J+/8IjHmthrct7vsMj64fYWxVytH1EpLmshsY?=
 =?us-ascii?Q?1h2y2RCpCfVB6Gd7dP/e/y1zUkhxv2EJ+Vz0qvSnhu/hp55wEs7x+1p/3WDn?=
 =?us-ascii?Q?u7XQGbaX2iBwBtKMnEfn7Q8D8qVTdkTsO9vTgPskxVacgR7Ej+5fz+8XQHLH?=
 =?us-ascii?Q?HSRZJ+Qtz2KycFMI2+rFowhCDiqAUDJC8R7KDG5jXJvzde+PyxHsfNVfmrCc?=
 =?us-ascii?Q?3FtEXAhHAyxTdl/sVfcPGpTQAA/FNlB771Y1pvVLcfkm0w+MIs4uFCVdkGiJ?=
 =?us-ascii?Q?kNkMAVTTiFVJrw3ng07GnMvKfiLtWoIWIEU5Xnu2U93+6nxfZ1KT4MnUfqgz?=
 =?us-ascii?Q?HrsMcHZd2toCIX/mgustEK/Xez4tDKjU1xvTwi4Nfae+zmkTpN+gxgqIcgY/?=
 =?us-ascii?Q?AAFiyxRbCNIdZ4+V5atjRDsEWYA/ChRLJ3tGtBiHZAIf2Uyssy6BoFJunIs/?=
 =?us-ascii?Q?y/qDH83LgPQDe/wePP3U8yps0HHoUz1hfIV59DIqkpQwvPNcBZOk4i+VS4AI?=
 =?us-ascii?Q?dPC4inT59zbOyqQ1Lz8SHU02ECbx8H6uPORpl8ZrAsSkTxrpqQEIKiuzTGS8?=
 =?us-ascii?Q?MMpylbYkXimOYz4x8QausvQE9s0ggMUaiazFXQ6byxlh8Z/FspfqH6VnTDVQ?=
 =?us-ascii?Q?TOMELv1B9oRy3yS5Bs4aWML1LRPPlp9Y5kicyDg8QjtnBUp2PRIZEiP2ubAq?=
 =?us-ascii?Q?McBsiLwcosmkPjszOmOPjyIKaId1JpdGhAOv2p5CLs7XH2CvAxm+t7q/HbfH?=
 =?us-ascii?Q?1e+mx9IXvAaVVB9x/5H6viQlJ4qxDCevZj0m5Fe30FQpbTRpJDGdYzP1iGoL?=
 =?us-ascii?Q?0L4fkREJHY89eo3XWQifwYaNEqvF9IFvn40kE3BQkuwo2LG0RrkT+7g9C8Ja?=
 =?us-ascii?Q?kGgiSol/m1xNzEUdyESNqjIrC4fB7WfMt9cutw2kOvW9/DcVtaLVIn0aBH63?=
 =?us-ascii?Q?GwbfJx6UweV7xdWl4y3zGNKi1uDCr2OHvASjgyjMEE0DFFBOCz1Gy/HeUu2D?=
 =?us-ascii?Q?bZwwyZPi5dpsoSxQ+Y8Esw3PrA1nhAGIXyvNpszdV+nWKvuncwArAq9o+dRo?=
 =?us-ascii?Q?gpJycsdhedyqKKkATuI+J9viKaeWY9Z3J2EFQz9R5DzgZub7VFEFxPsCJgbL?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab90484f-945e-46b7-0e85-08dd0d5e3752
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 14:34:06.4343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgkgarhhvmNO/2g4GbGLpZy/OhEhZ0mnADeZLq6m3jePn0DehSnYGuevCXkieohkfEgxY+8+GkIwj4dyF5HS1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5236
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-0.0 required=7.0 tests=ARC_SIGNED,ARC_VALID,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH RESEND 2 1/1] sched/syscalls: Allow setting
 niceness using sched_param struct
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
Cc: Juri Lelli <juri.lelli@redhat.com>, "Michael C .
 Pratt" <mcpratt@pm.me>, Valentin Schneider <vschneid@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, yu.c.chen@intel.com, Peter
 Zijlstra <peterz@infradead.org>, aubrey.li@linux.intel.com,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>,
 Ingo Molnar <mingo@redhat.com>, oliver.sang@intel.com,
 Mel Gorman <mgorman@suse.de>, oe-lkp@lists.linux.dev, stable@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, ltp@lists.linux.it, lkp@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



Hello,

kernel test robot noticed "ltp.sched_get_priority_min01.fail" on:

commit: ecd04eb1e1d00bbd158b2f7d1353af709d8131a7 ("[PATCH RESEND 2 1/1] sched/syscalls: Allow setting niceness using sched_param struct")
url: https://github.com/intel-lab-lkp/linux/commits/Michael-C-Pratt/sched-syscalls-Allow-setting-niceness-using-sched_param-struct/20241111-150517
base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git fe9beaaa802d44d881b165430b3239a9d7bebf30
patch link: https://lore.kernel.org/all/20241111070152.9781-2-mcpratt@pm.me/
patch subject: [PATCH RESEND 2 1/1] sched/syscalls: Allow setting niceness using sched_param struct

in testcase: ltp
version: ltp-x86_64-14c1f76-1_20241111
with following parameters:

	disk: 1HDD
	fs: xfs
	test: syscalls-07



config: x86_64-rhel-8.3-ltp
compiler: gcc-12
test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz (Ivy Bridge) with 8G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202411252241.2d75c2f6-lkp@intel.com



<<<test_start>>>
tag=sched_get_priority_min01 stime=1732078544
cmdline="sched_get_priority_min01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1890: TINFO: LTP version: 20240930-63-g6408294d8
tst_test.c:1894: TINFO: Tested kernel: 6.12.0-rc4-00035-gecd04eb1e1d0 #1 SMP PREEMPT_DYNAMIC Sun Nov 17 15:27:30 CST 2024 x86_64
tst_test.c:1725: TINFO: Timeout per run is 0h 02m 30s
sched_get_priority_min01.c:42: TFAIL: SCHED_BATCH retval 100 != 0: SUCCESS (0)
sched_get_priority_min01.c:42: TPASS: SCHED_DEADLINE passed
sched_get_priority_min01.c:42: TPASS: SCHED_FIFO passed
sched_get_priority_min01.c:42: TPASS: SCHED_IDLE passed
sched_get_priority_min01.c:42: TFAIL: SCHED_OTHER retval 100 != 0: SUCCESS (0)
sched_get_priority_min01.c:42: TPASS: SCHED_RR passed

Summary:
passed   4
failed   2
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=1 corefile=no
cutime=0 cstime=1
<<<test_end>>>



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241125/202411252241.2d75c2f6-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
