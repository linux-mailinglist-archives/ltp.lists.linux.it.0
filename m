Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 558A06A7E37
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Mar 2023 10:43:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 129823CCE02
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Mar 2023 10:43:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AEA263CB9CB
 for <ltp@lists.linux.it>; Thu,  2 Mar 2023 10:43:47 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::60f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BAE061001292
 for <ltp@lists.linux.it>; Thu,  2 Mar 2023 10:43:45 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtoQO6MeDD9/qo8z6O8V5eLl5jOBBccJzNTZVL86JTybhJkV+fur4/Rv0Ev4TqU43hQ3bgCxmP1LK0LZ2ZnJsZ0a/HIB8CitzvXiPSfvfrxF65Sdemfg7aVQA8kBsTA4ZfrJrnpp4Ea2Q/0MOOhtmRyX4YpuQcfV4c2qSc62/BUQUMnGRnNqJleJan748oGa8NSzS1voX4hQ0Qjur0pj2NXQsA2ipOTG4yQEYPN9oftNrnFQZbzP6O4tGJ+Zwl+d24c9WQpnrgxd1ubSdxnaKVTrjXh/t8itFk5LHT1pjq5cCpdhBywV7sG467fHtkWjKxWNLqtvF9H7b9JFNADg1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVjot48bzOLI2ZfusDqfV4V+lyUVsNiamzg3I4qisu0=;
 b=UFrqtuBITYPEtVqSf3w2DGt/84IEWFr9tPThsJLycOOaRxK1GZgVgNKsRJ++7wrxAR6M5l9htp9YvLA9b1tlyYjVtNH6Hum+oRHEeq+Gsdk5X3XjlNA9wuoZeACfGXZh5BUXj0dJHSTXecVjiI77trnJ943NHj0FUNYqt8tsI2UQKkN6rjpqFhZcYNl3SXh2+BuWxQ3t/akGw/dr4vMTgE0QP6F8Vg+5gUvNYPaB5KWuBOfOqtHZV2nDw4sEzQVOl4oYTXPfKNFSQZY6EgBKXkl6bHaN0iCCsJTLTkd4bU8Qx2Xgfqa0ozpYtYF1RxR2Mk+51xX5j7YpFyQAKIfoHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVjot48bzOLI2ZfusDqfV4V+lyUVsNiamzg3I4qisu0=;
 b=H/Kc0Cd+xHgRx2z6lbPGMeugFvM69+RU8fpZtwqNO6lkqx+25VsRVjv5+4BT0DyrqkNfSaAoBsBVwsze6hxW7up+ZgNJkHR6PZuZsaQXsVE4c5Bw6j+UdmJf2S+h8YZPf6YhI5pT9Z+UvrPK7KWhrAhjblJXnqbofOYN77fCJ2JmC71KD68NCbDIACZBruQ9sm7eOn6PxJcSIKnepfuKHR9KTWxVM1unEj76cLI3o+d6eIfvSOdAjYiNLYGupWqpI0BAp1c2YV96PPIykNU01nXn0NTYj74vFFCpuCTO1t+pHW98WIVP5mlc1ixXWzyaOjSCzlmrY0B7Wv/kRPYZfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB6797.eurprd04.prod.outlook.com (2603:10a6:803:13e::13)
 by PAWPR04MB9861.eurprd04.prod.outlook.com (2603:10a6:102:381::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 09:43:41 +0000
Received: from VI1PR04MB6797.eurprd04.prod.outlook.com
 ([fe80::e6db:281a:b03d:39ca]) by VI1PR04MB6797.eurprd04.prod.outlook.com
 ([fe80::e6db:281a:b03d:39ca%4]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 09:43:41 +0000
Message-ID: <f09f189d-88b0-fd6a-24e0-1bbe1df17fa4@suse.com>
Date: Thu, 2 Mar 2023 10:41:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: ltp@lists.linux.it, tomoyo-users-en@lists.osdn.me
References: <20230302093406.29799-1-andrea.cervesato@suse.com>
In-Reply-To: <20230302093406.29799-1-andrea.cervesato@suse.com>
X-ClientProxiedBy: FR0P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::6) To VI1PR04MB6797.eurprd04.prod.outlook.com
 (2603:10a6:803:13e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB6797:EE_|PAWPR04MB9861:EE_
X-MS-Office365-Filtering-Correlation-Id: 04b5b0ec-bdeb-4f8d-4629-08db1b029b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HStFR6iThMy/2+VaK1OoGj0py9pdqJYuaYkpHdnRvdAJWK3G5MA50YaIeIhK5coJUSmarM9OHhFRnwI3hJYPMba6+Tfrt9gfr2i54D/mPYGQjhhCgtD/0/tYVCI9tEu9Mo3YXYjaKubpPde2HAmD8jAa5NTpc2XJzXeZhUwdxO2S6e2G8So3QW47bpiTfuyO/4c2rY4IQsgBglW9HO+lb6j5ZmQVxBPnaXVgd55dqTjiNwsYo28JQN1hTukjJ2sgdKRjz41jKqtrBXfssvzsPPNWAarCmaqB7FNC6rkb9LQdjywCGZoPG57W7XISOib24bSixrWeJQm4Frei9O9TR5bkUyKrfCQtk6zNWMzqUGOHsbhIaQW/9m2h6WaYuVwNv3bwK4GtdNRIKYSXiq1D24CUfiPA9dtcAFDRDbMgjV+d37ndZy/YpE2LyWF52IJEDeOUP5IzhG7mF23WRHNIBBaP7O6Xz9W2z6SviaIdwjGCScnSc+I8iimwGRxd4kh4w653jEt8Km3GqY6zUWQ4AkSWnzGLJYRoimKIzh6plXj6qJlqOnGoq7lY78DFKhdzDr+a0m5BfJ94z3QPTH+lA2L9x27XVNsJyf1T3w0ReqCDCtnC1UDGhyK+lgCgArECK+tGJHXjm6kHmrYxcOwc7vQujDV64S8fJY0iL6gRO+bg9kyaf5ERl9Tp5qO21UclFQ6CLmMoCpgqyITUsNjBJsTfI3CJe3Gk3lwZqw74doRsCrynVZXQ8wwWOn2EyPmj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB6797.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199018)(83380400001)(31686004)(6666004)(36756003)(38100700002)(5660300002)(478600001)(8936002)(31696002)(86362001)(26005)(186003)(2616005)(6512007)(6486002)(53546011)(6506007)(8676002)(66946007)(66476007)(66556008)(30864003)(2906002)(44832011)(316002)(41300700001)(2004002)(43740500002)(45980500001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1N3bHZZdlpGNWpIaTZEZmtwQUVsQW5hUkNFaEFoS1Vyd2xrUVdMUVZqZW5z?=
 =?utf-8?B?R2YrSGFLRFBiZWQ1ZnJwQUIra0hlRUlwUnNwNGYxVG14dE5LMjBBSlFyNlZv?=
 =?utf-8?B?TEJJY3VZbzZrdkdxSUpINXRmd0J4S05QMWlnOU1nTEVlaEg4R2YxVkE4NHNI?=
 =?utf-8?B?c2xxNnp5c245YTVoZWlKTzZpZTdjSmRvenowWVRPNmViZXV1Vy9meXRWQUZK?=
 =?utf-8?B?aTZiZmdmL0FrdmpNY1A1TEhQNWRaaEdTcFM1anRzSmRTTlpNOU95Sy9GVnpW?=
 =?utf-8?B?NURRUjlNRnpISGgvN2d0Z1U3RDhTUnZReTdDM3NXNjU4K3c3ZUJCWUQwemNX?=
 =?utf-8?B?TW9xT2dTMXJMZUV6OVJPL2lwYjZGRXpRSm5qOGQ1dFc0aktCOXEwUXZFN0w5?=
 =?utf-8?B?THc0TzVKcmU0cHcrYWsyT2JScnV3Z2M5c2x1UDgxK245elp1SHEvK0EwNEhB?=
 =?utf-8?B?L2p0eFhQbTJxSmticCtOcWhiTkhmRnVaNW1ueGx2YnJOK1NtM3lQYzVTNXJl?=
 =?utf-8?B?UndUNy9KanFXT3hvNm5JcUl0c3Q1Z29TczFzNVI2MW5JWDBONUMzSVFjQi8w?=
 =?utf-8?B?dkJ5SFlVaThjZElwL1VrUGV4QkV3ZHI3TDRkSmRaUmtwSkJQMXRGY25JekpQ?=
 =?utf-8?B?cFIvYUpSakRtR3FoOHlXeER5ZnozaGFPU2czRlFaeGlTSnRVYkpmS1hmQndF?=
 =?utf-8?B?a0d4N1ZDeDJYSW5WVkNWRjhvdU9MMjdHS0RnYVJOSlZQVVVWVnAxdDFyaG1L?=
 =?utf-8?B?RmZEMzdBazZsYmVwb05LenFrSUtBaFA1aldyMUtqOGpPblZYNlozVExYUXN0?=
 =?utf-8?B?SndHRSs5cGZ3dHFRcXVaOHozK3YyTytNbDBOMjk3NlYrcTEyUGh4b2JSZ3p4?=
 =?utf-8?B?SE1TS3UwMlNTZXRBalcrRndWb0dnZTREd1h4R2RNZlA1VnZmcExKUjBRYi9S?=
 =?utf-8?B?enU5UWhlMkJJZXFtYVRodWk0eEpHVngrU21Fa1ZFdDlCbCtTVmgrL1VpcmJm?=
 =?utf-8?B?d2xWdHRzcjFlNTNGQklQaEw0aEc0b0JWdmdiWjVWdkJWNFM5dEpBUlhPdkZm?=
 =?utf-8?B?djd1ZVFHb1JJaDZrbUxyRDFCMU9WdlpEQXJNMlJRckVRN29pNyt2WGVuYWFH?=
 =?utf-8?B?QUF5ZFdXUUpENXQxTmVUekhxc3dJNnhWand5R3BDWHZEUmhFTVFWUVNORk9x?=
 =?utf-8?B?L0d1RVlQMjlXQ04rKzNmbDNiVkM4KzZVMXVmVUUxa3J4YXVnRzlOY1J5V0Zl?=
 =?utf-8?B?VWVCdjFRTFV6akQzWVpWL25xRTljN1hvVndLaVdNaTNyblREOXlsLzNZK0dl?=
 =?utf-8?B?MG1xUnR2SUtzQWoxc2pVckFKOTZxakhyZXg3UG9EQnNFVXhucFMvK1lpb1Fs?=
 =?utf-8?B?OGd1V05kZ291a3l0M003ZkFrOFZHRmhreUZ1bWQ4TGNiNEE1SUVXLzRiWGt6?=
 =?utf-8?B?dk9aRWgvK2Z1U1lwcGxpRXhueXNFd0JscWloK2o0Y01WanFuYlBkR05TcSt2?=
 =?utf-8?B?SjRnblY5WEYwNjdKaGozK0V2bStMUlZ1ekxBSDRqbHJZMXF3T2lacjl4SDZr?=
 =?utf-8?B?YlNYNGp2bERpK1ZvWURZTFRJNG1FRGpKSGlONHNlSkR5WEYyQWZyUXcrTkgv?=
 =?utf-8?B?U2RRN1ZuUU5MaUxiL2xkWXAvU3RIRU1pRkZXUGY2S0lDTDhHelB2MmQwVVJj?=
 =?utf-8?B?NXBMQnNTcmdkcDJhayt0UGxFNzJ1Sk4yaHVlWjFpVVlEa25VcllGVWszRkl5?=
 =?utf-8?B?SVJ4R2VEbWZyVzNObkx0QWVpNkFlU3YwYXlkdzV5TXo0b2FybTRueXRvaWd0?=
 =?utf-8?B?QWFYRDRDdzdYOSt4YjFJNmRRWmtDNVQrVGlTL3d1dXUwMHU5K2Jjb3BhV1ZZ?=
 =?utf-8?B?c045WjJDZHZhWENpSWNqbjJOUnc1RXB2NFNBaTNDa29QR0N5OFp4cVlrKzBK?=
 =?utf-8?B?T1V2dzd1YVROcEkzTHJlR2lRRFRyV3c3NmhuZ3B2di9xbVgxdW5mS0E5dU9G?=
 =?utf-8?B?Q0FPMjBacmpMSGVEYXZCNmRjRyt2ZGN1cDkvRDRIR2dqMVZkR3RiSnB0WjVS?=
 =?utf-8?B?OFRSeGZNcEVYZlcweEVtbFJLMUg0ZFQranpIbUJ3RnZacjYvbzJXeGlydGdI?=
 =?utf-8?B?OXdvTmw4MjQxM3ZPYjZVT3hUbTFnYlJ3cTJIOEs0ai9tTU9jN0hDTVE1dFRl?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b5b0ec-bdeb-4f8d-4629-08db1b029b18
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB6797.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 09:43:41.1188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YW0Edg78NM4OUg8LKBYXNOIibogywl+87E5k648bwm2MTll/1My2sPQGMwJEO1FLe/s7kjJso7OWVUFS9pF6oPjS38/N//EcL8weLGbn2NE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9861
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] [RFC] Remove tomoyo testing suite
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

an update: tomoyo linux is still maintained in Kernel Linux 
(https://github.com/torvalds/linux/commits/master/security/tomoyo), but 
we ask if LTP is still used to test it or we can remove the testing 
suite due to API deprecation.

If not, we should find someone who wants/needs to maintain it, because 
some API that the testing suite is using are going to be 
deprecated/removed in the next future.

Regards,
Andrea

On 3/2/23 10:34, Andrea Cervesato wrote:
> The tomoyo testing suite is built and installed inside the LTP testcases
> folder, but it's not used by any runtest file. It seems an old and
> unmaintained testing suite that uses old LTP API and ltp_clone_quick
> that is going to be deprecated.
>
> We suppose to update it using new LTP API, cleaning up the code and
> removing deprecated functions, but nowadays the whole Tomoyo linux
> functionality seems replaced by SELinux or AppArmor and not maintained
> anymore in years of development.
>
> For this reason, this patch is going to remove it from LTP installation.
>
> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
>   testcases/kernel/security/tomoyo/.gitignore   |   9 -
>   testcases/kernel/security/tomoyo/Makefile     |  29 -
>   testcases/kernel/security/tomoyo/README       |  58 --
>   testcases/kernel/security/tomoyo/include.h    | 379 ----------
>   testcases/kernel/security/tomoyo/newns.c      |  49 --
>   testcases/kernel/security/tomoyo/testall.sh   |  46 --
>   .../security/tomoyo/tomoyo_accept_test.c      | 146 ----
>   .../kernel/security/tomoyo/tomoyo_file_test.c | 304 --------
>   .../security/tomoyo/tomoyo_filesystem_test.c  | 633 -----------------
>   .../security/tomoyo/tomoyo_new_file_test.c    | 627 -----------------
>   .../kernel/security/tomoyo/tomoyo_new_test.c  | 652 ------------------
>   .../security/tomoyo/tomoyo_policy_io_test.c   | 195 ------
>   .../tomoyo/tomoyo_policy_memory_test.c        | 358 ----------
>   .../security/tomoyo/tomoyo_rewrite_test.c     | 169 -----
>   14 files changed, 3654 deletions(-)
>   delete mode 100644 testcases/kernel/security/tomoyo/.gitignore
>   delete mode 100644 testcases/kernel/security/tomoyo/Makefile
>   delete mode 100644 testcases/kernel/security/tomoyo/README
>   delete mode 100644 testcases/kernel/security/tomoyo/include.h
>   delete mode 100644 testcases/kernel/security/tomoyo/newns.c
>   delete mode 100644 testcases/kernel/security/tomoyo/testall.sh
>   delete mode 100644 testcases/kernel/security/tomoyo/tomoyo_accept_test.c
>   delete mode 100644 testcases/kernel/security/tomoyo/tomoyo_file_test.c
>   delete mode 100644 testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c
>   delete mode 100644 testcases/kernel/security/tomoyo/tomoyo_new_file_test.c
>   delete mode 100644 testcases/kernel/security/tomoyo/tomoyo_new_test.c
>   delete mode 100644 testcases/kernel/security/tomoyo/tomoyo_policy_io_test.c
>   delete mode 100644 testcases/kernel/security/tomoyo/tomoyo_policy_memory_test.c
>   delete mode 100644 testcases/kernel/security/tomoyo/tomoyo_rewrite_test.c
>
> diff --git a/testcases/kernel/security/tomoyo/.gitignore b/testcases/kernel/security/tomoyo/.gitignore
> deleted file mode 100644
> index 698646d93..000000000
> --- a/testcases/kernel/security/tomoyo/.gitignore
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -/newns
> -/tomoyo_accept_test
> -/tomoyo_file_test
> -/tomoyo_filesystem_test
> -/tomoyo_new_file_test
> -/tomoyo_new_test
> -/tomoyo_policy_io_test
> -/tomoyo_policy_memory_test
> -/tomoyo_rewrite_test
> diff --git a/testcases/kernel/security/tomoyo/Makefile b/testcases/kernel/security/tomoyo/Makefile
> deleted file mode 100644
> index 00e4cc3ed..000000000
> --- a/testcases/kernel/security/tomoyo/Makefile
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -#
> -#    kernel/security/smack testcase Makefile
> -#
> -#    Copyright (C) 2009, Cisco Systems Inc.
> -#
> -#    This program is free software; you can redistribute it and/or modify
> -#    it under the terms of the GNU General Public License as published by
> -#    the Free Software Foundation; either version 2 of the License, or
> -#    (at your option) any later version.
> -#
> -#    This program is distributed in the hope that it will be useful,
> -#    but WITHOUT ANY WARRANTY; without even the implied warranty of
> -#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -#    GNU General Public License for more details.
> -#
> -#    You should have received a copy of the GNU General Public License along
> -#    with this program; if not, write to the Free Software Foundation, Inc.,
> -#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> -#
> -# Ngie Cooper, July 2009
> -#
> -
> -top_srcdir		?= ../../../..
> -
> -include $(top_srcdir)/include/mk/testcases.mk
> -
> -INSTALL_TARGETS		:= testall.sh
> -
> -include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/security/tomoyo/README b/testcases/kernel/security/tomoyo/README
> deleted file mode 100644
> index 0cb538868..000000000
> --- a/testcases/kernel/security/tomoyo/README
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -Always look here for latest version of these tests:
> -http://sourceforge.jp/projects/tomoyo/svn/view/trunk/2.3.x/tomoyo-tools/kernel_test/?root=tomoyo
> -
> -These testcases test the TOMOYO Security Module. And they are not part of
> -default LTP build/install/run.
> -
> -A kernel with TOMOYO configured is required to run the TOMOYO testsuite.
> -The securityfs filesystem must be mounted at /sys/kernel/security .
> -
> -Preparation steps are:
> -
> -1) Download tomoyo-tools package and extract and build and install.
> -
> -  # wget -O tomoyo-tools.tar.gz 'http://sourceforge.jp/projects/tomoyo/svn/view/trunk/2.3.x/tomoyo-tools.tar.gz?root=tomoyo&view=tar'
> -  # tar -zxf tomoyo-tools.tar.gz
> -  # make -C tomoyo-tools/ install
> -
> -  Programs are installed in /usr/sbin/ with prefix "tomoyo-" and
> -  /usr/lib/tomoyo/ directory without prefix "tomoyo-".
> -
> -  You can make a RPM package by "rpmbuild -bb tomoyo-tools/tomoyo-tools.spec" and
> -  a DEB package by "alien -k" after "rpmbuild -bb".
> -
> -2) Run /usr/lib/tomoyo/init_policy .
> -
> -   This will take several minutes.
> -
> -   Hiding kernel source directory by "mount -t tmpfs none /usr/src/linux/"
> -   would save some time.
> -
> -   Configuration files are saved in /etc/tomoyo/ directory.
> -   You can do "rm -fR /etc/tomoyo/" if you want to uninstall.
> -
> -3) Reboot the system with TOMOYO enabled kernel.
> -
> -   To make sure TOMOYO is selected, you can add security=tomoyo to kernel's
> -   command line.
> -
> -4) Build the tests.
> -
> -   # (extract the tar ball containing the tests.)
> -   # make autotools
> -   # ./configure
> -   # cd testcases/kernel/security/tomoyo/
> -   # make
> -   # find `/bin/pwd` -type f -perm +100 >> /etc/tomoyo/manager.conf
> -   # /usr/sbin/tomoyo-loadpolicy m
> -
> -Test steps are:
> -
> -1) Run the tests from the directory you ran "make".
> -
> -   # ./testall.sh
> -
> -   Please don't run the tests inside /tmp/ directory, for /tmp/ directory is
> -   hidden by "newns" (a wrapper program to run the test in a new namespace).
> -
> -   You can use "| grep -vF OK" to pick up only failed tests as testall.sh does.
> diff --git a/testcases/kernel/security/tomoyo/include.h b/testcases/kernel/security/tomoyo/include.h
> deleted file mode 100644
> index edaf1170f..000000000
> --- a/testcases/kernel/security/tomoyo/include.h
> +++ /dev/null
> @@ -1,379 +0,0 @@
> -/******************************************************************************/
> -/*                                                                            */
> -/* Copyright (c) Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, 2009      */
> -/*                                                                            */
> -/* This program is free software;  you can redistribute it and/or modify      */
> -/* it under the terms of the GNU General Public License as published by       */
> -/* the Free Software Foundation; either version 2 of the License, or          */
> -/* (at your option) any later version.                                        */
> -/*                                                                            */
> -/* This program is distributed in the hope that it will be useful,            */
> -/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
> -/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
> -/* the GNU General Public License for more details.                           */
> -/*                                                                            */
> -/* You should have received a copy of the GNU General Public License          */
> -/* along with this program;  if not, write to the Free Software               */
> -/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
> -/*                                                                            */
> -/******************************************************************************/
> -/*
> - * include.h
> - *
> - * Common functions for testing TOMOYO Linux's kernel.
> - *
> - * Copyright (C) 2005-2010  NTT DATA CORPORATION
> - */
> -#include <errno.h>
> -#include <fcntl.h>
> -#include <linux/kdev_t.h>
> -#include <linux/unistd.h>
> -#include <pty.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <string.h>
> -#include <sys/socket.h>
> -#include <sys/stat.h>
> -#include <sys/syscall.h>
> -#include <sys/time.h>
> -#include <sys/timex.h>
> -#include <sys/types.h>
> -#include <sys/un.h>
> -#include <sys/wait.h>
> -#include <time.h>
> -#include <unistd.h>
> -#include <utime.h>
> -#include <sched.h>
> -#include <stdarg.h>
> -#include <sys/mount.h>
> -#include <arpa/inet.h>
> -#include <net/if.h>
> -#include <linux/ip.h>
> -#include <err.h>
> -#include "test.h"
> -
> -/*
> - * Some architectures like mips n32 don't have __NR_uselib defined in the
> - * system headers.
> - */
> -#ifdef __NR_uselib
> -static inline int uselib(const char *library)
> -{
> -	return syscall(__NR_uselib, library);
> -}
> -#else
> -static inline int uselib(const char *library)
> -{
> -	errno = ENOSYS;
> -	return -1;
> -}
> -#endif
> -
> -/* Is there an architecture without __NR_pivot_root defined? */
> -#ifdef __NR_pivot_root
> -static inline int pivot_root(const char *new_root, const char *put_old)
> -{
> -	return syscall(__NR_pivot_root, new_root, put_old);
> -}
> -#else
> -static inline int pivot_root(const char *new_root, const char *put_old)
> -{
> -	errno = ENOSYS;
> -	return -1;
> -}
> -#endif
> -
> -/* The sysctl() wrapper is dead and newer arches omit it now. */
> -static inline int write_sysctl(const char *path, const char *value)
> -{
> -	FILE *fp = fopen(path, "w");
> -	if (!fp)
> -		return 1;
> -	fputs(value, fp);
> -	fclose(fp);
> -	return 0;
> -}
> -
> -static inline int read_sysctl(const char *path, char *value, int len)
> -{
> -	char scratch[100];
> -	FILE *fp = fopen(path, "r");
> -	if (!fp)
> -		return 1;
> -	if (!value) {
> -		value = scratch;
> -		len = sizeof(scratch);
> -	}
> -	if (fgets(value, len, fp))
> -		/* ignore */;
> -	fclose(fp);
> -	return 0;
> -}
> -
> -/* Should be a fairly benign path to bang on. */
> -#define TEST_SYSCTL_PATH "/proc/sys/net/ipv4/ip_local_port_range"
> -
> -#define proc_policy_dir              "/sys/kernel/security/tomoyo/"
> -#define proc_policy_domain_policy    "/sys/kernel/security/tomoyo/domain_policy"
> -#define proc_policy_exception_policy "/sys/kernel/security/tomoyo/exception_policy"
> -#define proc_policy_profile          "/sys/kernel/security/tomoyo/profile"
> -#define proc_policy_manager          "/sys/kernel/security/tomoyo/manager"
> -#define proc_policy_query            "/sys/kernel/security/tomoyo/query"
> -#define proc_policy_grant_log        "/sys/kernel/security/tomoyo/grant_log"
> -#define proc_policy_reject_log       "/sys/kernel/security/tomoyo/reject_log"
> -#define proc_policy_domain_status    "/sys/kernel/security/tomoyo/.domain_status"
> -#define proc_policy_process_status   "/sys/kernel/security/tomoyo/.process_status"
> -#define proc_policy_self_domain      "/sys/kernel/security/tomoyo/self_domain"
> -
> -static FILE *profile_fp = NULL;
> -static FILE *domain_fp = NULL;
> -static FILE *exception_fp = NULL;
> -static char self_domain[4096] = "";
> -static pid_t pid = 0;
> -
> -static void clear_status(void)
> -{
> -	static const char *keywords[] = {
> -		"file::execute",
> -		"file::open",
> -		"file::create",
> -		"file::unlink",
> -		"file::mkdir",
> -		"file::rmdir",
> -		"file::mkfifo",
> -		"file::mksock",
> -		"file::truncate",
> -		"file::symlink",
> -		"file::rewrite",
> -		"file::mkblock",
> -		"file::mkchar",
> -		"file::link",
> -		"file::rename",
> -		"file::chmod",
> -		"file::chown",
> -		"file::chgrp",
> -		"file::ioctl",
> -		"file::chroot",
> -		"file::mount",
> -		"file::umount",
> -		"file::pivot_root",
> -		NULL
> -	};
> -	int i;
> -	FILE *fp = fopen(proc_policy_profile, "r");
> -	static char buffer[4096];
> -	if (!fp) {
> -		fprintf(stderr, "Can't open %s\n", proc_policy_profile);
> -		exit(1);
> -	}
> -	for (i = 0; keywords[i]; i++)
> -		fprintf(profile_fp,
> -			"255-CONFIG::%s={ mode=disabled }\n",
> -			keywords[i]);
> -	while (memset(buffer, 0, sizeof(buffer)),
> -	       fgets(buffer, sizeof(buffer) - 10, fp)) {
> -		const char *mode;
> -		char *cp = strchr(buffer, '=');
> -		if (!cp)
> -			continue;
> -		*cp = '\0';
> -		mode = cp + 1;
> -		cp = strchr(buffer, '-');
> -		if (!cp)
> -			continue;
> -		*cp++ = '\0';
> -		if (strcmp(buffer, "0"))
> -			continue;
> -		fprintf(profile_fp, "255-%s", cp);
> -		if (!strcmp(cp, "COMMENT"))
> -			mode = "Profile for kernel test\n";
> -		else
> -			mode = "{ mode=disabled verbose=no }\n";
> -		fprintf(profile_fp, "255-%s=%s", cp, mode);
> -	}
> -	fprintf(profile_fp, "255-PREFERENCE::learning= verbose=no\n");
> -	fprintf(profile_fp, "255-PREFERENCE::enforcing= verbose=no\n");
> -	fprintf(profile_fp, "255-PREFERENCE::permissive= verbose=no\n");
> -	fprintf(profile_fp, "255-PREFERENCE::disabled= verbose=no\n");
> -	fprintf(profile_fp, "255-PREFERENCE::learning= max_entry=2048\n");
> -	fflush(profile_fp);
> -	fclose(fp);
> -}
> -
> -static void tomoyo_test_init(void)
> -{
> -	pid = getpid();
> -	if (access(proc_policy_dir, F_OK)) {
> -		fprintf(stderr, "You can't use this program for this kernel."
> -			"\n");
> -		exit(1);
> -	}
> -	profile_fp = fopen(proc_policy_profile, "w");
> -	if (!profile_fp) {
> -		fprintf(stderr, "Can't open %s .\n", proc_policy_profile);
> -		exit(1);
> -	}
> -	setlinebuf(profile_fp);
> -	domain_fp = fopen(proc_policy_domain_policy, "w");
> -	if (!domain_fp) {
> -		fprintf(stderr, "Can't open %s .\n",
> -			proc_policy_domain_policy);
> -		exit(1);
> -	}
> -	setlinebuf(domain_fp);
> -	exception_fp = fopen(proc_policy_exception_policy, "w");
> -	if (!exception_fp) {
> -		fprintf(stderr, "Can't open %s .\n",
> -			proc_policy_exception_policy);
> -		exit(1);
> -	}
> -	setlinebuf(exception_fp);
> -	if (fputc('\n', profile_fp) != '\n' || fflush(profile_fp)) {
> -		fprintf(stderr, "You need to register this program to %s to "
> -			"run this program.\n", proc_policy_manager);
> -		exit(1);
> -	}
> -	clear_status();
> -	{
> -		FILE *fp = fopen(proc_policy_self_domain, "r");
> -		memset(self_domain, 0, sizeof(self_domain));
> -		if (!fp || !fgets(self_domain, sizeof(self_domain) - 1, fp) ||
> -		    fclose(fp)) {
> -			fprintf(stderr, "Can't open %s .\n",
> -				proc_policy_self_domain);
> -			exit(1);
> -		}
> -	}
> -	fprintf(domain_fp, "select pid=%u\n", pid);
> -	fprintf(domain_fp, "use_profile 255\n");
> -	fprintf(domain_fp, "allow_read/write /sys/kernel/security/tomoyo/domain_policy\n");
> -	fprintf(domain_fp, "allow_truncate /sys/kernel/security/tomoyo/domain_policy\n");
> -	fprintf(domain_fp, "allow_read/write /sys/kernel/security/tomoyo/exception_policy\n");
> -	fprintf(domain_fp, "allow_truncate /sys/kernel/security/tomoyo/exception_policy\n");
> -	fprintf(domain_fp, "allow_read/write /sys/kernel/security/tomoyo/profile\n");
> -	fprintf(domain_fp, "allow_truncate /sys/kernel/security/tomoyo/profile\n");
> -}
> -
> -static void BUG(const char *fmt, ...)
> -	__attribute__ ((format(printf, 1, 2)));
> -
> -static void BUG(const char *fmt, ...)
> -{
> -	va_list args;
> -	printf("BUG: ");
> -	va_start(args, fmt);
> -	vprintf(fmt, args);
> -	va_end(args);
> -	putchar('\n');
> -	fflush(stdout);
> -	while (1)
> -		sleep(100);
> -}
> -
> -int write_domain_policy(const char *policy, int is_delete)
> -{
> -	FILE *fp = fopen(proc_policy_domain_policy, "r");
> -	char buffer[8192];
> -	int domain_found = 0;
> -	int policy_found = 0;
> -	memset(buffer, 0, sizeof(buffer));
> -	if (!fp) {
> -		BUG("Can't read %s", proc_policy_domain_policy);
> -		return 0;
> -	}
> -	if (is_delete)
> -		fprintf(domain_fp, "delete ");
> -	fprintf(domain_fp, "%s\n", policy);
> -	while (fgets(buffer, sizeof(buffer) - 1, fp)) {
> -		char *cp = strchr(buffer, '\n');
> -		if (cp)
> -			*cp = '\0';
> -		if (!strncmp(buffer, "<kernel>", 8))
> -			domain_found = !strcmp(self_domain, buffer);
> -		if (!domain_found)
> -			continue;
> -		/* printf("<%s>\n", buffer); */
> -		if (strcmp(buffer, policy))
> -			continue;
> -		policy_found = 1;
> -		break;
> -	}
> -	fclose(fp);
> -	if (policy_found == is_delete) {
> -		BUG("Can't %s %s", is_delete ? "delete" : "append",
> -		    policy);
> -		return 0;
> -	}
> -	errno = 0;
> -	return 1;
> -
> -}
> -
> -int write_exception_policy(const char *policy, int is_delete)
> -{
> -	FILE *fp = fopen(proc_policy_exception_policy, "r");
> -	char buffer[8192];
> -	int policy_found = 0;
> -	memset(buffer, 0, sizeof(buffer));
> -	if (!fp) {
> -		BUG("Can't read %s", proc_policy_exception_policy);
> -		return 0;
> -	}
> -	if (is_delete)
> -		fprintf(exception_fp, "delete ");
> -	fprintf(exception_fp, "%s\n", policy);
> -	while (fgets(buffer, sizeof(buffer) - 1, fp)) {
> -		char *cp = strchr(buffer, '\n');
> -		if (cp)
> -			*cp = '\0';
> -		if (strcmp(buffer, policy))
> -			continue;
> -		policy_found = 1;
> -		break;
> -	}
> -	fclose(fp);
> -	if (policy_found == is_delete) {
> -		BUG("Can't %s %s", is_delete ? "delete" : "append",
> -		    policy);
> -		return 0;
> -	}
> -	errno = 0;
> -	return 1;
> -
> -}
> -
> -int set_profile(const int mode, const char *name)
> -{
> -	static const char *modes[4] = { "disabled", "learning", "permissive",
> -					"enforcing" };
> -	FILE *fp = fopen(proc_policy_profile, "r");
> -	char buffer[8192];
> -	int policy_found = 0;
> -	const int len = strlen(name);
> -	if (!fp) {
> -		BUG("Can't read %s", proc_policy_profile);
> -		return 0;
> -	}
> -	fprintf(profile_fp, "255-CONFIG::%s=%s\n", name, modes[mode]);
> -	while (memset(buffer, 0, sizeof(buffer)),
> -	       fgets(buffer, sizeof(buffer) - 1, fp)) {
> -		char *cp = strchr(buffer, '\n');
> -		if (cp)
> -			*cp = '\0';
> -		if (strncmp(buffer, "255-CONFIG::", 12) ||
> -		    strncmp(buffer + 12, name, len) ||
> -		    buffer[12 + len] != '=')
> -			continue;
> -		if (strstr(buffer + 13 + len, modes[mode]))
> -			policy_found = 1;
> -		break;
> -	}
> -	fclose(fp);
> -	if (!policy_found) {
> -		BUG("Can't change profile to 255-CONFIG::%s=%s",
> -		    name, modes[mode]);
> -		return 0;
> -	}
> -	errno = 0;
> -	return 1;
> -}
> diff --git a/testcases/kernel/security/tomoyo/newns.c b/testcases/kernel/security/tomoyo/newns.c
> deleted file mode 100644
> index f888ca31f..000000000
> --- a/testcases/kernel/security/tomoyo/newns.c
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -/******************************************************************************/
> -/*                                                                            */
> -/* Copyright (c) Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, 2009      */
> -/*                                                                            */
> -/* This program is free software;  you can redistribute it and/or modify      */
> -/* it under the terms of the GNU General Public License as published by       */
> -/* the Free Software Foundation; either version 2 of the License, or          */
> -/* (at your option) any later version.                                        */
> -/*                                                                            */
> -/* This program is distributed in the hope that it will be useful,            */
> -/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
> -/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
> -/* the GNU General Public License for more details.                           */
> -/*                                                                            */
> -/* You should have received a copy of the GNU General Public License          */
> -/* along with this program;  if not, write to the Free Software               */
> -/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
> -/*                                                                            */
> -/******************************************************************************/
> -
> -#define _GNU_SOURCE
> -
> -#include <stdio.h>
> -#include <sys/types.h>
> -#include <sys/wait.h>
> -#include <sys/mount.h>
> -#include <unistd.h>
> -#include <sched.h>
> -#include <errno.h>
> -#include <stdlib.h>
> -#include "test.h"
> -
> -static int child(void *arg)
> -{
> -	char **argv = (char **)arg;
> -	argv++;
> -	mount("/tmp/", "/tmp/", "tmpfs", 0, NULL);
> -	execvp(argv[0], argv);
> -	_exit(1);
> -}
> -
> -int main(int argc, char *argv[])
> -{
> -	char c = 0;
> -	const pid_t pid = ltp_clone_quick(CLONE_NEWNS, child, (void *)argv);
> -	while (waitpid(pid, NULL, __WALL) == EOF && errno == EINTR)
> -		c++;		/* Dummy. */
> -	return 0;
> -}
> diff --git a/testcases/kernel/security/tomoyo/testall.sh b/testcases/kernel/security/tomoyo/testall.sh
> deleted file mode 100644
> index b103be6c6..000000000
> --- a/testcases/kernel/security/tomoyo/testall.sh
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -#! /bin/sh
> -################################################################################
> -##                                                                            ##
> -## Copyright (c) Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, 2009      ##
> -##                                                                            ##
> -## This program is free software;  you can redistribute it and#or modify      ##
> -## it under the terms of the GNU General Public License as published by       ##
> -## the Free Software Foundation; either version 2 of the License, or          ##
> -## (at your option) any later version.                                        ##
> -##                                                                            ##
> -## This program is distributed in the hope that it will be useful, but        ##
> -## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
> -## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
> -## for more details.                                                          ##
> -##                                                                            ##
> -## You should have received a copy of the GNU General Public License          ##
> -## along with this program;  if not, write to the Free Software               ##
> -## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    ##
> -##                                                                            ##
> -################################################################################
> -
> -cd ${0%/*}
> -export PATH=$PWD:${PATH}
> -
> -echo "Testing all. (All results are reported)"
> -newns tomoyo_accept_test
> -newns tomoyo_filesystem_test
> -newns tomoyo_file_test
> -newns tomoyo_rewrite_test
> -newns tomoyo_new_file_test
> -newns tomoyo_new_test
> -echo
> -echo
> -echo
> -echo "Testing all. (Only ERRORS are reported)"
> -newns tomoyo_accept_test | grep -vF Done
> -newns tomoyo_filesystem_test | grep -vF OK | grep -F '('
> -newns tomoyo_file_test | grep -vF OK | grep -F '('
> -newns tomoyo_rewrite_test | grep -vF OK | grep -F '('
> -newns tomoyo_new_test | grep -vF OK
> -echo
> -echo
> -echo
> -echo "Testing policy I/O.  (Only ERRORS are reported)"
> -newns tomoyo_policy_io_test | grep -vF OK
> -newns tomoyo_new_file_test | grep -vF OK
> diff --git a/testcases/kernel/security/tomoyo/tomoyo_accept_test.c b/testcases/kernel/security/tomoyo/tomoyo_accept_test.c
> deleted file mode 100644
> index 335818a25..000000000
> --- a/testcases/kernel/security/tomoyo/tomoyo_accept_test.c
> +++ /dev/null
> @@ -1,146 +0,0 @@
> -/******************************************************************************/
> -/* This program is free software;  you can redistribute it and/or modify      */
> -/* it under the terms of the GNU General Public License as published by       */
> -/* the Free Software Foundation; either version 2 of the License, or          */
> -/* (at your option) any later version.                                        */
> -/*                                                                            */
> -/* This program is distributed in the hope that it will be useful,            */
> -/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
> -/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
> -/* the GNU General Public License for more details.                           */
> -/*                                                                            */
> -/* You should have received a copy of the GNU General Public License          */
> -/* along with this program;  if not, write to the Free Software               */
> -/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
> -/*                                                                            */
> -/******************************************************************************/
> -/*
> - * tomoyo_accept_test.c
> - *
> - * Testing program for security/tomoyo/
> - *
> - * Copyright (C) 2005-2010  NTT DATA CORPORATION
> - */
> -#include "include.h"
> -
> -static void set_level(const int i)
> -{
> -	set_profile(i, "file::execute");
> -	set_profile(i, "file::open");
> -	set_profile(i, "file::create");
> -	set_profile(i, "file::unlink");
> -	set_profile(i, "file::mkdir");
> -	set_profile(i, "file::rmdir");
> -	set_profile(i, "file::mkfifo");
> -	set_profile(i, "file::mksock");
> -	set_profile(i, "file::truncate");
> -	set_profile(i, "file::symlink");
> -	set_profile(i, "file::rewrite");
> -	set_profile(i, "file::mkblock");
> -	set_profile(i, "file::mkchar");
> -	set_profile(i, "file::link");
> -	set_profile(i, "file::rename");
> -	set_profile(i, "file::chmod");
> -	set_profile(i, "file::chown");
> -	set_profile(i, "file::chgrp");
> -	set_profile(i, "file::ioctl");
> -	set_profile(i, "file::chroot");
> -	set_profile(i, "file::mount");
> -	set_profile(i, "file::umount");
> -	set_profile(i, "file::pivot_root");
> -}
> -
> -static void test(int rw_loop, int truncate_loop, int append_loop,
> -		 int create_loop)
> -{
> -	static const int rw_flags[4] = { 0, O_RDONLY, O_WRONLY, O_RDWR };
> -	static const int create_flags[3] = { 0, O_CREAT /* nonexistent */ ,
> -		O_CREAT /* existent */
> -	};
> -	static const int truncate_flags[2] = { 0, O_TRUNC };
> -	static const int append_flags[2] = { 0, O_APPEND };
> -	int level;
> -	int flags;
> -	int i;
> -	int fd;
> -	static char buffer[1024];
> -	memset(buffer, 0, sizeof(buffer));
> -	snprintf(buffer, sizeof(buffer) - 1, "/tmp/file:a=%d:t=%d:c=%d:m=%d",
> -		 append_loop, truncate_loop, create_loop, rw_loop);
> -	fprintf(exception_fp, "deny_rewrite %s\n", buffer);
> -	flags = rw_flags[rw_loop] | truncate_flags[truncate_loop] |
> -	    append_flags[append_loop] | create_flags[create_loop];
> -	for (i = 1; i < 8; i++)
> -		fprintf(domain_fp, "delete %d %s\n", i, buffer);
> -	for (level = 0; level < 4; level++) {
> -		set_level(0);
> -		if (create_loop == 1)
> -			unlink(buffer);
> -		else
> -			close(open(buffer, O_CREAT, 0644));
> -		set_level(level);
> -		fd = open(buffer, flags, 0644);
> -		if (fd != EOF)
> -			close(fd);
> -		else
> -			fprintf(stderr, "%d: open(%04o) failed\n", level,
> -				flags);
> -		/*
> -		   fd = open(buffer, flags, 0644)
> -		   if (fd != EOF)
> -		   close(fd);
> -		   else
> -		   fprintf(stderr, "%d: open(%04o) failed\n", level, flags);
> -		 */
> -		/*
> -		   fd = open(buffer, flags, 0644);
> -		   if (fd != EOF)
> -		   close(fd);
> -		   else
> -		   fprintf(stderr, "%d: open(%04o) failed\n", level, flags);
> -		 */
> -	}
> -	for (i = 1; i < 8; i++)
> -		fprintf(domain_fp, "delete %d %s\n", i, buffer);
> -	fprintf(domain_fp, "delete allow_truncate %s\n", buffer);
> -	fprintf(domain_fp, "delete allow_create %s 0644\n", buffer);
> -	fprintf(domain_fp, "delete allow_rewrite %s\n", buffer);
> -	fd = open(buffer, flags, 0644);
> -	if (fd != EOF) {
> -		close(fd);
> -		fprintf(stderr, "%d: open(%04o) didn't fail\n", 3, flags);
> -	}
> -}
> -
> -int main(void)
> -{
> -	tomoyo_test_init();
> -	fprintf(profile_fp, "255-PREFERENCE::learning={ verbose=no }\n");
> -	fprintf(profile_fp, "255-PREFERENCE::enforcing={ verbose=no }\n");
> -	fprintf(profile_fp, "255-PREFERENCE::permissive={ verbose=no }\n");
> -	fprintf(profile_fp, "255-PREFERENCE::disabled={ verbose=no }\n");
> -	set_profile(0, "file");
> -	fprintf(profile_fp, "255-PREFERENCE::learning={ max_entry=2048 }\n");
> -	{
> -		int append_loop;
> -		for (append_loop = 0; append_loop < 2; append_loop++) {
> -			int truncate_loop;
> -			for (truncate_loop = 0; truncate_loop < 2;
> -			     truncate_loop++) {
> -				int create_loop;
> -				for (create_loop = 0; create_loop < 3;
> -				     create_loop++) {
> -					int rw_loop;
> -					for (rw_loop = 0; rw_loop < 4;
> -					     rw_loop++)
> -						test(rw_loop, truncate_loop,
> -						     append_loop, create_loop);
> -				}
> -			}
> -		}
> -	}
> -	fprintf(profile_fp, "255-CONFIG::file=disabled\n");
> -	printf("Done\n");
> -	clear_status();
> -	return 0;
> -}
> diff --git a/testcases/kernel/security/tomoyo/tomoyo_file_test.c b/testcases/kernel/security/tomoyo/tomoyo_file_test.c
> deleted file mode 100644
> index 003f47720..000000000
> --- a/testcases/kernel/security/tomoyo/tomoyo_file_test.c
> +++ /dev/null
> @@ -1,304 +0,0 @@
> -/******************************************************************************/
> -/* This program is free software;  you can redistribute it and/or modify      */
> -/* it under the terms of the GNU General Public License as published by       */
> -/* the Free Software Foundation; either version 2 of the License, or          */
> -/* (at your option) any later version.                                        */
> -/*                                                                            */
> -/* This program is distributed in the hope that it will be useful,            */
> -/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
> -/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
> -/* the GNU General Public License for more details.                           */
> -/*                                                                            */
> -/* You should have received a copy of the GNU General Public License          */
> -/* along with this program;  if not, write to the Free Software               */
> -/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
> -/*                                                                            */
> -/******************************************************************************/
> -/*
> - * tomoyo_file_test.c
> - *
> - * Testing program for security/tomoyo/
> - *
> - * Copyright (C) 2005-2010  NTT DATA CORPORATION
> - */
> -#include "include.h"
> -
> -static int should_fail = 0;
> -
> -static void show_prompt(const char *str)
> -{
> -	printf("Testing %35s: (%s) ", str,
> -	       should_fail ? "must fail" : "should success");
> -	errno = 0;
> -}
> -
> -static void show_result(int result)
> -{
> -	if (should_fail) {
> -		if (result == EOF) {
> -			if (errno == EPERM)
> -				printf("OK: Permission denied.\n");
> -			else
> -				printf("FAILED: %s\n", strerror(errno));
> -		} else {
> -			printf("BUG!\n");
> -		}
> -	} else {
> -		if (result != EOF)
> -			printf("OK\n");
> -		else
> -			printf("%s\n", strerror(errno));
> -	}
> -}
> -
> -static const char *dev_null_path = "/dev/null";
> -static const char *truncate_path = "/tmp/truncate_test";
> -static const char *ftruncate_path = "/tmp/ftruncate_test";
> -static const char *open_creat_path = "/tmp/open_test";
> -static const char *mknod_reg_path = "/tmp/mknod_reg_test";
> -static const char *mknod_chr_path = "/tmp/mknod_chr_test";
> -static const char *mknod_blk_path = "/tmp/mknod_blk_test";
> -static const char *mknod_fifo_path = "/tmp/mknod_fifo_test";
> -static const char *mknod_sock_path = "/tmp/mknod_sock_test";
> -static const char *unlink_path = "/tmp/unlink_test";
> -static const char *mkdir_path = "/tmp/mkdir_test";
> -static const char *rmdir_path = "/tmp/rmdir_test";
> -static const char *link_source_path = "/tmp/link_source_test";
> -static const char *link_dest_path = "/tmp/link_dest_test";
> -static const char *symlink_source_path = "/tmp/symlink_source_test";
> -static const char *symlink_dest_path = "/tmp/symlink_dest_test";
> -static const char *rename_source_path = "/tmp/rename_source_test";
> -static const char *rename_dest_path = "/tmp/rename_dest_test";
> -static const char *socket_path = "/tmp/socket_test";
> -
> -static int ftruncate_fd = EOF;
> -
> -static void stage_file_test(void)
> -{
> -	int fd;
> -	{
> -		const char buffer[] = "32768 61000";
> -		show_prompt("sysctl(READ)");
> -		show_result(read_sysctl(TEST_SYSCTL_PATH, NULL, 0));
> -		show_prompt("sysctl(WRITE)");
> -		show_result(write_sysctl(TEST_SYSCTL_PATH, buffer));
> -	}
> -
> -	/* QUESTION: Is there a file which can be passed to uselib()? */
> -	show_prompt("uselib()");
> -	show_result(uselib("/bin/true"));
> -
> -	{
> -		int pipe_fd[2] = { EOF, EOF };
> -		int error = 0;
> -		fflush(stdout);
> -		fflush(stderr);
> -		if (pipe(pipe_fd) == -1)
> -			err(1, "pipe");
> -		if (fork() == 0) {
> -			execl("/bin/true", "/bin/true", NULL);
> -			if (write(pipe_fd[1], &errno, sizeof(errno)) == -1)
> -				err(1, "write");
> -			_exit(0);
> -		}
> -		close(pipe_fd[1]);
> -		(void)read(pipe_fd[0], &error, sizeof(error));
> -		show_prompt("execve()");
> -		errno = error;
> -		show_result(error ? EOF : 0);
> -	}
> -
> -	show_prompt("open(O_RDONLY)");
> -	fd = open(dev_null_path, O_RDONLY);
> -	show_result(fd);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	show_prompt("open(O_WRONLY)");
> -	fd = open(dev_null_path, O_WRONLY);
> -	show_result(fd);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	show_prompt("open(O_RDWR)");
> -	fd = open(dev_null_path, O_RDWR);
> -	show_result(fd);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	show_prompt("open(O_CREAT | O_EXCL)");
> -	fd = open(open_creat_path, O_CREAT | O_EXCL, 0666);
> -	show_result(fd);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	show_prompt("open(O_TRUNC)");
> -	fd = open(truncate_path, O_TRUNC);
> -	show_result(fd);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	show_prompt("truncate()");
> -	show_result(truncate(truncate_path, 0));
> -
> -	show_prompt("ftruncate()");
> -	show_result(ftruncate(ftruncate_fd, 0));
> -
> -	show_prompt("mknod(S_IFREG)");
> -	show_result(mknod(mknod_reg_path, S_IFREG, 0));
> -
> -	show_prompt("mknod(S_IFCHR)");
> -	show_result(mknod(mknod_chr_path, S_IFCHR, MKDEV(1, 3)));
> -
> -	show_prompt("mknod(S_IFBLK)");
> -	show_result(mknod(mknod_blk_path, S_IFBLK, MKDEV(1, 0)));
> -
> -	show_prompt("mknod(S_IFIFO)");
> -	show_result(mknod(mknod_fifo_path, S_IFIFO, 0));
> -
> -	show_prompt("mknod(S_IFSOCK)");
> -	show_result(mknod(mknod_sock_path, S_IFSOCK, 0));
> -
> -	show_prompt("mkdir()");
> -	show_result(mkdir(mkdir_path, 0600));
> -
> -	show_prompt("rmdir()");
> -	show_result(rmdir(rmdir_path));
> -
> -	show_prompt("unlink()");
> -	show_result(unlink(unlink_path));
> -
> -	show_prompt("symlink()");
> -	show_result(symlink(symlink_dest_path, symlink_source_path));
> -
> -	show_prompt("link()");
> -	show_result(link(link_source_path, link_dest_path));
> -
> -	show_prompt("rename()");
> -	show_result(rename(rename_source_path, rename_dest_path));
> -
> -	{
> -		struct sockaddr_un addr;
> -		int fd;
> -		memset(&addr, 0, sizeof(addr));
> -		addr.sun_family = AF_UNIX;
> -		strncpy(addr.sun_path, socket_path, sizeof(addr.sun_path) - 1);
> -		fd = socket(AF_UNIX, SOCK_STREAM, 0);
> -		show_prompt("unix_bind()");
> -		show_result(bind(fd, (struct sockaddr *)&addr, sizeof(addr)));
> -		if (fd != EOF)
> -			close(fd);
> -	}
> -
> -	printf("\n\n");
> -}
> -
> -static void create_files(void)
> -{
> -	mkdir(rmdir_path, 0700);
> -	close(creat(link_source_path, 0600));
> -	close(creat(rename_source_path, 0600));
> -	close(creat(truncate_path, 0600));
> -	close(creat(unlink_path, 0600));
> -	ftruncate_fd = open(ftruncate_path, O_WRONLY | O_CREAT, 0600);
> -}
> -
> -static void creanup_files(void)
> -{
> -	if (ftruncate_fd != EOF)
> -		close(ftruncate_fd);
> -	ftruncate_fd = EOF;
> -	unlink(open_creat_path);
> -	unlink(mknod_reg_path);
> -	unlink(mknod_chr_path);
> -	unlink(mknod_blk_path);
> -	unlink(mknod_fifo_path);
> -	unlink(mknod_sock_path);
> -	rmdir(mkdir_path);
> -	unlink(symlink_source_path);
> -	unlink(symlink_dest_path);
> -	unlink(link_source_path);
> -	unlink(link_dest_path);
> -	unlink(rename_source_path);
> -	unlink(rename_dest_path);
> -	unlink(truncate_path);
> -	unlink(ftruncate_path);
> -	unlink(socket_path);
> -}
> -
> -static void set_file_enforce(int enforce)
> -{
> -	if (enforce) {
> -		set_profile(3, "file::execute");
> -		set_profile(3, "file::open");
> -		set_profile(3, "file::create");
> -		set_profile(3, "file::unlink");
> -		set_profile(3, "file::mkdir");
> -		set_profile(3, "file::rmdir");
> -		set_profile(3, "file::mkfifo");
> -		set_profile(3, "file::mksock");
> -		set_profile(3, "file::truncate");
> -		set_profile(3, "file::symlink");
> -		set_profile(3, "file::rewrite");
> -		set_profile(3, "file::mkblock");
> -		set_profile(3, "file::mkchar");
> -		set_profile(3, "file::link");
> -		set_profile(3, "file::rename");
> -		set_profile(3, "file::chmod");
> -		set_profile(3, "file::chown");
> -		set_profile(3, "file::chgrp");
> -		set_profile(3, "file::ioctl");
> -		set_profile(3, "file::chroot");
> -		set_profile(3, "file::mount");
> -		set_profile(3, "file::umount");
> -		set_profile(3, "file::pivot_root");
> -	} else {
> -		set_profile(0, "file::execute");
> -		set_profile(0, "file::open");
> -		set_profile(0, "file::create");
> -		set_profile(0, "file::unlink");
> -		set_profile(0, "file::mkdir");
> -		set_profile(0, "file::rmdir");
> -		set_profile(0, "file::mkfifo");
> -		set_profile(0, "file::mksock");
> -		set_profile(0, "file::truncate");
> -		set_profile(0, "file::symlink");
> -		set_profile(0, "file::rewrite");
> -		set_profile(0, "file::mkblock");
> -		set_profile(0, "file::mkchar");
> -		set_profile(0, "file::link");
> -		set_profile(0, "file::rename");
> -		set_profile(0, "file::chmod");
> -		set_profile(0, "file::chown");
> -		set_profile(0, "file::chgrp");
> -		set_profile(0, "file::ioctl");
> -		set_profile(0, "file::chroot");
> -		set_profile(0, "file::mount");
> -		set_profile(0, "file::umount");
> -		set_profile(0, "file::pivot_root");
> -	}
> -}
> -
> -int main(void)
> -{
> -	tomoyo_test_init();
> -
> -	printf("***** Testing file hooks in enforce mode. *****\n");
> -	create_files();
> -	should_fail = 1;
> -	set_file_enforce(1);
> -	stage_file_test();
> -	set_file_enforce(0);
> -	clear_status();
> -	creanup_files();
> -
> -	printf("***** Testing file hooks in permissive mode. *****\n");
> -	should_fail = 0;
> -	create_files();
> -	set_file_enforce(0);
> -	stage_file_test();
> -	creanup_files();
> -
> -	clear_status();
> -	return 0;
> -}
> diff --git a/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c b/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c
> deleted file mode 100644
> index e6e3bb087..000000000
> --- a/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c
> +++ /dev/null
> @@ -1,633 +0,0 @@
> -/******************************************************************************/
> -/* This program is free software;  you can redistribute it and/or modify      */
> -/* it under the terms of the GNU General Public License as published by       */
> -/* the Free Software Foundation; either version 2 of the License, or          */
> -/* (at your option) any later version.                                        */
> -/*                                                                            */
> -/* This program is distributed in the hope that it will be useful,            */
> -/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
> -/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
> -/* the GNU General Public License for more details.                           */
> -/*                                                                            */
> -/* You should have received a copy of the GNU General Public License          */
> -/* along with this program;  if not, write to the Free Software               */
> -/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
> -/*                                                                            */
> -/******************************************************************************/
> -/*
> - * tomoyo_filesystem_test.c
> - *
> - * Testing program for security/tomoyo/
> - *
> - * Copyright (C) 2005-2010  NTT DATA CORPORATION
> - */
> -#define _GNU_SOURCE
> -#include "include.h"
> -
> -static void show_prompt(const char *str, const int should_fail)
> -{
> -	printf("Testing %60s: (%s) ", str,
> -	       should_fail ? "must fail" : "should success");
> -	errno = 0;
> -}
> -
> -#ifndef MS_MOVE
> -#define MS_MOVE         8192
> -#endif
> -
> -static const char *pivot_root_dir = "/sys/kernel/security/";
> -
> -static int child(void *arg)
> -{
> -	errno = 0;
> -	pivot_root(pivot_root_dir, proc_policy_dir);
> -	return errno;
> -}
> -
> -static void mount2(const char *source, const char *target,
> -		   const char *filesystemtype)
> -{
> -	if (mount(source, target, filesystemtype, 0, NULL)) {
> -		printf("BUG: mount() failed\n");
> -		fflush(stdout);
> -	}
> -}
> -
> -static const unsigned char compressed_ext2_image_sample[1350] = {
> -	0x1F, 0x8B, 0x08, 0x00, 0xA8, 0xF2, 0x96, 0x4B, 0x02, 0x03, 0xED, 0xDC,
> -	0x3D, 0x4B, 0x5B, 0x51, 0x18, 0x07, 0xF0, 0xE7, 0xDE, 0xAB, 0x14, 0x8C,
> -	0xAB, 0xD5, 0x9A, 0xF8, 0x36, 0x0B, 0xA1, 0xE0, 0xE0, 0xDC, 0xD0, 0xAD,
> -	0xD0, 0xC5, 0xAF, 0x50, 0x9C, 0x42, 0x1D, 0x6A, 0xE6, 0xA6, 0x9B, 0x9B,
> -	0x8B, 0xD8, 0xA5, 0x5B, 0x97, 0x2E, 0xF9, 0x0E, 0x85, 0x4C, 0xF6, 0x23,
> -	0x74, 0x70, 0x55, 0x28, 0x52, 0xA8, 0xDD, 0xED, 0xB9, 0xB9, 0xB1, 0xA6,
> -	0xEA, 0x24, 0xA5, 0x81, 0xDE, 0xDF, 0x0F, 0x9E, 0xDC, 0xB7, 0x13, 0x2E,
> -	0xF7, 0xC0, 0xFF, 0x70, 0xCE, 0x85, 0x24, 0x02, 0xA8, 0xAB, 0x7E, 0xF9,
> -	0x31, 0x13, 0xB1, 0x95, 0x36, 0xA7, 0x45, 0x44, 0x2F, 0x6D, 0xB3, 0xC9,
> -	0x06, 0xEB, 0x55, 0xF5, 0xC7, 0x87, 0x9F, 0x7E, 0x1C, 0xBF, 0x88, 0x68,
> -	0xC5, 0xCE, 0xF7, 0x6C, 0xD4, 0x6E, 0x74, 0xFC, 0xF2, 0x62, 0x74, 0xED,
> -	0xFA, 0x7B, 0x8D, 0xB8, 0x69, 0x9F, 0x8F, 0xCF, 0x9F, 0x1D, 0x7E, 0x78,
> -	0xF7, 0x6D, 0xD8, 0x79, 0xFF, 0x71, 0xD0, 0xED, 0xBC, 0xCD, 0x9A, 0xBD,
> -	0x69, 0x3C, 0xEB, 0xE0, 0xCB, 0xF0, 0xA4, 0xF9, 0xF5, 0xF9, 0xCA, 0xE0,
> -	0xE0, 0x72, 0xBB, 0x7B, 0xD4, 0x1A, 0xE6, 0x13, 0xD7, 0xAA, 0xE7, 0x82,
> -	0x7A, 0x29, 0xAA, 0xF8, 0xC7, 0xEC, 0x28, 0xFF, 0xBD, 0xC8, 0x75, 0x09,
> -	0xD4, 0xC6, 0x55, 0x92, 0x4D, 0x71, 0xFA, 0x71, 0x05, 0x4C, 0xCF, 0xA3,
> -	0xBB, 0xE3, 0x01, 0x50, 0x0F, 0x93, 0xEB, 0xDF, 0xEB, 0xFA, 0x97, 0x13,
> -	0x80, 0x8B, 0x67, 0xD5, 0x02, 0xE4, 0xEE, 0xFD, 0x8B, 0x3F, 0xD6, 0x22,
> -	0x0B, 0xA6, 0x6A, 0xC0, 0x5F, 0xF6, 0xB9, 0x1C, 0x7F, 0x9E, 0xDE, 0x37,
> -	0xFE, 0xE4, 0xB1, 0x34, 0xD1, 0xEE, 0x71, 0xAA, 0xC5, 0x54, 0xE5, 0xB9,
> -	0x27, 0xA9, 0x96, 0x53, 0x35, 0xA3, 0x7C, 0x13, 0x1A, 0xB1, 0x92, 0x6A,
> -	0x35, 0xD5, 0xDA, 0xF8, 0x75, 0xE9, 0x86, 0x6E, 0x05, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x81,
> -	0xCA, 0xDF, 0xD8, 0xCF, 0x47, 0x96, 0xB7, 0x7F, 0xEF, 0xE7, 0x79, 0xBB,
> -	0x5D, 0xFD, 0x87, 0xDF, 0x79, 0x31, 0x97, 0x77, 0xF7, 0xDE, 0xEC, 0x6F,
> -	0xEE, 0xEE, 0xF5, 0x5E, 0xBF, 0xD2, 0x57, 0xF0, 0xBF, 0x69, 0xDC, 0xCA,
> -	0xFF, 0xCF, 0xA2, 0xCA, 0x3F, 0x50, 0x13, 0x33, 0xBA, 0x00, 0xE4, 0x1F,
> -	0x90, 0x7F, 0x40, 0xFE, 0x01, 0xF9, 0x07, 0xE4, 0x1F, 0x90, 0x7F, 0x40,
> -	0xFE, 0x01, 0xF9, 0x07, 0xE4, 0x1F, 0x90, 0x7F, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xFA, 0xF9, 0x05, 0x34, 0xF2,
> -	0x14, 0x08, 0x00, 0x00, 0x10, 0x00
> -};
> -
> -int main(void)
> -{
> -	char c = 0;
> -	tomoyo_test_init();
> -
> -	/* Test mount(). */
> -	{
> -		set_profile(3, "file::mount");
> -		show_prompt("mount('dev\\011name', '/', 'fs\\011name') ", 1);
> -		if (mount("dev\tname", "/", "fs\tname", 0, NULL) == EOF &&
> -		    errno == EPERM)
> -			printf("OK: Permission denied.\n");
> -		else if (errno == ENODEV)
> -			printf("OK: No such device.\n");
> -		else
> -			printf("BUG: %s\n", strerror(errno));
> -		set_profile(1, "file::mount");
> -		show_prompt("mount('dev\\011name', '/', 'fs\\011name') ", 0);
> -		if (mount("dev\tname", "/", "fs\tname", 0, NULL) == EOF &&
> -		    errno == ENOMEM)
> -			printf("OK: Out of memory.\n");
> -		else if (errno == ENODEV)
> -			printf("OK: No such device.\n");
> -		else
> -			printf("BUG: %s\n", strerror(errno));
> -		set_profile(3, "file::mount");
> -		show_prompt("mount('dev\\011name', '/', 'fs\\011name') ", 0);
> -		if (mount("dev\tname", "/", "fs\tname", 0, NULL) == EOF &&
> -		    errno == ENOMEM)
> -			printf("OK: Out of memory.\n");
> -		else if (errno == ENODEV)
> -			printf("OK: No such device.\n");
> -		else
> -			printf("BUG: %s\n", strerror(errno));
> -		fprintf(domain_fp, "delete allow_mount dev\\011name / "
> -			"fs\\011name 0\n");
> -		show_prompt("mount('dev\\011name', '/', 'fs\\011name') ", 1);
> -		if (mount("dev\tname", "/", "fs\tname", 0, NULL) == EOF &&
> -		    errno == EPERM)
> -			printf("OK: Permission denied.\n");
> -		else if (errno == ENODEV)
> -			printf("OK: No such device.\n");
> -		else
> -			printf("BUG: %s\n", strerror(errno));
> -		set_profile(1, "file::mount");
> -		show_prompt("mount(NULL, '/', 'tmpfs') ", 0);
> -		if (mount(NULL, "/", "tmpfs", 0, NULL))
> -			printf("BUG: %s\n", strerror(errno));
> -		else
> -			printf("OK: Success\n");
> -		set_profile(3, "file::mount");
> -		show_prompt("mount(NULL, '/', 'tmpfs') ", 0);
> -		if (mount(NULL, "/", "tmpfs", 0, NULL))
> -			printf("BUG: %s\n", strerror(errno));
> -		else
> -			printf("OK: Success\n");
> -		show_prompt("mount('anydev', '/', 'tmpfs') ", 0);
> -		if (mount("anydev", "/", "tmpfs", 0, NULL))
> -			printf("BUG: %s\n", strerror(errno));
> -		else
> -			printf("OK: Success\n");
> -		fprintf(domain_fp, "delete allow_mount <NULL> / tmpfs 0\n");
> -		fprintf(domain_fp, "allow_mount anydev / tmpfs 0\n");
> -		show_prompt("mount(NULL, '/', 'tmpfs') ", 0);
> -		if (mount(NULL, "/", "tmpfs", 0, NULL))
> -			printf("BUG: %s\n", strerror(errno));
> -		else
> -			printf("OK: Success\n");
> -		fprintf(domain_fp, "delete allow_mount anydev / tmpfs 0\n");
> -		set_profile(2, "file::mount");
> -		show_prompt("mount(NULL, NULL, 'tmpfs') ", 1);
> -		if (mount(NULL, NULL, "tmpfs", 0, NULL))
> -			printf("OK: %s\n", strerror(errno));
> -		else
> -			printf("BUG: Did not fail.\n");
> -		show_prompt("mount(NULL, NULL, NULL) ", 1);
> -		if (mount(NULL, NULL, NULL, 0, NULL))
> -			printf("OK: %s\n", strerror(errno));
> -		else
> -			printf("BUG: Did not fail.\n");
> -		show_prompt("mount('/', NULL, NULL) ", 1);
> -		if (mount("/", NULL, NULL, 0, NULL))
> -			printf("OK: %s\n", strerror(errno));
> -		else
> -			printf("BUG: Did not fail.\n");
> -		show_prompt("mount('/', NULL, 'tmpfs') ", 1);
> -		if (mount("/", NULL, "tmpfs", 0, NULL))
> -			printf("OK: %s\n", strerror(errno));
> -		else
> -			printf("BUG: Did not fail.\n");
> -		show_prompt("mount('/', '/', 'nonexistentfs') ", 1);
> -		if (mount("/", "/", "nonexistentfs", 0, NULL))
> -			printf("OK: %s\n", strerror(errno));
> -		else
> -			printf("BUG: Did not fail.\n");
> -		set_profile(0, "file::mount");
> -	}
> -
> -	mkdir("/tmp/mount/", 0755);
> -	mkdir("/tmp/mount_bind/", 0755);
> -	mkdir("/tmp/mount_move/", 0755);
> -
> -	/* Test mount(). */
> -	{
> -		static char buf[4096];
> -		char *dev_ram_path = realpath("/dev/ram0", NULL);
> -		if (!dev_ram_path)
> -			dev_ram_path = realpath("/dev/ram", NULL);
> -		if (!dev_ram_path) {
> -			dev_ram_path = "/dev/ram0";
> -			mknod(dev_ram_path, S_IFBLK, MKDEV(1, 0));
> -		}
> -		memset(buf, 0, sizeof(buf));
> -		{
> -			struct stat sbuf;
> -			FILE *fp = NULL;
> -			snprintf(buf, sizeof(buf) - 1, "zcat - > %s",
> -				 dev_ram_path);
> -			if (lstat(dev_ram_path, &sbuf) == 0 &&
> -			    S_ISBLK(sbuf.st_mode) && MAJOR(sbuf.st_rdev) == 1)
> -				fp = popen(buf, "w");
> -			if (fp) {
> -				if (fwrite(compressed_ext2_image_sample, 1,
> -					   sizeof(compressed_ext2_image_sample),
> -					   fp) !=
> -				    sizeof(compressed_ext2_image_sample))
> -					err(1, "fwrite");
> -				pclose(fp);
> -			} else
> -				fprintf(stderr, "Can't write to %s .\n",
> -					dev_ram_path);
> -		}
> -		set_profile(3, "file::mount");
> -
> -		/* Test standard case */
> -		show_prompt("mount('none', '/tmp/mount/', 'tmpfs') for "
> -			    "'/tmp/mount/'", 1);
> -		if (mount("none", "/tmp/mount/", "tmpfs", 0, NULL) == EOF &&
> -		    errno == EPERM)
> -			printf("OK: Permission denied.\n");
> -		else
> -			printf("BUG: %s\n", strerror(errno));
> -
> -		/* Test device_name with pattern */
> -		snprintf(buf, sizeof(buf) - 1, "mount('%s', '/tmp/mount/', "
> -			 "'ext2') for '%s\\*'", dev_ram_path, dev_ram_path);
> -		show_prompt(buf, 1);
> -		if (mount(dev_ram_path, "/tmp/mount/", "ext2", MS_RDONLY, NULL)
> -		    == EOF && errno == EPERM)
> -			printf("OK: Permission denied.\n");
> -		else
> -			printf("BUG: %s\n", strerror(errno));
> -
> -		/* Test dir_name with pattern */
> -		show_prompt("mount('none', '/tmp/mount/', 'tmpfs') for "
> -			    "'/tmp/\\?\\?\\?\\?\\?/'", 1);
> -		if (mount("none", "/tmp/mount/", "tmpfs", 0, NULL) == EOF &&
> -		    errno == EPERM)
> -			printf("OK: Permission denied.\n");
> -		else
> -			printf("BUG: %s\n", strerror(errno));
> -
> -		/* Test standard case */
> -		fprintf(domain_fp, "allow_mount none /tmp/mount/ tmpfs 0\n");
> -		show_prompt("mount('none', '/tmp/mount/', 'tmpfs') for "
> -			    "'/tmp/mount/'", 0);
> -		if (mount("none", "/tmp/mount/", "tmpfs", 0, NULL) == 0)
> -			printf("OK\n");
> -		else
> -			printf("FAILED: %s\n", strerror(errno));
> -		fprintf(domain_fp,
> -			"delete allow_mount none /tmp/mount/ tmpfs 0\n");
> -
> -		/* Test device_name with pattern */
> -		fprintf(domain_fp, "allow_mount %s\\* /tmp/mount/ ext2 1\n",
> -			dev_ram_path);
> -		snprintf(buf, sizeof(buf) - 1, "mount('%s', '/tmp/mount/', "
> -			 "'ext2') for '%s\\*'", dev_ram_path, dev_ram_path);
> -		show_prompt(buf, 0);
> -		if (mount(dev_ram_path, "/tmp/mount/", "ext2", MS_RDONLY, NULL)
> -		    == 0)
> -			printf("OK\n");
> -		else
> -			printf("FAILED: %s\n", strerror(errno));
> -		fprintf(domain_fp, "delete allow_mount %s\\* "
> -			"/tmp/mount/ ext2 1\n", dev_ram_path);
> -
> -		/* Test dir_name with pattern */
> -		fprintf(domain_fp,
> -			"allow_mount none /tmp/\\?\\?\\?\\?\\?/ tmpfs 0\n");
> -		show_prompt("mount('none', '/tmp/mount/', 'tmpfs') for "
> -			    "'/tmp/\\?\\?\\?\\?\\?/'", 0);
> -		if (mount("none", "/tmp/mount/", "tmpfs", 0, NULL) == 0)
> -			printf("OK\n");
> -		else
> -			printf("FAILED: %s\n", strerror(errno));
> -		fprintf(domain_fp, "delete allow_mount none "
> -			"/tmp/\\?\\?\\?\\?\\?/ tmpfs 0\n");
> -
> -		set_profile(0, "file::mount");
> -		while (umount("/tmp/mount/") == 0)
> -			c++;	/* Dummy. */
> -	}
> -
> -	/* Test mount(). */
> -	{
> -		mount2("none", "/tmp/mount/", "tmpfs");
> -		set_profile(3, "file::mount");
> -
> -		/* Test remount case */
> -		show_prompt("mount('/tmp/mount/', MS_REMOUNT)", 1);
> -		if (mount("none", "/tmp/mount/", "tmpfs", MS_REMOUNT, NULL)
> -		    == EOF && errno == EPERM)
> -			printf("OK: Permission denied.\n");
> -		else
> -			printf("BUG: %s\n", strerror(errno));
> -		show_prompt("mount('/tmp/mount/', MS_REMOUNT)", 1);
> -		if (mount(NULL, "/tmp/mount/", NULL, MS_REMOUNT, NULL) == EOF
> -		    && errno == EPERM)
> -			printf("OK: Permission denied.\n");
> -		else
> -			printf("BUG: %s\n", strerror(errno));
> -		fprintf(domain_fp, "allow_mount something /tmp/mount/ "
> -			"--remount 0\n");
> -		show_prompt("mount('/tmp/mount/', MS_REMOUNT)", 0);
> -		if (mount(NULL, "/tmp/mount/", NULL, MS_REMOUNT, NULL))
> -			printf("BUG: %s\n", strerror(errno));
> -		else
> -			printf("OK: Success.\n");
> -		fprintf(domain_fp, "delete allow_mount something /tmp/mount/ "
> -			"--remount 0\n");
> -
> -		/* Test bind case */
> -		show_prompt("mount('/tmp/mount/', '/tmp/mount_bind/', "
> -			    "MS_BIND)", 1);
> -		if (mount("/tmp/mount/", "/tmp/mount_bind/", NULL, MS_BIND,
> -			  NULL) == EOF && errno == EPERM)
> -			printf("OK: Permission denied.\n");
> -		else
> -			printf("BUG: %s\n", strerror(errno));
> -
> -		/* Test move case */
> -		show_prompt("mount('/tmp/mount/', '/tmp/mount_move/', "
> -			    "MS_MOVE)", 1);
> -		if (mount("/tmp/mount/", "/tmp/mount_move/", NULL, MS_MOVE,
> -			  NULL) == EOF && errno == EPERM)
> -			printf("OK: Permission denied.\n");
> -		else
> -			printf("BUG: %s\n", strerror(errno));
> -
> -		/* Test remount case */
> -		fprintf(domain_fp, "allow_mount any /tmp/mount/ --remount 0\n");
> -		show_prompt("mount('/tmp/mount/', MS_REMOUNT)", 0);
> -		if (mount("none", "/tmp/mount/", "tmpfs", MS_REMOUNT, NULL)
> -		    == 0)
> -			printf("OK\n");
> -		else
> -			printf("FAILED: %s\n", strerror(errno));
> -		fprintf(domain_fp, "delete allow_mount any /tmp/mount/ "
> -			"--remount 0\n");
> -
> -		/* Test bind case */
> -		fprintf(domain_fp,
> -			"allow_mount /tmp/mount/ /tmp/mount_bind/ --bind 0\n");
> -		show_prompt("mount('/tmp/mount/', '/tmp/mount_bind', MS_BIND)",
> -			    0);
> -		if (mount("/tmp/mount/", "/tmp/mount_bind/", NULL, MS_BIND,
> -			  NULL) == 0)
> -			printf("OK\n");
> -		else
> -			printf("FAILED: %s\n", strerror(errno));
> -		set_profile(0, "file::mount");
> -		umount("/tmp/mount_bind/");
> -		fprintf(domain_fp, "delete allow_mount /tmp/mount/ "
> -			"/tmp/mount_bind/ --bind 0\n");
> -
> -		/* Test move case */
> -		set_profile(3, "file::mount");
> -		fprintf(domain_fp, "allow_unmount /tmp/mount/\n");
> -		fprintf(domain_fp, "allow_mount /tmp/mount/ /tmp/mount_move/ "
> -			"--move 0\n");
> -		show_prompt("mount('/tmp/mount/', '/tmp/mount_move/', "
> -			    "MS_MOVE)", 0);
> -		if (mount("/tmp/mount/", "/tmp/mount_move/", NULL, MS_MOVE,
> -			  NULL) == 0)
> -			printf("OK\n");
> -		else
> -			printf("FAILED: %s\n", strerror(errno));
> -		set_profile(0, "file::mount");
> -		umount("/tmp/mount_move/");
> -		fprintf(domain_fp, "delete allow_unmount /tmp/mount/\n");
> -		fprintf(domain_fp, "delete allow_mount /tmp/mount/ "
> -			"/tmp/mount_move/ --move 0\n");
> -
> -		while (umount("/tmp/mount/") == 0)
> -			c++;	/* Dummy. */
> -	}
> -
> -	/* Test umount(). */
> -	{
> -		/* Test standard case */
> -		fprintf(domain_fp, "allow_unmount /tmp/mount/\n");
> -
> -		set_profile(0, "file::umount");
> -		mount2("none", "/tmp/mount/", "tmpfs");
> -		set_profile(3, "file::umount");
> -		show_prompt("umount('/tmp/mount/') for '/tmp/mount/'", 0);
> -		if (umount("/tmp/mount/") == 0)
> -			printf("OK\n");
> -		else
> -			printf("BUG: %s\n", strerror(errno));
> -		fprintf(domain_fp, "delete allow_unmount /tmp/mount/\n");
> -
> -		set_profile(0, "file::umount");
> -
> -		mount2("none", "/tmp/mount/", "tmpfs");
> -		set_profile(3, "file::umount");
> -		show_prompt("umount('/tmp/mount/') for '/tmp/mount/'", 1);
> -		if (umount("/tmp/mount/") == EOF && errno == EPERM)
> -			printf("OK: Permission denied.\n");
> -		else
> -			printf("FAILED: %s\n", strerror(errno));
> -
> -		/* Test pattern */
> -		fprintf(domain_fp, "allow_unmount /tmp/\\?\\?\\?\\?\\?/\n");
> -		set_profile(0, "file::umount");
> -		mount2("none", "/tmp/mount/", "tmpfs");
> -		set_profile(3, "file::umount");
> -		show_prompt("umount('/tmp/mount/') for "
> -			    "'/tmp/\\?\\?\\?\\?\\?/'", 1);
> -		if (umount("/tmp/mount/") == 0)
> -			printf("OK\n");
> -		else
> -			printf("BUG: %s\n", strerror(errno));
> -		fprintf(domain_fp,
> -			"delete allow_unmount /tmp/\\?\\?\\?\\?\\?/\n");
> -
> -		set_profile(0, "file::umount");
> -		while (umount("/tmp/mount/") == 0)
> -			c++;	/* Dummy. */
> -	}
> -
> -	/* Test chroot(). */
> -	{
> -		set_profile(3, "file::chroot");
> -
> -		/* Test standard case */
> -		fprintf(domain_fp, "allow_chroot /tmp/mount/\n");
> -		show_prompt("chroot('/tmp/mount/') for '/tmp/mount/'", 0);
> -		fflush(stdout);
> -		if (fork() == 0) {
> -			if (chroot("/tmp/mount/") == 0)
> -				printf("OK\n");
> -			else
> -				printf("FAILED: %s\n", strerror(errno));
> -			fflush(stdout);
> -			_exit(0);
> -		}
> -		wait(NULL);
> -		fprintf(domain_fp, "delete allow_chroot /tmp/mount/\n");
> -
> -		show_prompt("chroot('/tmp/mount/') for '/tmp/mount/'", 1);
> -		fflush(stdout);
> -		if (fork() == 0) {
> -			if (chroot("/tmp/mount/") == EOF && errno == EPERM)
> -				printf("OK: Permission denied.\n");
> -			else
> -				printf("BUG: %s\n", strerror(errno));
> -			fflush(stdout);
> -			_exit(0);
> -		}
> -		wait(NULL);
> -
> -		/* Test pattern */
> -		fprintf(domain_fp, "allow_chroot /tmp/\\?\\?\\?\\?\\?/\n");
> -		show_prompt("chroot('/tmp/mount/') for "
> -			    "'/tmp/\\?\\?\\?\\?\\?/'", 0);
> -		fflush(stdout);
> -		if (fork() == 0) {
> -			if (chroot("/tmp/mount/") == 0)
> -				printf("OK\n");
> -			else
> -				printf("FAILED: %s\n", strerror(errno));
> -			fflush(stdout);
> -			_exit(0);
> -		}
> -		wait(NULL);
> -		fprintf(domain_fp,
> -			"delete allow_chroot /tmp/\\?\\?\\?\\?\\?/\n");
> -
> -		set_profile(0, "file::chroot");
> -	}
> -
> -	/* Test pivot_root(). */
> -	{
> -		int error;
> -		static char stack[8192];
> -		set_profile(3, "file::pivot_root");
> -		fprintf(domain_fp, "allow_pivot_root %s %s\n",
> -			pivot_root_dir, proc_policy_dir);
> -		snprintf(stack, 8191, "pivot_root('%s', '%s')", pivot_root_dir,
> -			 proc_policy_dir);
> -		show_prompt(stack, 0);
> -		{
> -			const pid_t pid = ltp_clone_quick(CLONE_NEWNS, child,
> -							  NULL);
> -			while (waitpid(pid, &error, __WALL) == EOF &&
> -			       errno == EINTR)
> -				c++;	/* Dummy. */
> -		}
> -		errno = WIFEXITED(error) ? WEXITSTATUS(error) : -1;
> -		if (errno == 0)
> -			printf("OK\n");
> -		else
> -			printf("FAILED: %s\n", strerror(errno));
> -
> -		fprintf(domain_fp, "delete allow_pivot_root %s %s\n",
> -			pivot_root_dir, proc_policy_dir);
> -		snprintf(stack, 8191, "pivot_root('%s', '%s')", pivot_root_dir,
> -			 proc_policy_dir);
> -		show_prompt(stack, 1);
> -		{
> -			const pid_t pid = ltp_clone_quick(CLONE_NEWNS, child,
> -							  NULL);
> -			while (waitpid(pid, &error, __WALL) == EOF &&
> -			       errno == EINTR)
> -				c++;	/* Dummy. */
> -		}
> -		errno = WIFEXITED(error) ? WEXITSTATUS(error) : -1;
> -		if (errno == EPERM)
> -			printf("OK: Permission denied.\n");
> -		else
> -			printf("BUG: %s\n", strerror(errno));
> -
> -		set_profile(2, "file::pivot_root");
> -		snprintf(stack, 8191, "pivot_root('%s', '%s')", pivot_root_dir,
> -			 proc_policy_dir);
> -		show_prompt(stack, 0);
> -		{
> -			const pid_t pid = ltp_clone_quick(CLONE_NEWNS, child,
> -							  NULL);
> -			while (waitpid(pid, &error, __WALL) == EOF &&
> -			       errno == EINTR)
> -				c++;	/* Dummy. */
> -		}
> -		errno = WIFEXITED(error) ? WEXITSTATUS(error) : -1;
> -		if (errno == 0)
> -			printf("OK\n");
> -		else
> -			printf("FAILED: %s\n", strerror(errno));
> -
> -		set_profile(0, "file::pivot_root");
> -
> -	}
> -
> -	rmdir("/tmp/mount_move/");
> -	rmdir("/tmp/mount_bind/");
> -	rmdir("/tmp/mount/");
> -
> -	clear_status();
> -	return 0;
> -}
> diff --git a/testcases/kernel/security/tomoyo/tomoyo_new_file_test.c b/testcases/kernel/security/tomoyo/tomoyo_new_file_test.c
> deleted file mode 100644
> index eb912d726..000000000
> --- a/testcases/kernel/security/tomoyo/tomoyo_new_file_test.c
> +++ /dev/null
> @@ -1,627 +0,0 @@
> -/******************************************************************************/
> -/* This program is free software;  you can redistribute it and/or modify      */
> -/* it under the terms of the GNU General Public License as published by       */
> -/* the Free Software Foundation; either version 2 of the License, or          */
> -/* (at your option) any later version.                                        */
> -/*                                                                            */
> -/* This program is distributed in the hope that it will be useful,            */
> -/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
> -/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
> -/* the GNU General Public License for more details.                           */
> -/*                                                                            */
> -/* You should have received a copy of the GNU General Public License          */
> -/* along with this program;  if not, write to the Free Software               */
> -/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
> -/*                                                                            */
> -/******************************************************************************/
> -/*
> - * tomoyo_new_file_test.c
> - *
> - * Testing program for security/tomoyo/
> - *
> - * Copyright (C) 2005-2010  NTT DATA CORPORATION
> - */
> -#include "include.h"
> -
> -static const char *policy = "";
> -
> -static void show_result(int result, char should_success)
> -{
> -	int error = errno;
> -	printf("%s : ", policy);
> -	if (should_success) {
> -		if (result != EOF)
> -			printf("OK\n");
> -		else
> -			printf("FAILED: %s\n", strerror(error));
> -	} else {
> -		if (result == EOF) {
> -			if (error == EPERM)
> -				printf("OK: Permission denied.\n");
> -			else
> -				printf("FAILED: %s\n", strerror(error));
> -		} else {
> -			printf("BUG: didn't fail.\n");
> -		}
> -	}
> -}
> -
> -static void create2(const char *pathname)
> -{
> -	set_profile(0, "file::create");
> -	set_profile(0, "file::open");
> -	close(creat(pathname, 0600));
> -	set_profile(3, "file::create");
> -	set_profile(3, "file::open");
> -	errno = 0;
> -}
> -
> -static void mkdir2(const char *pathname)
> -{
> -	set_profile(0, "file::mkdir");
> -	mkdir(pathname, 0600);
> -	set_profile(3, "file::mkdir");
> -	errno = 0;
> -}
> -
> -static void unlink2(const char *pathname)
> -{
> -	set_profile(0, "file::unlink");
> -	unlink(pathname);
> -	set_profile(3, "file::unlink");
> -	errno = 0;
> -}
> -
> -static void rmdir2(const char *pathname)
> -{
> -	set_profile(0, "file::rmdir");
> -	rmdir(pathname);
> -	set_profile(3, "file::rmdir");
> -	errno = 0;
> -}
> -
> -static void mkfifo2(const char *pathname)
> -{
> -	set_profile(0, "file::mkfifo");
> -	mkfifo(pathname, 0600);
> -	set_profile(3, "file::mkfifo");
> -	errno = 0;
> -}
> -
> -static void stage_file_test(void)
> -{
> -	const char buffer[] = "32768 61000";
> -	int pipe_fd[2] = { EOF, EOF };
> -	int error = 0;
> -	int fd;
> -	char pbuffer[1024];
> -	struct stat sbuf;
> -	struct sockaddr_un addr;
> -	struct ifreq ifreq;
> -	char *filename = "";
> -	set_profile(3, "file::execute");
> -	set_profile(3, "file::open");
> -	set_profile(3, "file::create");
> -	set_profile(3, "file::unlink");
> -	set_profile(3, "file::mkdir");
> -	set_profile(3, "file::rmdir");
> -	set_profile(3, "file::mkfifo");
> -	set_profile(3, "file::mksock");
> -	set_profile(3, "file::truncate");
> -	set_profile(3, "file::symlink");
> -	set_profile(3, "file::rewrite");
> -	set_profile(3, "file::mkblock");
> -	set_profile(3, "file::mkchar");
> -	set_profile(3, "file::link");
> -	set_profile(3, "file::rename");
> -	set_profile(3, "file::chmod");
> -	set_profile(3, "file::chown");
> -	set_profile(3, "file::chgrp");
> -	set_profile(3, "file::ioctl");
> -	set_profile(3, "file::chroot");
> -	set_profile(3, "file::mount");
> -	set_profile(3, "file::umount");
> -	set_profile(3, "file::pivot_root");
> -
> -	policy = "allow_read /proc/sys/net/ipv4/ip_local_port_range";
> -	write_domain_policy(policy, 0);
> -	show_result(read_sysctl(TEST_SYSCTL_PATH, NULL, 0), 1);
> -	write_domain_policy(policy, 1);
> -	show_result(read_sysctl(TEST_SYSCTL_PATH, NULL, 0), 0);
> -
> -	policy = "allow_write /proc/sys/net/ipv4/ip_local_port_range";
> -	write_domain_policy(policy, 0);
> -	show_result(write_sysctl(TEST_SYSCTL_PATH, buffer), 1);
> -	write_domain_policy(policy, 1);
> -	show_result(write_sysctl(TEST_SYSCTL_PATH, buffer), 0);
> -
> -	policy = "allow_read/write /proc/sys/net/ipv4/ip_local_port_range";
> -	write_domain_policy(policy, 0);
> -	show_result(read_sysctl(TEST_SYSCTL_PATH, NULL, 0) &&
> -	            write_sysctl(TEST_SYSCTL_PATH, buffer), 1);
> -	write_domain_policy(policy, 1);
> -	show_result(read_sysctl(TEST_SYSCTL_PATH, NULL, 0) &&
> -	            write_sysctl(TEST_SYSCTL_PATH, buffer), 0);
> -
> -	policy = "allow_read /bin/true";
> -	write_domain_policy(policy, 0);
> -	show_result(uselib("/bin/true"), 1);
> -	write_domain_policy(policy, 1);
> -	show_result(uselib("/bin/true"), 0);
> -
> -	policy = "allow_execute /bin/true";
> -	write_domain_policy(policy, 0);
> -	fflush(stdout);
> -	fflush(stderr);
> -	if (pipe(pipe_fd) == -1)
> -		err(1, "pipe");
> -	if (fork() == 0) {
> -		execl("/bin/true", "/bin/true", NULL);
> -		if (write(pipe_fd[1], &errno, sizeof(errno)) == -1)
> -			err(1, "write");
> -		exit(0);
> -	}
> -	close(pipe_fd[1]);
> -	(void)read(pipe_fd[0], &error, sizeof(error));
> -	close(pipe_fd[0]);
> -	wait(NULL);
> -	errno = error;
> -	show_result(error ? EOF : 0, 1);
> -	write_domain_policy(policy, 1);
> -	fflush(stdout);
> -	fflush(stderr);
> -	if (pipe(pipe_fd) == -1)
> -		err(1, "pipe");
> -	if (fork() == 0) {
> -		execl("/bin/true", "/bin/true", NULL);
> -		if (write(pipe_fd[1], &errno, sizeof(errno)) == -1)
> -			err(1, "write");
> -		_exit(0);
> -	}
> -	close(pipe_fd[1]);
> -	(void)read(pipe_fd[0], &error, sizeof(error));
> -	close(pipe_fd[0]);
> -	wait(NULL);
> -	errno = error;
> -	show_result(errno ? EOF : 0, 0);
> -
> -	policy = "allow_read /dev/null";
> -	write_domain_policy(policy, 0);
> -	fd = open("/dev/null", O_RDONLY);
> -	show_result(fd, 1);
> -	if (fd != EOF)
> -		close(fd);
> -	write_domain_policy(policy, 1);
> -	fd = open("/dev/null", O_RDONLY);
> -	show_result(fd, 0);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	policy = "allow_read /dev/null";
> -	write_domain_policy(policy, 0);
> -	fd = open("/dev/null", O_RDONLY);
> -	show_result(fd, 1);
> -	if (fd != EOF)
> -		close(fd);
> -	write_domain_policy(policy, 1);
> -	fd = open("/dev/null", O_RDONLY);
> -	show_result(fd, 0);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	policy = "allow_read /dev/null";
> -	write_domain_policy(policy, 0);
> -	fd = open("/dev/null", O_RDONLY);
> -	show_result(fd, 1);
> -	if (fd != EOF)
> -		close(fd);
> -	write_domain_policy(policy, 1);
> -	fd = open("/dev/null", O_RDONLY);
> -	show_result(fd, 0);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	policy = "allow_read /dev/null";
> -	write_domain_policy(policy, 0);
> -	fd = open("/dev/null", O_RDONLY);
> -	show_result(fd, 1);
> -	if (fd != EOF)
> -		close(fd);
> -	write_domain_policy(policy, 1);
> -	fd = open("/dev/null", O_RDONLY);
> -	show_result(fd, 0);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	set_profile(3, "file::mkfifo");
> -	policy = "allow_mkfifo /tmp/mknod_fifo_test 0644";
> -	write_domain_policy(policy, 0);
> -	filename = "/tmp/mknod_fifo_test";
> -	show_result(mknod(filename, S_IFIFO | 0644, 0), 1);
> -	write_domain_policy(policy, 1);
> -	unlink2(filename);
> -	show_result(mknod(filename, S_IFIFO | 0644, 0), 0);
> -
> -	memset(pbuffer, 0, sizeof(pbuffer));
> -	memset(&sbuf, 0, sizeof(sbuf));
> -	filename = "/dev/null";
> -	stat(filename, &sbuf);
> -	snprintf(pbuffer, sizeof(pbuffer) - 1, "allow_write %s", filename);
> -	policy = pbuffer;
> -	write_domain_policy(policy, 0);
> -	fd = open(filename, O_WRONLY);
> -	show_result(fd, 1);
> -	if (fd != EOF)
> -		close(fd);
> -	write_domain_policy(policy, 1);
> -	fd = open(filename, O_WRONLY);
> -	show_result(fd, 0);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	policy = "allow_read/write /tmp/fifo";
> -	mkfifo2("/tmp/fifo");
> -	write_domain_policy(policy, 0);
> -	fd = open("/tmp/fifo", O_RDWR);
> -	show_result(fd, 1);
> -	if (fd != EOF)
> -		close(fd);
> -	write_domain_policy(policy, 1);
> -	fd = open("/tmp/fifo", O_RDWR);
> -	show_result(fd, 0);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	policy = "allow_read /dev/null";
> -	write_domain_policy(policy, 0);
> -	fd = open("/dev/null", O_RDONLY);
> -	show_result(fd, 1);
> -	if (fd != EOF)
> -		close(fd);
> -	write_domain_policy(policy, 1);
> -	fd = open("/dev/null", O_RDONLY);
> -	show_result(fd, 0);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	policy = "allow_write /dev/null";
> -	write_domain_policy(policy, 0);
> -	fd = open("/dev/null", O_WRONLY);
> -	show_result(fd, 1);
> -	if (fd != EOF)
> -		close(fd);
> -	write_domain_policy(policy, 1);
> -	fd = open("/dev/null", O_WRONLY);
> -	show_result(fd, 0);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	policy = "allow_read/write /dev/null";
> -	write_domain_policy(policy, 0);
> -	fd = open("/dev/null", O_RDWR);
> -	show_result(fd, 1);
> -	if (fd != EOF)
> -		close(fd);
> -	write_domain_policy(policy, 1);
> -	fd = open("/dev/null", O_RDWR);
> -	show_result(fd, 0);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	policy = "allow_create /tmp/open_test 0644";
> -	write_domain_policy(policy, 0);
> -	policy = "allow_write /tmp/open_test";
> -	write_domain_policy(policy, 0);
> -	fd = open("/tmp/open_test", O_WRONLY | O_CREAT | O_EXCL, 0644);
> -	show_result(fd, 1);
> -	if (fd != EOF)
> -		close(fd);
> -	unlink2("/tmp/open_test");
> -	write_domain_policy(policy, 1);
> -	fd = open("/tmp/open_test", O_WRONLY | O_CREAT | O_EXCL, 0644);
> -	show_result(fd, 0);
> -	if (fd != EOF)
> -		close(fd);
> -	unlink2("/tmp/open_test");
> -
> -	policy = "allow_create /tmp/open_test 0644";
> -	write_domain_policy(policy, 1);
> -
> -	policy = "allow_write /tmp/open_test";
> -	write_domain_policy(policy, 0);
> -	policy = "allow_create /tmp/open_test 0644";
> -	write_domain_policy(policy, 0);
> -	fd = open("/tmp/open_test", O_WRONLY | O_CREAT | O_EXCL, 0644);
> -	show_result(fd, 1);
> -	if (fd != EOF)
> -		close(fd);
> -	unlink2("/tmp/open_test");
> -	write_domain_policy(policy, 1);
> -	fd = open("/tmp/open_test", O_WRONLY | O_CREAT | O_EXCL, 0644);
> -	show_result(fd, 0);
> -	if (fd != EOF)
> -		close(fd);
> -	unlink2("/tmp/open_test");
> -	policy = "allow_write /tmp/open_test";
> -	write_domain_policy(policy, 1);
> -
> -	filename = "/tmp/truncate_test";
> -	create2(filename);
> -
> -	policy = "allow_truncate /tmp/truncate_test";
> -	write_domain_policy(policy, 0);
> -	policy = "allow_write /tmp/truncate_test";
> -	write_domain_policy(policy, 0);
> -	fd = open(filename, O_WRONLY | O_TRUNC);
> -	show_result(fd, 1);
> -	if (fd != EOF)
> -		close(fd);
> -	write_domain_policy(policy, 1);
> -	fd = open(filename, O_WRONLY | O_TRUNC);
> -	show_result(fd, 0);
> -	if (fd != EOF)
> -		close(fd);
> -	policy = "allow_truncate /tmp/truncate_test";
> -	write_domain_policy(policy, 1);
> -
> -	policy = "allow_write /tmp/truncate_test";
> -	write_domain_policy(policy, 0);
> -	policy = "allow_truncate /tmp/truncate_test";
> -	write_domain_policy(policy, 0);
> -	fd = open(filename, O_WRONLY | O_TRUNC);
> -	show_result(fd, 1);
> -	if (fd != EOF)
> -		close(fd);
> -	write_domain_policy(policy, 1);
> -	fd = open(filename, O_WRONLY | O_TRUNC);
> -	show_result(fd, 0);
> -	if (fd != EOF)
> -		close(fd);
> -	policy = "allow_write /tmp/truncate_test";
> -	write_domain_policy(policy, 1);
> -
> -	policy = "allow_truncate /tmp/truncate_test";
> -	write_domain_policy(policy, 0);
> -	show_result(truncate(filename, 0), 1);
> -	write_domain_policy(policy, 1);
> -	show_result(truncate(filename, 0), 0);
> -
> -	policy = "allow_truncate /tmp/truncate_test";
> -	write_domain_policy(policy, 0);
> -	set_profile(0, "file::open");
> -	fd = open(filename, O_WRONLY);
> -	set_profile(3, "file::open");
> -	show_result(ftruncate(fd, 0), 1);
> -	write_domain_policy(policy, 1);
> -	show_result(ftruncate(fd, 0), 0);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	unlink2(filename);
> -
> -	policy = "allow_create /tmp/mknod_reg_test 0644";
> -	write_domain_policy(policy, 0);
> -	filename = "/tmp/mknod_reg_test";
> -	show_result(mknod(filename, S_IFREG | 0644, 0), 1);
> -	write_domain_policy(policy, 1);
> -	unlink2(filename);
> -	show_result(mknod(filename, S_IFREG | 0644, 0), 0);
> -
> -	policy = "allow_mkchar /tmp/mknod_chr_test 0644 1 3";
> -	write_domain_policy(policy, 0);
> -	filename = "/tmp/mknod_chr_test";
> -	show_result(mknod(filename, S_IFCHR | 0644, MKDEV(1, 3)), 1);
> -	write_domain_policy(policy, 1);
> -	unlink2(filename);
> -	show_result(mknod(filename, S_IFCHR | 0644, MKDEV(1, 3)), 0);
> -
> -	policy = "allow_mkblock /tmp/mknod_blk_test 0644 1 0";
> -	write_domain_policy(policy, 0);
> -	filename = "/tmp/mknod_blk_test";
> -	show_result(mknod(filename, S_IFBLK | 0644, MKDEV(1, 0)), 1);
> -	write_domain_policy(policy, 1);
> -	unlink2(filename);
> -	show_result(mknod(filename, S_IFBLK | 0644, MKDEV(1, 0)), 0);
> -
> -	policy = "allow_mkfifo /tmp/mknod_fifo_test 0644";
> -	write_domain_policy(policy, 0);
> -	filename = "/tmp/mknod_fifo_test";
> -	show_result(mknod(filename, S_IFIFO | 0644, 0), 1);
> -	write_domain_policy(policy, 1);
> -	unlink2(filename);
> -	show_result(mknod(filename, S_IFIFO | 0644, 0), 0);
> -
> -	policy = "allow_mksock /tmp/mknod_sock_test 0644";
> -	write_domain_policy(policy, 0);
> -	filename = "/tmp/mknod_sock_test";
> -	show_result(mknod(filename, S_IFSOCK | 0644, 0), 1);
> -	write_domain_policy(policy, 1);
> -	unlink2(filename);
> -	show_result(mknod(filename, S_IFSOCK | 0644, 0), 0);
> -
> -	policy = "allow_mkdir /tmp/mkdir_test/ 0600";
> -	write_domain_policy(policy, 0);
> -	filename = "/tmp/mkdir_test";
> -	show_result(mkdir(filename, 0600), 1);
> -	write_domain_policy(policy, 1);
> -	rmdir2(filename);
> -	show_result(mkdir(filename, 0600), 0);
> -
> -	policy = "allow_rmdir /tmp/rmdir_test/";
> -	write_domain_policy(policy, 0);
> -	filename = "/tmp/rmdir_test";
> -	mkdir2(filename);
> -	show_result(rmdir(filename), 1);
> -	write_domain_policy(policy, 1);
> -	mkdir2(filename);
> -	show_result(rmdir(filename), 0);
> -	rmdir2(filename);
> -
> -	policy = "allow_unlink /tmp/unlink_test";
> -	write_domain_policy(policy, 0);
> -	filename = "/tmp/unlink_test";
> -	create2(filename);
> -	show_result(unlink(filename), 1);
> -	write_domain_policy(policy, 1);
> -	create2(filename);
> -	show_result(unlink(filename), 0);
> -	unlink2(filename);
> -
> -	policy = "allow_symlink /tmp/symlink_source_test";
> -	write_domain_policy(policy, 0);
> -	filename = "/tmp/symlink_source_test";
> -	show_result(symlink("/tmp/symlink_dest_test", filename), 1);
> -	write_domain_policy(policy, 1);
> -	unlink2(filename);
> -	show_result(symlink("/tmp/symlink_dest_test", filename), 0);
> -
> -	policy = "allow_symlink /tmp/symlink_source_test";
> -	write_domain_policy(policy, 0);
> -	filename = "/tmp/symlink_source_test";
> -	show_result(symlink("/tmp/symlink_dest_test", filename), 1);
> -	write_domain_policy(policy, 1);
> -	unlink2(filename);
> -	show_result(symlink("/tmp/symlink_dest_test", filename), 0);
> -
> -	policy = "allow_symlink /tmp/symlink_source_test";
> -	write_domain_policy(policy, 0);
> -	filename = "/tmp/symlink_source_test";
> -	show_result(symlink("/tmp/symlink_dest_test", filename), 1);
> -	write_domain_policy(policy, 1);
> -	unlink2(filename);
> -	show_result(symlink("/tmp/symlink_dest_test", filename), 0);
> -
> -	policy = "allow_symlink /tmp/symlink_source_test";
> -	write_domain_policy(policy, 0);
> -	filename = "/tmp/symlink_source_test";
> -	show_result(symlink("/tmp/symlink_dest_test", filename), 1);
> -	write_domain_policy(policy, 1);
> -	unlink2(filename);
> -	show_result(symlink("/tmp/symlink_dest_test", filename), 0);
> -
> -	policy = "allow_symlink /tmp/symlink_source_test";
> -	write_domain_policy(policy, 0);
> -	filename = "/tmp/symlink_source_test";
> -	show_result(symlink("/tmp/symlink_dest_test", filename), 1);
> -	write_domain_policy(policy, 1);
> -	unlink2(filename);
> -	show_result(symlink("/tmp/symlink_dest_test", filename), 0);
> -
> -	policy = "allow_link /tmp/link_source_test /tmp/link_dest_test";
> -	write_domain_policy(policy, 0);
> -	filename = "/tmp/link_source_test";
> -	create2(filename);
> -	show_result(link(filename, "/tmp/link_dest_test"), 1);
> -	write_domain_policy(policy, 1);
> -	unlink2("/tmp/link_dest_test");
> -	show_result(link(filename, "/tmp/link_dest_test"), 0);
> -	unlink2(filename);
> -
> -	policy = "allow_rename /tmp/rename_source_test /tmp/rename_dest_test";
> -	write_domain_policy(policy, 0);
> -	filename = "/tmp/rename_source_test";
> -	create2(filename);
> -	show_result(rename(filename, "/tmp/rename_dest_test"), 1);
> -	write_domain_policy(policy, 1);
> -	unlink2("/tmp/rename_dest_test");
> -	create2(filename);
> -	show_result(rename(filename, "/tmp/rename_dest_test"), 0);
> -	unlink2(filename);
> -
> -	policy = "allow_mksock /tmp/socket_test 0755";
> -	write_domain_policy(policy, 0);
> -	filename = "/tmp/socket_test";
> -	memset(&addr, 0, sizeof(addr));
> -	addr.sun_family = AF_UNIX;
> -	strncpy(addr.sun_path, filename, sizeof(addr.sun_path) - 1);
> -	fd = socket(AF_UNIX, SOCK_STREAM, 0);
> -	show_result(bind(fd, (struct sockaddr *)&addr, sizeof(addr)), 1);
> -	if (fd != EOF)
> -		close(fd);
> -	write_domain_policy(policy, 1);
> -	unlink2(filename);
> -	fd = socket(AF_UNIX, SOCK_STREAM, 0);
> -	show_result(bind(fd, (struct sockaddr *)&addr, sizeof(addr)), 0);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	filename = "/tmp/rewrite_test";
> -	create2(filename);
> -	policy = "allow_read/write /tmp/rewrite_test";
> -	write_domain_policy(policy, 0);
> -	write_exception_policy("deny_rewrite /tmp/rewrite_test", 0);
> -	policy = "allow_truncate /tmp/rewrite_test";
> -	write_domain_policy(policy, 0);
> -
> -	fd = open(filename, O_RDONLY);
> -	show_result(fd, 1);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	fd = open(filename, O_WRONLY | O_APPEND);
> -	show_result(fd, 1);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	fd = open(filename, O_WRONLY);
> -	show_result(fd, 0);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	fd = open(filename, O_WRONLY | O_TRUNC);
> -	show_result(fd, 0);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	fd = open(filename, O_WRONLY | O_TRUNC | O_APPEND);
> -	show_result(fd, 0);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	show_result(truncate(filename, 0), 0);
> -
> -	set_profile(0, "file::open");
> -	fd = open(filename, O_WRONLY | O_APPEND);
> -	set_profile(3, "file::open");
> -	show_result(ftruncate(fd, 0), 0);
> -
> -	show_result(fcntl(fd, F_SETFL, fcntl(fd, F_GETFL) & ~O_APPEND), 0);
> -	if (fd != EOF)
> -		close(fd);
> -
> -	write_domain_policy(policy, 1);
> -
> -	policy = "allow_read/write /tmp/rewrite_test";
> -	write_domain_policy(policy, 1);
> -	write_exception_policy("deny_rewrite /tmp/rewrite_test", 1);
> -
> -	unlink2(filename);
> -
> -	policy = "allow_ioctl socket:[family=2:type=2:protocol=17] "
> -	    "35122-35124";
> -	write_domain_policy(policy, 0);
> -	fd = socket(PF_INET, SOCK_DGRAM, IPPROTO_IP);
> -	memset(&ifreq, 0, sizeof(ifreq));
> -	snprintf(ifreq.ifr_name, sizeof(ifreq.ifr_name) - 1, "lo");
> -	show_result(ioctl(fd, 35123, &ifreq), 1);
> -	write_domain_policy(policy, 1);
> -	policy = "allow_ioctl " "socket:[family=2:type=2:protocol=17] 0-35122";
> -	write_domain_policy(policy, 0);
> -	show_result(ioctl(fd, 35123, &ifreq), 0);
> -	write_domain_policy(policy, 1);
> -	if (fd != EOF)
> -		close(fd);
> -}
> -
> -int main(void)
> -{
> -	tomoyo_test_init();
> -	fprintf(domain_fp, "%s /bin/true\n", self_domain);
> -	fprintf(domain_fp, "use_profile 255\n");
> -	fprintf(domain_fp, "select pid=%u\n", pid);
> -	fprintf(profile_fp, "255-PREFERENCE::audit={ max_reject_log=1024 }\n");
> -	stage_file_test();
> -	fprintf(domain_fp, "use_profile 0\n");
> -	clear_status();
> -	return 0;
> -}
> diff --git a/testcases/kernel/security/tomoyo/tomoyo_new_test.c b/testcases/kernel/security/tomoyo/tomoyo_new_test.c
> deleted file mode 100644
> index a1ab259e5..000000000
> --- a/testcases/kernel/security/tomoyo/tomoyo_new_test.c
> +++ /dev/null
> @@ -1,652 +0,0 @@
> -/******************************************************************************/
> -/* This program is free software;  you can redistribute it and/or modify      */
> -/* it under the terms of the GNU General Public License as published by       */
> -/* the Free Software Foundation; either version 2 of the License, or          */
> -/* (at your option) any later version.                                        */
> -/*                                                                            */
> -/* This program is distributed in the hope that it will be useful,            */
> -/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
> -/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
> -/* the GNU General Public License for more details.                           */
> -/*                                                                            */
> -/* You should have received a copy of the GNU General Public License          */
> -/* along with this program;  if not, write to the Free Software               */
> -/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
> -/*                                                                            */
> -/******************************************************************************/
> -/*
> - * tomoyo_new_test.c
> - *
> - * Testing program for security/tomoyo/
> - *
> - * Copyright (C) 2005-2010  NTT DATA CORPORATION
> - */
> -#include "include.h"
> -
> -static int result;
> -static int error;
> -
> -static void show_result(const char *test, int should_success)
> -{
> -	error = errno;
> -	printf("%s : ", test);
> -	if (should_success) {
> -		if (error == 0)
> -			printf("OK (%d)\n", result);
> -		else
> -			printf("FAILED: %s\n", strerror(error));
> -	} else {
> -		if (error == 0)
> -			printf("BUG: Didn't fail (%d)\n", result);
> -		else if (error == EPERM)
> -			printf("OK: permission denied\n");
> -		else
> -			printf("FAILED: %s\n", strerror(error));
> -	}
> -}
> -
> -static void test_read_etc_fstab(void)
> -{
> -	result = open("/etc/fstab", O_RDONLY);
> -}
> -
> -static void test_write_dev_null(void)
> -{
> -	result = open("/dev/null", O_WRONLY);
> -}
> -
> -static void cleanup_file_open(void)
> -{
> -	if (result != EOF)
> -		close(result);
> -}
> -
> -static void test_mkdir_testdir(void)
> -{
> -	result = mkdir("/tmp/testdir", 0755);
> -}
> -
> -static void cleanup_mkdir_testdir(void)
> -{
> -	rmdir("/tmp/testdir");
> -}
> -
> -static void setup_mkdir_testdir(void)
> -{
> -	mkdir("/tmp/testdir", 0755);
> -}
> -
> -static void test_rmdir_testdir(void)
> -{
> -	result = rmdir("/tmp/testdir");
> -}
> -
> -static void setup_execute_bin_true(void)
> -{
> -	fprintf(domain_fp, "%s /bin/true\n", self_domain);
> -	fprintf(domain_fp, "use_profile 0\n");
> -	fprintf(domain_fp, "select pid=%u\n", pid);
> -}
> -
> -static void cleanup_execute_bin_true(void)
> -{
> -	wait(NULL);
> -	fprintf(domain_fp, "delete %s /bin/true\n", self_domain);
> -	fprintf(domain_fp, "select pid=%u\n", pid);
> -}
> -
> -static void test_execute_bin_true(void)
> -{
> -	char *argv[] = { "/bin/true", NULL };
> -	char *envp[] = { "HOME=/", NULL };
> -	int pipe_fd[2] = { EOF, EOF };
> -	if (pipe(pipe_fd) == -1)
> -		err(1, "pipe");
> -	switch (fork()) {
> -	case 0:
> -		execve("/bin/true", argv, envp);
> -		error = errno;
> -		if (write(pipe_fd[1], &error, sizeof(error)) == -1)
> -			err(1, "write");
> -		_exit(0);
> -		break;
> -	case -1:
> -		error = ENOMEM;
> -		break;
> -	}
> -	close(pipe_fd[1]);
> -	(void)read(pipe_fd[0], &error, sizeof(error));
> -	close(pipe_fd[0]);
> -	result = error ? EOF : 0;
> -	errno = error;
> -}
> -
> -static void test_chmod_dev_null(void)
> -{
> -	result = chmod("/dev/null", 0666);
> -}
> -
> -static void test_chown_dev_null(void)
> -{
> -	result = chown("/dev/null", 0, -1);
> -}
> -
> -static void test_chgrp_dev_null(void)
> -{
> -	result = chown("/dev/null", -1, 0);
> -}
> -
> -static void test_ioctl_dev_null(void)
> -{
> -	int fd = open("/dev/null", O_RDWR);
> -	errno = 0;
> -	result = ioctl(fd, 0x5451, NULL);
> -	error = errno;
> -	close(fd);
> -	errno = error;
> -}
> -
> -static void setup_chmod_group(void)
> -{
> -	write_exception_policy("path_group CHMOD_TARGET /dev/null", 0);
> -	write_exception_policy("number_group CHMOD_MODES 0666", 0);
> -}
> -
> -static void cleanup_chmod_group(void)
> -{
> -	write_exception_policy("path_group CHMOD_TARGET /dev/null", 1);
> -	write_exception_policy("number_group CHMOD_MODES 0666", 1);
> -}
> -
> -static void setup_chown_group(void)
> -{
> -	write_exception_policy("path_group CHOWN_TARGET /dev/\\*", 0);
> -	write_exception_policy("number_group CHOWN_IDS 0x0-0xFFFE", 0);
> -}
> -
> -static void cleanup_chown_group(void)
> -{
> -	write_exception_policy("path_group CHOWN_TARGET /dev/\\*", 1);
> -	write_exception_policy("number_group CHOWN_IDS 0x0-0xFFFE", 1);
> -}
> -
> -static void setup_ioctl_group(void)
> -{
> -	write_exception_policy("path_group IOCTL_TARGET /dev/\\*", 0);
> -	write_exception_policy("number_group IOCTL_NUMBERS 0x5450-0x5452", 0);
> -}
> -
> -static void cleanup_ioctl_group(void)
> -{
> -	write_exception_policy("path_group IOCTL_TARGET /dev/\\*", 1);
> -	write_exception_policy("number_group IOCTL_NUMBERS 0x5450-0x5452", 1);
> -}
> -
> -static void setup_open_group(void)
> -{
> -	write_exception_policy("path_group READABLE /etc/\\*", 0);
> -	write_exception_policy("number_group READABLE_IDS 0-0xFFF", 0);
> -}
> -
> -static void cleanup_open_group(void)
> -{
> -	cleanup_file_open();
> -	write_exception_policy("path_group READABLE /etc/\\*", 1);
> -	write_exception_policy("number_group READABLE_IDS 0-0xFFF", 1);
> -}
> -
> -static void test_file_open_0(void)
> -{
> -	result = open("/tmp/testfile0", O_RDONLY, 0600);
> -}
> -
> -static void test_file_open_1(void)
> -{
> -	result = open("/tmp/testfile1", O_CREAT | O_RDONLY, 0600);
> -}
> -
> -static void test_file_open_2(void)
> -{
> -	result = open("/tmp/testfile2", O_TRUNC | O_RDONLY, 0600);
> -}
> -
> -static void test_file_open_3(void)
> -{
> -	result = open("/tmp/testfile3", O_TRUNC | O_CREAT | O_RDONLY, 0600);
> -}
> -
> -static void test_file_open_4(void)
> -{
> -	result = open("/tmp/testfile4", O_APPEND | O_RDONLY, 0600);
> -}
> -
> -static void test_file_open_5(void)
> -{
> -	result = open("/tmp/testfile5", O_APPEND | O_CREAT | O_RDONLY, 0600);
> -}
> -
> -static void test_file_open_6(void)
> -{
> -	result = open("/tmp/testfile6", O_APPEND | O_TRUNC | O_RDONLY, 0600);
> -}
> -
> -static void test_file_open_7(void)
> -{
> -	result = open("/tmp/testfile7",
> -		      O_APPEND | O_TRUNC | O_CREAT | O_RDONLY, 0600);
> -}
> -
> -static void test_file_open_8(void)
> -{
> -	result = open("/tmp/testfile8", O_WRONLY, 0600);
> -}
> -
> -static void test_file_open_9(void)
> -{
> -	result = open("/tmp/testfile9", O_CREAT | O_WRONLY, 0600);
> -}
> -
> -static void test_file_open_10(void)
> -{
> -	result = open("/tmp/testfile10", O_TRUNC | O_WRONLY, 0600);
> -}
> -
> -static void test_file_open_11(void)
> -{
> -	result = open("/tmp/testfile11", O_TRUNC | O_CREAT | O_WRONLY, 0600);
> -}
> -
> -static void test_file_open_12(void)
> -{
> -	result = open("/tmp/testfile12", O_APPEND | O_WRONLY, 0600);
> -}
> -
> -static void test_file_open_13(void)
> -{
> -	result = open("/tmp/testfile13", O_APPEND | O_CREAT | O_WRONLY, 0600);
> -}
> -
> -static void test_file_open_14(void)
> -{
> -	result = open("/tmp/testfile14", O_APPEND | O_TRUNC | O_WRONLY, 0600);
> -}
> -
> -static void test_file_open_15(void)
> -{
> -	result = open("/tmp/testfile15",
> -		      O_APPEND | O_TRUNC | O_CREAT | O_WRONLY, 0600);
> -}
> -
> -static void test_file_open_16(void)
> -{
> -	result = open("/tmp/testfile16", O_RDWR, 0600);
> -}
> -
> -static void test_file_open_17(void)
> -{
> -	result = open("/tmp/testfile17", O_CREAT | O_RDWR, 0600);
> -}
> -
> -static void test_file_open_18(void)
> -{
> -	result = open("/tmp/testfile18", O_TRUNC | O_RDWR, 0600);
> -}
> -
> -static void test_file_open_19(void)
> -{
> -	result = open("/tmp/testfile19", O_TRUNC | O_CREAT | O_RDWR, 0600);
> -}
> -
> -static void test_file_open_20(void)
> -{
> -	result = open("/tmp/testfile20", O_APPEND | O_RDWR, 0600);
> -}
> -
> -static void test_file_open_21(void)
> -{
> -	result = open("/tmp/testfile21", O_APPEND | O_CREAT | O_RDWR, 0600);
> -}
> -
> -static void test_file_open_22(void)
> -{
> -	result = open("/tmp/testfile22", O_APPEND | O_TRUNC | O_RDWR, 0600);
> -}
> -
> -static void test_file_open_23(void)
> -{
> -	result = open("/tmp/testfile23", O_APPEND | O_TRUNC | O_CREAT | O_RDWR,
> -		      0600);
> -}
> -
> -static void setup_test_file(void)
> -{
> -	int i;
> -	char buffer[32];
> -	buffer[31] = '\0';
> -	for (i = 0; i < 24; i += 2) {
> -		snprintf(buffer, sizeof(buffer) - 1, "/tmp/testfile%u", i);
> -		close(open(buffer, O_WRONLY | O_CREAT, 0600));
> -	}
> -	write_exception_policy("deny_rewrite /tmp/testfile\\$", 0);
> -}
> -
> -static void setup_test_file_truncate(void)
> -{
> -	setup_test_file();
> -	write_domain_policy("allow_truncate /tmp/testfile\\$", 0);
> -	set_profile(3, "file::truncate");
> -}
> -
> -static void setup_all_test_file(void)
> -{
> -	int i;
> -	char buffer[32];
> -	buffer[31] = '\0';
> -	for (i = 0; i < 24; i++) {
> -		snprintf(buffer, sizeof(buffer) - 1, "/tmp/testfile%u", i);
> -		close(open(buffer, O_WRONLY | O_CREAT, 0600));
> -	}
> -	write_exception_policy("deny_rewrite /tmp/testfile\\$", 0);
> -}
> -
> -static void setup_all_test_file_truncate(void)
> -{
> -	setup_all_test_file();
> -	write_domain_policy("allow_truncate /tmp/testfile\\$", 0);
> -	set_profile(3, "file::truncate");
> -}
> -
> -static void cleanup_test_file(void)
> -{
> -	int i;
> -	char buffer[32];
> -	buffer[31] = '\0';
> -	for (i = 0; i < 24; i++) {
> -		snprintf(buffer, sizeof(buffer) - 1, "/tmp/testfile%u", i);
> -		unlink(buffer);
> -	}
> -	write_exception_policy("deny_rewrite /tmp/testfile\\$", 1);
> -	cleanup_file_open();
> -}
> -
> -static void cleanup_test_file_truncate(void)
> -{
> -	cleanup_test_file();
> -	write_domain_policy("allow_truncate /tmp/testfile\\$", 1);
> -	set_profile(0, "file::truncate");
> -}
> -
> -static struct test_struct {
> -	void (*do_setup) (void);
> -	void (*do_test) (void);
> -	void (*do_cleanup) (void);
> -	const char *name;
> -	const char *policy;
> -} tests[] = {
> -	{
> -	NULL, test_read_etc_fstab, cleanup_file_open, "file::open",
> -		    "allow_read /etc/fstab"}, {
> -	NULL, test_read_etc_fstab, cleanup_file_open, "file::open",
> -		    "allow_read /etc/fstab"}, {
> -	NULL, test_read_etc_fstab, cleanup_file_open, "file::open",
> -		    "allow_read /etc/fstab"}, {
> -	setup_open_group, test_read_etc_fstab, cleanup_open_group,
> -		    "file::open", "allow_read @READABLE"}, {
> -	NULL, test_write_dev_null, cleanup_file_open, "file::open",
> -		    "allow_write /dev/null"}, {
> -	NULL, test_write_dev_null, cleanup_file_open, "file::open",
> -		    "allow_write /dev/null"}, {
> -	NULL, test_write_dev_null, cleanup_file_open, "file::open",
> -		    "allow_write /dev/null"}, {
> -	cleanup_mkdir_testdir, test_mkdir_testdir,
> -		    cleanup_mkdir_testdir, "file::mkdir",
> -		    "allow_mkdir /tmp/testdir/ 0755"}, {
> -	cleanup_mkdir_testdir, test_mkdir_testdir,
> -		    cleanup_mkdir_testdir, "file::mkdir",
> -		    "allow_mkdir /tmp/testdir/ 0755"}, {
> -	cleanup_mkdir_testdir, test_mkdir_testdir,
> -		    cleanup_mkdir_testdir, "file::mkdir",
> -		    "allow_mkdir /tmp/testdir/ 0755"}, {
> -	setup_mkdir_testdir, test_rmdir_testdir, cleanup_mkdir_testdir,
> -		    "file::rmdir", "allow_rmdir /tmp/testdir/"}, {
> -	setup_mkdir_testdir, test_rmdir_testdir, cleanup_mkdir_testdir,
> -		    "file::rmdir", "allow_rmdir /tmp/testdir/"}, {
> -	setup_mkdir_testdir, test_rmdir_testdir, cleanup_mkdir_testdir,
> -		    "file::rmdir", "allow_rmdir /tmp/testdir/"}, {
> -	setup_execute_bin_true, test_execute_bin_true,
> -		    cleanup_execute_bin_true, "file::execute",
> -		    "allow_execute /bin/true"}, {
> -	setup_execute_bin_true, test_execute_bin_true,
> -		    cleanup_execute_bin_true, "file::execute",
> -		    "allow_execute /bin/true"}, {
> -	setup_execute_bin_true, test_execute_bin_true,
> -		    cleanup_execute_bin_true, "file::execute",
> -		    "allow_execute /bin/true"}, {
> -	NULL, test_chmod_dev_null, NULL, "file::chmod",
> -		    "allow_chmod /dev/null 0666"}, {
> -	NULL, test_chown_dev_null, NULL, "file::chown",
> -		    "allow_chown /dev/null 0"}, {
> -	NULL, test_chgrp_dev_null, NULL, "file::chgrp",
> -		    "allow_chgrp /dev/null 0"}, {
> -	NULL, test_ioctl_dev_null, NULL, "file::ioctl",
> -		    "allow_ioctl /dev/null 0x5451"}, {
> -	setup_chmod_group, test_chmod_dev_null, cleanup_chmod_group,
> -		    "file::chmod", "allow_chmod @CHMOD_TARGET @CHMOD_MODES"}, {
> -	setup_chown_group, test_chown_dev_null, cleanup_chown_group,
> -		    "file::chown", "allow_chown @CHOWN_TARGET @CHOWN_IDS"}, {
> -	setup_chown_group, test_chgrp_dev_null, cleanup_chown_group,
> -		    "file::chgrp", "allow_chgrp @CHOWN_TARGET @CHOWN_IDS"}, {
> -	setup_ioctl_group, test_ioctl_dev_null, cleanup_ioctl_group,
> -		    "file::ioctl", "allow_ioctl @IOCTL_TARGET @IOCTL_NUMBERS"},
> -	{
> -	setup_test_file, test_file_open_0, cleanup_test_file,
> -		    "file::open", "allow_read /tmp/testfile0"}, {
> -	setup_test_file, test_file_open_1, cleanup_test_file,
> -		    "file::open", "allow_read /tmp/testfile1"}, {
> -	setup_test_file, test_file_open_1, cleanup_test_file,
> -		    "file::create", "allow_create /tmp/testfile1 0600"}, {
> -	setup_test_file, test_file_open_2, cleanup_test_file,
> -		    "file::open", "allow_read /tmp/testfile2"}, {
> -	setup_test_file, test_file_open_2, cleanup_test_file,
> -		    "file::truncate", "allow_truncate /tmp/testfile2"}, {
> -	setup_test_file_truncate, test_file_open_2,
> -		    cleanup_test_file_truncate, "file::rewrite",
> -		    "allow_rewrite /tmp/testfile2"}, {
> -	setup_test_file, test_file_open_3, cleanup_test_file,
> -		    "file::open", "allow_read /tmp/testfile3"}, {
> -	setup_test_file, test_file_open_3, cleanup_test_file,
> -		    "file::create", "allow_create /tmp/testfile3 0600"}, {
> -	setup_test_file, test_file_open_4, cleanup_test_file,
> -		    "file::open", "allow_read /tmp/testfile4"}, {
> -	setup_test_file, test_file_open_5, cleanup_test_file,
> -		    "file::open", "allow_read /tmp/testfile5"}, {
> -	setup_test_file, test_file_open_5, cleanup_test_file,
> -		    "file::create", "allow_create /tmp/testfile5 0600"}, {
> -	setup_test_file, test_file_open_6, cleanup_test_file,
> -		    "file::open", "allow_read /tmp/testfile6"}, {
> -	setup_test_file, test_file_open_6, cleanup_test_file,
> -		    "file::truncate", "allow_truncate /tmp/testfile6"}, {
> -	setup_test_file_truncate, test_file_open_6,
> -		    cleanup_test_file_truncate, "file::rewrite",
> -		    "allow_rewrite /tmp/testfile6"}, {
> -	setup_test_file, test_file_open_7, cleanup_test_file,
> -		    "file::open", "allow_read /tmp/testfile7"}, {
> -	setup_test_file, test_file_open_7, cleanup_test_file,
> -		    "file::create", "allow_create /tmp/testfile7 0600"}, {
> -	setup_test_file, test_file_open_8, cleanup_test_file,
> -		    "file::open", "allow_write /tmp/testfile8"}, {
> -	setup_test_file, test_file_open_8, cleanup_test_file,
> -		    "file::rewrite", "allow_rewrite /tmp/testfile8"}, {
> -	setup_test_file, test_file_open_9, cleanup_test_file,
> -		    "file::open", "allow_write /tmp/testfile9"}, {
> -	setup_test_file, test_file_open_9, cleanup_test_file,
> -		    "file::create", "allow_create /tmp/testfile9 0600"}, {
> -	setup_test_file, test_file_open_9, cleanup_test_file,
> -		    "file::rewrite", "allow_rewrite /tmp/testfile9"}, {
> -	setup_test_file, test_file_open_10, cleanup_test_file,
> -		    "file::open", "allow_write /tmp/testfile10"}, {
> -	setup_test_file, test_file_open_10, cleanup_test_file,
> -		    "file::truncate", "allow_truncate /tmp/testfile10"}, {
> -	setup_test_file, test_file_open_10, cleanup_test_file,
> -		    "file::rewrite", "allow_rewrite /tmp/testfile10"}, {
> -	setup_test_file, test_file_open_11, cleanup_test_file,
> -		    "file::open", "allow_write /tmp/testfile11"}, {
> -	setup_test_file, test_file_open_11, cleanup_test_file,
> -		    "file::create", "allow_create /tmp/testfile11 0600"}, {
> -	setup_test_file, test_file_open_11, cleanup_test_file,
> -		    "file::rewrite", "allow_rewrite /tmp/testfile11"}, {
> -	setup_test_file, test_file_open_12, cleanup_test_file,
> -		    "file::open", "allow_write /tmp/testfile12"}, {
> -	setup_test_file, test_file_open_13, cleanup_test_file,
> -		    "file::open", "allow_write /tmp/testfile13"}, {
> -	setup_test_file, test_file_open_13, cleanup_test_file,
> -		    "file::create", "allow_create /tmp/testfile13 0600"}, {
> -	setup_test_file, test_file_open_14, cleanup_test_file,
> -		    "file::open", "allow_write /tmp/testfile14"}, {
> -	setup_test_file, test_file_open_14, cleanup_test_file,
> -		    "file::truncate", "allow_truncate /tmp/testfile14"}, {
> -	setup_test_file_truncate, test_file_open_14,
> -		    cleanup_test_file_truncate, "file::rewrite",
> -		    "allow_rewrite /tmp/testfile14"}, {
> -	setup_test_file, test_file_open_15, cleanup_test_file,
> -		    "file::open", "allow_write /tmp/testfile15"}, {
> -	setup_test_file, test_file_open_15, cleanup_test_file,
> -		    "file::create", "allow_create /tmp/testfile15 0600"}, {
> -	setup_test_file, test_file_open_16, cleanup_test_file,
> -		    "file::open", "allow_read/write /tmp/testfile16"}, {
> -	setup_test_file, test_file_open_16, cleanup_test_file,
> -		    "file::rewrite", "allow_rewrite /tmp/testfile16"}, {
> -	setup_test_file, test_file_open_17, cleanup_test_file,
> -		    "file::open", "allow_read/write /tmp/testfile17"}, {
> -	setup_test_file, test_file_open_17, cleanup_test_file,
> -		    "file::create", "allow_create /tmp/testfile17 0600"}, {
> -	setup_test_file, test_file_open_17, cleanup_test_file,
> -		    "file::rewrite", "allow_rewrite /tmp/testfile17"}, {
> -	setup_test_file, test_file_open_18, cleanup_test_file,
> -		    "file::open", "allow_read/write /tmp/testfile18"}, {
> -	setup_test_file, test_file_open_18, cleanup_test_file,
> -		    "file::truncate", "allow_truncate /tmp/testfile18"}, {
> -	setup_test_file, test_file_open_18, cleanup_test_file,
> -		    "file::rewrite", "allow_rewrite /tmp/testfile18"}, {
> -	setup_test_file, test_file_open_19, cleanup_test_file,
> -		    "file::open", "allow_read/write /tmp/testfile19"}, {
> -	setup_test_file, test_file_open_19, cleanup_test_file,
> -		    "file::create", "allow_create /tmp/testfile19 0600"}, {
> -	setup_test_file, test_file_open_19, cleanup_test_file,
> -		    "file::rewrite", "allow_rewrite /tmp/testfile19"}, {
> -	setup_test_file, test_file_open_20, cleanup_test_file,
> -		    "file::open", "allow_read/write /tmp/testfile20"}, {
> -	setup_test_file, test_file_open_21, cleanup_test_file,
> -		    "file::open", "allow_read/write /tmp/testfile21"}, {
> -	setup_test_file, test_file_open_21, cleanup_test_file,
> -		    "file::create", "allow_create /tmp/testfile21 0600"}, {
> -	setup_test_file, test_file_open_22, cleanup_test_file,
> -		    "file::open", "allow_read/write /tmp/testfile22"}, {
> -	setup_test_file, test_file_open_22, cleanup_test_file,
> -		    "file::truncate", "allow_truncate /tmp/testfile22"}, {
> -	setup_test_file_truncate, test_file_open_22,
> -		    cleanup_test_file_truncate, "file::rewrite",
> -		    "allow_rewrite /tmp/testfile22"}, {
> -	setup_test_file, test_file_open_23, cleanup_test_file,
> -		    "file::open", "allow_read/write /tmp/testfile23"}, {
> -	setup_test_file, test_file_open_23, cleanup_test_file,
> -		    "file::create", "allow_create /tmp/testfile23 0600"}, {
> -	setup_all_test_file, test_file_open_0, cleanup_test_file,
> -		    "file::open", "allow_read /tmp/testfile0"}, {
> -	setup_all_test_file, test_file_open_2, cleanup_test_file,
> -		    "file::open", "allow_read /tmp/testfile2"}, {
> -	setup_all_test_file, test_file_open_2, cleanup_test_file,
> -		    "file::truncate", "allow_truncate /tmp/testfile2"}, {
> -	setup_all_test_file_truncate, test_file_open_2,
> -		    cleanup_test_file_truncate, "file::rewrite",
> -		    "allow_rewrite /tmp/testfile2"}, {
> -	setup_all_test_file, test_file_open_4, cleanup_test_file,
> -		    "file::open", "allow_read /tmp/testfile4"}, {
> -	setup_all_test_file, test_file_open_6, cleanup_test_file,
> -		    "file::open", "allow_read /tmp/testfile6"}, {
> -	setup_all_test_file, test_file_open_6, cleanup_test_file,
> -		    "file::truncate", "allow_truncate /tmp/testfile6"}, {
> -	setup_all_test_file_truncate, test_file_open_6,
> -		    cleanup_test_file_truncate, "file::rewrite",
> -		    "allow_rewrite /tmp/testfile6"}, {
> -	setup_all_test_file, test_file_open_8, cleanup_test_file,
> -		    "file::open", "allow_write /tmp/testfile8"}, {
> -	setup_all_test_file, test_file_open_8, cleanup_test_file,
> -		    "file::rewrite", "allow_rewrite /tmp/testfile8"}, {
> -	setup_all_test_file, test_file_open_10, cleanup_test_file,
> -		    "file::open", "allow_write /tmp/testfile10"}, {
> -	setup_all_test_file, test_file_open_10, cleanup_test_file,
> -		    "file::truncate", "allow_truncate /tmp/testfile10"}, {
> -	setup_all_test_file, test_file_open_10, cleanup_test_file,
> -		    "file::rewrite", "allow_rewrite /tmp/testfile10"}, {
> -	setup_all_test_file, test_file_open_12, cleanup_test_file,
> -		    "file::open", "allow_write /tmp/testfile12"}, {
> -	setup_all_test_file, test_file_open_14, cleanup_test_file,
> -		    "file::open", "allow_write /tmp/testfile14"}, {
> -	setup_all_test_file, test_file_open_14, cleanup_test_file,
> -		    "file::truncate", "allow_truncate /tmp/testfile14"}, {
> -	setup_all_test_file_truncate, test_file_open_14,
> -		    cleanup_test_file_truncate, "file::rewrite",
> -		    "allow_rewrite /tmp/testfile14"}, {
> -	setup_all_test_file, test_file_open_16, cleanup_test_file,
> -		    "file::open", "allow_read/write /tmp/testfile16"}, {
> -	setup_all_test_file, test_file_open_16, cleanup_test_file,
> -		    "file::rewrite", "allow_rewrite /tmp/testfile16"}, {
> -	setup_all_test_file, test_file_open_18, cleanup_test_file,
> -		    "file::open", "allow_read/write /tmp/testfile18"}, {
> -	setup_all_test_file, test_file_open_18, cleanup_test_file,
> -		    "file::truncate", "allow_truncate /tmp/testfile18"}, {
> -	setup_all_test_file, test_file_open_18, cleanup_test_file,
> -		    "file::rewrite", "allow_rewrite /tmp/testfile18"}, {
> -	setup_all_test_file, test_file_open_20, cleanup_test_file,
> -		    "file::open", "allow_read/write /tmp/testfile20"}, {
> -	setup_all_test_file, test_file_open_22, cleanup_test_file,
> -		    "file::open", "allow_read/write /tmp/testfile22"}, {
> -	setup_all_test_file, test_file_open_22, cleanup_test_file,
> -		    "file::truncate", "allow_truncate /tmp/testfile22"}, {
> -	setup_all_test_file_truncate, test_file_open_22,
> -		    cleanup_test_file_truncate, "file::rewrite",
> -		    "allow_rewrite /tmp/testfile22"}, {
> -	NULL}
> -};
> -
> -int main(void)
> -{
> -	int i;
> -	tomoyo_test_init();
> -	for (i = 0; tests[i].do_test; i++) {
> -		int trial;
> -		for (trial = 0; trial < 2; trial++) {
> -			int should_fail;
> -			for (should_fail = 0; should_fail < 2; should_fail++) {
> -				if (tests[i].do_setup)
> -					tests[i].do_setup();
> -				if (!should_fail)
> -					write_domain_policy(tests[i].policy, 0);
> -				set_profile(3, tests[i].name);
> -				tests[i].do_test();
> -				show_result(tests[i].policy, !should_fail);
> -				set_profile(0, tests[i].name);
> -				if (tests[i].do_cleanup)
> -					tests[i].do_cleanup();
> -				if (!should_fail)
> -					write_domain_policy(tests[i].policy, 1);
> -			}
> -		}
> -	}
> -	for (i = 0; tests[i].do_test; i++) {
> -		int mode;
> -		for (mode = 0; mode < 4; mode++) {
> -			if (tests[i].do_setup)
> -				tests[i].do_setup();
> -			set_profile(mode, tests[i].name);
> -			tests[i].do_test();
> -			show_result(tests[i].name, 1);
> -			set_profile(0, tests[i].name);
> -			if (tests[i].do_cleanup)
> -				tests[i].do_cleanup();
> -		}
> -	}
> -	fprintf(domain_fp, "delete %s\n", self_domain);
> -	return 0;
> -}
> diff --git a/testcases/kernel/security/tomoyo/tomoyo_policy_io_test.c b/testcases/kernel/security/tomoyo/tomoyo_policy_io_test.c
> deleted file mode 100644
> index b1897a0fc..000000000
> --- a/testcases/kernel/security/tomoyo/tomoyo_policy_io_test.c
> +++ /dev/null
> @@ -1,195 +0,0 @@
> -/******************************************************************************/
> -/* This program is free software;  you can redistribute it and/or modify      */
> -/* it under the terms of the GNU General Public License as published by       */
> -/* the Free Software Foundation; either version 2 of the License, or          */
> -/* (at your option) any later version.                                        */
> -/*                                                                            */
> -/* This program is distributed in the hope that it will be useful,            */
> -/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
> -/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
> -/* the GNU General Public License for more details.                           */
> -/*                                                                            */
> -/* You should have received a copy of the GNU General Public License          */
> -/* along with this program;  if not, write to the Free Software               */
> -/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
> -/*                                                                            */
> -/******************************************************************************/
> -/*
> - * tomoyo_policy_io_test.c
> - *
> - * Testing program for security/tomoyo/
> - *
> - * Copyright (C) 2005-2010  NTT DATA CORPORATION
> - */
> -#include "include.h"
> -
> -static FILE *policy_fp = NULL;
> -static const char *policy_file = "";
> -
> -static void try_io(const char *policy, const char should_success)
> -{
> -	FILE *fp = fopen(policy_file, "r");
> -	char buffer[8192];
> -	int policy_found = 0;
> -	memset(buffer, 0, sizeof(buffer));
> -	printf("%s: ", policy);
> -	fprintf(policy_fp, "%s\n", policy);
> -	if (!fp) {
> -		printf("BUG: policy read failed\n");
> -		return;
> -	}
> -	while (fgets(buffer, sizeof(buffer) - 1, fp)) {
> -		char *cp = strchr(buffer, '\n');
> -		if (cp)
> -			*cp = '\0';
> -		if (!strcmp(buffer, policy)) {
> -			policy_found = 1;
> -			break;
> -		}
> -	}
> -	fclose(fp);
> -	if (should_success) {
> -		if (policy_found)
> -			printf("OK\n");
> -		else
> -			printf("BUG: policy write failed\n");
> -	} else {
> -		if (!policy_found)
> -			printf("OK : write rejected.\n");
> -		else
> -			printf("BUG: policy write not rejected.\n");
> -	}
> -	fprintf(policy_fp, "delete %s\n", policy);
> -}
> -
> -static void stage_policy_io_test(void)
> -{
> -	int i;
> -	policy_file = proc_policy_domain_policy;
> -	policy_fp = domain_fp;
> -	for (i = 0; i < 3; i++) {
> -		try_io("allow_chroot /", 1);
> -		try_io("allow_chroot ", 0);
> -		try_io("allow_chroot /mnt0/", 1);
> -		try_io("allow_chroot /var1/chroot2/", 1);
> -		try_io("allow_chroot /mnt0/", 1);
> -		try_io("allow_chroot /mnt0/", 1);
> -		try_io("allow_chroot /mnt0/", 1);
> -		try_io("allow_chroot /mnt\\?\\*/", 1);
> -		try_io("allow_chroot /mnt\\?\\*/", 1);
> -		try_io("allow_unmount /", 1);
> -		try_io("allow_unmount /sys1/", 1);
> -		try_io("allow_unmount /initrd2/", 1);
> -		try_io("allow_unmount /initrd/dev3/", 1);
> -		try_io("allow_unmount /initrd/\\*\\+/", 1);
> -		try_io("allow_unmount /initrd/\\@\\*/", 1);
> -		try_io("allow_unmount /initrd2/", 1);
> -		try_io("allow_pivot_root / /proc3/", 1);
> -		try_io("allow_pivot_root /sys5/ /proc3/", 1);
> -		try_io("allow_pivot_root /sys/", 0);
> -		try_io("allow_pivot_root *", 0);
> -		try_io("allow_pivot_root /sys5/ /proc3/", 1);
> -		try_io("allow_mount / / --bind 0xD", 1);
> -		try_io("allow_mount / / --move 0xF", 1);
> -		try_io("allow_mount / --remount", 0);
> -		try_io("allow_mount /", 0);
> -		try_io("allow_mount none /tmp/ tmpfs 0x1", 1);
> -		try_io("allow_mount none /tmp/ tmpfs", 0);
> -		try_io("allow_mount none /tmp/ nonexistent 0x0", 1);
> -		try_io("allow_mount none /proc/ proc 0x0", 1);
> -		try_io("allow_mount none /selinux/ selinuxfs 0x0", 1);
> -		try_io("allow_mount /proc/bus/usb /proc/bus/usb/ usbfs 0x0", 1);
> -		try_io("allow_mount none /dev/pts/ devpts 0x0", 1);
> -		try_io("allow_mount any / --remount 0xC00", 1);
> -		try_io("allow_mount /dev/sda1 /boot/ ext3 0xC00", 1);
> -		try_io("allow_mount none /dev/shm/ tmpfs 0x0", 1);
> -		try_io("allow_mount none /proc/sys/fs/binfmt_misc/ binfmt_misc "
> -		       "0x0", 1);
> -		try_io("allow_mount none /proc/sys/fs/binfmt_misc/ binfmt_misc "
> -		       "0x0 0x1", 0);
> -		try_io("allow_mount none /proc/sys/fs/binfmt_misc/ tmpfs "
> -		       "binfmt_misc 0x0", 0);
> -		try_io("allow_mount /proc/bus/usb /proc/bus/usb/ usbfs 0x0", 1);
> -	}
> -	policy_file = proc_policy_exception_policy;
> -	policy_fp = exception_fp;
> -	for (i = 0; i < 3; i++) {
> -		try_io("allow_read /tmp/abc", 1);
> -		try_io("allow_read /tmp/abc\\*", 1);
> -		try_io("allow_read abc", 1);
> -		try_io("allow_read /tmp/abc/", 1);
> -		try_io("allow_read", 0);
> -		try_io("allow_read *", 1);
> -		try_io("file_pattern /\\*\\*\\*", 1);
> -		try_io("file_pattern /abc", 1);
> -		try_io("file_pattern /abc /def", 0);
> -		try_io("file_pattern abcdef", 1);
> -		try_io("path_group TEST /", 1);
> -		try_io("path_group TEST /boo", 1);
> -		try_io("path_group TEST /bar", 1);
> -		try_io("path_group TEST /\\*", 1);
> -		try_io("path_group TEST / /", 0);
> -		try_io("path_group TEST /boo", 1);
> -		try_io("path_group TEST /bar", 1);
> -		try_io("path_group TEST boo", 1);
> -		try_io("path_group TEST boo/", 1);
> -		try_io("path_group TEST /bar", 1);
> -		try_io("path_group TEST3 /\\*", 1);
> -		try_io("path_group TEST3 / /", 0);
> -		try_io("path_group TEST3 /boo", 1);
> -		try_io("path_group TEST3 /bar", 1);
> -		try_io("path_group TEST3 boo", 1);
> -		try_io("path_group TEST3 boo/", 1);
> -		try_io("deny_rewrite /", 1);
> -		try_io("deny_rewrite /foo", 1);
> -		try_io("deny_rewrite /\\*", 1);
> -		try_io("deny_rewrite /\\:", 0);
> -		try_io("deny_rewrite / /", 0);
> -		try_io("deny_rewrite @/TEST", 1);
> -		try_io("aggregator /boo/\\* /BOO", 1);
> -		try_io("aggregator /boo/\\* /BOO\\*", 0);
> -		try_io("aggregator /boo/\\*/ /BOO", 1);
> -		try_io("aggregator /boo/\\* /BOO/", 1);
> -		try_io("keep_domain <kernel>", 1);
> -		try_io("keep_domain <kernel> /sbin/init", 1);
> -		try_io("keep_domain <kernel> foo", 0);
> -		try_io("keep_domain <kernel> \\*", 0);
> -		try_io("keep_domain /ssh", 1);
> -		try_io("keep_domain /ssh /foo", 0);
> -		try_io("keep_domain /foo from <kernel>", 1);
> -		try_io("keep_domain /foo from <kernel> /sbin/init", 1);
> -		try_io("keep_domain from <kernel> /sbin/init", 0);
> -		try_io("keep_domain \\* from <kernel> /sbin/init", 0);
> -		try_io("no_keep_domain <kernel>", 1);
> -		try_io("no_keep_domain <kernel> /sbin/init", 1);
> -		try_io("no_keep_domain <kernel> foo", 0);
> -		try_io("no_keep_domain <kernel> \\*", 0);
> -		try_io("no_keep_domain /ssh", 1);
> -		try_io("no_keep_domain /ssh /foo", 0);
> -		try_io("no_keep_domain /foo from <kernel>", 1);
> -		try_io("no_keep_domain /foo from <kernel> /sbin/init", 1);
> -		try_io("no_keep_domain from <kernel> /sbin/init", 0);
> -		try_io("no_keep_domain \\* from <kernel> /sbin/init", 0);
> -		try_io("initialize_domain /foo", 1);
> -		try_io("initialize_domain /\\*", 1);
> -		try_io("initialize_domain /foo /bar", 0);
> -		try_io("initialize_domain /foo from /bar", 1);
> -		try_io("initialize_domain /foo from <kernel> /bar", 1);
> -		try_io("initialize_domain /\\* from <kernel>", 1);
> -		try_io("initialize_domain /foo from <kernel> \\*", 0);
> -		try_io("no_initialize_domain /foo", 1);
> -		try_io("no_initialize_domain /\\*", 1);
> -		try_io("no_initialize_domain /foo /bar", 0);
> -		try_io("no_initialize_domain /foo from /bar", 1);
> -		try_io("no_initialize_domain /foo from <kernel> /bar", 1);
> -		try_io("no_initialize_domain /\\* from <kernel>", 1);
> -		try_io("no_initialize_domain /foo from <kernel> \\*", 0);
> -	}
> -}
> -
> -int main(void)
> -{
> -	tomoyo_test_init();
> -	stage_policy_io_test();
> -	return 0;
> -}
> diff --git a/testcases/kernel/security/tomoyo/tomoyo_policy_memory_test.c b/testcases/kernel/security/tomoyo/tomoyo_policy_memory_test.c
> deleted file mode 100644
> index a6620ba30..000000000
> --- a/testcases/kernel/security/tomoyo/tomoyo_policy_memory_test.c
> +++ /dev/null
> @@ -1,358 +0,0 @@
> -/******************************************************************************/
> -/* This program is free software;  you can redistribute it and/or modify      */
> -/* it under the terms of the GNU General Public License as published by       */
> -/* the Free Software Foundation; either version 2 of the License, or          */
> -/* (at your option) any later version.                                        */
> -/*                                                                            */
> -/* This program is distributed in the hope that it will be useful,            */
> -/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
> -/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
> -/* the GNU General Public License for more details.                           */
> -/*                                                                            */
> -/* You should have received a copy of the GNU General Public License          */
> -/* along with this program;  if not, write to the Free Software               */
> -/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
> -/*                                                                            */
> -/******************************************************************************/
> -/*
> - * tomoyo_policy_memory_test.c
> - *
> - * Testing program for security/tomoyo/
> - *
> - * Copyright (C) 2005-2010  NTT DATA CORPORATION
> - */
> -/*
> - * Usage: Run this program using init= boot option.
> - */
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <string.h>
> -#include <unistd.h>
> -#include <sys/mount.h>
> -
> -static void BUG(const char *msg)
> -{
> -	printf("%s", msg);
> -	fflush(stdout);
> -	while (1)
> -		sleep(100);
> -}
> -
> -static const char *policy_file = NULL;
> -static const char *policy = NULL;
> -
> -static void get_meminfo(unsigned int *policy_memory)
> -{
> -	FILE *fp = fopen("/sys/kernel/security/tomoyo/meminfo", "r");
> -	if (!fp || fscanf(fp, "Policy: %u", policy_memory) != 1 || fclose(fp))
> -		BUG("BUG: Policy read error\n");
> -}
> -
> -static void check_policy_common(const int found_expected, const int id)
> -{
> -	FILE *fp = fopen(policy_file, "r");
> -	char buffer[8192];
> -	int policy_found = 0;
> -	memset(buffer, 0, sizeof(buffer));
> -	if (!fp)
> -		BUG("BUG: Policy read error\n");
> -	while (fgets(buffer, sizeof(buffer) - 1, fp)) {
> -		char *cp = strchr(buffer, '\n');
> -		if (cp)
> -			*cp = '\0';
> -		if (strcmp(buffer, policy))
> -			continue;
> -		policy_found = 1;
> -		break;
> -	}
> -	fclose(fp);
> -	if (policy_found != found_expected) {
> -		printf("BUG: Policy write error: %s %s at %d\n", policy,
> -		       found_expected ? "not added" : "not deleted", id);
> -		BUG("");
> -	}
> -}
> -
> -static inline void check_policy_written(FILE * fp, const int id)
> -{
> -	fflush(fp);
> -	check_policy_common(1, id);
> -}
> -
> -static inline void check_policy_deleted(FILE * fp, const int id)
> -{
> -	fflush(fp);
> -	check_policy_common(0, id);
> -}
> -
> -static const char *domain_testcases[] = {
> -	"allow_create /tmp/mknod_reg_test 0600",
> -	"allow_create /tmp/open_test 0600",
> -	"allow_create /tmp/open_test 0600",
> -	"allow_create /tmp/open_test 0600",
> -	"allow_execute /bin/true",
> -	"allow_execute /bin/true",
> -	"allow_execute /bin/true0",
> -	"allow_execute /bin/true1",
> -	"allow_execute /bin/true2",
> -	"allow_execute /bin/true3",
> -	"allow_execute /bin/true4",
> -	"allow_execute /bin/true5",
> -	"allow_execute /bin/true6",
> -	"allow_execute /bin/true7",
> -	"allow_execute /bin/true7",
> -	"allow_execute /bin/true7",
> -	"allow_execute /bin/true8",
> -	"allow_ioctl socket:[family=2:type=2:protocol=17] 0-35122",
> -	"allow_ioctl socket:[family=2:type=2:protocol=17] 35122-35124",
> -	"allow_link /tmp/link_source_test /tmp/link_dest_test",
> -	"allow_mkblock /tmp/mknod_blk_test 0600 1 0",
> -	"allow_mkchar /tmp/mknod_chr_test 0600 1 3",
> -	"allow_mkdir /tmp/mkdir_test/ 0755",
> -	"allow_mkfifo /tmp/mknod_fifo_test 0600",
> -	"allow_mkfifo /tmp/mknod_fifo_test 0600",
> -	"allow_mksock /tmp/mknod_sock_test 0600",
> -	"allow_mksock /tmp/socket_test 0600",
> -	"allow_read /bin/true",
> -	"allow_read /bin/true",
> -	"allow_read /dev/null",
> -	"allow_read /dev/null",
> -	"allow_read /dev/null",
> -	"allow_read /dev/null",
> -	"allow_read /dev/null",
> -	"allow_read /dev/null",
> -	"allow_read /foo",
> -	"allow_read /proc/sys/net/ipv4/ip_local_port_range",
> -	"allow_read /proc/sys/net/ipv4/ip_local_port_range",
> -	"allow_read/write /bar",
> -	"allow_read/write /dev/null",
> -	"allow_read/write /dev/null",
> -	"allow_read/write /proc/sys/net/ipv4/ip_local_port_range",
> -	"allow_read/write /proc/sys/net/ipv4/ip_local_port_range",
> -	"allow_read/write /tmp/fifo",
> -	"allow_read/write /tmp/fifo",
> -	"allow_read/write /tmp/rewrite_test",
> -	"allow_rename /tmp/rename_source_test /tmp/rename_dest_test",
> -	"allow_rmdir /tmp/rmdir_test/",
> -	"allow_symlink /symlink",
> -	"allow_symlink /symlink",
> -	"allow_symlink /symlink",
> -	"allow_symlink /symlink",
> -	"allow_symlink /tmp/symlink_source_test",
> -	"allow_symlink /tmp/symlink_source_test",
> -	"allow_symlink /tmp/symlink_source_test",
> -	"allow_symlink /tmp/symlink_source_test",
> -	"allow_symlink /tmp/symlink_source_test",
> -	"allow_truncate /tmp/rewrite_test",
> -	"allow_truncate /tmp/truncate_test",
> -	"allow_truncate /tmp/truncate_test",
> -	"allow_unlink /tmp/unlink_test",
> -	"allow_write /123",
> -	"allow_write /dev/null",
> -	"allow_write /dev/null",
> -	"allow_write /devfile",
> -	"allow_write /devfile",
> -	"allow_write /proc/sys/net/ipv4/ip_local_port_range",
> -	"allow_write /proc/sys/net/ipv4/ip_local_port_range",
> -	"allow_write /tmp/open_test",
> -	"allow_write /tmp/open_test",
> -	"allow_write /tmp/open_test",
> -	"allow_write /tmp/truncate_test",
> -	"allow_write /tmp/truncate_test",
> -	"allow_rewrite /tmp/rewrite_test",
> -	"allow_rewrite /tmp/rewrite_test",
> -	"allow_mount /dev/sda1 /mnt/sda1/ ext3 0x123",
> -	"allow_mount /dev/sda1 /mnt/sda1/ ext3 123",
> -	"allow_mount /dev/sda1 /mnt/sda1/ ext3 0123",
> -	"allow_mount /dev/sda1 /mnt/sda1/ ext3 0x123",
> -	"allow_mount /dev/sda1 /mnt/sda1/ ext3 123",
> -	"allow_mount /dev/sda1 /mnt/sda1/ ext3 0123",
> -	"allow_chroot /",
> -	"allow_chroot /",
> -	"allow_chroot /mnt/",
> -	"allow_pivot_root / /proc/",
> -	"allow_pivot_root /mnt/ /proc/mnt/",
> -	"allow_unmount /",
> -	"allow_unmount /proc/",
> -	NULL
> -};
> -
> -static void domain_policy_test(const unsigned int before)
> -{
> -	unsigned int after;
> -	int j;
> -	policy_file = "/sys/kernel/security/tomoyo/domain_policy";
> -	for (j = 0; domain_testcases[j]; j++) {
> -		int i;
> -		FILE *fp = fopen(policy_file, "w");
> -		if (!fp)
> -			BUG("BUG: Policy write error\n");
> -		fprintf(fp, "<kernel>\n");
> -		policy = domain_testcases[j];
> -		printf("Processing: %s\n", policy);
> -		for (i = 0; i < 100; i++) {
> -			fprintf(fp, "%s\n", policy);
> -			if (!i)
> -				check_policy_written(fp, 1);
> -			fprintf(fp, "delete %s\n", policy);
> -		}
> -		check_policy_deleted(fp, 1);
> -		for (i = 0; i < 100; i++)
> -			fprintf(fp, "%s\n", policy);
> -		check_policy_written(fp, 2);
> -		fprintf(fp, "delete %s\n", policy);
> -		check_policy_deleted(fp, 2);
> -		fclose(fp);
> -		for (i = 0; i < 30; i++) {
> -			usleep(100000);
> -			get_meminfo(&after);
> -			if (before == after)
> -				break;
> -		}
> -		if (before != after) {
> -			printf("Policy: %d\n", after - before);
> -			BUG("Policy read/write test: Fail\n");
> -		}
> -	}
> -	for (j = 0; j < 10; j++) {
> -		int i;
> -		FILE *fp = fopen(policy_file, "w");
> -		if (!fp)
> -			BUG("BUG: Policy write error\n");
> -		fprintf(fp, "<kernel> /sbin/init\n");
> -		for (i = 0; domain_testcases[i]; i++)
> -			fprintf(fp, "%s\n", domain_testcases[i]);
> -		fprintf(fp, "delete <kernel> /sbin/init\n");
> -		fclose(fp);
> -		for (i = 0; i < 50; i++) {
> -			usleep(100000);
> -			get_meminfo(&after);
> -			if (before == after)
> -				break;
> -		}
> -		if (before != after) {
> -			printf("Policy: %d\n", after - before);
> -			BUG("Policy read/write test: Fail\n");
> -		}
> -	}
> -}
> -
> -static const char *exception_testcases[] = {
> -	"allow_read /tmp/mknod_reg_test",
> -	"allow_env HOME",
> -	"path_group PG1 /",
> -	"path_group PG2 /",
> -	"address_group AG3 0.0.0.0",
> -	"address_group AG3 1.2.3.4-5.6.7.8",
> -	"address_group AG3 f:ee:ddd:cccc:b:aa:999:8888",
> -	"address_group AG4 0:1:2:3:4:5:6:7-8:90:a00:b000:c00:d0:e:f000",
> -	"number_group NG1 1000",
> -	"number_group NG2 10-0x100000",
> -	"number_group NG3 01234567-0xABCDEF89",
> -	"deny_autobind 1024",
> -	"deny_autobind 32668-65535",
> -	"deny_autobind 0-1023",
> -	"initialize_domain /usr/sbin/sshd",
> -	"no_initialize_domain /usr/sbin/sshd",
> -	"initialize_domain /usr/sbin/sshd from /bin/bash",
> -	"no_initialize_domain /usr/sbin/sshd from /bin/bash",
> -	"initialize_domain /usr/sbin/sshd from "
> -	    "<kernel> /bin/mingetty/bin/bash",
> -	"no_initialize_domain /usr/sbin/sshd from "
> -	    "<kernel> /bin/mingetty/bin/bash",
> -	"keep_domain <kernel> /usr/sbin/sshd /bin/bash",
> -	"no_keep_domain <kernel> /usr/sbin/sshd /bin/bash",
> -	"keep_domain /bin/pwd from <kernel> /usr/sbin/sshd /bin/bash",
> -	"no_keep_domain /bin/pwd from <kernel> /usr/sbin/sshd /bin/bash",
> -	"keep_domain /bin/pwd from /bin/bash",
> -	"no_keep_domain /bin/pwd from /bin/bash",
> -	"file_pattern /proc/\\$/task/\\$/environ",
> -	"file_pattern /proc/\\$/task/\\$/auxv",
> -	"allow_read /etc/ld.so.cache",
> -	"allow_read /proc/meminfo",
> -	"allow_read /proc/sys/kernel/version",
> -	"allow_read /etc/localtime",
> -	"allow_read /proc/self/task/\\$/attr/current",
> -	"allow_read /proc/self/task/\\$/oom_score",
> -	"allow_read /proc/self/wchan",
> -	"allow_read /lib/ld-2.5.so",
> -	"file_pattern pipe:[\\$]",
> -	"file_pattern socket:[\\$]",
> -	"file_pattern /var/cache/logwatch/logwatch.\\*/",
> -	"file_pattern /var/cache/logwatch/logwatch.\\*/\\*",
> -	"deny_rewrite /var/log/\\*",
> -	"deny_rewrite /var/log/\\*/\\*",
> -	"aggregator /etc/rc.d/rc\\?.d/\\?\\+\\+smb /etc/rc.d/init.d/smb",
> -	"aggregator /etc/rc.d/rc\\?.d/\\?\\+\\+crond /etc/rc.d/init.d/crond",
> -	NULL
> -};
> -
> -static void exception_policy_test(const unsigned int before)
> -{
> -	unsigned int after;
> -	int j;
> -	policy_file = "/sys/kernel/security/tomoyo/exception_policy";
> -	for (j = 0; exception_testcases[j]; j++) {
> -		int i;
> -		FILE *fp = fopen(policy_file, "w");
> -		if (!fp)
> -			BUG("BUG: Policy write error\n");
> -		policy = exception_testcases[j];
> -		printf("Processing: %s\n", policy);
> -		for (i = 0; i < 100; i++) {
> -			fprintf(fp, "%s\n", policy);
> -			if (!i)
> -				check_policy_written(fp, 1);
> -			fprintf(fp, "delete %s\n", policy);
> -		}
> -		check_policy_deleted(fp, 1);
> -		for (i = 0; i < 100; i++)
> -			fprintf(fp, "%s\n", policy);
> -		check_policy_written(fp, 2);
> -		fprintf(fp, "delete %s\n", policy);
> -		check_policy_deleted(fp, 2);
> -		fclose(fp);
> -		for (i = 0; i < 30; i++) {
> -			usleep(100000);
> -			get_meminfo(&after);
> -			if (before == after)
> -				break;
> -		}
> -		if (before != after) {
> -			printf("Policy: %d\n", after - before);
> -			BUG("Policy read/write test: Fail\n");
> -		}
> -	}
> -	for (j = 0; j < 10; j++) {
> -		int i;
> -		FILE *fp = fopen(policy_file, "w");
> -		if (!fp)
> -			BUG("BUG: Policy write error\n");
> -		for (i = 0; exception_testcases[i]; i++)
> -			fprintf(fp, "%s\n", exception_testcases[i]);
> -		for (i = 0; exception_testcases[i]; i++)
> -			fprintf(fp, "delete %s\n", exception_testcases[i]);
> -		fclose(fp);
> -		for (i = 0; i < 50; i++) {
> -			usleep(100000);
> -			get_meminfo(&after);
> -			if (before == after)
> -				break;
> -		}
> -		if (before != after) {
> -			printf("Policy: %d\n", after - before);
> -			BUG("Policy read/write test: Fail\n");
> -		}
> -	}
> -}
> -
> -int main(void)
> -{
> -	unsigned int before;
> -	mount("/proc", "/proc/", "proc", 0, NULL);
> -	get_meminfo(&before);
> -	domain_policy_test(before);
> -	exception_policy_test(before);
> -	BUG("Policy read/write test: Success\n");
> -	return 0;
> -}
> diff --git a/testcases/kernel/security/tomoyo/tomoyo_rewrite_test.c b/testcases/kernel/security/tomoyo/tomoyo_rewrite_test.c
> deleted file mode 100644
> index 7bc22c39b..000000000
> --- a/testcases/kernel/security/tomoyo/tomoyo_rewrite_test.c
> +++ /dev/null
> @@ -1,169 +0,0 @@
> -/******************************************************************************/
> -/* This program is free software;  you can redistribute it and/or modify      */
> -/* it under the terms of the GNU General Public License as published by       */
> -/* the Free Software Foundation; either version 2 of the License, or          */
> -/* (at your option) any later version.                                        */
> -/*                                                                            */
> -/* This program is distributed in the hope that it will be useful,            */
> -/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
> -/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
> -/* the GNU General Public License for more details.                           */
> -/*                                                                            */
> -/* You should have received a copy of the GNU General Public License          */
> -/* along with this program;  if not, write to the Free Software               */
> -/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
> -/*                                                                            */
> -/******************************************************************************/
> -/*
> - * tomoyo_rewrite_test.c
> - *
> - * Testing program for security/tomoyo/
> - *
> - * Copyright (C) 2005-2010  NTT DATA CORPORATION
> - */
> -#include "include.h"
> -
> -static int should_fail = 0;
> -
> -static void show_prompt(const char *str)
> -{
> -	printf("Testing %35s: (%s) ", str,
> -	       should_fail ? "must fail" : "must success");
> -	errno = 0;
> -}
> -
> -static void show_result(int result)
> -{
> -	if (should_fail) {
> -		if (result == EOF) {
> -			if (errno == EPERM)
> -				printf("OK: Permission denied.\n");
> -			else
> -				printf("BUG!\n");
> -		} else {
> -			printf("BUG!\n");
> -		}
> -	} else {
> -		if (result != EOF)
> -			printf("OK\n");
> -		else
> -			printf("BUG!\n");
> -	}
> -}
> -
> -#define REWRITE_PATH "/tmp/rewrite_test"
> -
> -static void stage_rewrite_test(void)
> -{
> -	int fd;
> -
> -	/* Start up */
> -	write_domain_policy("allow_read/write " REWRITE_PATH, 0);
> -	write_domain_policy("allow_truncate " REWRITE_PATH, 0);
> -	write_domain_policy("allow_create " REWRITE_PATH " 0600", 0);
> -	write_domain_policy("allow_unlink " REWRITE_PATH, 0);
> -	write_exception_policy("deny_rewrite " REWRITE_PATH, 0);
> -	set_profile(3, "file::open");
> -	set_profile(3, "file::create");
> -	set_profile(3, "file::truncate");
> -	set_profile(3, "file::rewrite");
> -	set_profile(3, "file::unlink");
> -	close(open(REWRITE_PATH, O_WRONLY | O_APPEND | O_CREAT, 0600));
> -
> -	/* Enforce mode */
> -	should_fail = 0;
> -
> -	show_prompt("open(O_RDONLY)");
> -	fd = open(REWRITE_PATH, O_RDONLY);
> -	show_result(fd);
> -	close(fd);
> -
> -	show_prompt("open(O_WRONLY | O_APPEND)");
> -	fd = open(REWRITE_PATH, O_WRONLY | O_APPEND);
> -	show_result(fd);
> -	close(fd);
> -
> -	should_fail = 1;
> -	show_prompt("open(O_WRONLY)");
> -	fd = open(REWRITE_PATH, O_WRONLY);
> -	show_result(fd);
> -	close(fd);
> -
> -	show_prompt("open(O_WRONLY | O_TRUNC)");
> -	fd = open(REWRITE_PATH, O_WRONLY | O_TRUNC);
> -	show_result(fd);
> -	close(fd);
> -
> -	show_prompt("open(O_WRONLY | O_TRUNC | O_APPEND)");
> -	fd = open(REWRITE_PATH, O_WRONLY | O_TRUNC | O_APPEND);
> -	show_result(fd);
> -	close(fd);
> -
> -	show_prompt("truncate()");
> -	show_result(truncate(REWRITE_PATH, 0));
> -
> -	fd = open(REWRITE_PATH, O_WRONLY | O_APPEND);
> -	show_prompt("ftruncate()");
> -	show_result(ftruncate(fd, 0));
> -
> -	show_prompt("fcntl(F_SETFL, ~O_APPEND)");
> -	show_result(fcntl(fd, F_SETFL, fcntl(fd, F_GETFL) & ~O_APPEND));
> -	close(fd);
> -
> -	/* Permissive mode */
> -	set_profile(2, "file::open");
> -	set_profile(2, "file::create");
> -	set_profile(2, "file::truncate");
> -	set_profile(2, "file::rewrite");
> -	set_profile(2, "file::unlink");
> -	should_fail = 0;
> -
> -	show_prompt("open(O_RDONLY)");
> -	fd = open(REWRITE_PATH, O_RDONLY);
> -	show_result(fd);
> -	close(fd);
> -
> -	show_prompt("open(O_WRONLY | O_APPEND)");
> -	fd = open(REWRITE_PATH, O_WRONLY | O_APPEND);
> -	show_result(fd);
> -	close(fd);
> -
> -	show_prompt("open(O_WRONLY)");
> -	fd = open(REWRITE_PATH, O_WRONLY);
> -	show_result(fd);
> -	close(fd);
> -
> -	show_prompt("open(O_WRONLY | O_TRUNC)");
> -	fd = open(REWRITE_PATH, O_WRONLY | O_TRUNC);
> -	show_result(fd);
> -	close(fd);
> -
> -	show_prompt("open(O_WRONLY | O_TRUNC | O_APPEND)");
> -	fd = open(REWRITE_PATH, O_WRONLY | O_TRUNC | O_APPEND);
> -	show_result(fd);
> -	close(fd);
> -
> -	show_prompt("truncate()");
> -	show_result(truncate(REWRITE_PATH, 0));
> -
> -	fd = open(REWRITE_PATH, O_WRONLY | O_APPEND);
> -	show_prompt("ftruncate()");
> -	show_result(ftruncate(fd, 0));
> -
> -	show_prompt("fcntl(F_SETFL, ~O_APPEND)");
> -	show_result(fcntl(fd, F_SETFL, fcntl(fd, F_GETFL) & ~O_APPEND));
> -	close(fd);
> -
> -	/* Clean up */
> -	unlink(REWRITE_PATH);
> -	write_exception_policy("deny_rewrite " REWRITE_PATH, 0);
> -	printf("\n\n");
> -}
> -
> -int main(void)
> -{
> -	tomoyo_test_init();
> -	stage_rewrite_test();
> -	clear_status();
> -	return 0;
> -}



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
