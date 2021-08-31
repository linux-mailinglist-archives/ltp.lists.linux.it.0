Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 998BE3FC1CA
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 06:19:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3DEAA3C9B5A
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 06:19:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C3DB93C2A9C
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 06:19:51 +0200 (CEST)
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-ty1jpn01olkn0162.outbound.protection.outlook.com [104.47.93.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0AC2F1400991
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 06:19:51 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0MKyxjCwxG8AOjKNhZZEiEZfKoQ8ss2i8wf2CxY4cpGe3Lo9ze5uuqXgpViDx0zkoEKYiHX28KyKuD09cN6BcWWFSl0n10+/vls12Z+vUocG6oJRdOkh/UILGfho+H2tGoGWUZQ08G2953Dd1EzgLDyeKaYwOgcJ49ZsAdKPvPNoYNhSkdNJKv51c2ADFwhcu5uWg4jvgBGddKsvMQSjjYYlT63sUICSCbV8Bm8wTtvMHDqQOeiI86geto1bXzCbuoBS+tuF2/M8DSxXxJTrE0oQ6cuB2iUK/YJqN+Z6s0fyE9ceK1IVJ/X9SZYewbBfGpW+FceIJDrh7CGKePfjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QN4sgr2lFG7FVClFt7cpGG4xUrTGlEB9xGvQeB/OvA=;
 b=HX1T128B9aKvdahfXr7TLkLq9JqDkKShfqmdegSfBRFA+g1bJC53NfJ5hJq7ssnVnthAJp48uLWFAtmSJEVV7w/ECHvQ3EFCdmJHy9G88l4ZZhdLqlSixPPOQKbOaXeGd6toH2obWWBSnowc8m4cNtzGeWt4a6xzAgznBP/6cG9H8yNaqIxvqAuosT81hPc1fd41uDbmE8bW6Kg2KxKqoE6G+XEMs8kBzOS0cF0GJuCpqG9HP+Hwiu5wUvtYrYR8vIDe/bStWJQCqvIEE3HQqq+Zt9DhE6AcNRgV8tq/txVnEsc8Fvrm3Cd3H3AodIKQggl4zn5eJDNmPcgOE+R84w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QN4sgr2lFG7FVClFt7cpGG4xUrTGlEB9xGvQeB/OvA=;
 b=aVvNlVd42K3ZHpD7j/z8eZ/zXCBm4w/FXEZwFpA7UMDdTxlWT1JYnDGz8oKr6RzaPq+LmPcy0qj3dhwqtyQiVBz0U2hwcUMKols+nWjFskbTuGEhUtBBSPELfk4eaDiapWH5X6s4WE2yQNvARfXnSpaEquuMtqnM27m8HyDXrBkIlledwQj78yMfDhudygMmar4vScHZJm5faXUTGQaxt7YUJgiTmJC2KNnOzLZoTlnJaH89ypoAvA93Lr8n1OmodYVPK6iQ37ZhkxFvCNEiV+3DT5alRj5pvn8DUHOk+xc6Tx8Z2rbBv88CPJHCgOjMZgMz1OCiRtgfXr3h3G1Xvg==
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:e9::13)
 by OS0P286MB0596.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:c9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Tue, 31 Aug
 2021 04:19:47 +0000
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209]) by OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 04:19:47 +0000
From: Xie Ziyao <ziyaoxie@outlook.com>
To: Wang Kunfeng <threefifteen.wangkunfeng@huawei.com>, ltp@lists.linux.it
References: <20210831024617.246758-1-threefifteen.wangkunfeng@huawei.com>
 <OSZP286MB08712631399F14EC1329DFEDCCCC9@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <OSZP286MB087197527B5E59DC13C2195CCCCC9@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
Date: Tue, 31 Aug 2021 12:19:44 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
In-Reply-To: <OSZP286MB08712631399F14EC1329DFEDCCCC9@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-US
X-TMN: [agt414ijIO4TIyzKRs3vErhkpFwnQH66]
X-ClientProxiedBy: HK2PR02CA0134.apcprd02.prod.outlook.com
 (2603:1096:202:16::18) To OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:e9::13)
X-Microsoft-Original-Message-ID: <97596f07-5da0-5453-bfbc-95102961a32d@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ZiyaodeMacBook-Pro.local (14.192.49.77) by
 HK2PR02CA0134.apcprd02.prod.outlook.com (2603:1096:202:16::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.19 via Frontend Transport; Tue, 31 Aug 2021 04:19:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 303d5972-5a10-4552-808b-08d96c369144
X-MS-TrafficTypeDiagnostic: OS0P286MB0596:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q0G5hWUUk7+15aWt4eH5uEHIqUA1HzcLeS3UjQXkELdj+80Y1rgWopX9dBT1JLA0vyF1+xh6rFBsROiMt6biT7ob4V+v3RKajovpXupxpIo4ZpEmX12cKaNkMgns27RdY21ZVxi1OjVsb8vR+VJq9Rf+U84ZvVFiLNpFFr1mrYtr6fR3FYGTSs6U5rZ8/GOTeKWXj0z4sxsbH6RuyNVXsmY5M2e52l3fIRUyDtR8q4Xs8miCZon/cuHx3S2ei8rCtvPvAhWqRv/SM1ChQEHgofm6H+Y5AowVZCpcb+aWDeQ3aBFwvB3Tn8WghNkSaqX9k3REz34hLl3ay1VaqqHgmZimIMH16x1iFjC/F4CmXYnc8fYHX5yIV1u5Ir7spalOz0yFRibLFZxSjBQhRbHqICYwKLYFnrAi/BVdR2NrSVZjXOrO4c2AW4h3iAeww+bz
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MUm5u9VioigUEOnvQeLWcel3IyalIKHCzUawvQUrU+40xe+rhauizWVzw4X0swAQy2OnvFM08wWzpxUKOZMBVnCtwfBVWdEbTZx84EAIAyEgMv4+swJHYWrTpFcCoLGx4vbfRNXaU5ta/eaUYYIGDg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 303d5972-5a10-4552-808b-08d96c369144
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 04:19:47.2717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0P286MB0596
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.8 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FORGED_MUA_MOZILLA,FREEMAIL_FROM,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] gettid:Convert gettid01 to new API
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Cj4+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZ2V0dGlkL2dldHRpZDAxLmMKPj4g
KysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9nZXR0aWQvZ2V0dGlkMDEuYwo+PiBAQCAt
MSwzICsxLDQgQEAKPj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gVGhl
IGxpY2Vuc2UgaGVyZSBzaG91bGQgYmUgR1BMLTIuMC1sYXRlci4KU29ycnksIEdQTC0yLjAtb3It
bGF0ZXIuCj4+IMKgIC8qCj4+IMKgwqAgKiBDcmFja2VyamFjayBQcm9qZWN0Cj4+IMKgwqAgKgoK
LS0gCkJlc3QgUmVnYXJkcywKWGllIFppeWFvCkUtbWFpbDogeml5YW94aWVAb3V0bG9vay5jb20K
CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwCg==
