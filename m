Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D9620C598
	for <lists+linux-ltp@lfdr.de>; Sun, 28 Jun 2020 05:36:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2AA963C2B8A
	for <lists+linux-ltp@lfdr.de>; Sun, 28 Jun 2020 05:36:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D5D4A3C074B
 for <ltp@lists.linux.it>; Sun, 28 Jun 2020 05:36:10 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 95751200B3B
 for <ltp@lists.linux.it>; Sun, 28 Jun 2020 05:36:08 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,290,1589212800"; d="scan'208";a="95406230"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Jun 2020 11:36:06 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id D512C4CE49BA;
 Sun, 28 Jun 2020 11:25:39 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 28 Jun 2020 11:36:06 +0800
Message-ID: <5EF81024.4050502@cn.fujitsu.com>
Date: Sun, 28 Jun 2020 11:36:04 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Alexey Kodanev <alexey.kodanev@oracle.com>, Petr Vorel
 <petr.vorel@suse.com>
References: <20200622070911.16123-1-petr.vorel@suse.com>
 <20200622070911.16123-2-petr.vorel@suse.com>
 <3c3327ea-3132-255c-f853-c5c2d3f3c338@oracle.com>
 <746f495c-b079-4ead-147a-ab21bb357464@oracle.com>
In-Reply-To: <746f495c-b079-4ead-147a-ab21bb357464@oracle.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: D512C4CE49BA.AC92A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RESENT PATCH 1/5] tst_net.sh: Remove rsh support
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

On 2020/6/26 14:27, Alexey Kodanev wrote:
> On 25.06.2020 19:42, Alexey Kodanev wrote:
>> On 22.06.2020 10:09, Petr Vorel wrote:
>>> From: Petr Vorel<pvorel@suse.cz>
>>>
>> Hi Petr,
>>
>>> rsh is not used nowadays. When was the first network library version
>>> added in 18739ff06 (2014), it was a default + and ssh replacement was
>>> optional. Netns based single machine testing was added in 5f8ca6cf0
>>> (2016). After 6 years it's time to drop legacy rsh.
>>>
>>> ssh based testing setup requires only RHOST variable, TST_USE_SSH has
>>> been removed as unneeded. Also check for ssh in tst_rhost_run().
>>>
>>> We still keep $LTP_RSH for some of the network stress tests, which has
>>> not been ported to tst_net.sh yet.
>> But tst_net.sh not used in such tests, so why keeping LTP_RSH there?
> Ok, tst_net.sh included in testscripts/network.sh, we could change it
> to ssh too:
>
> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index 41938b1ac..0e10945da 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -856,7 +856,7 @@ tst_default_max_pkt()
>   export RHOST="$RHOST"
>   export PASSWD="${PASSWD:-}"
>   # Don't use it in new tests, use tst_rhost_run() from tst_net.sh instead.
> -export LTP_RSH="${LTP_RSH:-rsh -n}"
> +export LTP_RSH="${LTP_RSH:-ssh -nq -l root}"
Hi,

I also prefer to init it to ssh directly. :-)

BTW: Is it necessary to add fixed 'root' user? we can choose the user by 
current login user.

Best Regards,
Xiao Yang
>
>   # Test Links
>   # IPV{4,6}_{L,R}HOST can be set with or without prefix (e.g. IP or IP/prefix),
>
>>> Suggested-by: Alexey Kodanev<alexey.kodanev@oracle.com>
>>> Signed-off-by: Petr Vorel<pvorel@suse.cz>
>>> ---
>>>   testcases/lib/tst_net.sh | 10 ++++------
>>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
>>> index 806b540cd..1b96b3bf4 100644
>>> --- a/testcases/lib/tst_net.sh
>>> +++ b/testcases/lib/tst_net.sh
>>> @@ -136,7 +136,7 @@ init_ltp_netspace()
>>>   # -b run in background
>>>   # -c CMD specify command to run (this must be binary, not shell builtin/function)
>>>   # -s safe option, if something goes wrong, will exit with TBROK
>>> -# -u USER for ssh/rsh (default root)
>>> +# -u USER for ssh (default root)
>>>   # RETURN: 0 on success, 1 on failure
>>>   tst_rhost_run()
>>>   {
>>> @@ -166,14 +166,12 @@ tst_rhost_run()
>>>   		return 1
>>>   	fi
>>>
>>> -	if [ -n "${TST_USE_SSH:-}" ]; then
>>> -		output=`ssh -n -q $user@$RHOST "sh -c \
>>> -			'$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
>>> -	elif [ -n "${TST_USE_NETNS:-}" ]; then
>>> +	if [ -n "${TST_USE_NETNS:-}" ]; then
>>>   		output=`$LTP_NETNS sh -c \
>>>   			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR'`
>>>   	else
>>> -		output=`rsh -n -l $user $RHOST "sh -c \
>>> +		tst_require_cmds ssh
>>> +		output=`ssh -n -q $user@$RHOST "sh -c \
>>>   			'$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
>>>   	fi
>>>   	echo "$output" | grep -q 'RTERR$'&&  ret=1
>>>
>>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
