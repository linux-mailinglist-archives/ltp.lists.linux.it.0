Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E07A903F57
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2024 16:58:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 317203D0B60
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2024 16:58:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A77ED3CE0D9
 for <ltp@lists.linux.it>; Tue, 11 Jun 2024 16:58:45 +0200 (CEST)
Authentication-Results: in-4.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com;
 envelope-from=oliver.sang@intel.com; receiver=lists.linux.it)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2A54C100118F
 for <ltp@lists.linux.it>; Tue, 11 Jun 2024 16:58:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718117923; x=1749653923;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=5D0UAu45K8IOs2jsSunAB4sXhY0YinSque640vUfIwA=;
 b=ONnI0CORq4Yzp7m8Am+U1um7lEv0nEM/A6SAUtKrQu1WkLewCJbezUsA
 iuu9AZafZP7S9Al18Au8oO5cMFYrCzw0vTauKgzyoOgCIX/Q22eKcpExf
 Qfke/zjwEzD80y78HHpx5i+Q6Jvj92hSee7oRRC9p0Zce5obl44/aukMC
 C1N4zrbR5rWWnTxCph19p08eXElPb5wDUW1DK5pNlP0t51OhDw7PGWD0x
 fWDidOYM3gFEuxO93ua2wE9pKjREb9skSDjWflm/SnlTC62Em2NtYgPX9
 rlV7a9/bpQDMiMgmzLbeb5EnHQgZF0qYXfRu/CZMx8F/H3gn+OTxnocRB Q==;
