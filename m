Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEEB7BA26
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 09:10:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E5BA83C1D0C
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 09:10:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0EAFE3C1C8C
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 09:09:58 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 9DFFC6002FB
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 09:09:55 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,329,1559491200"; d="scan'208";a="72575540"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 31 Jul 2019 15:09:54 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 4777E4CDE868;
 Wed, 31 Jul 2019 15:09:49 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Wed, 31 Jul 2019 15:09:51 +0800
Message-ID: <5D413EBB.2010802@cn.fujitsu.com>
Date: Wed, 31 Jul 2019 15:09:47 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <5D30200B.4050306@cn.fujitsu.com>
 <1564030915-3211-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564030915-3211-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190730132613.GA3614@dell5510>
In-Reply-To: <20190730132613.GA3614@dell5510>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 4777E4CDE868.A0E4E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 3/3] syscalls/copy_file_range02: increase
 coverage and remove EXDEV test
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


> Hi,
>
> ...
>> diff --git a/include/lapi/fs.h b/include/lapi/fs.h
> ...
>> +/* Referred form linux kernel include/linux/fs.h */
>> +#ifdef TST_ABI64
>> + #define MAX_LFS_FILESIZE   ((loff_t)LLONG_MAX)
>> +#else
>> + #define MAX_LFS_FILESIZE   ((loff_t)ULONG_MAX<<  PAGE_SHIFT)
> Build fails on i386 on Debian stable [1] [2] due PAGE_SHIFT undeclared.
> I guess including<sys/user.h>  fixes it.
>
Hi Petr

  Thanks for you pointing out it.  I will include this header file.


> Kind regards,
> Petr
>
> [1] https://api.travis-ci.org/v3/job/565467338/log.txt
> [2] https://travis-ci.org/pevik/ltp/builds/565467337
>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
