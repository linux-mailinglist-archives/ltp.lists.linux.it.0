Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DCA27E6F8
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 12:46:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF2C53C4C0D
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 12:46:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C719B3C2824
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 12:46:42 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 46B891400C42
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 12:46:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA91AAC85;
 Wed, 30 Sep 2020 10:46:41 +0000 (UTC)
Date: Wed, 30 Sep 2020 12:47:09 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200930104709.GC6611@yuki.lan>
References: <20200929025606.322543-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929025606.322543-1-yangx.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers/cpuset_base_ops_testset.sh: Accept
 either 0 or -EINVAL when passing '0-'
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
Cc: ltp@lists.linux.it, rpalethorpe@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> When we write '0-' to cpuset.cpus/cpuset.mems, new bitmap_parselist()
> in kernel(e.g. newer than v4.2) treats it as an invalid value and old
> one treats it as a valid '0':
> -------------------------------------------
> on v5.8.0:
>  # echo 0- > cpuset.cpus
>  -bash: echo: write error: Invalid argument
>  # echo 0- > cpuset.mems
>  -bash: echo: write error: Invalid argument
> 
> on v4.0.0:
>  # echo '0-' >cpuset.cpus
>  # cat cpuset.cpus
>  0
>  # echo '0-' >cpuset.mems
>  # cat cpuset.cpus
>  0
> -------------------------------------------
> Note: commit d9282cb66353b changes the behavior.
> 
> Drop the check of kernel version and accept either 0 or -EINVAL
> because the change of behavior can be backported into old kernel.

Why can't we just simply adjust the kernel check, it looks like the
commit you mentioned was added to 4.3 so it should be fixed by changing
the line to:

	if tst_kvcmp -lt "4.3 RHEL6:2.6.32"; then

We want to at least keep the check for kernels newer than 4.3 just to
make sure that kernel keeps rejecting the '0-' invalid value.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
