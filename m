Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA4014859A
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 14:07:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 468CD3C23B2
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 14:07:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id CCDDB3C094C
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 14:06:58 +0100 (CET)
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 727441A03FD5
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 14:06:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=x/VRY
 dQ2sEzzHSZ97SxHs9KFaE+uxXB3ktS6hc6tIRo=; b=geBjgk3ZL+MujyMXjFcWq
 ztOsQkcIw6ljNmUmLNuAL/SW9kh4oS26HX1SdakLsJf1Ngzmek3QdCRda7FQoqGW
 LQdc0/BG+7l0SfFqmG0ehshlaHCrmxQkD7YvA1sG3vOv6wha9WDBpYSKmWzjuSXB
 RuVSeJpjHlOp22FbzOUjfQ=
Received: from [192.168.0.103] (unknown [223.64.160.153])
 by smtp7 (Coremail) with SMTP id C8CowAAHFU3t6ype+vh9IQ--.544S2;
 Fri, 24 Jan 2020 21:06:54 +0800 (CST)
To: Cyril Hrubis <chrubis@suse.cz>
References: <239304412.3515101.1579791334045.JavaMail.zimbra@redhat.com>
 <20200123151836.29484-1-mdoucha@suse.cz>
 <b2a63820-656c-de66-cde2-ce91c62e52b6@163.com>
 <20200124124847.GB31214@rei.lan>
From: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <f3c20a91-7903-6c8d-340f-defb34ebb325@163.com>
Date: Fri, 24 Jan 2020 21:06:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200124124847.GB31214@rei.lan>
X-CM-TRANSID: C8CowAAHFU3t6ype+vh9IQ--.544S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFykGw4xuFWUGw1kKFy7trb_yoWDWwbE9a
 nrAF93Gw4UCFsFyryYy3ZxJrWfKrW3Kr45J347tFnIk348Xa1DWr1DtwsIya13Gr12qF15
 tF1DXFW7A343ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUniYFtUUUUU==
X-Originating-IP: [223.64.160.153]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/xtbBzg60hFQHHrsdDwAAsU
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Fix prctl02
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
>>> The prctl() system call takes 5 integer arguments but only 3 of them were
>>> passed in the test. This means that the system call read random garbage
>>> from stack in place of the two missing arguments and failed even on some
>>> perfectly valid combinations of arguments on some platforms.
>>>
>>> - Change num_invalid to ULONG_MAX
>>> - Fix arguments in test case 9, 13 and 14
>>> - Fix test call of prctl() to have all 5 arguments
>> looks prctl manpages and kernel code, you are right, Thanks for the fix!
>> Feel free to add??
>> Reviewed-by: xuyang_jy_0410@163.com
>> Tested-by: xuyang_jy_0410@163.com
>>
>> Also, do we should use 5 arguments for other prctl test cases?
> 
> It depends on the option argument, the PR_CAP_AMBIENT explicitely states
> that arg4 and arg5 must be set to 0 as well as the
> PR_GET_SPECULATION_CTRL.
> 
> Some of the options explicitely say that some arguments are ignored.
> 
> And some, including PR_SET_NO_NEW_PRIVS does not say anyting.
Thanks for your answer. I see.
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
