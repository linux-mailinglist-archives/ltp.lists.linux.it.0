Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A67AA2C22D3
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 11:24:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6AEED3C4E4A
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 11:24:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 3ED733C22AF
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 11:24:51 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 02AAD6008D8
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 11:24:50 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,365,1599494400"; d="scan'208";a="101697691"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 Nov 2020 18:24:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 587B34CE5CC2;
 Tue, 24 Nov 2020 18:24:43 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 24 Nov 2020 18:24:42 +0800
Message-ID: <5FBCDF6A.8050704@cn.fujitsu.com>
Date: Tue, 24 Nov 2020 18:24:42 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>
References: <20201123083137.11575-1-liwang@redhat.com>
 <20201123083137.11575-2-liwang@redhat.com> <5FBC765A.3020102@cn.fujitsu.com>
 <CAEemH2eiTQMBA6g1BOeDNx+H81Yk6FvZt_0AonRY7zdpc0K14w@mail.gmail.com>
In-Reply-To: <CAEemH2eiTQMBA6g1BOeDNx+H81Yk6FvZt_0AonRY7zdpc0K14w@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 587B34CE5CC2.AD133
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls: shift to time() if __NR_time not
 support
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
>     I have seen this patchset, Can we use a function to check whether
>     kernel
>
>
> Yes, we can, I was even thinking to define a global MACRO can check
> any syscall not only __NR_time.
> (maybe we can achieve it for other tests)
> But for this kind of case, I'd not suggest using that MACRO/function
> to check __NR_time, because the test will perform twice at the moment
> for the __NR_time syscall if it supporting(first time for support checking,
> second time for real invoking).
>
> Considering this is a time comparing test, that makes our seconds
> more inaccurate to compare.
>
>     supports time syscall (like time_supported_by_kernel()) in setup
>     and then we use time() - !return value in verify funtion?
>
>
> Though we check the syscall in setup(), shouldn't we also export a variable
> to record the result we checked? That does not make things be simple too.
Yes. On some platform(aarch64), it is simple because it doesn't need to 
call tst_syscall two times and  time() two times and report non-support 
info many times especailly when using -i parameters.

IMO, it is a taste perference(I usually detect kernel whether support in 
setup). Your patchset is also ok. So

Acked-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

>
> --
> Regards,
> Li Wang




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
