Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 412FB2A2A6E
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 13:10:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0AE733C3035
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 13:10:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id EF4943C262E
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 13:10:46 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [51.163.158.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 64E9F200BDE
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 13:10:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1604319045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7BIpPchhUaqnocEgVmjdt0q7lUbJwkBsGyJZIX6wegc=;
 b=LsCU8EqPBSyCgLyQPv6dwQZ+CC5NAjjueUlznktpWJA6M0gRv8jqvFMlnbNAgcBpIyE/e5
 ArTiP4PUz/zyjwquzmexoZxlqb08GGF9LF/8DtEmobDT7iFOYMLO1NtxvBgwYvTbvKlzCs
 +HzCFgZSEi1ScTi8+NtYE3obnqSgEBY=
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-YWJ3AqqtMTWIfObDGhnVHw-1; Mon, 02 Nov 2020 13:10:44 +0100
X-MC-Unique: YWJ3AqqtMTWIfObDGhnVHw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CErMvfzeVfZgiPql+K0V/1cNfFmLzrJ9AgHrkW5LpAAqCnITPJTXQcLKXa4IlhP+zr6mIi+AZfDmOL1thZfAhBo5ew0qXaLdIDYVK3lwp+27bgx+8o9y/2v02xVy92rw9mnfLPY/qNVvSXgeTtv1NCCqQH8HifbWMqPbSlK4AuUTMIYEzrQTKzBR45CIEYt6U/QcdPqQABNYplDqUwyy/DBz+6LBmmSeE3QP9xy76FNZZ9PuYvgXhEH6HVzj+qKI1/XYAfxKXyg9k9Ur8b/JekKjP4VO531Br7LpjIaqGjqyvx8mzEXpOmXBd07bWyVlC3Hl4SEY+Y81YjK9LiVSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BIpPchhUaqnocEgVmjdt0q7lUbJwkBsGyJZIX6wegc=;
 b=aEF5d69KjkuTjRrSybEWTdVkjujMbvAroXpTRcSMTv5jjy3na52nRNbnGCq8dpTCuhreCKEKqjzatz3ZMZcQ5k5f5ykjz2WpCb0sM5B6czzwzRXVsb6763oQ1rsq50eqcM3HXj0/nlwJ9ZPS/6FVVjhfKLIAyISiMjulbFn0XfgmHo4puWzXjRmGa5INI7AONQdEYPufcqrylF1crxF1v2ZnqBjkFtPCCVhBTt1NGXNvwt/3znCDZnYdda5yUJKvbiW592QnlAgut9oUGa7TYqgfGzr6onH1XYHaA8HVCMJu0OQXiJeOSLhO5mnNEv15zPGFcrL+k3ZS+pbpzvrT6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VI1PR04MB6877.eurprd04.prod.outlook.com
 (2603:10a6:803:131::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 2 Nov
 2020 12:10:43 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224%7]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 12:10:43 +0000
Message-ID: <19ba38ac70fbde53ede10728ad8bc8c72c9a4b6b.camel@suse.com>
From: Radoslav Kolev <radoslav.kolev@suse.com>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Mon, 02 Nov 2020 14:10:40 +0200
In-Reply-To: <20201102120014.GB7653@yuki.lan>
References: <20201102082751.9807-1-radoslav.kolev@suse.com>
 <20201102120014.GB7653@yuki.lan>
User-Agent: Evolution 3.34.4 
X-Originating-IP: [85.196.172.93]
X-ClientProxiedBy: AM0PR01CA0120.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::25) To VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.24] (85.196.172.93) by
 AM0PR01CA0120.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Mon, 2 Nov 2020 12:10:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed2e8537-557c-4c6d-cc7d-08d87f285245
X-MS-TrafficTypeDiagnostic: VI1PR04MB6877:
X-Microsoft-Antispam-PRVS: <VI1PR04MB6877CBCDF8236A93459EEC11E0100@VI1PR04MB6877.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iahJbjkWmK3pY4r9qDFFJ2IpIZ21/PkTJKCE2yfc9PAXte3fxZejyxzvdP9ZnZlk9BWrjvTsUpcPs5U2jAxw0KJE3WZgEeBnima7gATi9OCwYTZ59ZYacKcQ+StXzfWPSadXQlUQpbbzXE0YJgdZ3CskT2lPCHUbiBXNND7AAR45YR4yOK6YHdz59TWYDP/BMKkK1FyBxCTSu1ys9Dvtw/SshDHL7kSKXHce1dolXL2m8uU0y5GFgnSWmCr51fxIBJ7u2CwKbSby87KIzravUFd+R2XX9nN3JTnYUrRmVuDe+VP1iBJjT2M0wF4r0kkD9SBpJDlaNbuci/8Xpw9etg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39860400002)(366004)(136003)(376002)(6916009)(2906002)(8676002)(316002)(186003)(16576012)(4326008)(6486002)(956004)(86362001)(26005)(2616005)(16526019)(478600001)(52116002)(44832011)(66946007)(66556008)(8936002)(66476007)(4744005)(5660300002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: InlMtcyT7H9zx/vCbZv9C2tOluYYIG0i4kkmx6Vy85xq32JAZ+GJyRXT+knejsx//2PTsZ7HYE62b3LV9OPHJ7UBQM+iaWTKDPBSCafB8hMVf1KiFuYpgv1o5nkXbgSGUZRiTuJv7a5q5eXJ0Qg6DzFubz9g+LXviBlbuwGhQKR4I5qAOOylUCzI5yoWzIP4SkB9L3fzxddAEvR89AnipJ8J3A9tt3RlYFbBN8e7FvOC0WAi8FY9aBI4QZg33bznxEIm+2zAWtRlotONRiVrknSE+GQdh2phvERn6HYTJgwL9IkH6SLSsM4OjPWDlZ7Dz4a6Fj0OZhz294ztxmSkI1OWY4DOefUwzOIQmXJ5JubISeslQZHAbdCjNCaImKBVS7SNgSPo0XpkCRGSU1j7YQ9nXr9/vZXXME+6it7IOh+t9RhSp/opCzAVSaVC8yUMgZxzZ51rioWqo7lBJbvC7ttstFn2KgwQ3QTILpxwrtRMciBKGSj5nPCiGafAyI4USrzjF5x0l+baZhLoRrDc02VKwYAmk8SHpsRwov5Jis8ZxfHJMATfrSqF7eyTP91dHBx5Sx16fur4dXiMcnFU7jOR8lzkCGehAo8NXUq7oRrvhyWtz96dVFWhoVbSD8B0FUlyA5RfoxTfs6d9VeB74g==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2e8537-557c-4c6d-cc7d-08d87f285245
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 12:10:43.0529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14/hnHfNEt4lk+nLOIebREoXay7zwnpcRNNC9mCl0MG2wHNyIHHHwPeFjeY3qa3qlm8cLVoGokxK9I/wjbw+mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6877
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Convert dup01 to new API and clean up
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, 2020-11-02 at 13:00 +0100, Cyril Hrubis wrote:
> 
> I can fix these two issues before applying if you agree, no need to
> send
> a v3.


Thanks for the review, Cyril!

I'll respin a v3 real quick, sorry for the mailing list spam. Better to
get used to the tools and workflow. I'll also add checkpatch.pl as git
precommit hook. to avoid such problems in the future.

Cheers,
Rado


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
