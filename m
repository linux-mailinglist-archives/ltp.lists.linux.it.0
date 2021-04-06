Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 678CF3550F8
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 12:36:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 958513C1E1C
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 12:36:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C8BA83C0E13
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 12:35:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D8B3068FF2F
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 12:35:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 01186B147;
 Tue,  6 Apr 2021 10:35:56 +0000 (UTC)
Date: Tue, 6 Apr 2021 12:35:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YGw5inZ09uZY2uRs@pevik>
References: <20210402031934.14615-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402031934.14615-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fs/iso9660: bugfix for iso9660/isofs.sh
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

...
> Currently in Debian, only the package genisoimage in sid and bullseye contains mkisofs,
> and there is no deb package of mkisofs in architectures such as mips. In addition, 
> this patch increases compatibility and is better than the previous one. 

Well, bullseye is stable. But ok, some people might care about oldstable (we
test it built LTP in Travis) and even oldoldstable.

> It is necessary to modify it.
> Reference: https://packages.debian.org/search?suite=sid&searchon=contents&keywords=mkisofs 

> According to your suggestion, the revised patch:
> ---
>  testcases/kernel/fs/iso9660/isofs.sh | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

> diff --git a/testcases/kernel/fs/iso9660/isofs.sh b/testcases/kernel/fs/iso9660/isofs.sh
> index 9de3f7cdc..1da3a398f 100755
> --- a/testcases/kernel/fs/iso9660/isofs.sh
> +++ b/testcases/kernel/fs/iso9660/isofs.sh
> @@ -12,6 +12,11 @@
>  TST_NEEDS_CMDS="mkisofs"
>  TST_NEEDS_TMPDIR=1
>  TST_TESTFUNC=do_test
> +if ! which mkisofs >/dev/null 2>&1; then
> +       TST_NEEDS_CMDS="genisoimage"
> +fi
> +MKISOFS_CMD=$TST_NEEDS_CMDS

Actually, this depends on which (take look on tst_cmd_available(), it also uses
command and trying to use which only if missing). And also it's misleading to
suggest to use only genisoimage.

Although for our documentation ("docparse"), it'd be better to use
TST_NEEDS_CMDS, until (if ever) shell API supports logical OR (e.g.
TST_NEEDS_CMDS="mkisofs|genisoimage") it'd be better to avoid TST_NEEDS_CMDS and
decide in the setup. Thus if you don't mind I'll merge this fix with you as an author:

setup()
{
	if ! tst_cmd_available mkisofs && ! tst_cmd_available genisoimage; then
		tst_brk TCONF "please install mkisofs or genisoimage"
	fi
}

> @@ -56,7 +61,7 @@ do_test() {
>  		"-allow-lowercase -allow-multidot -iso-level 3 -f -l -D -J -allow-leading-dots -R"
>  	do
>  		rm -f isofs.iso
> -		EXPECT_PASS mkisofs -o isofs.iso -quiet $mkisofs_opt $make_file_sys_dir 2\> /dev/null \
> +		EXPECT_PASS $MKISOFS_CMD -o isofs.iso -quiet $mkisofs_opt $make_file_sys_dir 2\> /dev/null \

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
