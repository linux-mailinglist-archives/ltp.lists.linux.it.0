Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D53816F620
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 04:34:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D3013C137A
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 04:34:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 445D23C08C9
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 04:34:31 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id E0FF61000949
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 04:34:28 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,486,1574092800"; d="scan'208";a="84177268"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Feb 2020 11:34:26 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 765FB50A9973;
 Wed, 26 Feb 2020 11:24:38 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 26 Feb 2020 11:34:21 +0800
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <cover.1582612624.git.viresh.kumar@linaro.org>
 <e12560056ebc632918426194172a6cba48953d4e.1582612624.git.viresh.kumar@linaro.org>
 <20200225135709.GC62318@gacrux.arch.suse.de>
 <20200226022758.ls35mblsetg4nk6f@vireshk-i7>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <f1801e95-5200-48ee-a8b9-38e8b90e6593@cn.fujitsu.com>
Date: Wed, 26 Feb 2020 11:34:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200226022758.ls35mblsetg4nk6f@vireshk-i7>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 765FB50A9973.AFFFF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 08/10] syscalls/move_mount: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it,
 Vikas.Kumar2@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi

> On 25-02-20, 14:57, Petr Vorel wrote:
>>> +	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
>>> +	if (TST_RET == -1) {
>>> +		SAFE_CLOSE(fd);
>>> +		tst_res(TBROK | TERRNO, "fsconfig() failed");
>> These should be TFAIL otherwise it 1) breaks all tests 2) does not report any
>> result:
>>
>> move_mount02.c:37: BROK: fsopen() failed: SUCCESS (0)
>> tst_test.c:1051: BROK: Test 0 haven't reported results!
> 
> I am a bit confused about TBROK and TFAIL to be honest. The test
> writing guideline says this:
> 
> | 'TFAIL' | Test has failed.
> | 'TBROK' | Something has failed in test preparation phase.
> 
> And so in my code I have been using TFAIL only for the failures for the
> actual syscalls that we are testing, like move_mount here. And I have
> been using TBROK for pretty much everything else
If using TBROK, it will terminate the program. So how can test the 
remaining test?
Like move_mount02.c, if test "invalid-from-fd"and fsconfig failed, it 
will exit. So how do you test "invalid-from-path"?

Also, using return after TBROK is meaningless.

Best Regards
Yang Xu
> 
> Would be good if you and Cyril can explain what's the correct usage
> model for these is.
> 




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
