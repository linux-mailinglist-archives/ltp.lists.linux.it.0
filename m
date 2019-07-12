Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B4815665D1
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 06:34:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F0603C1CF3
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 06:34:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2DD033C1C94
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 06:34:15 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 0A249602762
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 06:34:13 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,481,1557158400"; d="scan'208";a="71235535"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Jul 2019 12:34:09 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 739724CDDB0D;
 Fri, 12 Jul 2019 12:34:03 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 12 Jul 2019 12:34:05 +0800
Message-ID: <5D280DBE.4010202@cn.fujitsu.com>
Date: Fri, 12 Jul 2019 12:34:06 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190709105303.GA4914@rei.lan>
 <1562366936-26456-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190710105207.GC30934@rei.lan> <5D26EBEF.3090604@cn.fujitsu.com>
 <20190711113405.GA27889@rei.lan>
In-Reply-To: <20190711113405.GA27889@rei.lan>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 739724CDDB0D.ABDB0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RESEND] syscalls/prctl06.c: New test for prctl()
 with PR_{SET, GET}_NO_NEW_PRIVS
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
>>> We are executing setuid binary that was created by root here so
>>> shouldn't we just check that getuid() and getgid() returns 0?
>>>
>> I try it.  whether we set or not set new privs, the getuid() or getgid() return nobody in
>> prctl06_execve.  Or, I misunderstand your advise?
> Looking closely into the manuals the setuid and setgid bits are supposed
> to set the effective ids, so I guess that the geteuid() and getegid()
> will return 0 when the process was executed without the prctl().
>

Hi Cyril

Yes. I will remove capeff and setuid,setgid check in my v3 patch.  For the prctl value
and check that it cannot be unset, I think it is a error test as manpage said
"prctl() fails with EINVAL when options is PR_SET_NO_NEW_PRIVS&  arg2 is not equal to 1 or arg3, arg4, or arg5 is nonzero."

I will add it into prctl02.c.  Also, there are many error conditions for prctl. So I think when my prctl07.c are merged into

ltp, I will increase prctl02.c together.

Thanks
Yang Xu




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
