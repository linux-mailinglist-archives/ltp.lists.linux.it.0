Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F95323564
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 02:40:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34AB33C5EC9
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 02:40:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 254903C2656
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 02:40:20 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AB9BF600BF8
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 02:40:19 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB8A3AFE2;
 Wed, 24 Feb 2021 01:40:18 +0000 (UTC)
Date: Wed, 24 Feb 2021 02:40:17 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YDWugcEDg/z4tRrX@pevik>
References: <20210223140323.126555-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210223140323.126555-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] unshare01.sh: Setup parent mount flag before
 unshare testing
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

> We need setup parent mount flag to shared before unshare testing, or it will
> fail for system which has no systemd service since the propagation flag is
> changed by systemd. From man 7 mount_namespaces.
Do I understand correctly that all distros without systemd are affected,
because systemd "automatically remounts all mount points as MS_SHARED
on system startup" and test expect it?

> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> ---
>  testcases/commands/unshare/unshare01.sh | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

> diff --git a/testcases/commands/unshare/unshare01.sh b/testcases/commands/unshare/unshare01.sh
> index bf163a7f4..e1fb15035 100755
> --- a/testcases/commands/unshare/unshare01.sh
> +++ b/testcases/commands/unshare/unshare01.sh
> @@ -31,7 +31,6 @@ TST_SETUP=setup
>  TST_CLEANUP=cleanup
>  TST_TESTFUNC=do_test
>  TST_NEEDS_ROOT=1
> -TST_NEEDS_TMPDIR=1
You still need TST_NEEDS_TMPDIR=1, because you create files and directories.

Also your patch breaks bind test on very old systems (kernel 2.6, util-linux
2.17.2, glibc 2.12):
unshare01 5 TFAIL: unshare --mount mount --bind dir_A dir_B got bind info

Any idea why (how to avoid this regression)?

>  TST_NEEDS_CMDS="unshare id mount umount"
>  . tst_test.sh

> @@ -39,6 +38,7 @@ max_userns_path="/proc/sys/user/max_user_namespaces"
>  max_mntns_path="/proc/sys/user/max_mnt_namespaces"
>  default_max_userns=-1
>  default_max_mntns=-1
> +CURR=$(pwd)
Instead of $CURR, cd - can be used.

>  setup()
>  {
> @@ -55,6 +55,10 @@ setup()
>  		echo 1024 > "${max_mntns_path}"
>  	fi

> +	mkdir $CURR/dir_C
just mkdir dir_C
> +	mount -t tmpfs none dir_C
> +	mount --make-shared dir_C
FYI We have tst_mount, but it'd not help much here.

> +	cd dir_C
>  	mkdir -p dir_A dir_B
>  	touch dir_A/A dir_B/B
>  }
> @@ -66,6 +70,9 @@ cleanup()
>  		echo ${default_max_userns} > "${max_userns_path}"
>  	[ ${default_max_mntns} -ne -1 ] && \
>  		echo ${default_max_mntns} > "${max_mntns_path}"
> +	cd $CURR
> +	umount dir_C
tst_umount dir_C

> +	rm -rf dir_C
rm is not needed (cleanup is done automatically).
>  }

>  check_id()

Full diff of changes I propose below.

Kind regards,
Petr

diff --git testcases/commands/unshare/unshare01.sh testcases/commands/unshare/unshare01.sh
index e1fb15035..0b5c56811 100755
--- testcases/commands/unshare/unshare01.sh
+++ testcases/commands/unshare/unshare01.sh
@@ -31,6 +31,7 @@ TST_SETUP=setup
 TST_CLEANUP=cleanup
 TST_TESTFUNC=do_test
 TST_NEEDS_ROOT=1
+TST_NEEDS_TMPDIR=1
 TST_NEEDS_CMDS="unshare id mount umount"
 . tst_test.sh
 
@@ -38,7 +39,6 @@ max_userns_path="/proc/sys/user/max_user_namespaces"
 max_mntns_path="/proc/sys/user/max_mnt_namespaces"
 default_max_userns=-1
 default_max_mntns=-1
-CURR=$(pwd)
 
 setup()
 {
@@ -55,7 +55,7 @@ setup()
 		echo 1024 > "${max_mntns_path}"
 	fi
 
-	mkdir $CURR/dir_C
+	mkdir dir_C
 	mount -t tmpfs none dir_C
 	mount --make-shared dir_C
 	cd dir_C
@@ -70,9 +70,8 @@ cleanup()
 		echo ${default_max_userns} > "${max_userns_path}"
 	[ ${default_max_mntns} -ne -1 ] && \
 		echo ${default_max_mntns} > "${max_mntns_path}"
-	cd $CURR
-	umount dir_C
-	rm -rf dir_C
+	cd - >/dev/null
+	tst_umount dir_C
 }
 
 check_id()

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
