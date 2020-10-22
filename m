Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BF729567D
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 04:44:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 45A913C56BF
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 04:44:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 6C7D83C319C
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 04:44:51 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 4E9F51000BE6
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 04:44:49 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,402,1596470400"; d="scan'208";a="100392333"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Oct 2020 10:44:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id D0D534CE1504;
 Thu, 22 Oct 2020 10:44:40 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Oct 2020 10:44:32 +0800
Message-ID: <5F90F214.20102@cn.fujitsu.com>
Date: Thu, 22 Oct 2020 10:44:36 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>, Petr Vorel <pvorel@suse.cz>
References: <20201021193547.GA49488@x230>
 <CAEemH2cAeMzbr6WWDOTTNYkU8b+1J+7WEHjGU283r3qWtXP8TA@mail.gmail.com>
In-Reply-To: <CAEemH2cAeMzbr6WWDOTTNYkU8b+1J+7WEHjGU283r3qWtXP8TA@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D0D534CE1504.AC362
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] Broken Fedora build
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

Hi Li,Petr
> Petr Vorel<pvorel@suse.cz>  wrote:
>
>> Fedora build is broken due missing<sys/timeb.h>  [1].
>> Quick fix would probably be to use Fedora 33 instead of Rawhide. [2]
>> But we should port hugetlb.c and trace_sched.c (if used) to gettimeofday or
>> clock_gettime. [3]
>
> +1
> I prefer to go replace ftime() by gettimeofday() or clock_gettime()
> way to solve this from root.
+1

I have seen the hugetlb.c and trace_sched.c code, they all use the time 
to generate a random value for ftok or sched_priority. So using 
gettimeofday() also looks ok.

I will send a patch to use gettimeofday.

Best Regards
Yang Xu
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
