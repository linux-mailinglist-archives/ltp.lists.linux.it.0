Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7902F193A37
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 09:03:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DABB23C4AE3
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 09:03:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8EC133C3362
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 09:03:33 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id D3C661A01062
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 09:03:30 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.72,307,1580745600"; d="scan'208";a="87357546"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Mar 2020 16:03:26 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id E600A50A9992;
 Thu, 26 Mar 2020 15:53:13 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 26 Mar 2020 16:03:26 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <CAEemH2fhRYefq_9LmSmDvujS1OQa7rCeF7V=mJQrLhz0bwpo0A@mail.gmail.com>
 <CAEemH2e4sRwZ8HRm-w5CD=Wm8-SW+LaA5XHDnXdqrOL1t4FdtA@mail.gmail.com>
 <20200323160415.GC15673@dell5510> <20200324235150.GC4521@yuki.lan>
 <20200324172102.GA1307@dell5510> <20200325015324.GA15127@yuki.lan>
 <CAEemH2doL4m4-TLBBWTHygTRPSTa68dkoAFjZJrDmzrkmgUrSQ@mail.gmail.com>
 <20200325170739.GA2461@yuki.lan> <20200325093427.GA23023@dell5510>
 <1dea6ff2-f32d-c797-b52d-716efe73d4a6@cn.fujitsu.com>
 <20200325155624.GC21800@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <88ebe7aa-58f8-0c83-2d13-7836198827af@cn.fujitsu.com>
Date: Thu, 26 Mar 2020 16:03:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200325155624.GC21800@dell5510>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E600A50A9992.AACD6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Use SAFE_RUNCMD()
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

Hi Petr

> Hi Xu,
> 
>> I have seen the history about this problem. We have few C cases to use many
>> commands(copy_file_range02.c is a specify case, I ported it from xfstest to
>> increase coverage), do we really want to implement need_cmd or
>> want_cmds(Usually, we seldom use command in c case and  we should avoid this
>> for reduce unnecessary dependencies, except user level command such as mkfs
>> or makeswap or useradd)? It will give user a mislead.
> 
>> ps:copy_file_range02.c should use swapon and swapoff syscall instead of
>> command.
> Yes, rewriting to C would be an improvement for non-standard linux platforms
> (but then you need to deal with other exceptions: e.g. whether
> swapon()/swapoff() is even supported on platforms like Android and you might
> endup with 1) much more code 2) TCONF anyway for these platforms.
> And there is also chattr and mkswap.
> 
I missed non-standard linux platforms.
> Besides this IMHO there will always be a need for running some command via
> tst_run_cmd() in the test instead of reimplementing a wheel.
Yes, we can not avoid using command.
> Some of other
> dependencies:
> 
> cat (testcases/cve/stack_clash.c this one could be using C code),
> mpdprobe, make, mkswap, quotacheck,
> useradd/userdel (I plan to put these into the library, but still it's much
> easier to use them than reimplement code in C).
Yes, it is fast and efficient.

Also as Li said, we can write code firstly(add_key05 can use library a 
api int the future as your issue#468 mentioned).

Best Regards
Yang Xu
> 
> Also library itself (these will not use the flag): insmod, modprobe, rmmod,  mkfs.*,
> systemd-detect-virt (this one is not a hard dependency).
> 
> Kind regards,
> Petr
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
