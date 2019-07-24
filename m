Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1554E72994
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 10:12:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4E033C1CFB
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 10:12:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 9E6443C18FA
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 10:12:01 +0200 (CEST)
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4E6AE1A01236
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 10:11:57 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6O8Bq9C014129
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Wed, 24 Jul 2019 01:11:54 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Wed, 24 Jul 2019 01:11:51 -0700
To: Cyril Hrubis <chrubis@suse.cz>
References: <1540348607-217391-1-git-send-email-hongzhi.song@windriver.com>
 <20181127135149.GA26575@rei.lan>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <1762f702-64bb-fd8e-f748-5ede629f5d3b@windriver.com>
Date: Wed, 24 Jul 2019 16:11:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20181127135149.GA26575@rei.lan>
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open_posix_testsuite/mmap24-2: Support mips
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


On 11/27/18 9:51 PM, Cyril Hrubis wrote:
> Hi!
> First of all sorry for the late reply.
>
>> Mips will return EINVAL instead of ENOMEM as expected
>> if MAP_FIXED is set and the range of [addr + len) exceeds
>> TASK_SIZE.
>>
>> Linux kernel code: arch/mips/mm/mmap.c
>> if (flags & MAP_FIXED) {
>>      /* Even MAP_FIXED mappings must reside within TASK_SIZE */
>>      if (TASK_SIZE - len < addr)
>>          return -EINVAL;
>>
>> The POSIX specification says:
>> "If MAP_FIXED is set, mmap() may return MAP_FAILED and set errno to
>> [EINVAL]."
>> [http://pubs.opengroup.org/onlinepubs/9699919799/functions/mmap.html]
>>
>> So I think the mips kernel remains POSIX compliant.
> There is a subtle difference between the ENOMEM and EINVAL error for
> MAP_FIXED though.
>
> If you look at POSIX specification terminology it says that 'shall'
> defines mandatory features while 'may' describes optional features.
>
> Which means that the MAP_FIXED returning ENOMEM for addresses above
> TASK_SIZE is mandatory since it's defined in the shall fail list. And
> that EINVAL is recomended to be used for other unsuitable address that
> fit into the process address space but are not suitable for a different
> reasons which could be mostly translated to hardware limits.
>
> To sum it up, as far as I can tell mips is not POSIX confirmant here and
> even if this is a very minor issue we shouldn't change the test here.
>

Sorry for my recent ping-emails, because I missed your reply.

I follow your final above conclusion.


--Hongzhi



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
