Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9417B35E796
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 22:27:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BF2A3C72C6
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 22:27:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 388BE3C1D7E
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 22:27:45 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 35B0D6008F9
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 22:27:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A390AF42;
 Tue, 13 Apr 2021 20:27:43 +0000 (UTC)
Date: Tue, 13 Apr 2021 22:27:41 +0200
From: Petr Vorel <pvorel@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YHX+vS+SnHJt7mDi@pevik>
References: <20210407052424.5795-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210407052424.5795-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] bugfix for iso9660/isofs.sh
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
> Thank you very much for your guidance, but I want to submit it myself. 
> Because this is the first time I submit a patch in the community.

I added this as your commit and merged. But please next time send a proper patch
(it's easier to use proper patch via LTP patchwork [1]).
And I added additional cleanup patch.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/list/

> ---
>  testcases/kernel/fs/iso9660/isofs.sh | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)

> diff --git a/testcases/kernel/fs/iso9660/isofs.sh b/testcases/kernel/fs/iso9660/isofs.sh
> index 9de3f7cdc..c0e2d1ff8 100755
> --- a/testcases/kernel/fs/iso9660/isofs.sh
> +++ b/testcases/kernel/fs/iso9660/isofs.sh
> @@ -9,14 +9,26 @@
>  # It makes ISO9660 file system with different options and also
>  # mounts ISO9660 file system with different mount options.

> -TST_NEEDS_CMDS="mkisofs"
>  TST_NEEDS_TMPDIR=1
>  TST_TESTFUNC=do_test
> +TST_SETUP=setup
> +
>  . tst_test.sh

>  MAX_DEPTH=3
>  MAX_DIRS=4

> +setup()
> +{
> +	if tst_cmd_available mkisofs; then
> +		MKISOFS_CMD="mkisofs"
> +	elif tst_cmd_available genisoimage; then
> +		MKISOFS_CMD="genisoimage"
> +	else
> +		tst_brk TCONF "please install mkisofs or genisoimage"
> +	fi
> +}
> +
>  gen_fs_tree()
>  {
>  	local cur_path="$1"
> @@ -56,7 +68,7 @@ do_test() {
>  		"-allow-lowercase -allow-multidot -iso-level 3 -f -l -D -J -allow-leading-dots -R"
>  	do
>  		rm -f isofs.iso
> -		EXPECT_PASS mkisofs -o isofs.iso -quiet $mkisofs_opt $make_file_sys_dir 2\> /dev/null \
> +		EXPECT_PASS $MKISOFS_CMD -o isofs.iso -quiet $mkisofs_opt $make_file_sys_dir 2\> /dev/null \
>  			|| continue

>  		for mount_opt in \

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
