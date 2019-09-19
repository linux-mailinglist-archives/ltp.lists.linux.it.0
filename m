Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC3EB768D
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 11:45:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 180173C211D
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 11:45:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 955413C20DB
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 11:45:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EF4C0600149
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 11:45:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 03864B6C7;
 Thu, 19 Sep 2019 09:45:45 +0000 (UTC)
Date: Thu, 19 Sep 2019 11:45:44 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190919094544.GA21345@rei>
References: <1568884247-2605-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568884247-2605-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cgroup_regression_test.sh: Remove obselte test_5
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

Hi!
> test_5 is a very old regresstion test and kernel code has been
> rewritten completely since 2.6. No user will use such old kernel
> code to test. So I think we can remove it.

Unfortunatelly we also have to renumber the tests and change TST_CNT
otherwise the test library will attempt to run a function that is not
present.

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  .../cgroup/cgroup_regression_test.sh          | 75 -------------------
>  1 file changed, 75 deletions(-)
> 
> -------------------------
> a discussion about it:
> https://patchwork.ozlabs.org/patch/1113680/
> -------------------------
> 
> diff --git a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> index e197f5d3f..a32ed172c 100755
> --- a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> +++ b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> @@ -232,81 +232,6 @@ test4()
>  	tst_res TPASS "no lockdep BUG was found"
>  }
>  
> -#---------------------------------------------------------------------------
> -# Bug:    When mount cgroup fs and the fs was busy, root_count should not be
> -#         decremented in cgroup_kill_sb()
> -# Kernel: 2.6.29-rcX
> -# Links:  https://openvz.org/pipermail/devel/2009-January/016345.html
> -#         http://lkml.org/lkml/2009/1/28/190
> -# Fix:    commit 839ec5452ebfd5905b9c69b20ceb640903a8ea1a
> -#---------------------------------------------------------------------------
> -test5()
> -{
> -	local mounted
> -	local failing
> -	local mntpoint
> -
> -	local lines=`cat /proc/cgroups | wc -l`
> -	if [ $lines -le 2 ]; then
> -		tst_res TCONF "require at least 2 cgroup subsystems"
> -		return
> -	fi
> -
> -	local subsys1=`tail -n 1 /proc/cgroups | awk '{ print $1 }'`
> -	local subsys2=`tail -n 2 /proc/cgroups | head -1 | awk '{ print $1 }'`
> -
> -	# Accounting here for the fact that the chosen subsystems could
> -	# have been already previously mounted at boot time: in such a
> -	# case we must skip the initial co-mount step (which would
> -	# fail anyway) and properly re-organize the $mntpoint and
> -	# $failing params to be used in the following expected-to-fail
> -	# mount action. Note that the subsysN name itself will be listed
> -	# amongst mounts options.
> -	get_cgroup_mountpoint $subsys1 >/dev/null && mounted=$subsys1
> -	[ -z "$mounted" ] && get_cgroup_mountpoint $subsys2 >/dev/null && mounted=$subsys2
> -	if [ -z "$mounted" ]; then
> -		mntpoint=cgroup
> -		failing=$subsys1
> -		mount -t cgroup -o $subsys1,$subsys2 xxx $mntpoint/
> -		if [ $? -ne 0 ]; then
> -			tst_res TFAIL "mount $subsys1 and $subsys2 failed"
> -			return
> -		fi
> -	else
> -		# Use the pre-esistent mountpoint as $mntpoint and use a
> -		# co-mount with $failing: this way the 2nd mount will
> -		# also fail (as expected) in this 'mirrored' configuration.
> -		mntpoint=$(get_cgroup_mountpoint $mounted)
> -		failing=$subsys1,$subsys2
> -	fi
> -
> -	# This 2nd mount has been properly configured to fail
> -	mount -t cgroup -o $failing xxx $mntpoint/ 2> /dev/null
> -	if [ $? -eq 0 ]; then
> -		tst_res TFAIL "mount $failing should fail"
> -		# Do NOT unmount pre-existent mountpoints...
> -		[ -z "$mounted" ] && umount $mntpoint/
> -		return
> -	fi
> -
> -	mkdir $mntpoint/0
> -	# Otherwise we can't attach task
> -	if [ "$subsys1" = cpuset -o "$subsys2" = cpuset ]; then
> -		echo 0 > $mntpoint/0/cpuset.cpus 2> /dev/null
> -		echo 0 > $mntpoint/0/cpuset.mems 2> /dev/null
> -	fi
> -
> -	sleep 100 &
> -	echo $! > $mntpoint/0/tasks
> -
> -	kill -TERM $! > /dev/null
> -	wait $! 2>/dev/null
> -	rmdir $mntpoint/0
> -	# Do NOT unmount pre-existent mountpoints...
> -	[ -z "$mounted" ] && umount $mntpoint/
> -	check_kernel_bug
> -}
> -
>  #---------------------------------------------------------------------------
>  # Bug:    There was a race between cgroup_clone and umount
>  # Kernel: 2.6.24 - 2.6.28, 2.6.29-rcX
> -- 
> 2.18.1
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
