Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB9822C312
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 12:27:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 08F5B3C2A92
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 12:27:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 451F83C1CB6
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 12:27:11 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 2E971100174E
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 12:27:09 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,390,1589212800"; d="scan'208";a="96852091"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 Jul 2020 18:27:05 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id EFAA44CE5059;
 Fri, 24 Jul 2020 18:27:04 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Jul 2020 18:27:06 +0800
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <ede8d1c6a1ad1b23d8dca2297c740c301b329e37.1593743927.git.viresh.kumar@linaro.org>
 <47e40724c2a7a9612aca0265e493e62c69d65996.1594204153.git.viresh.kumar@linaro.org>
 <20200714142843.GA14905@yuki.lan>
 <d008820f-22d2-078d-3a62-f1fa20e6750b@cn.fujitsu.com>
 <20200724033732.gwzu2zdhdziwtbtz@vireshk-mac-ubuntu>
 <f9289166-5698-e2ec-ecc8-531fbcbd60c5@cn.fujitsu.com>
 <20200724101807.dtf46ydpegj3w43d@vireshk-mac-ubuntu>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <480f566f-0354-16ef-4ffb-855a2e367cf0@cn.fujitsu.com>
Date: Fri, 24 Jul 2020 18:27:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200724101807.dtf46ydpegj3w43d@vireshk-mac-ubuntu>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: EFAA44CE5059.AFFED
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3] syscalls/timer_settime01: Make sure the timer
 fires
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
Cc: ltp@lists.linux.it, Vincent Guittot <vincent.guittot@linaro.org>,
 arnd@arndb.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh


> On 24-07-20, 13:07, Yang Xu wrote:
>> Yes, only _ALARM fails.
> 
> Right. So this seems this is rather a kernel issue. And I am not
> really sure how to handle these.
> 
> Cyril, Any ideas ? Do we even try to support 3.10 here ?

ltp supports kernel 3.10. minimal supported kernel and (g)libc version 
discussion is here[1].  I don't know this is a backport bug or a 
upstream kernel bug(has fixed). I will figure out this on next week.

[1]https://github.com/linux-test-project/ltp/issues/657
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
