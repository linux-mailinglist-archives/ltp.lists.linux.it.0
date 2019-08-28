Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C61D9F8FC
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2019 05:56:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 191693C1D0C
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2019 05:56:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id ADC893C1C7F
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 05:56:46 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 0927A1400439
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 05:56:44 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,439,1559491200"; d="scan'208";a="74417328"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Aug 2019 11:56:40 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 112BD4CE032B;
 Wed, 28 Aug 2019 11:56:38 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Wed, 28 Aug 2019 11:56:39 +0800
Message-ID: <5D65FB75.6070800@cn.fujitsu.com>
Date: Wed, 28 Aug 2019 11:56:37 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20190802115046.GB27727@rei>
 <1566282838-2980-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190827092520.GA28859@dell5510>
In-Reply-To: <20190827092520.GA28859@dell5510>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 112BD4CE032B.A2055
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/statx04: use stx_attributes_mask
 before test
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

on 2019/08/27 17:25, Petr Vorel wrote:

> Hi Yang,
>
>> stx_attributes_mask shows what's supported in stx_attributes.
>> we should check four attrbutes whether supports on tested filesystem
> typo attrbutes
>> and only test supported flags on tested filesystem.
> I'd change it to
> Set supp_{append,compr,immutable,nodump} attributes only on filesystems which
> actually support them.
>
>> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
> Reviewed-by: Petr Vorel<pvorel@suse.cz>
Hi Petr

Thanks for your review.

>> ---
>>   testcases/kernel/syscalls/statx/statx04.c | 124 ++++++++++++++++------
> ...
>
>> -	attr |= FS_COMPR_FL | FS_APPEND_FL | FS_IMMUTABLE_FL | FS_NODUMP_FL;
>> +	if (supp_compr)
>> +		attr |= FS_COMPR_FL;
>> +	if (supp_append)
>> +		attr |= FS_APPEND_FL;
>> +	if (supp_immutable)
>> +		attr |= FS_IMMUTABLE_FL;
>> +	if (supp_nodump)
>> +		attr |= FS_NODUMP_FL;
>>   	ret = ioctl(fd, FS_IOC_SETFLAGS,&attr);
>>   	if (ret<  0) {
>> @@ -149,12 +176,43 @@ static void caid_flags_setup(void)
> Current code...
> 	if (supp_append)
> 		attr |= FS_APPEND_FL;
> 	if (supp_compr)
> 		attr |= FS_COMPR_FL;
> 	if (supp_immutable)
> 		attr |= FS_IMMUTABLE_FL;
> 	if (supp_nodump)
> 		attr |= FS_NODUMP_FL;
>
> 	ret = ioctl(fd, FS_IOC_SETFLAGS,&attr);
> 	if (ret<  0) {
> I wonder, if this check is still needed. Probably it's still useful to have
> sanity check, but "Flags not supported" has been caught
> by supp_{append,compr,immutable,nodump} variables.
It seems this check is redundant. In principle, if attributes_mask support these flags, the attribute should also
support them. Even though xfs filesystem missed attributes_mask after[1] and doesn't add it until [2]. But we don't
have the situation of having attribute_mask but not having attribute. So I think we can remove it.

[1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5f955f26f3d42d
[2]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1b9598c8fb9965

Thanks
Yang Xu

> 		if (errno == EOPNOTSUPP)
> 			tst_brk(TCONF, "Flags not supported");
> 		tst_brk(TBROK | TERRNO, "ioctl(%i, FS_IOC_SETFLAGS, %i)", fd, attr);
> 	}
> ...
>
> Kind regards,
> Petr
>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
