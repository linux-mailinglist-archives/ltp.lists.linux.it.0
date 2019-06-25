Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2482154D0D
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jun 2019 13:00:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E6FAB3C13E4
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jun 2019 13:00:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 382E03C005B
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 13:00:02 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 666A9200D1A
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 12:59:59 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,415,1557158400"; d="scan'208";a="69240317"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Jun 2019 18:59:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 285464CDB937;
 Tue, 25 Jun 2019 18:59:49 +0800 (CST)
Received: from [10.167.215.39] (10.167.215.39) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 25 Jun 2019 18:59:49 +0800
Message-ID: <5D11FEA7.1000104@cn.fujitsu.com>
Date: Tue, 25 Jun 2019 18:59:51 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
References: <20190625100351.19800-1-po-hsu.lin@canonical.com>
In-Reply-To: <20190625100351.19800-1-po-hsu.lin@canonical.com>
X-Originating-IP: [10.167.215.39]
X-yoursite-MailScanner-ID: 285464CDB937.A93D4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] runpwtests03: use expr to calculate total_cpus
 for runpwtests03
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2019/06/25 18:03, Po-Hsu Lin wrote:
> The arithmetic operation (( total_cpus-=1 )) does not work for dash,
> which was symbolic linked to /bin/sh on some OS like Ubuntu.
>
> In such case, people will see error like:
>    runpwtests03.sh: total_cpus-=1: not found
>
> And this further leads to access for a non-existing file and cause
> false-positive result in the end:
>    runpwtests03.sh: cannot create
>    /sys/devices/system/cpu/cpu8/cpufreq/scaling_governor: Directory nonexistent
>    runpwtests03.sh: FAIL: Unable to set governor -- powersave for cpu8
>    Power_Management03 2 TFAIL: Changing governors
>
> Use expr instead for fix this issue.
>
> Signed-off-by: Po-Hsu Lin<po-hsu.lin@canonical.com>
> ---
>   testcases/kernel/power_management/runpwtests03.sh | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/testcases/kernel/power_management/runpwtests03.sh b/testcases/kernel/power_management/runpwtests03.sh
> index 11197937f..3fb85d273 100755
> --- a/testcases/kernel/power_management/runpwtests03.sh
> +++ b/testcases/kernel/power_management/runpwtests03.sh
> @@ -25,8 +25,7 @@ export TST_TOTAL=4
>   . pm_include.sh
>
>   check_cpufreq_sysfs_files() {
> -	total_cpus=$(tst_ncpus)
> -	(( total_cpus-=1 ))
> +	total_cpus=`expr $(tst_ncpus) - 1`

Hi,

It's wrong for single variable to use $(), did you mean ${tst_ncpus}?

Best Regards,
Xiao Yang
>   	RC=0
>
>   	for cpu in $(seq 0 "${total_cpus}" )
> @@ -51,8 +50,7 @@ check_cpufreq_sysfs_files() {
>   change_govr() {
>   	available_govr=$(get_supporting_govr)
>
> -	total_cpus=$(tst_ncpus)
> -	(( total_cpus-=1 ))
> +	total_cpus=`expr $(tst_ncpus) - 1`
>   	RC=0
>
>   	for cpu in $(seq 0 "${total_cpus}" )
> @@ -79,8 +77,7 @@ change_freq() {
>   	available_govr=$(get_supporting_govr)
>   	RC=0
>
> -	total_cpus=$(tst_ncpus)
> -	(( total_cpus-=1 ))
> +	total_cpus=`expr $(tst_ncpus) - 1`
>
>   	if ( echo ${available_govr} | grep -i "userspace" \
>   		>/dev/null 2>&1 ); then




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