X-CSE-ConnectionGUID: mmF0sTemQ5uHhyJn2UgKiA==
X-CSE-MsgGUID: e3e+SpxFQDaLAYS+dwDrhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26249975"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="26249975"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:58:37 -0700
X-CSE-ConnectionGUID: Fm+AHOAKS4KSMahP1QwSiw==
X-CSE-MsgGUID: sDe4gSERTtqUAwpm69z3Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="40059834"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jun 2024 07:58:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 07:58:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 07:58:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 11 Jun 2024 07:58:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Jun 2024 07:58:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M04aTi/0hJQZRld3XHu8lP9IZVzV70wNh7e2Elo2PMJtqvb27t1Ql4tUWgGIYpdCjlFGtIV0hykxuszjh6Jidzy3mZCIbiIJqFgdjHAfKTcqYeFhGqyMd9+vIj94wxkdqysEN8UafvyVKlhuswJZvpnk5TgwOC6wX0udJLyZtjANdQHjdXrn3nqQcQYDbsdtY8ZD1vkQ8bHb+yW+3mVPvlaBQR7+TDxzUKfgxBPpur8WMDdnCWURasSURWPgo6/Ep7iBlfjlNemUGIjjzwBIf9H02P0iIDrICS2YzU5uIl7Fj9Uk2qnc5mrxW4IvKiNt7QM0w/NhDv/uCzJowB87zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucu3sMcik5to3+0+nhn0q00ek7BbKdw08AYb9VF8OG8=;
 b=iRqH+RZ5wMQmJr7zP2pVP28mlWP0Fk9yZZKQuWjbqUVQpvbjoDgGn/tbLE+bs+a01hGwYo4cTP08P/jrMXSXoYhhQEijLBMFGRUgoThuLiB3EkFzxSPlYXMt8N13zqNUreDrz4iRBKeLldxgg6d+96/1Kgh/f2y4URLu40LovcQ+LhpfU4Vk4/5gwuNNeSYFkbfIhkXKlC6KAfXr+VkjhgbxJMIyUd466B8VQv7Nk5NqSNfSud/nJG4ATujKNIQoTfHM0smhwHh1dWjrVvbPajZPTKISGzSdQveWDowz26p/hGmBBEDA8ijfUGxX8QUwI54bhPjq0QNRpduxbeJo7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB7572.namprd11.prod.outlook.com (2603:10b6:510:27b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 11 Jun
 2024 14:58:32 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 14:58:32 +0000
Date: Tue, 11 Jun 2024 22:58:17 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Gulam Mohamed <gulam.mohamed@oracle.com>
Message-ID: <202406112130.a572f72-oliver.sang@intel.com>
Content-Disposition: inline
In-Reply-To: <20240607190607.17705-1-gulam.mohamed@oracle.com>
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea1320c-2fb8-4222-60eb-08dc8a26f661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|376006|366008|1800799016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U8J4i72bpW6Y+n0KFAbBoafrcwJtLLZaJpxtkO4z58xLQ7AFGLVwPrJ0I5DQ?=
 =?us-ascii?Q?41o4UFoVdylQ7u7IBhtQ0Ioz5Z9oVmn0TbaAIxJSDIFsDvs7vWoVp/qvkxd8?=
 =?us-ascii?Q?+yEu5qjwJh7BhWiAlIq2HWbKkunNO14/lF5dTY6DuFwrNPqsIXRusD4gDQEm?=
 =?us-ascii?Q?WaVSED6woGlCxo4xXC6A5BfvRV3azjzzmwvbIceQWHOVPt54TPJgbg5ZnkQI?=
 =?us-ascii?Q?TKDC6N9ju1KrrYtj4CUBLk9SeSNAoIPLhm6k8BNtBHxwRYh1XkmV4w+2jZ/p?=
 =?us-ascii?Q?5yyr/xjpdvWNHOwQSUPoPalMMg46aqUq2O/9psdtTluNlicTLfOrppaiSWv1?=
 =?us-ascii?Q?km+oxsssl1Pnwx5HJfQSZmMpfRECtY3gTsh73J60rufHQmUHafa3t1vuvoZY?=
 =?us-ascii?Q?RygPa7CzxjIoz8ajA9tH4oQSh96PSFPGsOAkTbXnTuKWSS6suVNjSUJ5XpWv?=
 =?us-ascii?Q?jOj8gpTBVm7VFePad7XfstyqG7ISOl3JzsXtw5ugCBLDeDR6YOehnp6tCW+b?=
 =?us-ascii?Q?c2Ld40uEoNk+JTDzQzW3cvbBUuhucmu9z3UL2JtMSrb113Y97k0q2KbYjq/d?=
 =?us-ascii?Q?tSzCQTpXWTl8Xh+iyV5RNQqh/KBG6Fd094xj+lxRRxneI3gyQuH4siHU4qUD?=
 =?us-ascii?Q?wnO9HCPsj6LgL18ha23aHB77UWj3/5BBIiJ9hxA5FPPtRKBlPSh4jSXqFtDd?=
 =?us-ascii?Q?uOKsLQtloAro4ugdcbRjqylbWqMpiNlqYnMQHYmdKqH6pGI1BUOiIFMUzP57?=
 =?us-ascii?Q?Bc091gZIF8SK+9oExZBPBHKVGT6UiL9qhJafZzzQRdMkye3SZXCHxfpEBGY2?=
 =?us-ascii?Q?P1C30EeDy9A2F+P+1mrYWduvo8u29dl3OpDpCDNDIMlS3MM+xq2sPBMI5vNv?=
 =?us-ascii?Q?F0t7bUs19C2XFCR5TOkzLOL5H6rBqCi3Pid4M3bRw5gAxQR/zdCgBXkFWmtz?=
 =?us-ascii?Q?4X4MZ1jutbVIgnLzITNgiC4EdjNbZeCPYBIoM7w9J3VtGd1C183h+JBrBo9/?=
 =?us-ascii?Q?sEYW3ourK6C3RdtcSIfzi9rYGdVthRX/t1xwh59vpls2eS6brfY5zlKCbZPK?=
 =?us-ascii?Q?KU8G1UqaWPW1Taw6CXhdI+k94vPvtfSz9+Zq3aauTYjYku/uosfcfmBdZqmE?=
 =?us-ascii?Q?4f/fRjmpv/W55ZOY6Z79AogDSkFv12sJfD7G7GuBOy1bpauDvUlcP5Cmlsyx?=
 =?us-ascii?Q?XFKbcykQYH+yOXelMyMyGC7dge2GQvVE1XnyUf20CqjXcg72n5DlsJSLrxnN?=
 =?us-ascii?Q?Itza4+cr0KuFWCwZgXikK5QHzKPiOqovEtwkftX8/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(376006)(366008)(1800799016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lbYKV4WD9wnYx0joi2CG7EEMvY2zjSKZpgIUuYhdXea/nszXtXDyYL173gFF?=
 =?us-ascii?Q?CEmvysqzP8izSW1uFPP9atdrob4wNpwaR0QkSjEBYisgEpLwh2Ro9fuqlEKO?=
 =?us-ascii?Q?wHfyMBAC/P2F1kM8AGNEWhgfQgkwoDR7eQGWmw629BEx7FVnwMnJjHVa/NQM?=
 =?us-ascii?Q?Mtz/OcEAljx3Gxhs+2o7lsIWnofEmBvQgkRll4U14fjJVAYSQqGjManxRAtQ?=
 =?us-ascii?Q?MLoMaZm7dpHgVw+C75JLZ3FsvkIiY5ShWUC2PR3VsS5UDeF8Xh9v3rggawJs?=
 =?us-ascii?Q?QcFaGelxi0lpghezgCVoaQ9YKdY/b4SiQf9dmNyD5obczI6tcyoQd36m+M+S?=
 =?us-ascii?Q?pPW/Ot3mywmHZquHS0w/otzJn1iUhk/LTFih9JYiqfVTsdwLBd4zGgn71IrU?=
 =?us-ascii?Q?4p2wnFugIkXMyK/GV+vie3c79RBV8nn4I/2wtQzpzIzMfrkKkfoQug89iCGz?=
 =?us-ascii?Q?oz4jqvS543CbkZCOV8pDBUGgV7D1/wG+BoYqde6nNUDMQE8S1A+TofruldWm?=
 =?us-ascii?Q?mwZpmGKWKJA0Rg8+ExaFBJaAI7SGIw+ZA73h2Omrv3qAwjU2R8i6FcWmjW0d?=
 =?us-ascii?Q?B4gP0aEuu2cymyqa8oe08s3AkAf/BZipb6NbElH+1w2/+VvocWHiwnD6cuEN?=
 =?us-ascii?Q?9IXBRy1ImkiW+QDIPIRvfA2abug0F3tQnpkomWSnGZ18aOZB/Voc7dmcr2v+?=
 =?us-ascii?Q?mkwM7UoyNR5FQlIO9elippOFQDQ62+IpEhW2zodoFgJCLIxWRRbNh4i/8br4?=
 =?us-ascii?Q?QEnrXc+9oQ1QgeTsZFxHLR8EvCvlIsrLZxb0vFSLJL2UrzlOWs8q93P7BmVs?=
 =?us-ascii?Q?PMTSPeJKyNB/iKMIP6pakwaokG1Bxgln+JFEy3gEQMG0xJqczdDY3P6X3sY4?=
 =?us-ascii?Q?uieilC0sKi+sCBuZMFhvWs+CCKUuJkGYx4Wo5hTj7uEFm+gnADVbVz1v5WrF?=
 =?us-ascii?Q?GWOb6zqfek6CMHoPpJBbMtfWY3Tc5dAQIboYsmlczC4ZKoemJsUowztIQzE/?=
 =?us-ascii?Q?YlQ5PT+N3swdxhGnYUiGAeWoQTIr6QqBnl0NAUomscytARNYu0TVIU+jraxw?=
 =?us-ascii?Q?miaS5hymFLc/qQEhWOve5wPDZpDRCrZuyFBhpCmLTrZY846OGygbXmbx3JIz?=
 =?us-ascii?Q?8L6TWetMMnwzDQIvLc10rA+S3kFy/FiCLfGUtREOGWLTIoXdFYePg5m1KQe+?=
 =?us-ascii?Q?hVsG8p88eKG6AOG7ATtsw66ftaSG4lipkFy9zOTNXB5jH3LE+yuD4xGodTh7?=
 =?us-ascii?Q?X/EbJxYg4nP8/2oEWjPlznIplxFPPYSsnc/mQWK10/aE0at5NkM3WEwtpO0D?=
 =?us-ascii?Q?ToGoWUj0W+QgDcIwyFLBU2px55ky1tVcDOhLiP/uuFllUjtcmmrj1zcpv0kV?=
 =?us-ascii?Q?gB2m2kAjsp025uCeZ98BjLliMV1LT0CmuYfu43zGWMmui02NLVhQV+4kfvvX?=
 =?us-ascii?Q?WEiMhhlxxIbroWI982Vst3op8uHVguu++sjaMoHTc2YFkrDsksHW/lkUWBsj?=
 =?us-ascii?Q?o7wCeQ/NWt6zfi+q7MPXwZlFfhRD0NV6Ef7wXXTvXIY8gmouJUHhAhh2nhbE?=
 =?us-ascii?Q?Y6ncIwZIm8KjV1ZIMkRVgbfcALxwyBvXPrItE1o1+8ljZcfxkddFxwq7CYey?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea1320c-2fb8-4222-60eb-08dc8a26f661
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 14:58:32.7645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BewmsdZf1rzaDVbgfUKwj/gwKPYcuWzuaj6XaOV02cxhq6T9LWwC9hvf0J/Klxq/+a9KCxilLV4lCeni7grmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7572
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=0.1 required=7.0 tests=ARC_SIGNED,ARC_VALID,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
 SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled
 version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH V4 for-6.10/block] loop: Fix a race between loop
 detach and loop open
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
Cc: axboe@kernel.dk, lkp@intel.com, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, yukuai1@huaweicloud.com, oliver.sang@intel.com,
 oe-lkp@lists.linux.dev, hch@lst.de, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



Hello,

kernel test robot noticed "ltp.ioctl09.fail" on:

commit: 02ab74c165fb204557fe6cde80eda0633fbc4412 ("[PATCH V4 for-6.10/block] loop: Fix a race between loop detach and loop open")
url: https://github.com/intel-lab-lkp/linux/commits/Gulam-Mohamed/loop-Fix-a-race-between-loop-detach-and-loop-open/20240608-031123
base: https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git for-next
patch link: https://lore.kernel.org/all/20240607190607.17705-1-gulam.mohamed@oracle.com/
patch subject: [PATCH V4 for-6.10/block] loop: Fix a race between loop detach and loop open

in testcase: ltp
version: ltp-x86_64-14c1f76-1_20240608
with following parameters:

	disk: 1HDD
	fs: ext4
	test: syscalls-03/ioctl09



compiler: gcc-13
test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz (Ivy Bridge) with 8G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202406112130.a572f72-oliver.sang@intel.com


Running tests.......
<<<test_start>>>
tag=ioctl09 stime=1717978971
cmdline="ioctl09"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1734: TINFO: LTP version: 20240524-32-ge2c52c5bb
tst_test.c:1618: TINFO: Timeout per run is 0h 02m 30s
tst_device.c:96: TINFO: Found free device 0 '/dev/loop0'
ioctl09.c:48: TPASS: access /sys/block/loop0/loop0p1 succeeds
ioctl09.c:56: TPASS: access /dev/loop0p1 succeeds
ioctl09.c:51: TPASS: access /sys/block/loop0/loop0p2 fails
ioctl09.c:59: TPASS: access /dev/loop0p2 fails
ioctl09.c:48: TPASS: access /sys/block/loop0/loop0p1 succeeds
ioctl09.c:56: TPASS: access /dev/loop0p1 succeeds
ioctl09.c:48: TPASS: access /sys/block/loop0/loop0p2 succeeds
ioctl09.c:56: TPASS: access /dev/loop0p2 succeeds
tst_device.c:263: TWARN: ioctl(/dev/loop0, LOOP_CLR_FD, 0) no ENXIO for too long

Summary:
passed   8
failed   0
broken   0
skipped  0
warnings 1
incrementing stop
<<<execution_status>>>
initiation_status="ok"
duration=3 termination_type=exited termination_id=4 corefile=no
cutime=3 cstime=42
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL
LTP Version: 20240524-32-ge2c52c5bb

       ###############################################################

            Done executing testcases.
            LTP Version:  20240524-32-ge2c52c5bb
       ###############################################################




The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240611/202406112130.a572f72-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
