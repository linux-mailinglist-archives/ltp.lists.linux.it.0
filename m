Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C663830EFFB
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 10:53:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D58F3C711B
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 10:53:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 8AFFC3C5E0D
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 10:53:05 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 3080014010EC
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 10:53:03 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,400,1602518400"; d="scan'208";a="104192791"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Feb 2021 17:53:01 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 042984CE6D74;
 Thu,  4 Feb 2021 17:52:55 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Feb 2021 17:52:55 +0800
Message-ID: <601BC40C.4030900@cn.fujitsu.com>
Date: Thu, 4 Feb 2021 17:53:16 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>
References: <1611654925-8994-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1611654925-8994-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <YBLaQvt2g3z8Xy1A@yuki.lan> <601A713F.7020301@cn.fujitsu.com>
 <CAEemH2efATKDx6T-j=GZKm6N4XZ3qTR22ZwzLPi5pBHkFkMEJQ@mail.gmail.com>
In-Reply-To: <CAEemH2efATKDx6T-j=GZKm6N4XZ3qTR22ZwzLPi5pBHkFkMEJQ@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 042984CE6D74.ADF16
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.2 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/3] syscalls/mallinfo02: Add a basic test to
 check use mmap or sbrk
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li
> Hi Xu,
>
> Yang Xu <xuyang2018.jy@cn.fujitsu.com
> <mailto:xuyang2018.jy@cn.fujitsu.com>> wrote:
>
>     ...
>
>     So I use this code "MAX(info.fordblks, 131072)" to get the right value
>     to trigger mmap.
>
>
> My 2 cents:
>
>  From what I understand, once we request memory larger than the upper
> limit DEFAULT_MMAP_THRESHOLD_MAX, Glibc will always make use
> of mmap() because it will be out of any value it can adjust in dynamical.
> So that we don't be bothered with this issue anymore.
But in subsequent malloc, the previous mmap area will add into arena and 
we still will increase the threashold. I use 8M size to test.
>
> Or:
>
> Invoking mallopt(M_MMAP_THRESHOLD, ...) function in front of the
> SAFE_MALLOC helps to fix the threshold. In such a case, the dynamic
> adjustment of the mmap threshold will be disabled.
Yes, it works well. Thanks for your review.
>
> --
> Regards,
> Li Wang




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
