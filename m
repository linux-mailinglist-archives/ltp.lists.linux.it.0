Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 893981D32F5
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 16:34:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33A723C2244
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 16:34:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 041F23C1414
 for <ltp@lists.linux.it>; Thu, 14 May 2020 16:34:06 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id B65461A009B6
 for <ltp@lists.linux.it>; Thu, 14 May 2020 16:34:03 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,391,1583164800"; d="scan'208";a="92058142"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 14 May 2020 22:27:58 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id CEB2950A999D;
 Thu, 14 May 2020 22:27:56 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 14 May 2020 22:27:56 +0800
Message-ID: <5EBD556B.4050406@cn.fujitsu.com>
Date: Thu, 14 May 2020 22:27:55 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
 <5EBB5B3D.4020302@cn.fujitsu.com> <20200513092028.GA4598@dell5510>
 <5EBBCA12.5020901@cn.fujitsu.com> <20200513103032.GA18763@dell5510>
 <20200514073701.GA9562@dell5510> <5EBD12D9.70708@cn.fujitsu.com>
 <20200514141454.GB17718@dell5510>
In-Reply-To: <20200514141454.GB17718@dell5510>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: CEB2950A999D.ACB63
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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
Cc: viresh.kumar@linaro.org, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2020/5/14 22:14, Petr Vorel wrote:
> Hi Yang,
>
>>> To be honest I like this approach, because 1) it defines when new syscall was
>>> backported
>
>> Hmm, the reason seems a little weak, it can be done by adding a comment(e.g.
>> "the syscall is introduced since v5.6.0").
> Sure, that would work as well.
>
>> 2) if there is really problem that some functionality was removed, we
>>> can always handle it. But IMHO that's going to be rare (btrfs removed in RHEL 8
>>> is IMHO because RHEL does not want to support it, but that would not happen for
>>> syscalls).
>
>> Without the rare situation, I also think tst_syscall() is enough to check
>> the support of syscall.
> Well, nothing that much important, but I'd like to hear the opinion of
> other maintainers. BTW We now concentrate on pre-release fixes.
Hi Petr,

Sure.

>
>>> I'd also like to be consistent how we handle these new syscalls.
>> Agreed.
>
>> I also think if we can implement common func(e.g.
>> syscall_supported_by_kernel()).
> Sure, feel free to send a patch (could be a macro).

OK, I will send a patch after the release.

Best Regards,
Xiao Yang
>
>
> Kind regards,
> Petr
>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
