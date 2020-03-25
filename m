Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C16831925FF
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 11:43:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89B033C4BB3
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 11:43:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id F30A33C4BA7
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 11:43:00 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 846CA1401649
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 11:42:57 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.72,303,1580745600"; d="scan'208";a="87268318"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Mar 2020 18:42:55 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5453950A9992;
 Wed, 25 Mar 2020 18:32:42 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 25 Mar 2020 18:42:53 +0800
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>, Li Wang
 <liwang@redhat.com>
References: <303d1019-f836-b2ae-ce51-d2c46dd7fb1e@cn.fujitsu.com>
 <20200323113738.GA4807@dell5510>
 <CAEemH2fhRYefq_9LmSmDvujS1OQa7rCeF7V=mJQrLhz0bwpo0A@mail.gmail.com>
 <CAEemH2e4sRwZ8HRm-w5CD=Wm8-SW+LaA5XHDnXdqrOL1t4FdtA@mail.gmail.com>
 <20200323160415.GC15673@dell5510> <20200324235150.GC4521@yuki.lan>
 <20200324172102.GA1307@dell5510> <20200325015324.GA15127@yuki.lan>
 <CAEemH2doL4m4-TLBBWTHygTRPSTa68dkoAFjZJrDmzrkmgUrSQ@mail.gmail.com>
 <20200325170739.GA2461@yuki.lan> <20200325093427.GA23023@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1dea6ff2-f32d-c797-b52d-716efe73d4a6@cn.fujitsu.com>
Date: Wed, 25 Mar 2020 18:42:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200325093427.GA23023@dell5510>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5453950A9992.AA484
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

Hi Petr,Li, Cyril

> Hi Li, Metan,
> 
>>> And this makes me think more of the '.request_hugepages' story. The
>>> needs_foo flags require the foo to be present on the system as hard
>>> requirements. In some situations(i.e copy_file_range02.c), we probably need
>>> to handle the soft situation, which means, the commands are only part of
>>> the test requirement. So if it writing with .needs_cmds="xxx", it might
>>> skip the whole test in setup() phase.
> +1. This is similar to a general problem how to structure tests when you want to
> use tst_brk() and cleanup function (having more unrelated tests in single C file
> means one should try to avoid using tst_brk() when not needed).
> 
>> Indeed, there are couple of solutions for that, one of them would have
>> all the arrays doubled and one of them would list hard requirement while
>> the other soft requirements. Then we will end up with something as
>> "need_cmds" and "wants_cmds". The second one would be more or less
>> informative, the test may print a message "Missing foo command test
>> coverage will be limited".
> I was thinking about it and thought that would be too rich API (given there is
> not that much external dependencies for C tests). But ok, sounds reasonable.
> 
> Also similar use case from shell tests: mostly $TST_NEEDS_CMDS is used,
> which stop whole testing. But rarely (only in 3 tests and tst_net.sh) is used
> tst_require_cmds() directly - it's a hard requirement, but it tries to run some
> test before (or require it only when it's needed - tst_net.sh).
> But that's bad from metadata point of view (you concentrate on metadata in C,
> but sooner or later we'll need to handle shell as well).
I have seen the history about this problem. We have few C cases to use 
many commands(copy_file_range02.c is a specify case, I ported it from 
xfstest to increase coverage), do we really want to implement need_cmd 
or want_cmds(Usually, we seldom use command in c case and  we should 
avoid this for reduce unnecessary dependencies, except user level 
command such as mkfs or makeswap or useradd)? It will give user a mislead.

ps:copy_file_range02.c should use swapon and swapoff syscall instead of 
command.

Best Regards
Yang Xu
> 
> Kind regards,
> Petr
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
