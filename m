Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B28E1F33FA
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 08:15:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 322943C2E49
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 08:15:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 47B653C2E3F
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 08:15:00 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 7BA65200074
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 08:14:58 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,490,1583164800"; d="scan'208";a="94146689"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Jun 2020 14:14:56 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id CD8264C4A88F;
 Tue,  9 Jun 2020 14:14:55 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 9 Jun 2020 14:14:54 +0800
Message-ID: <5EDF28DE.7070202@cn.fujitsu.com>
Date: Tue, 9 Jun 2020 14:14:54 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200608142744.274287-1-yangx.jy@cn.fujitsu.com>
 <20200608145831.GA2746544@x230>
In-Reply-To: <20200608145831.GA2746544@x230>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: CD8264C4A88F.AB833
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/nfs_lib.sh: Use double quotes for grep
 pattern
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

On 2020/6/8 22:58, Petr Vorel wrote:
> Hi Xiao,
>
> Reviewed-by: Petr Vorel<petr.vorel@gmail.com>
>
>> +++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
>> @@ -58,7 +58,7 @@ nfs_server_udp_enabled()
>>   	tst_rhost_run -c "[ -f /etc/nfs.conf ]" || return 0
>>   	config=$(tst_rhost_run -c 'for f in $(grep ^include.*= '/etc/nfs.conf' | cut -d = -f2); do [ -f $f ]&&  printf "$f "; done')
>
>> -	tst_rhost_run -c "grep -q '^[# ]*udp *= *y' /etc/nfs.conf $config"
>> +	tst_rhost_run -c "grep -q \"^[# ]*udp *= *y\" /etc/nfs.conf $config"
> Good catch. But I wonder if we shouldn't fix tst_rhost_run instead, to avoid
> this error in the future. How about replacing ' with \" in $cmd?
Hi Petr,

It is fine for me to fix the issue in tst_rhost_run() but I didn't find 
a better fix, could you provide an example about your idea?

Best Regards,
Xiao Yang
>
> Kind regards,
> Petr
>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
