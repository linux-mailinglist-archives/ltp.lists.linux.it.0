Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2194B6A206
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 08:01:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A498A3C1D04
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 08:01:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 9ACA33C1C68
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 08:01:11 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 109701401345
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 08:01:08 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,496,1557158400"; d="scan'208";a="71542518"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Jul 2019 14:01:02 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 5B0E94CDE65B
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 14:01:02 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 16 Jul 2019 14:01:06 +0800
Message-ID: <5D2D681D.1050909@cn.fujitsu.com>
Date: Tue, 16 Jul 2019 14:01:01 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
References: <1560250815-2308-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1560250815-2308-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 5B0E94CDE65B.AF4A2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cgroup_regression_test.sh: fix test_5 possible
 mount failure because of cgroup hierarchy
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

Hi 

Ping.  :-) 

> Currently, if systems doesn't mount subsys1,subsys2 and the hierarchy is not equal to 0, running it
> reports the following error:
>
> mount: xxx is already mounted or /tmp/ltp-wPw08anmTI/LTP_cgroup_regression_test.V4jf0qrS7z/cgroup busy
> cgroup_regression_test 5 TFAIL: mount net_prio and pids failed
>
> It fails because libcgroup doesn't permmit destroy cgroup subsystem hierarchies.
> Simple umnout does not destroy the hierarchies. They still live inside kernel!
>
> When  hierarchy is equal to 0 in /proc/cgroups, we can mount them together on
> a new mountpoint.
>
> I add a check for subsystem hierarchy and get subsystem from head.
>
> Notice:
> more information about"Bug 612805 - cgroup: mount: none already mounted or /cgroups busy"
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  .../cgroup/cgroup_regression_test.sh           | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> index e197f5d3f..38cb760c2 100755
> --- a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> +++ b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> @@ -252,8 +252,10 @@ test5()
>  		return
>  	fi
>  
> -	local subsys1=`tail -n 1 /proc/cgroups | awk '{ print $1 }'`
> -	local subsys2=`tail -n 2 /proc/cgroups | head -1 | awk '{ print $1 }'`
> +	local subsys1=`head -2 /proc/cgroups | tail -n 1 | awk '{ print $1 }'`
> +	local subsys1_hierarchy=`head -2 /proc/cgroups | tail -n 1 | awk '{ print $2 }'`
> +	local subsys2=`head -3 /proc/cgroups | tail -n 1 | awk '{ print $1 }'`
> +	local subsys2_hierarchy=`head -3 /proc/cgroups | tail -n 1 | awk '{ print $2 }'`
>  
>  	# Accounting here for the fact that the chosen subsystems could
>  	# have been already previously mounted at boot time: in such a
> @@ -267,10 +269,16 @@ test5()
>  	if [ -z "$mounted" ]; then
>  		mntpoint=cgroup
>  		failing=$subsys1
> -		mount -t cgroup -o $subsys1,$subsys2 xxx $mntpoint/
> +		mount -t cgroup -o $subsys1,$subsys2 xxx $mntpoint/ 2>/dev/null
> +		# Even subsystem has not been mounted, it still live in kernel.
> +		# So we will get EBUSY when both mount subsys1 and subsys2 if
> +		# hierarchy isn't equal to 0.
>  		if [ $? -ne 0 ]; then
> -			tst_res TFAIL "mount $subsys1 and $subsys2 failed"
> -			return
> +			if [ "$subsys1_hierarchy" = 0 -a "$subsys2_hierarchy" = 0 ]; then
> +				tst_res TFAIL "mount $subsys1 and $subsys2 failed"
> +				return
> +			fi
> +			failing=$subsys1,$subsys2
>  		fi
>  	else
>  		# Use the pre-esistent mountpoint as $mntpoint and use a




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
