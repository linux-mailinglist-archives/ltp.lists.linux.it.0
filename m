Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB3C7D860
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 11:20:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E404E3C1E03
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 11:20:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 447D83C1DEA
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 11:20:47 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 43A7214000B3
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 11:20:44 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,333,1559491200"; d="scan'208";a="72661641"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 01 Aug 2019 17:20:41 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id E90A04CDF074;
 Thu,  1 Aug 2019 17:20:41 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 1 Aug 2019 17:20:41 +0800
Message-ID: <5D42AEE8.2000801@cn.fujitsu.com>
Date: Thu, 1 Aug 2019 17:20:40 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Jan Stancek <jstancek@redhat.com>
References: <1561110806-2734-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1766730430.29482900.1561112032870.JavaMail.zimbra@redhat.com>
In-Reply-To: <1766730430.29482900.1561112032870.JavaMail.zimbra@redhat.com>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: E90A04CDF074.AC507
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] daemonlib.sh: call tty before executing service
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


> Bug 1711536 - polkit-0.112-22.el7 breaks restarting services from background process
> https://bugzilla.redhat.com/show_bug.cgi?id=1711536
>
> Not sure though we should be adding workarounds for what seems like a bug.
Hi Jan

This bug has been sloved on gitlab after commit 75c8b8afaa ("pkttyagent: process stopped by SIGTTOU if run in background job") ,as below:

https://gitlab.freedesktop.org/polkit/polkit/issues/85
https://gitlab.freedesktop.org/polkit/polkit/commit/75c8b8afaa8e1fba0efb63c3c7b66b5b5f713a35

I think my patch was meaningless.

Thanks
Yang Xu




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
