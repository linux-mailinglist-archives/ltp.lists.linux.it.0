Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6457223953
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 12:33:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 567553C2911
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 12:33:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B0A813C2687
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 12:33:11 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 72F6020149E
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 12:33:09 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,362,1589212800"; d="scan'208";a="96468539"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Jul 2020 18:33:06 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 71B084CE2808;
 Fri, 17 Jul 2020 18:33:00 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 17 Jul 2020 18:33:02 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <1594959191-25155-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200717073842.GA31254@dell5510> <20200717080840.GB32407@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1eac1ed9-66dd-5141-0bc2-cc05312704c8@cn.fujitsu.com>
Date: Fri, 17 Jul 2020 18:32:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200717080840.GB32407@dell5510>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 71B084CE2808.AE666
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lapi/io_uring.h: Add declaration of __kernel_rwf_t
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
Cc: Vikas Kumar <vikas.kumar2@arm.com>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr


>>> Since kernel commit ddef7ed2b5cb ("annotate RWF_... flags"), fs.h introduced
>>>   __kernel_rwf_t data type in 4.14-rc1.
>>>
>>> Fix build error on old kernel.
> 
>> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>> Thanks for the fix.
>> Going to merge it, just wait for travis verification.
> BTW the regression was caused by my changes to the lapi header in 95399bc87
> ("lapi/io_uring: Preparation for io_uring tests") - I updated the header.
> 
> We might consider not including <linux/types.h>, it's needed just for
> __kernel_rwf_t. I'm against these optimisations (as the definition can change),
> but I remember Jan asked me to avoid including kernel header just for single use
> [1], but maybe this is a different case.
I still remember the similar case when clean up quotactl code(commit 
c4bf6f66 lapi/quotactl.h: Use libc headers instead kernel uapi) last year.

how about the follwing change

+#ifdef __CHECKER__
+#define __bitwise__ __attribute__((bitwise))
+#else
+#define __bitwise__
+#endif
+#define __bitwise __bitwise__
+
+#ifndef __kernel_rwf_t
+typedef int __bitwise __kernel_rwf_t;
+#endif

Also, I think we should replace _u32 with uint32 in lapi/loop.h if we 
don't want to include linux kernel header for single use.

> 
> Kind regards,
> Petr
> 
> [1] https://patchwork.ozlabs.org/project/ltp/patch/20191016211501.3777-1-petr.vorel@gmail.com/#2281586
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
