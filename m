Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5112D2AC372
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 19:16:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A5C13C538F
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 19:16:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 51FFE3C2453
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 19:16:04 +0100 (CET)
Received: from de-smtp-delivery-52.mimecast.com
 (de-smtp-delivery-52.mimecast.com [62.140.7.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C45816009ED
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 19:16:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1604945762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hAn/DMlaPBm9jQnxBB5k0TDa1QKNqhNeF1NkXuMZ8Ck=;
 b=XvgzyXR/pbJvyn2U2wdzF/jQrdK97BAJHx6sIJUYqXyNAl71WsK9XnA/2wdqJjJlDpDLN5
 y9zOVhGmJ+HW3uoOY3QSX3jVv73eRUea57TMwEwomEGybXqHibyxt0yqWrxNi1uiPVqc2f
 bf8vjXIvv9s0qX0gHkj788bVQpkME7o=
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-Z5eXnL1oMQmXgNdZKlST5A-1; Mon, 09 Nov 2020 19:16:00 +0100
X-MC-Unique: Z5eXnL1oMQmXgNdZKlST5A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2Y5eL/jIsNgvx+mfWSfnQ7OrBAibADoKuoo7KHGBUQ/Yk89Es+IydsOV6q8L30jEHi4VqYQZ2qOjIEGInb5Df+SUjiBJSBK4bGlWmAVyVyqiqLhHc1dV8FQfa71B36q/ENnp6wWqpbGjC7EnF9eR+A37wikPveJxr6AUEroSIdeOsozZs5xWDfPsiMYZhjlBMsajPu2ts54OrI1tylQcXu6gq0frlAJrQWviIuJv+ihuAiaTiZsZYq2MfEJlus3FdgPGc8khj0NKwwNCui6e0DLfH3EaHETr8mqaZiJwztALNdEKKTjwsXRpDHl3U0M5XtmMndGRwEazHLQpJ6T9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAn/DMlaPBm9jQnxBB5k0TDa1QKNqhNeF1NkXuMZ8Ck=;
 b=U9Zh/F5nKsqyEM5u4vR8wprxecvvUAYEgtvMSAuAqgYhHvDSR8PupBnOgbwHBJL9a7HHeGWPC/pCg4AXP+CfK5P3xj0iLBvuyMtzNR3yTEB0QZVdXhwGhZ4DLYA03Wv9nDDmBEcp0X41DA5/drlbQpTuiexbiCM+IjeuTQlCxuHu8nGunLwLQuyjitMc/FEJsQyOz/Mr421hu4S5c7wgunWYXqrnz1FxX/wDbK5IrINndg8hKDOBlvzNr42LGMcBoiDvgPjHoY8bx4Kce8fXrDxzcOGfY/Cz8uUE9Btc704++M/+s5jv53fYbMGmwRmKYdguFpkNDc5WI0sTX6Ktlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VI1PR0402MB3662.eurprd04.prod.outlook.com
 (2603:10a6:803:1c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 18:15:59 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224%7]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 18:15:59 +0000
Message-ID: <260dd94635a3dead2e946b2c40096061aa18d25b.camel@suse.com>
From: Radoslav Kolev <radoslav.kolev@suse.com>
To: Cyril Hrubis <chrubis@suse.cz>, Xiao Yang <yangx.jy@cn.fujitsu.com>
Date: Mon, 09 Nov 2020 20:15:55 +0200
In-Reply-To: <20201109124233.GA9991@yuki.lan>
References: <1603691317-22811-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5FA21AA9.9020208@cn.fujitsu.com> <20201106123604.GA30097@yuki.lan>
 <0bc685ce-1983-b900-787f-3d89e75ca48d@163.com>
 <20201106164742.GA6449@rei.lan>
 <f99d3484-f86d-dd8a-e64e-7d9d94533de4@163.com>
 <20201107165518.GB10159@pevik> <5FA8BE07.4040201@cn.fujitsu.com>
 <20201109124233.GA9991@yuki.lan>
User-Agent: Evolution 3.34.4 
X-Originating-IP: [85.196.172.93]
X-ClientProxiedBy: AM3PR07CA0110.eurprd07.prod.outlook.com
 (2603:10a6:207:7::20) To VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.24] (85.196.172.93) by
 AM3PR07CA0110.eurprd07.prod.outlook.com (2603:10a6:207:7::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.13 via Frontend Transport; Mon, 9 Nov 2020 18:15:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c76bbe77-ef44-4f13-c6dc-08d884db8249
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3662:
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3662A0825C116C66A47BD3B1E0EA0@VI1PR0402MB3662.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pTo2i122fPwYKyjlbCcYv+vtc2Fu26YSzpmoH3G65bYiIW3utkJ6h+k0jxJ5rEYZWp5V4lzbhRWArtcBu59TloBGgcpZ2Yjn43l/nWObZH9uwrroRw5aesMUcxuZnr40BIbqwHh7Yjx0huE5VVitgK2i8ajra9U00/gYie8Qns+k00mU92EJsDObJtbTHaKq9sg3QR9bbB7sj/k6sqiXixO42YKP0RRS5pWHOWUN5tC5NXS+0mNEyi2Ai8fPmM6BFOANCAGrLu9BI67dOs0EkztpRi5bt52BEhpyPgd3uibY9r1Tr4D3koFW7RmLsnTYr1IUc1Udznw54VlfWv3yzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(346002)(366004)(396003)(376002)(478600001)(86362001)(16576012)(316002)(110136005)(6486002)(5660300002)(66476007)(66556008)(66946007)(4326008)(6666004)(2616005)(36756003)(44832011)(52116002)(26005)(8676002)(186003)(16526019)(956004)(8936002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: EvoXWcDED7XmOed94cUhhxQ+HSonbEcl3Cb+u4KZTcc7tX5PppLdn+SNatG2F0LVuzUMQN2WjCKA9U7gND4ozVQkeeB3M0Q8Ppoc6ZXWOclbPpC/wMmwwFJJU96kMnkAGhj7UIDB8AbZLsd2QO7j/hOe6Bccvmq3j48F9N7Q+j41nqD2A6nwo56XbxEn3ZGw6szMIPt8LPuGxHWaxY9WeWocEP4bIawDVKJzyZVJAWOUnB2nhJNSvgUPZfNaNdMh/+sLqxLq6ewnNF04REZ2UXILgE2qfQV3HYTZ+ZxGto9ahZ1lKo5NMeL1JG6QYDRviEF3vwTlsxjx2AzhCuvKoQIOuZWmxONVrUEhbwe/rh6QrrNNWcMAUiYrTgb1BlBly079vfr/De+ReEE31pJsCTTlkbX2+6GE7lXO6ScmniEheInECS5yjA8gH3Ck4P5lHwzVeseCVMwMGwgYt5xcXMUfGyHfoPt2pt/YSiOMzOKtwjfGF+GmzOQ6wThGpE4JslSln13M/ePzsP8iEkLWPZSye9kd8SrF33JalVACzTvEmULI1AypHlkBKJW8smAHweg63wfMjZB+2yOQGx05USCVtVBu6CVgMxcEwXIzBYfCB8T5PiSAFjlj4VP05lyapJ2Tvr7hoe/SMO+IasyCWw==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76bbe77-ef44-4f13-c6dc-08d884db8249
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 18:15:59.4680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZRnUgBnUcbsi5mHl1QyyZzDBrXkuZbXR8b0P/6VBY2+DXVSSfmQrwIuf4HV2cq0ofzT/RsLkPiHGgMfSJDHmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3662
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] syscalls/sync01: Remove it
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

On Mon, 2020-11-09 at 13:42 +0100, Cyril Hrubis wrote:
> Hi!
> > 1) open(2) will return -1 if an error occur.
> >      Is it necessary to check invalid return value(except -1) if
> > an 
> > error occur?
> 
> Well if there are values that are never supposed to be returned it
> makes
> sense to catch these and return a TBROK or TFAIL.
> 
> If we are expecially testing a syscall() I would say that we should
> check for all kinds of errors including the values that shall not be
> returned e.g.:
> 
> 	TEST(open(...));
> 
> 	if (TST_RET == -1) {
> 		tst_ret(TFAIL | TTERRNO, "open() failed");
> 		return;
> 	}
> 
> 	if (TST_RET < 0) {
> 		tst_ret(TFAIL | TTERRNO, "Invalid open() retval %ld",
> TST_RET);
> 		return;
> 	}
> 
> 	...

I see no downside in checking for this unexpected negative value,
except copy/pasting this test condition in every syscall testcase.

I don't know the LTP codebase well enough yet, but what would you say
is a good way to have this somewhere in the library. A TEST_SYSCALL
macro, or something else, which fails if the return value is < -1?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
