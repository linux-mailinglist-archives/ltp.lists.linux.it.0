Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C52938B332B
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Apr 2024 10:44:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C8C53D035D
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Apr 2024 10:44:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D103F3CE955
 for <ltp@lists.linux.it>; Fri, 26 Apr 2024 10:43:59 +0200 (CEST)
Authentication-Results: in-4.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com;
 envelope-from=oliver.sang@intel.com; receiver=lists.linux.it)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D47761001149
 for <ltp@lists.linux.it>; Fri, 26 Apr 2024 10:43:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714121038; x=1745657038;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=dF5FZdCIxHF/Gk6QuNg3uBPFruHMSEmKZBOnLMQ/sj0=;
 b=b6wn7Zzp+o/viM0jPGkcEGUC7oBASU4rOzPvb9bvZFsfDUH18/Opn/Px
 BLC0Z13r9/lzfDa7QRD1PR9eHwqIYnPBgY8hR4JPON1Xwh3DkK+8qX7Fe
 wZDNfpMPo2pjEToMZ80i1xIvt6Vj2OQNcXBPv72V25e+5bvJXezui9xJL
 3fDVdab0dvkSculnWqiLo998GKUBEKz5dG+Ezkeo2XwjeUU7wk3UfgdFn
 ctOwtKV04wizTaNUrM3KB2fY2jlvZTcON5FrTMrL+UvMmnpy28XWVAgHv
 KRKphqx0VRAyh0uStfLm8ZwLWBnmVv7iEQLi0FRaZeVk7PKj4rew/Fpag w==;
