Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E432AA1E6
	for <lists+linux-ltp@lfdr.de>; Sat,  7 Nov 2020 01:53:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 217CB3C6D6A
	for <lists+linux-ltp@lfdr.de>; Sat,  7 Nov 2020 01:53:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8FFD23C20D7
 for <ltp@lists.linux.it>; Sat,  7 Nov 2020 01:53:31 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 6D92A600040
 for <ltp@lists.linux.it>; Sat,  7 Nov 2020 01:53:29 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,458,1596470400"; d="scan'208";a="101038191"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 07 Nov 2020 08:53:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 095F14CE34EF;
 Sat,  7 Nov 2020 08:53:28 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 7 Nov 2020 08:53:27 +0800
Message-ID: <5FA5F005.7080408@cn.fujitsu.com>
Date: Sat, 7 Nov 2020 08:53:25 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Xiao Yang <ice_yangxiao@163.com>, Cyril Hrubis <chrubis@suse.cz>
References: <1603691317-22811-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5FA21AA9.9020208@cn.fujitsu.com> <20201106123604.GA30097@yuki.lan>
 <0bc685ce-1983-b900-787f-3d89e75ca48d@163.com>
 <20201106164742.GA6449@rei.lan>
 <f99d3484-f86d-dd8a-e64e-7d9d94533de4@163.com>
In-Reply-To: <f99d3484-f86d-dd8a-e64e-7d9d94533de4@163.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 095F14CE34EF.AF678
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] syscalls/sync01: Remove it
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

Hi Xiao, Cyril
> On 11/7/20 12:47 AM, Cyril Hrubis wrote:
>> Hi!
>>> I have a doubt after reading Xu's patch[1] and Martin's patch[2]:
>>>
>>> 1) Xu removed sync01 because sync() always return 0.
>> Actually sync() is defined as void function, so the tests were bogusly
>> checking the TST_RET value which haven't been set at all.
>
> Hi Cyril,
>
> Oops, I gave a wrong example. :-(
>
> On error, I just wonder if we need to check all return value(i.e.
> negative value except -1).
>
> IOW, Is it possible for syscall to get a error value which is not -1?
IMO, get a error and syscall return -1 that is a normal situation. 
Martin creates a standard model for it and doesn't match this rule is 
wrong, so we can check syscall whether return the right value when 
kernel changes these api in the future.

Best Regards,
Yang Xu
>
> Best Regards,
>
> Xiao Yang
>
>>
>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
