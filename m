Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7A533EFD3
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 12:53:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DBB3D3C60CF
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 12:53:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 871D13C2CFA
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 12:53:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 27CA3200C99
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 12:53:41 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 526E1AC1D
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 11:53:41 +0000 (UTC)
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
References: <20210317105318.32017-1-chrubis@suse.cz>
 <20210317105318.32017-4-chrubis@suse.cz>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <b2d54281-2893-2dc1-e2a8-ff789dc1c1f2@suse.cz>
Date: Wed, 17 Mar 2021 12:53:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317105318.32017-4-chrubis@suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/4] lib: Apply the skip_filesystems to rest of
 test as well
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,
the whole patchset looks great, just a small nit below.

Reviewed-by: Martin Doucha <mdoucha@suse.cz>

On 17. 03. 21 11:53, Cyril Hrubis wrote:
> There is no reason to use the newly introduced .skip_filesystems only
> for .all_filesystems tests.
> 
> So if .all_filesystems is not enabled and .skip_filesystems is set we
> check if test temporary directory filesystem type is in the list of
> supported filesystem types.
> 
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  lib/tst_test.c                                | 12 ++++++++++++
>  testcases/kernel/syscalls/fcntl/fcntl33.c     | 19 +++++++------------
>  .../kernel/syscalls/ioctl/ioctl_loop05.c      | 11 +++++------
>  .../kernel/syscalls/vmsplice/vmsplice01.c     |  9 ++++-----
>  .../kernel/syscalls/vmsplice/vmsplice02.c     |  9 ++++-----
>  5 files changed, 32 insertions(+), 28 deletions(-)
> 
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 639e21727..2f728de28 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -1051,6 +1051,18 @@ static void do_test_setup(void)
>  {
>  	main_pid = getpid();
>  
> +	if (!tst_test->all_filesystems && tst_test->skip_filesystems) {
> +		long fs_type = tst_fs_type(".");
> +		const char *fs_name = tst_fs_type_name(fs_type);
> +
> +		if (tst_fs_in_skiplist(fs_name, tst_test->skip_filesystems)) {
> +			tst_brk(TCONF, "Skipping %s as requested by the test",
> +				fs_name);

This message might be a little confusing when the test didn't ask for
all filesystems. I'd recommend something like "Test does not support %s
workdir, skipping". The else clause below is probably unnecessary.

But feel free to push as is if you disagree.

> +		} else {
> +			tst_res(TINFO, "%s is supported by the test", fs_name);
> +		}
> +	}
> +
>  	if (tst_test->caps)
>  		tst_cap_setup(tst_test->caps, TST_CAP_REQ);
>  

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