X-CSE-ConnectionGUID: t4vd6UXmR6GWVyAjaU3kvQ==
X-CSE-MsgGUID: 096lyTRlTNy5m4N3yYcSvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10008969"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="10008969"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 01:43:52 -0700
X-CSE-ConnectionGUID: NykhfIk8SdqxFnCnTNSzvw==
X-CSE-MsgGUID: TnUbPONjSVKsB8UGyXl5OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="30153662"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 01:43:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 01:43:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 01:43:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 01:43:51 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 01:43:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fs2XoZt9FQ5AnudKPK/f5C9JT+HGDiEz9Rmc03UucosTcwXD2dnsGqG2Gh45XKKbg6oqeEJtbgO3wNq/xPLQgwLNnNYfPk8n308vTEiztUTRkjP8qBUZhywX8Famf9RRuerMHW8/wV8i3JgLfe8UlunAv2hZQOkjgFF3yMOjagFL+bvDjG/HOpxk/MUhb428rfUs2Ub5lLO1/StN9WUzITM8MmI4XFeoKptyEU/EUItYJMjrwi7wGVf3u9eSU5hD03T8f/79UNp6h4Y+mm4bffndCZOYLN6GNGdvKz7KkAjBsXu2ggAGSUcTDKdR+Pb6YX2eS2Ff9iTTc0phTniVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFNt56ZKtIv2SNOwfK4at9syVvL7tftBveYWzTccmPA=;
 b=nelqaW4+k3bUM8/XqOh5CexcuIA2UH6AsDDvEEldCKLec7kYjDWDI9Wo8/S6chlp/K2n02UtgQbFqgoLS5p2XAPOzQJyz/auqg8vHRnRkNIwNCvFhTu5lsZJX2m4ylCofRB5yS12pgzYbuCepShRJ1OLHoL3FT2oAObomP+HnFcJ9rDNJP0PirklZME8wuqBwbIFJ5Cx3pnrj5RFNOY5EURWVDS9jMHQVKQo84whUt4yKh0bBNQKlTPqwma9zqOBz8W1nI3O5PzCGB7QouFEybwoILakR/Re7eIi9SFOXTsisqqrerGtEbD9kpMvPTyqOsD7vapONrIQx1GRpJKPJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21)
 by PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Fri, 26 Apr
 2024 08:43:49 +0000
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125]) by SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125%7]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 08:43:49 +0000
Date: Fri, 26 Apr 2024 16:43:39 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Message-ID: <202404261608.7c346a06-oliver.sang@intel.com>
Content-Disposition: inline
In-Reply-To: <20240415113436.3261042-2-vschneid@redhat.com>
X-ClientProxiedBy: SG2PR04CA0178.apcprd04.prod.outlook.com
 (2603:1096:4:14::16) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8587:EE_|PH8PR11MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a479d36-a663-4814-62fa-08dc65ccfdd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?khexKspVizuuermuXuHIFnROW0inJfqp1fBdD/Bk23EJ9WvnXm95Zz/3GAKF?=
 =?us-ascii?Q?YnpvWk333ofyVAZLSFu9vFzhJHVlqp1X0/GdUjGpmVRNki5JuqO7lpW3pqDj?=
 =?us-ascii?Q?7jBLFF+EXxhOtz2gLzqOudL9ECVZktxHc2d/5+Q81kA8RsXg6IcMBvF1G6UI?=
 =?us-ascii?Q?5NglOPbcUG9uALtDCbXeOLZuyG5sJ+g5yxFMDfZNO2UUK/gg7dYfHAjXYfe/?=
 =?us-ascii?Q?qLVUg7l7UKDLcYyv3q2XjqMm4Cc8Wc4vf+xB9xravTYx08edPb9r71OHZzkI?=
 =?us-ascii?Q?aNkd+U9sMovQTXZY2yrjRE6IoSfLULJe+d8THi90jieG5vUnClIoTVpsT4ER?=
 =?us-ascii?Q?GZRHaOtPyR7w6hhkJojUMlXSnSQZFWmb7SqUMibaUTlIdXFfeTsAI9D5T35+?=
 =?us-ascii?Q?G2P5bwZKB9GG3t4ErOW+O44PUy9Mz+jP+MRtK48aWDhQQeDWbg2hhCPmo3bl?=
 =?us-ascii?Q?ftjn5Pkwu3d5lJ6jTtl6AB9ImRVTTZtoYSmCMg4a4OwWO6O4YzcpIjBRsrnC?=
 =?us-ascii?Q?HzQjP96wjvV3W3CuGysR6hWhSHjQhxDTG+NLwd9LSuWd5WxwwpTswaEPNPCI?=
 =?us-ascii?Q?VMXhbRdG8eHAwticnUcpWdqyYZX0y2FK2SagghXGT5xPKthXl1ih4walT4WK?=
 =?us-ascii?Q?eSY6rCTRDVT05lc+R72UuwnpKJmeAtzbFAqfJui0E8lEjULPkC8bfD94xErL?=
 =?us-ascii?Q?Yl9FeVgSO7uCfa/L9e4lDARncTLesZA+TYF7zCbTkKwdhRZ0wfhpL++JSLGy?=
 =?us-ascii?Q?OxtJz4KDMjzURSyFjNL3ZZTLM/2//gDmO263rFqQCN6rTBC5b892PqjjizUK?=
 =?us-ascii?Q?9h8nvf9PDs8aHgG/1A+//VAeLNNk8tSR8g6cu5ijl8vYrxdCdCLv2ruO2bfX?=
 =?us-ascii?Q?CqxK9rH59sW/uWiUKJ9rFjoHa4MrWb0l0rFJIMfQzUxZLExTLG+R4F1faUmy?=
 =?us-ascii?Q?M+qfvh6WXfDATgEENMXWpDxT2IY+PLyBCrW3LhPkRhUuie4VfnqsJS72srEy?=
 =?us-ascii?Q?27bccm6LVKZXBddn6knUoyI79QVVoEDt7Pbrzap5Wdj7EjWV3YRdsuMPE9eA?=
 =?us-ascii?Q?I7DM91F6/F66E6FGtaylzRx1LiJzZB9zhNHOvzosvOzxRkjJ8bentAZVc29d?=
 =?us-ascii?Q?EnDN9j1bKE+xlDXJFwj6CHEk3FHF0KsRtQ0SfA+w3A7aY/s9GMXcefUXm7tp?=
 =?us-ascii?Q?T7Xa6fs+fpk4INt+CmjPdzMy/yow7RnyQuDiCtWItqzNfJQShePk/AP8woc?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB8587.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qyz420OCfow6Y6fxEOJ59SVL/HPjbIrRuXdxwmuMzLmcuZyM7PcQDQnz934l?=
 =?us-ascii?Q?GMHRQiSHU+/NwRA+wTyoOBZOtuGphV7W4NegpymJVhPvVELdGCx0EWfz1tpm?=
 =?us-ascii?Q?eaBWQMpSYpEQjPHDhZC4ZN4QrjXoggiUUgyz77SPeLgozLhutKyqtuFbKH46?=
 =?us-ascii?Q?ST9mA6cF8axjHlI6FS2V4lZABGrjwu4Ps08TZGh8JKFFPSCLAohIoUkwJ3eD?=
 =?us-ascii?Q?llAQp7oRBRsSUy7bgChwHf6tDGCTxGM6eKhWFnqJtRAghA84LWmEdIsXFDUe?=
 =?us-ascii?Q?s+z0M1i0mGrc/O/CTwQSG0bPGF7WJ1w94aQ2sE9E2yRcs9gsiNe6FE+Ogb/J?=
 =?us-ascii?Q?HvPrtN5N7M9THDQJhbCsjlvFrOctTMDHSrHCQYotxA3TZsS1GrkIVeNBTRi3?=
 =?us-ascii?Q?gxcVAVthRWdho/TmYPrOYHZkb2Mb12aWnVLWJloF3LzIOWYq7HId28JOV/Zi?=
 =?us-ascii?Q?1dmUUy80RTE5UCO8SKvRAHHzb3j8ihMbt+ql4UBARE+dIlNNABAYgiE+aOj1?=
 =?us-ascii?Q?LssFnGYoXALdgXkTfgTTa4l1EnNujZ+vnyPEho849Fi8sEqH5OUZqv7/G+at?=
 =?us-ascii?Q?n8tKlr/XwxI4b3aJkzqBhF/6p3DflC5wJkiZ4rZWjUfUM7E1m7memRwLM69H?=
 =?us-ascii?Q?t5xlivNZvy/LA1TFoauCRL7Zc7mzFBihRElrG/ZNKJSwB3gqMS9L6vbfkpcK?=
 =?us-ascii?Q?jpcGjzh7NvBfFat8J8vNj4z0x1pwzy5s6uRrWUvLa4mtLplQbz0/Ws28KkEi?=
 =?us-ascii?Q?gQ2LfJ9WeLe8Y/GYtYBP8kv83U4v5OMnDofrNPXVN3zHVtRgIFu3vw++ga1m?=
 =?us-ascii?Q?VZaW2/yIcqEcRKvU2MByegZpjsU++jkeiJrA7rqGabqF3Md0SoJJoYvcfzGZ?=
 =?us-ascii?Q?0f6vPiy1gZnto7/iCHtLbB0lk3OMR8aXKFU5lQvgP2i7exTWyKle1zYoBynf?=
 =?us-ascii?Q?U7nJdOuznuBWpSuJXM1dDvxAjVDuLvA2HXVhIdnWGhnmk8Cy7kfvJuH28I6s?=
 =?us-ascii?Q?9sSkGaAH2N7AdU97BxOYYGW+Z8z5CYp4/iE9+JIVJJbqXh5kkmCo4Swabd4w?=
 =?us-ascii?Q?dC+qlrkG4zBqKeVK07SIMxBrV+VyeGCgnR6xl0QkwmhBlXY3utZnh6kba6LC?=
 =?us-ascii?Q?za/5PrfjQdgmZYY/KOrISgYp8Yif/ZaY/qaLkUuDCTacQGQsuzkygByxRe4U?=
 =?us-ascii?Q?iZBEviboAHOE7xJDPkqWA29br3J790vphiZC1uxjdHORm2e0ZPxMeR4DrZ/E?=
 =?us-ascii?Q?Moqi0GIIdYqiyzPs2j+6ZQTG7BLOk/xnkgDeBG4LZ6JaSYkxGEVTu/sHVI/y?=
 =?us-ascii?Q?wzKsRgnpoUGXZdFo21qc43jIfiAwv+zgcxSEOoLtigzlmjOxMO94SrOfu9v7?=
 =?us-ascii?Q?LT/FsLwQrLb5m4xsh8oRRq4WHIhd94Ao/KRAXOKiyYVwo81N1eF84tststUb?=
 =?us-ascii?Q?xe1F44DkfgvkUexHB5ynUyiEwORWcRXGSWJjvuZwbRW1/HEzqiL6Tru4UlBu?=
 =?us-ascii?Q?tDMVXxHR0sDWmw7S2EmqY/JyDh0CrbVP/xGI/2oNdBnqZmFkekaCMFI5NvtL?=
 =?us-ascii?Q?TPw0DSGAya1lub9AfWSvvAZyvZ58N6Pp3o8wFfGtpYHIf93/jVYy29REd2ua?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a479d36-a663-4814-62fa-08dc65ccfdd7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 08:43:48.9388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGahEwr78Bph5zfRmT5SWzTeUb19d/cWR/kRI96yvUwx2bmwsUzFX1Im3g2eXMItFy05dkf03VcX+6zm7Sge9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8105
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=0.1 required=7.0 tests=ARC_SIGNED,ARC_VALID,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v5 1/2] SQUASH: tcp/dcpp: Convert timewait timer
 into a delayed_work
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Tomas Glozar <tglozar@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, lkp@intel.com, dccp@vger.kernel.org,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 linux-kernel@vger.kernel.org, oliver.sang@intel.com,
 Eric Dumazet <edumazet@google.com>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>, mleitner@redhat.com,
 oe-lkp@lists.linux.dev, Jakub
 Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, ltp@lists.linux.it,
 linux-rt-users@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



