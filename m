Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3BD5F103
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 03:40:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D3733C1DA5
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 03:40:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 1F1563C1D4E
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 03:40:54 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id DA985200B03
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 03:40:52 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,449,1557158400"; d="scan'208";a="70719057"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Jul 2019 09:40:48 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 1CEDD4CDE88B;
 Thu,  4 Jul 2019 09:40:50 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 4 Jul 2019 09:40:48 +0800
Message-ID: <5D1D5919.6000309@cn.fujitsu.com>
Date: Thu, 4 Jul 2019 09:40:41 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20190606114134.GB13068@rei.lan>
 <1560156706-13617-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190620120122.GB31382@dell5510> <5D0C323B.5020505@cn.fujitsu.com>
 <20190703144236.GA1495@dell5510>
In-Reply-To: <20190703144236.GA1495@dell5510>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 1CEDD4CDE88B.AF516
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] sysctl/sysctl02: Add new regression test for
 overflow file-max
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


> Hi Yang,
>
>> Hi Petr
>>   I use 2 strings because sysctl uses "fs.file-max" but cat uses "fs/file-max" file.
>>   Your big changes look good to me.  Thanks for your changes.
> I pushed tiny changes to sysctl02.sh as 8e2d73a88 ("sysctl/sysctl02: Improve log messages").
> See the diff below.
Hi Petr

     Your change makes this case more clear for user. It looks good to me.

Thanks
Yang Xu

> Kind regards,
> Petr
>
> diff --git a/testcases/commands/sysctl/sysctl02.sh b/testcases/commands/sysctl/sysctl02.sh
> index 8a434183e..3964a9829 100755
> --- a/testcases/commands/sysctl/sysctl02.sh
> +++ b/testcases/commands/sysctl/sysctl02.sh
> @@ -44,14 +44,17 @@ do_test()
>
>   sysctl_test_overflow()
>   {
> +	local test_value="$1"
>   	local old_value="$(cat $sys_file)"
> -	sysctl -w -q $sys_name=$1 2>/dev/null
> -	local test_value="$(cat $sys_file)"
>
> -	if echo $test_value | grep -q $old_value; then
> -		tst_res TPASS "$sys_file overflows, reject it and keep old value"
> +	tst_res TINFO "trying to set $sys_name=$test_value"
> +	sysctl -w -q $sys_name=$test_value 2>/dev/null
> +	local new_value="$(cat $sys_file)"
> +
> +	if [ "$new_value" = "$old_value" ]; then
> +		tst_res TPASS "$sys_file keeps old value ($old_value)"
>   	else
> -		tst_res TFAIL "$sys_file overflows and set to $test_value"
> +		tst_res TFAIL "$sys_file overflows and is set to $new_value"
>   	fi
>   	cleanup
>   }
>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
