Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D64D17B7E3
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 09:03:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 890643C63D0
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 09:03:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 7D93D3C63A4
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 09:03:24 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 4899C2016C4
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 09:03:22 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,521,1574092800"; d="scan'208";a="85938726"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Mar 2020 16:03:19 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 58B16406AB15;
 Fri,  6 Mar 2020 15:53:24 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 6 Mar 2020 16:03:10 +0800
To: Petr Vorel <pvorel@suse.cz>, Li Wang <liwang@redhat.com>
References: <1583402023-22461-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200305172142.GA24302@dell5510>
 <CAEemH2f+tOCEm=6k9p+xZNAKgKcCu95ZdDdyy1RQqtqRYD+zOA@mail.gmail.com>
 <20200306071221.GA13530@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <9c80c354-ed99-2889-5840-27a519da8c52@cn.fujitsu.com>
Date: Fri, 6 Mar 2020 16:03:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200306071221.GA13530@dell5510>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 58B16406AB15.AA743
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] hugeshmctl01: Revert "hugeshmctl: Use loop from
 the API"
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

Hi Petr,Li


> Hi Li, Xu,
>>> I'd personally prefer to keep .tcnt = ARRAY_SIZE(tcases),
> 
>> +1 Me too. I don't think we should revert the patch. Just fix the problem
>> and do refactor or improvement will make the code more readable.
> 
> Thank you both for review and additional info.
> Xu, you did the original debugging, so feel free to send a patch which just
> fixes the problem.
> 
I plan to refactor this case and make case more cleaner.

Best Regards
Yang Xu
> Kind regards,
> Petr
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
