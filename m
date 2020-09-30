Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7CE27E90E
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 14:58:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B39D3C4C08
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 14:58:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1C7163C27DE
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 14:58:20 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 52B556005E6
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 14:58:18 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,322,1596470400"; d="scan'208";a="99787153"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Sep 2020 20:58:17 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id CF05548990D5;
 Wed, 30 Sep 2020 20:58:15 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 30 Sep 2020 20:58:09 +0800
Message-ID: <5F7480DD.8080803@cn.fujitsu.com>
Date: Wed, 30 Sep 2020 20:58:05 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200929025606.322543-1-yangx.jy@cn.fujitsu.com>
 <20200930104709.GC6611@yuki.lan> <5F7479CF.4090007@cn.fujitsu.com>
 <20200930124018.GF6611@yuki.lan>
In-Reply-To: <20200930124018.GF6611@yuki.lan>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: CF05548990D5.A8D6D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers/cpuset_base_ops_testset.sh: Accept
 either 0 or -EINVAL when passing '0-'
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
Cc: ltp@lists.linux.it, rpalethorpe@suse.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2020/9/30 20:40, Cyril Hrubis wrote:
> Hi!
>> Thanks for your reply. :-)
>> 1) I still got '0' value instead of -EINVAL on Centos 6.10(2.6.32-754)
>> so not sure why we have the wrong kernel check before.
>>       Perhaps, is there anothe older kernel commit to change the behavior
>> as well?
>> 2) I don't think that kernel check is enough because  the change of
>> behavior may be backported into old kernel.
>>
>> How about removing the combination directly as Richard suggested on #695.
> So what about disabling the test on older kernels completely and expect
> EINVAL on 4.3 and newer?
>
> That will still catch regression in mailine kernel but will not fail on
> older ones.
Hi Cyril,

It is reasonable for me to foucs on new kernel(4.3 and newer).
I will send v2 patch soon. :-)

BTW:
Sorry, I misread the meaning of 'tst_kvcmp -lt "3.0 RHEL6:2.6.32"'.
It means that writing '0-' also get -EINVAL on very old 
kernel(3.0/RHEL6:2.6.32 and older),
so I think there is another old commit to change the behavior as well.

Thanks,
Xiao Yang



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
