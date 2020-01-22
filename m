Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 370FF144AA8
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 05:01:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D28BD3C2379
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 05:01:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B3C813C224E
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 05:01:15 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id C14171001172
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 05:01:11 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,347,1574092800"; d="scan'208";a="82364356"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Jan 2020 12:01:10 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 493AD4CE38A1;
 Wed, 22 Jan 2020 11:51:56 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 22 Jan 2020 12:01:06 +0800
To: Xiao Yang <yangx.jy@cn.fujitsu.com>, Petr Vorel <pvorel@suse.cz>
References: <1575532537-27105-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200121052447.GA6657@dell5510>
 <5707ecce-aec4-a80d-5ec6-f9c728625634@cn.fujitsu.com>
 <20200121101513.GA9254@gacrux.arch.suse.de> <5E279FB9.6010108@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <2b16f627-1299-9f35-889c-0044139a99b3@cn.fujitsu.com>
Date: Wed, 22 Jan 2020 12:01:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <5E279FB9.6010108@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 493AD4CE38A1.AE6B9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/userfaultfd01: Always require
 CAP_SYS_PTRACE
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


> On 2020/1/21 18:17, Petr Vorel wrote:
>> Hi Xu,
>>
>>> We have pushed "syscalls/userfaultfd01: add hint about =

>>> unprivileged_userfaultfd" patch(v2)[1].
>>> This is v1.=A0 li Wang and me both think adding hint is more wise, more =

>>> info see[2].
>>> [1] =

>>> https://github.com/linux-test-project/ltp/commit/7dc571d3ad1908d6e50163=
a06ef848f096fe880a =

>>>
>>> [2] http://lists.linux.it/pipermail/ltp/2020-January/014921.html
>> Thanks for notification, I'll check previous commits next time!
>>
>> BTW this was caused by maintainers not updating patchwork :(.
>> Would you mind to register to patchwork and check state of your =

>> tickets time to
>> time [1]. You'd be able to change state of your own patches.
Hi Petr
  I have registered to patchwork and I will change the state of my other =

patches later. Thanks for your kind advice.

also thanks for xiao that changed the state of this patch.

Best Regards
Yang Xu
> Hi Petr,
> =

> Thanks for your effort.
> Xu is my colleague and I helped him change the state to superseded. :-)
> =

> Best Regards,
> Xiao Yang
>> Kind regards,
>> Petr
>>
>> [1] https://patchwork.ozlabs.org/project/ltp/list/?submitter=3D76329
>>
> =




-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
