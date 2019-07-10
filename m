Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0292264486
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 11:42:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFFEB3C0232
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 11:42:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D7DB63C003C
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 11:42:42 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 97D2B6006E6
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 11:42:42 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,474,1557158400"; d="scan'208";a="71098935"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jul 2019 17:42:37 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 11B894B41EDC;
 Wed, 10 Jul 2019 17:42:33 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Wed, 10 Jul 2019 17:42:32 +0800
Message-ID: <5D25B308.2050603@cn.fujitsu.com>
Date: Wed, 10 Jul 2019 17:42:32 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <1557404498-3879-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190523115236.GD30616@rei.lan> <5D0377BB.1060605@cn.fujitsu.com>
 <20190709105303.GA4914@rei.lan>
In-Reply-To: <20190709105303.GA4914@rei.lan>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 11B894B41EDC.A09E0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/prctl06.c: New test for prctl() with
 PR_{SET, GET}_NO_NEW_PRIVS
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> Can you pretty please resend the prctl06 v2 patch?
>
> I can see it in the patchwork at
> http://patchwork.ozlabs.org/patch/1118628/
> but that email haven't made it to my mailbox.
>
Hi cyril

I have resent it again.

ps:I sent it but email date is 2019/07/06 6:48 (my virtual machine date is incorrect I don't notice it )

Thanks
Yang Xu




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
