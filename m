Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E6868826
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 13:27:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6EA853C1D24
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 13:27:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8F8D93C18F9
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 13:27:27 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id BCEE810005FE
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 13:27:19 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,493,1557158400"; d="scan'208";a="71469963"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 15 Jul 2019 19:27:19 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id A9CA84B734C6;
 Mon, 15 Jul 2019 19:27:05 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Mon, 15 Jul 2019 19:27:17 +0800
Message-ID: <5D2C6313.1080707@cn.fujitsu.com>
Date: Mon, 15 Jul 2019 19:27:15 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190712141530.22195-1-chrubis@suse.cz>
 <20190712141530.22195-3-chrubis@suse.cz> <5D2C35B6.6080606@cn.fujitsu.com>
 <20190715111950.GA12926@rei>
In-Reply-To: <20190715111950.GA12926@rei>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: A9CA84B734C6.AC6AC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/acct02: Fix failures with nearly
 full FS
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
>> I met the same problem on last week when I ran acct02 on nearly full
>> FS.  Since kernel/acct.c has defined the RESUME(4) and SUSPEND(2)
>> macro, 4.1 is enough.  And I think we can leave a simple comment in
>> here for why the limit is 4.1(even though the commit message has the
>> reason).
> I guess that short comment would help there, if it's OK I will add it
> before I push the patch.
Hi

Yes, go ahead.





-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