Hello,

kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_kernel/workqueue.c" on:

commit: 1463958a05a90694cf63a6decf02983ef9a0b102 ("[PATCH v5 1/2] SQUASH: tcp/dcpp: Convert timewait timer into a delayed_work")
url: https://github.com/intel-lab-lkp/linux/commits/Valentin-Schneider/SQUASH-tcp-dcpp-Convert-timewait-timer-into-a-delayed_work/20240415-193744
base: https://git.kernel.org/cgit/linux/kernel/git/bpf/bpf-next.git master
patch link: https://lore.kernel.org/all/20240415113436.3261042-2-vschneid@redhat.com/
patch subject: [PATCH v5 1/2] SQUASH: tcp/dcpp: Convert timewait timer into a delayed_work

in testcase: ltp
version: ltp-x86_64-14c1f76-1_20240420
with following parameters:

	test: net_stress.appl-ssh



compiler: gcc-13
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202404261608.7c346a06-oliver.sang@intel.com


[  157.135844][    C7] BUG: sleeping function called from invalid context at kernel/workqueue.c:2195
[  157.144790][    C7] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 3686, name: sshd
[  157.153204][    C7] preempt_count: 101, expected: 0
[  157.158116][    C7] RCU nest depth: 4, expected: 0
[  157.162939][    C7] CPU: 7 PID: 3686 Comm: sshd Tainted: G S                 6.9.0-rc1-00332-g1463958a05a9 #1
[  157.172905][    C7] Hardware name: Dell Inc. OptiPlex 9020/0DNKMN, BIOS A05 12/05/2013
[  157.180861][    C7] Call Trace:
[  157.184021][    C7]  <IRQ>
[ 157.186743][ C7] dump_stack_lvl (lib/dump_stack.c:117) 
[ 157.191131][ C7] __might_resched (kernel/sched/core.c:10198) 
[ 157.195780][ C7] ? __pfx___might_resched (kernel/sched/core.c:10152) 
[ 157.200951][ C7] __cancel_work_sync (include/linux/kernel.h:73 kernel/workqueue.c:2195 kernel/workqueue.c:4295) 
[ 157.205773][ C7] ? __pfx___cancel_work_sync (kernel/workqueue.c:4290) 
[ 157.211209][ C7] inet_twsk_deschedule_put (net/ipv4/inet_timewait_sock.c:222 (discriminator 1)) 
[ 157.216470][ C7] tcp_v4_rcv (net/ipv4/tcp_ipv4.c:2413) 
[ 157.220770][ C7] ? __pfx_tcp_v4_rcv (net/ipv4/tcp_ipv4.c:2163) 
[ 157.225501][ C7] ? __kernel_text_address (kernel/extable.c:79 (discriminator 1)) 
[ 157.230668][ C7] ? __pfx_raw_v4_input (net/ipv4/raw.c:165) 
[ 157.235574][ C7] ip_protocol_deliver_rcu (net/ipv4/ip_input.c:205 (discriminator 1)) 
[ 157.240830][ C7] ip_local_deliver_finish (include/linux/rcupdate.h:813 net/ipv4/ip_input.c:234) 
[ 157.246171][ C7] ? tcp_wfree (net/ipv4/tcp_output.c:1225) 
[ 157.250464][ C7] ip_local_deliver (include/linux/netfilter.h:314 include/linux/netfilter.h:308 net/ipv4/ip_input.c:254) 
[ 157.255190][ C7] ? __pfx_ip_local_deliver (net/ipv4/ip_input.c:243) 
[ 157.260442][ C7] ? ip_rcv_finish_core+0x1c0/0x10a0 
[ 157.266219][ C7] ip_rcv (include/net/dst.h:460 (discriminator 4) net/ipv4/ip_input.c:449 (discriminator 4) include/linux/netfilter.h:314 (discriminator 4) include/linux/netfilter.h:308 (discriminator 4) net/ipv4/ip_input.c:569 (discriminator 4)) 
[ 157.270078][ C7] ? __pfx_ip_rcv (net/ipv4/ip_input.c:562) 
[ 157.274459][ C7] ? do_syscall_64 (arch/x86/entry/common.c:52 (discriminator 1) arch/x86/entry/common.c:83 (discriminator 1)) 
[ 157.279012][ C7] ? update_curr (kernel/sched/fair.c:1164 (discriminator 1)) 
[ 157.283395][ C7] ? update_load_avg (kernel/sched/fair.c:4411 kernel/sched/fair.c:4748) 
[ 157.288300][ C7] ? __pfx_ip_rcv (net/ipv4/ip_input.c:562) 
[ 157.292684][ C7] __netif_receive_skb_one_core (net/core/dev.c:5585 (discriminator 4)) 
[ 157.298462][ C7] ? __pfx___netif_receive_skb_one_core (net/core/dev.c:5578) 
[ 157.304760][ C7] ? _raw_spin_lock_irq (arch/x86/include/asm/atomic.h:115 (discriminator 4) include/linux/atomic/atomic-arch-fallback.h:2170 (discriminator 4) include/linux/atomic/atomic-instrumented.h:1302 (discriminator 4) include/asm-generic/qspinlock.h:111 (discriminator 4) include/linux/spinlock.h:187 (discriminator 4) include/linux/spinlock_api_smp.h:120 (discriminator 4) kernel/locking/spinlock.c:170 (discriminator 4)) 
[ 157.309663][ C7] process_backlog (include/linux/rcupdate.h:813 net/core/dev.c:6029) 
[ 157.314305][ C7] ? __pfx_trigger_load_balance (kernel/sched/fair.c:12435) 
[ 157.319904][ C7] __napi_poll (net/core/dev.c:6679) 
[ 157.324110][ C7] ? update_process_times (kernel/time/timer.c:2480) 
[ 157.329276][ C7] net_rx_action (net/core/dev.c:6750 net/core/dev.c:6864) 
[ 157.333748][ C7] ? __pfx_net_rx_action (net/core/dev.c:6828) 
[ 157.338734][ C7] ? __pfx_sched_clock_cpu (kernel/sched/clock.c:389) 
[ 157.343902][ C7] ? __pfx_sched_clock_cpu (kernel/sched/clock.c:389) 
[ 157.349070][ C7] __do_softirq (arch/x86/include/asm/jump_label.h:27 include/linux/jump_label.h:207 include/trace/events/irq.h:142 kernel/softirq.c:555) 
[ 157.353453][ C7] ? __pfx___do_softirq (kernel/softirq.c:512) 
[ 157.358361][ C7] ? irqtime_account_irq (kernel/sched/cputime.c:64 (discriminator 1)) 
[ 157.363449][ C7] do_softirq (kernel/softirq.c:455 (discriminator 32) kernel/softirq.c:442 (discriminator 32)) 
[  157.367488][    C7]  </IRQ>
[  157.370296][    C7]  <TASK>
[ 157.373107][ C7] __local_bh_enable_ip (kernel/softirq.c:382) 
[ 157.378015][ C7] __dev_queue_xmit (net/core/dev.c:4389) 
[ 157.382836][ C7] ? unwind_next_frame (arch/x86/kernel/unwind_orc.c:406 (discriminator 1) arch/x86/kernel/unwind_orc.c:648 (discriminator 1)) 
[ 157.388007][ C7] ? __pfx___dev_queue_xmit (net/core/dev.c:4270) 
[ 157.393263][ C7] ? kernel_text_address (kernel/extable.c:119 (discriminator 1) kernel/extable.c:94 (discriminator 1)) 
[ 157.398348][ C7] ? __kernel_text_address (kernel/extable.c:79 (discriminator 1)) 
[ 157.403516][ C7] ? unwind_get_return_address (arch/x86/kernel/unwind_orc.c:369 (discriminator 1)) 
[ 157.409035][ C7] ? arch_stack_walk (arch/x86/kernel/stacktrace.c:26) 
[ 157.413769][ C7] ? eth_header (net/ethernet/eth.c:100) 
[ 157.418065][ C7] ? neigh_resolve_output (include/linux/netdevice.h:3145 net/core/neighbour.c:1558 net/core/neighbour.c:1543) 
[ 157.423324][ C7] ip_finish_output2 (include/net/neighbour.h:542 (discriminator 2) net/ipv4/ip_output.c:235 (discriminator 2)) 
[ 157.428226][ C7] ? arch_stack_walk (arch/x86/kernel/stacktrace.c:24 (discriminator 1)) 
[ 157.432953][ C7] ? __pfx_ip_skb_dst_mtu (include/net/ip.h:496) 
[ 157.438041][ C7] ? __pfx_ip_finish_output2 (net/ipv4/ip_output.c:199) 
[ 157.443394][ C7] ? __ip_finish_output (include/linux/skbuff.h:1636 include/linux/skbuff.h:4958 net/ipv4/ip_output.c:307 net/ipv4/ip_output.c:295) 
[ 157.448381][ C7] ip_output (net/ipv4/ip_output.c:427) 
[ 157.452495][ C7] ? __pfx_ip_output (net/ipv4/ip_output.c:427) 
[ 157.457137][ C7] __ip_queue_xmit (net/ipv4/ip_output.c:535) 
[ 157.461862][ C7] ? __copy_skb_header (include/net/dst.h:290 net/core/skbuff.c:1528) 
[ 157.466765][ C7] ? __skb_clone (arch/x86/include/asm/atomic.h:53 include/linux/atomic/atomic-arch-fallback.h:992 include/linux/atomic/atomic-instrumented.h:436 net/core/skbuff.c:1599) 
[ 157.471229][ C7] __tcp_transmit_skb (net/ipv4/tcp_output.c:1462 (discriminator 4)) 
[ 157.476317][ C7] ? __pfx___tcp_transmit_skb (net/ipv4/tcp_output.c:1283) 
[ 157.481740][ C7] tcp_write_xmit (net/ipv4/tcp_output.c:2792 (discriminator 2)) 
[ 157.486379][ C7] ? skb_do_copy_data_nocache (include/linux/uio.h:204 include/linux/uio.h:211 include/net/sock.h:2238) 
[ 157.491977][ C7] ? __pfx_skb_do_copy_data_nocache (include/net/sock.h:2229) 
[ 157.497923][ C7] ? skb_page_frag_refill (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/atomic/atomic-instrumented.h:33 include/linux/page_ref.h:67 net/core/sock.c:2908) 
[ 157.503083][ C7] __tcp_push_pending_frames (net/ipv4/tcp_output.c:2977 (discriminator 2)) 
[ 157.508505][ C7] tcp_sendmsg_locked (net/ipv4/tcp.c:1310) 
[ 157.513578][ C7] ? __pfx_chacha_block_generic (lib/crypto/chacha.c:77) 
[ 157.519173][ C7] ? __pfx_tcp_sendmsg_locked (net/ipv4/tcp.c:1040) 
[ 157.524594][ C7] ? _raw_spin_lock_bh (arch/x86/include/asm/atomic.h:115 (discriminator 4) include/linux/atomic/atomic-arch-fallback.h:2170 (discriminator 4) include/linux/atomic/atomic-instrumented.h:1302 (discriminator 4) include/asm-generic/qspinlock.h:111 (discriminator 4) include/linux/spinlock.h:187 (discriminator 4) include/linux/spinlock_api_smp.h:127 (discriminator 4) kernel/locking/spinlock.c:178 (discriminator 4)) 
[ 157.529405][ C7] ? __pfx__raw_spin_lock_bh (kernel/locking/spinlock.c:177) 
[ 157.534736][ C7] tcp_sendmsg (net/ipv4/tcp.c:1343) 
[ 157.538850][ C7] sock_write_iter (net/socket.c:730 (discriminator 1) net/socket.c:745 (discriminator 1) net/socket.c:1160 (discriminator 1)) 
[ 157.543486][ C7] ? __pfx_sock_write_iter (net/socket.c:1144) 
[ 157.548644][ C7] ? rw_verify_area (fs/read_write.c:377) 
[ 157.553279][ C7] vfs_write (include/linux/fs.h:2108 fs/read_write.c:497 fs/read_write.c:590) 
[ 157.557391][ C7] ? __pfx_vfs_write (fs/read_write.c:571) 
[ 157.562026][ C7] ? __pfx___might_resched (kernel/sched/core.c:10152) 
[ 157.567189][ C7] ksys_write (fs/read_write.c:643) 
[ 157.571389][ C7] ? __pfx_ksys_write (fs/read_write.c:633) 
[ 157.576112][ C7] do_syscall_64 (arch/x86/entry/common.c:52 (discriminator 1) arch/x86/entry/common.c:83 (discriminator 1)) 
[ 157.580486][ C7] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:129) 
[  157.586254][    C7] RIP: 0033:0x7f568f9de240
[ 157.590542][ C7] Code: 40 00 48 8b 15 c1 9b 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 80 3d a1 23 0e 00 00 74 17 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 58 c3 0f 1f 80 00 00 00 00 48 83 ec 28 48 89
All code
========
   0:	40 00 48 8b          	add    %cl,-0x75(%rax)
   4:	15 c1 9b 0d 00       	adc    $0xd9bc1,%eax
   9:	f7 d8                	neg    %eax
   b:	64 89 02             	mov    %eax,%fs:(%rdx)
   e:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  15:	eb b7                	jmp    0xffffffffffffffce
  17:	0f 1f 00             	nopl   (%rax)
  1a:	80 3d a1 23 0e 00 00 	cmpb   $0x0,0xe23a1(%rip)        # 0xe23c2
  21:	74 17                	je     0x3a
  23:	b8 01 00 00 00       	mov    $0x1,%eax
  28:	0f 05                	syscall 
  2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<-- trapping instruction
  30:	77 58                	ja     0x8a
  32:	c3                   	retq   
  33:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  3a:	48 83 ec 28          	sub    $0x28,%rsp
  3e:	48                   	rex.W
  3f:	89                   	.byte 0x89

Code starting with the faulting instruction
===========================================
   0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
   6:	77 58                	ja     0x60
   8:	c3                   	retq   
   9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  10:	48 83 ec 28          	sub    $0x28,%rsp
  14:	48                   	rex.W
  15:	89                   	.byte 0x89


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240426/202404261608.7c346a06-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
