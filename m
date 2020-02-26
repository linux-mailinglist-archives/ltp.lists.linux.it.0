Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E688116FE9F
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 13:05:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 677943C253E
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 13:05:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 398713C12C9
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 13:05:13 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id A7F07600E3A
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 13:05:10 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,487,1574092800"; d="scan'208";a="84333640"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Feb 2020 20:05:05 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 7DDDF50A9976;
 Wed, 26 Feb 2020 19:55:15 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 26 Feb 2020 20:04:59 +0800
Message-ID: <5E565EEA.5020900@cn.fujitsu.com>
Date: Wed, 26 Feb 2020 20:04:58 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200226084249.29561-1-pvorel@suse.cz>
 <CAEemH2cMBtVV-1_RZb_UHN9rQF3sD2w-H2gS11BD2WHPTPzvgQ@mail.gmail.com>
 <20200226091824.GA2215@dell5510>
 <CAEemH2cXGOh=MX28kYvhFaHspHGXiVdGuNZeyN97+O3+bt1jGg@mail.gmail.com>
 <20200226113757.GA24342@dell5510>
In-Reply-To: <20200226113757.GA24342@dell5510>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 7DDDF50A9976.AA86F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] request_key04: Use TFAIL instead of TBROK
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2020/2/26 19:37, Petr Vorel wrote:
> Hi Li,
>
>>> ...
>>>>> obvious fix which I'd normally merge without sending to ML.
>>>>> But there are 19 tests which use tst_res(TBROK, and at least some of
>>>>> them are affected by this (i.e. don't unconditionally report any result
>>>>> before tst_res(TBROK), so we might want to fix it different way.
>>>> +1 for this fix.
>>> Thanks for your review.
>>>> By the way, do you think it makes sense to add build check parameters for
>>>> tst_res() too? Just like what we do for tst_brk() in commit 0738e3753c51.
>>> IMHO if we agree that tst_res(TBROK) is harmful and should be avoided
>>> entirely,
>> I agree.
>>> I'd be for adding this check.
>
>> In personally, I'd let tst_res() only accept 'TPASS, TFAIL, TINFO, TCONF,
>> TWARN'.
> +1. Cyril, Jan?
Hi Petr,

It is OK for me to add this check. :-)

Thanks,
Xiao Yang
> Kind regards,
> Petr
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
