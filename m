Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4516A2F46D3
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 09:51:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C0B913C6445
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 09:51:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C0C633C06E2
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 09:51:36 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id C527E600B8B
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 09:51:35 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,343,1602518400"; d="scan'208";a="103438256"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Jan 2021 16:51:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id D942C4CE4B3E;
 Wed, 13 Jan 2021 16:51:32 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 Jan 2021 16:51:32 +0800
Message-ID: <5FFEB4AF.5030602@cn.fujitsu.com>
Date: Wed, 13 Jan 2021 16:51:59 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20210113075110.31628-1-pvorel@suse.cz>
 <20210113075110.31628-2-pvorel@suse.cz> <5FFEAD16.7050704@cn.fujitsu.com>
 <X/6xDNIUPMRMTi05@pevik>
In-Reply-To: <X/6xDNIUPMRMTi05@pevik>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D942C4CE4B3E.AEB2C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] lapi: Move struct file_handle into
 lapi/fcntl.h
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

Hi Petr
> Hi Xu,
>
> ...
>>> +AC_CHECK_TYPES([struct file_handle],,,[
>>> +#define _GNU_SOURCE
>> I think file_handle struct doesn't need _GNU_SOURCE macro or I miss
>> something?
>
> It does require :).
> In glibc is guarded in sysdeps/unix/sysv/linux/bits/fcntl-linux.h with
> __USE_GNU which is controlled by user with _GNU_SOURCE.
>
> In musl (which is much easier to read) is just guarded by _GNU_SOURCE.
>
> That is the reason why I guarded it with __USE_GNU in uclibc-ng, when I
> backported there the implementation from musl.
Thanks for your explanation, I see glibc code, you are right. I missed 
file_handle struct using _USE_GNU macro. Also, I see feature.h header 
uses _GNU_SOURCE controlling __USE_GNU.

Best Regards
Yang Xu
>
> Kind regards,
> Petr
>
>> Other than this, this patchset LGTM.
>> Acked-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
> Thanks for your review!
>
> Kind regards,
> Petr
>>> +#include<fcntl.h>
>>> +])
>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
