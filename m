Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F01482DBC7E
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 09:16:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 96A903C57E8
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 09:16:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 941693C29E8
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 09:16:43 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [62.140.7.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2048F200072
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 09:16:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1608106602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IrJgTXX2r8MgWb/cnWUvz//Y4lCvwJsEcLpjJX055Do=;
 b=dn4O2rHhNJ3zNna7SFjFe40f/Gp5+OdhBmqftdCU2eSJ22LQ0EClQWquF2naHmZhtudonL
 lng0CYtccv7naYaeCKQ4Yl3paHXorpP8WgF/Zc/YuJpMmr7A8cILMbhL3GaQSh5GHDEKNT
 ezbIrC0X9ClDOoH9yJJhc+bKQSxftpg=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-Hb8_rS1pMx-4FvsGnSBSiw-1; Wed, 16 Dec 2020 09:16:40 +0100
X-MC-Unique: Hb8_rS1pMx-4FvsGnSBSiw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLwvTh1h+skTJC/5DztCw1lk5zfrapA5RR4Dm7Zt+HkV8ynYQ7CFAiFZqcRiSMdHbgubM+yRjfKtD7MCaupXk9xwIwcXBpNDpDZ5hPC3hV7cRPtF6ixcKOWzDrXJcbAN860UCnrIlQ42TEE8Ql8HJohz1jOyAN5EdqNbDC7q4NxexPvmfTb7DI9mLpI3Yt4XB6AStBZ6kNkw5EMkPq912IW4ci7SlW5XVAUJHc8+gudrbYAbN2HFJKEkPANnbNsjWrUxYp1M06s4Q3SOIjhwv/3hrNt+nj0uCB0BIYD+7v0GKwRl8aFmWUt3G7uH5v1BbK4MGDFHrplKzHgL577JQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrJgTXX2r8MgWb/cnWUvz//Y4lCvwJsEcLpjJX055Do=;
 b=NLi1dtmnh5U23tDzFf3Yyr1At4PlAjfsOoMc7HqdRv0PrGdBybnYUDs49XSxqK1FtKP2LqNSML7csEmtmum63beuk5GO+dL0Pr3/AXJERsfXxlc5cw1Vqw3Ck/XhL0dux/EZuoO5zEvXIJEqzJHQcDVNPI78DLBf1pjYKE2Y6s/B4Zeyi0rtCywz+M4Y0Vn6PLx9iTAPjIxxQ2T+4niGLUIJiQDe3UyB8M4DEhYZhV7sf1h12rdOc+7hhjAPGNgB+tmT2e93PW8uZ8hFAr98Hy9Hedrn+T6yazgDY8ArYWWQreRjeAm3LtZewPFEiCN+/ZGCWQQaVTCJT9z0pQOMog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: cn.fujitsu.com; dkim=none (message not signed)
 header.d=none;cn.fujitsu.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VI1PR0401MB2253.eurprd04.prod.outlook.com
 (2603:10a6:800:26::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 16 Dec
 2020 08:16:38 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224%7]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 08:16:38 +0000
Message-ID: <c6340b4dc96458ddd972beb28059324d44f44a99.camel@suse.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Date: Wed, 16 Dec 2020 10:16:35 +0200
In-Reply-To: <5FD96C97.6020602@cn.fujitsu.com>
References: <20201215155650.6496-1-radoslav.kolev@suse.com>
 <5FD96C97.6020602@cn.fujitsu.com>
User-Agent: Evolution 3.34.4 
X-Originating-IP: [85.196.172.93]
X-ClientProxiedBy: AM0PR02CA0099.eurprd02.prod.outlook.com
 (2603:10a6:208:154::40) To VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.102] (85.196.172.93) by
 AM0PR02CA0099.eurprd02.prod.outlook.com (2603:10a6:208:154::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 08:16:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a59f1db-35ca-44aa-5c12-08d8a19ae966
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2253:
X-Microsoft-Antispam-PRVS: <VI1PR0401MB225329EB11D44B0B8DA03593E0C50@VI1PR0401MB2253.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6cpspJn0rEVumOH3U4OTn8kqP+V3FL+qHinXtRSaf3wiAeO/PQbpKjvgB1kFEmn66RSa4EfgS6sr9ejHckHw1cbY8wXpwRfWFCIrdHlOxY3oJiYH0K1O6+aq9y34wcnSmHcCs1Z+VmyTTLI9tBM9plQrlfqqiYiobONKlru2Mw43dZM+P6GTv/294CMu64TVZUFPTNj73auGg70GG5ZIq9HhDNKFEPFT2xfM/QbBenbkG8kFtF4uG2YtRHGGVNrh1gEWQf5BAlxk+dMiUTYhKmzJlica/4Yolp/GTcSK6cDrqtAcewO37hZU3yBkS1QfHWOXdEI//VAzsl2v1lxgug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(366004)(376002)(39860400002)(346002)(316002)(36756003)(16526019)(86362001)(5660300002)(2906002)(16576012)(478600001)(8676002)(4001150100001)(6916009)(52116002)(4326008)(956004)(2616005)(44832011)(66946007)(186003)(8936002)(26005)(4744005)(83380400001)(6486002)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SjFMcTdoa1V2Q1ZXQjFTeFlLMk9OWkZoYVJ3UGwvYUhWYVBJOU4rUXZBMHpK?=
 =?utf-8?B?SkdXWDlrU1F2TGVHdFFoa0U0UWxlWksyT3NiTEtjWThjM3loUWdFK0ZXVzFU?=
 =?utf-8?B?NDFOa3hwS3psVXdBMEU5MzhabWhGYllQM2txR3A0Q0IxTVlKdnI5Sm5yWmEr?=
 =?utf-8?B?TWUwR2VVZHpmeWY3MjVCRHArNkNKV20rU3JmYzRrYzFNejhlWThyZm5oOGM5?=
 =?utf-8?B?Z2F5VjJya20xU0pLZ1dqMjQvRUNtUVRjUEsyblN3U0NPRjdFUW0xN0ppc0JT?=
 =?utf-8?B?SFRScEZleUNIK3I3dDhUaE4rVjF6YzBQTFozU1FjUHlqckdmSnU4Tm5RM09w?=
 =?utf-8?B?bTJ1Y3EzMUVDcmZDL2RObnJMSkVxOGJjdGV4bFN2YnpvUFM4MXdlaXQxUzJi?=
 =?utf-8?B?aDJuY3B0ZVFzZ0dQL2E0SFJuYlRwUnl4Nm83eXpHWUMxQXFXd3lWTElqQ1Y4?=
 =?utf-8?B?SVdnOENuM2QvaHhzcytzeUZoRkd6eUpOa3Zldy9kSUZ5bVdBQmQ5Z28reVlY?=
 =?utf-8?B?bmRTSllzdk5ic25DZVNMWDZSRVhiOStxSGpuY1ZMYXlSaVhWTGdKek13alRI?=
 =?utf-8?B?RHkrazlXOVErYndyVGJyYUFLblZRQTVOcm1lN2gzV3puZ0k0U3dORGk3bkIz?=
 =?utf-8?B?Q3k3eXRlckFIUktXa3djU2dmUmRUTysxRXZWQmxaUGIyWExQZmJpa0MzV0hC?=
 =?utf-8?B?T3NkblgzcnJaYlZFeHJnWlVQNnJXUTRBV0tmZys5Q3BqZ2ZpbCtFRGIyQ0dw?=
 =?utf-8?B?UklaU09nMHVZNFB1S2ZvUnppUU50UWwvWTFwUjlieVI1WmxOWS9TVWVmTHA0?=
 =?utf-8?B?dFB5TG9CcWhwZHBKK2cvMytwYzQ4WXVyaDhDV2dGeWZYVlpncHNRZjFIZDNo?=
 =?utf-8?B?VE1jZ2ZpSzVCN2dXQ1Q3R2k2VGxtcnU5aDlIYnJyZ1o5YmhKM0JRZmlxUTZ2?=
 =?utf-8?B?cTBKMk1sR3dFVEpyVkpZbE0rbjJseWtWcmUyODk4Y0JiNnd2Yjl5dXRNMmJn?=
 =?utf-8?B?NkZUR1Q3WVFyWFAyMUpiTHRWWmJCcFB4ZDY3V2ZRbjdZQmZNZlJ1am1sYjBV?=
 =?utf-8?B?b2tSYklrNmIrRUhOT1JyQmxDalplNCtyaXQyYUZKYWQvcVhDUWRhV3l0WTJh?=
 =?utf-8?B?bTZVOHFRSjc4UkhOaU5NUGpBWE8wSFFwWm9LZU1CdXdvODhrTzFjblB5S0hv?=
 =?utf-8?B?NEJGUGFpVFkxZHBzY28zZDVxZGVMeUIzZnI2UGNObHR1SlNBSkVEZ1FKbVFE?=
 =?utf-8?B?ZXBsNy9WT0kzd1FGMmlINDJxVDhYTW42ZWhtU1JCYVp6Ty80UlB0dUdjeS9y?=
 =?utf-8?Q?YSR6pJGZRMXYM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 08:16:38.4480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a59f1db-35ca-44aa-5c12-08d8a19ae966
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rO7s3j7p+zNqIjtbNpWSatotRFSWM9SFZ1il6KE6K6aa38DvesARRlI5gSaYzOabFQnRA9Ld36RitWGWCCqmuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2253
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_loop05.c: skip test on overlay
 filesystem
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
From: Radoslav Kolev via ltp <ltp@lists.linux.it>
Reply-To: Radoslav Kolev <radoslav.kolev@suse.com>
Cc: Radoslav Kolev via ltp <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, 2020-12-16 at 10:10 +0800, Yang Xu wrote:
> Hi Radoslav
> > The undelrying device can't be properly detected and causes failure
> > when running in an overlay filesystem.
> 
> I guess the best way is to change tst_find_backing_dev api, so it
> can 
> detect the correct underlying device.

Yes, that would be the best solution. If you have and idea of how to do
it that's not too complicated please give me some pointers.

I looked into it briefly, but didn't see a straighforward way.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
