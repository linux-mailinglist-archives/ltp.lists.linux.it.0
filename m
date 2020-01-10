Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E851366C0
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 06:36:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22CFA3C2573
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 06:36:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C40B93C2543
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 06:36:07 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 52E0F1000D2F
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 06:36:05 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,415,1571673600"; d="scan'208";a="81609073"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jan 2020 13:36:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 67D79406AB15;
 Fri, 10 Jan 2020 13:26:55 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 10 Jan 2020 13:35:57 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <1576577571-3668-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1576577571-3668-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200107133913.GE26408@rei.lan>
 <e6cada30-fb4e-a2e0-72e9-cdfc796361cb@cn.fujitsu.com>
 <20200108110343.GA3318@rei.lan>
 <cb1878f7-a00a-f5d1-c55f-6f80ff01cb6b@cn.fujitsu.com>
 <20200109124101.GE31981@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <ca98116f-f6b2-d7bc-537e-76d2ace127a1@cn.fujitsu.com>
Date: Fri, 10 Jan 2020 13:35:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200109124101.GE31981@rei.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 67D79406AB15.AB2B2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 3/4] syscalls/capset03: add new EPERM error
 test without CAP_SETPCAP
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

Hi!
> Hi!
>>> Also the CAP_DROP in the tst_test structure seems to be useless to me.
>>>
>>>
>>> Looking at man 7 capabilities, there are also transitions defined for
>>> what is supposed to happen when we change user id. It would make sense
>>> to write tests that capabilities are correctly dropped when UID changes
>>> from 0 to nonzero. Which is what this test is testing when executed as
>>> non-root, since the transition from 0 to nonzero must have happened
>>> somewhere when user has logged in.
>> In man 7 capabilities " Effect of user ID changes on capabilities",
>> I see transitions between 0 and nonzero user IDs. But it is about
>> capabilities??not about capset syscall. I think we should add these
>> cases(user ID changes on capabilities) into kernel/security (such as
>> cap_bound or filecaps). In capset, we can only test capset various EPERM
>> error as kernel sercurity/commoncap.c  cap_capset function.
>> ---------------------------------
>>        if (cap_inh_is_capped() &&
>>               !cap_issubset(*inheritable,
>>                             cap_combine(old->cap_inheritable,
>>                                         old->cap_permitted)))
>>                   /* incapable of using this inheritable set */
>>                   return -EPERM;
>>
>>           if (!cap_issubset(*inheritable,
>>                             cap_combine(old->cap_inheritable,
>>                                         old->cap_bset)))
>>                   /* no new pI capabilities outside bounding set */
>>                   return -EPERM;
>>
>>           /* verify restrictions on target's new Permitted set */
>>           if (!cap_issubset(*permitted, old->cap_permitted))
>>                   return -EPERM;
>>
>>           /* verify the _new_Effective_ is a subset of the _new_Permitted_ */
>>           if (!cap_issubset(*effective, *permitted))
>>                   return -EPERM;
>> ---------------------------------
> 
> Indeed these does not belog under setcap(). Maybe we could add these
> checks under setuid tests, since we are testing side efect of setuid.
> But having these under security/ would work as well.Maybe put them in setuid is better because I don't know a  good 
directory name for them in security(such as user_change_cap). Anyway, I 
will list them in my todo.
> 
>> Also, if we only run under root, CAP_DROP(CAP_SETPCAP) is needed  to
>> reproduce this EPERM error.
> 
> Isn't the first thing that the test does to remove all capabilities but
> CAP_KILL? Why do we need to drop anything beforehand?
Yes, you are right. I forgot it. I will remove this drop and also used 
guarded buffer  for the other capset cases .
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
