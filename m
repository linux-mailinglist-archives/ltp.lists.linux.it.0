Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8662858468
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jun 2019 16:24:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34C223C1C83
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jun 2019 16:24:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id DA6CA3C1C6F
 for <ltp@lists.linux.it>; Thu, 27 Jun 2019 16:24:23 +0200 (CEST)
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 9421F1001451
 for <ltp@lists.linux.it>; Thu, 27 Jun 2019 16:24:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=kXsOW
 DKNUOHHulVj9xrHwbJ2dP57BwLhTMIICYY5LkE=; b=BMaNsdsUbeaoYPcUnkdQq
 N/XM+HLuGZ0KWBpAGPpxpBcosk1i6HJlPfUsy/1408xjXtYMhWZOacNf4vZTkVU+
 baH09AL67FYUVO+HLQry2hdIST/NBc2YkmawhShLUFnk2AsVENlkadObOi63QNlb
 Nq/lxueewjyCN9WgiBxnS8=
Received: from [192.168.0.7] (unknown [183.210.52.6])
 by smtp10 (Coremail) with SMTP id DsCowAB3akiP0RRdUyI2Cw--.26685S2;
 Thu, 27 Jun 2019 22:24:17 +0800 (CST)
To: Po-Hsu Lin <po-hsu.lin@canonical.com>, ltp@lists.linux.it
References: <20190626081735.31327-1-po-hsu.lin@canonical.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <394ecb21-4ed5-cc0f-9c07-9dcea295604b@163.com>
Date: Thu, 27 Jun 2019 22:24:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20190626081735.31327-1-po-hsu.lin@canonical.com>
Content-Language: en-US
X-CM-TRANSID: DsCowAB3akiP0RRdUyI2Cw--.26685S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ury8Cw4kGF1fJFW7Gw43Awb_yoW8ZF1xpF
 ZxGr4Yyw4fZF95Xan7Ar10g3W8XaykAFW7WFyrtrsaqr1kXF1F9F1qgr1rJr1DWr4DZa4F
 vrsrZa4fXa47XFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jlNtxUUUUU=
X-Originating-IP: [183.210.52.6]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEhTgXlZYDD1uxQAAss
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] runpwtests03: fix for module name retrieval
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 06/26/2019 04:17 PM, Po-Hsu Lin wrote:
> The -l flag for modprobe has been deprecated in newer packages.
> This will induce some noise during the execution:
>      modprobe: invalid option -- 'l'
>
> And making the "Loading and Unloading of governor kernel modules" test
> not doing module load / unload operations.
>
> Fix this by using the find command to retrieve module names instead.
>
> Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> ---
>   testcases/kernel/power_management/runpwtests03.sh | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/testcases/kernel/power_management/runpwtests03.sh b/testcases/kernel/power_management/runpwtests03.sh
> index 11197937f..81d44f9b1 100755
> --- a/testcases/kernel/power_management/runpwtests03.sh
> +++ b/testcases/kernel/power_management/runpwtests03.sh
> @@ -118,8 +118,8 @@ pwkm_load_unload() {
>   	RC=0
>   	loaded_governor=`cat \
>   		/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor`
> -	for module in `modprobe -l | grep cpufreq_ | \
> -		cut -f8 -d"/" | cut -f1 -d"."`
> +	for module in `find /lib/modules/$(uname -r) -name "*cpufreq_*.ko" \
> +		-printf "%f\n" | cut -f1 -d"."`
Hi,

We may install compressed kernel modules(e.g. cpufreq_userspace.ko.xz) 
so we should match
these different formats.

There are still other issues(e.g. test is skipped if CPU_FREQ is built 
as a module) in the old code.
We should rewrite it to new API first and fix these issues including 
invalid "-l" option by the way.

Best Regards,
Xiao Yang
>   	do
>   		#echo -n "Loading $module ... "
>   		if [ $module != "cpufreq_$loaded_governor" ]; then
> @@ -131,8 +131,8 @@ pwkm_load_unload() {
>   			fi
>   		fi
>   	done
> -	for module in `modprobe -l | grep cpufreq_ | \
> -		cut -f8 -d"/" | cut -f1 -d"."`
> +	for module in `find /lib/modules/$(uname -r) -name "*cpufreq_*.ko" \
> +		-printf "%f\n" | cut -f1 -d"."`
>   		do
>   		#echo -n "Unloading $module ... "
>   		if [ $module != "cpufreq_$loaded_governor" ]; then



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
