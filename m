Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AA617DA11
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 08:52:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 434C33C60FA
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 08:52:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id D0A5D3C60ED
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 08:52:19 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 49FDD600D2F
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 08:52:17 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,532,1574092800"; d="scan'208";a="86043317"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Mar 2020 15:52:13 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6682F50A996F;
 Mon,  9 Mar 2020 15:42:15 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 9 Mar 2020 15:52:13 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <1583311467-2379-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1583311467-2379-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200309074701.GA299736@x230>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <fd1bed86-4590-cf73-a121-b9f9f0271e13@cn.fujitsu.com>
Date: Mon, 9 Mar 2020 15:52:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200309074701.GA299736@x230>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6682F50A996F.ADAFA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/2] syscalls/settimeofday02: convert to new
 library
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

Hi


> Hi Xu,
> 
>> +static void verify_settimeofday(unsigned int n)
> ...
>> +	struct tcase *tc = &tcases[n];
>> +
>> +	flag = 0;
>> +	tst_res(TINFO, "%s", tc->message);
>> +	TEST(settimeofday(&tc->tv, NULL));
>> +	if (TST_RET != -1) {
>> +		tst_res(TFAIL, "settimeofday() succeeded unexpectedly");
> Maybe add TTERRNO here as well?
Why? When run into here, settimeofyday succeeded unexpectedly, errno 
should be 0.

Best Regards
Yang Xu
>> +		flag = 1;
>> +		return;
> 
> Kind regards,
> Petr
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
