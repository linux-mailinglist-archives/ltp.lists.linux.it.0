Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A47528E19A
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 15:47:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 944573C580E
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 15:47:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6E9603C2494
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 15:47:42 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1CD581A0118E
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 15:47:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 71E50B120;
 Wed, 14 Oct 2020 13:47:41 +0000 (UTC)
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, Petr Vorel <pvorel@suse.cz>
References: <20200828151747.21445-1-mdoucha@suse.cz>
 <20200903155030.GA23664@dell5510> <5F84042B.9000505@cn.fujitsu.com>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <bdafce94-0c61-bee5-d8cb-5f6fe638bd89@suse.cz>
Date: Wed, 14 Oct 2020 15:47:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <5F84042B.9000505@cn.fujitsu.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add test for send(MSG_MORE)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 12. 10. 20 9:22, Yang Xu wrote:
> I test this case on centos8.2, it failed, but it passed on centos7.8 and
> fedora31. On upstream kernel (5.9-rc7+,commit 6f2f486d57c4,using kvm,4G
> memory,2 cpus), it also failed. I don't know whether it has some kernel
> parameters or kconfig to affect this. It seems not a kernel bug and like
> a environment bug(I guess).
> 
> tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s
> send02.c:86: TFAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
> send02.c:86: TFAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
> send02.c:86: TFAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
> send02.c:86: TFAIL: recv() error: EAGAIN/EWOULDBLOCK (11)

We have some similar failures on old s390 kernels (v4.4). I can't
reproduce any failures at all on our 4.12 and 5.3 kernels.

Can you add some debug prints and check whether it fails on the first
iteration or after a few successful loops? Also, do you have any test
runs where the TCP test case succeeded?

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
