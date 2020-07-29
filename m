Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89922231CD8
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 12:44:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 364563C2B2A
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 12:44:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 7DF833C0515
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 12:44:02 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 2A31C1466082
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 12:44:00 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,410,1589212800"; d="scan'208";a="97057739"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 29 Jul 2020 18:43:57 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 78A894CE5064;
 Wed, 29 Jul 2020 18:43:54 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 29 Jul 2020 18:43:54 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200722125946.GA22573@yuki.lan>
 <1595556357-29932-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200729100758.GA7152@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <a6b872b4-35e7-c326-1470-4372a02a92ad@cn.fujitsu.com>
Date: Wed, 29 Jul 2020 18:43:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200729100758.GA7152@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 78A894CE5064.ABF5F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-0.6 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] syscalls/ioctl_loop06: Using
 LOOP_CONFIGURE to test invalid block size
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

Hi Cyril
> Hi!
>>   static void verify_ioctl_loop(unsigned int n)
>> +{
>> +	if (tcases[n].ioctl_flag == LOOP_CONFIGURE)
>> +		TEST(ioctl(dev_fd, LOOP_CONFIGURE, &loopconfig));
>> +	else
>> +		TEST(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, *(tcases[n].setvalue)));
>> +
>> +	if (TST_RET == 0) {
>> +		tst_res(TFAIL, "Set block size succeed unexpectedly");
>> +		if (tcases[n].ioctl_flag == LOOP_CONFIGURE)
>> +			TST_RETRY_FUNC(ioctl(dev_fd, LOOP_CLR_FD, 0), TST_RETVAL_EQ0);
> 
> I guess that we can use the tst_detach_device_by_fd() here as well
> right?
> 
> If you agree with that change I will change this and push the patch.
Agree.
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
