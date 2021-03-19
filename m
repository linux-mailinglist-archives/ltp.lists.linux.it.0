Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7C23418BD
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:49:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D19FB3C601F
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:49:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 0F8FE3C2C33
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:49:23 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9C380200067
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:49:23 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EA65DAE05
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 09:49:22 +0000 (UTC)
To: Petr Vorel <pvorel@suse.cz>
References: <20210318162409.9871-1-mdoucha@suse.cz> <YFOcOJP4innlbIk4@pevik>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <78ca788f-f24e-61f5-b0c6-a0742b6af176@suse.cz>
Date: Fri, 19 Mar 2021 10:49:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFOcOJP4innlbIk4@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/semctl09: Skip libc test if SEM_STAT_ANY
 not defined
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 18. 03. 21 19:30, Petr Vorel wrote:
> Hi Martin,
> 
>> The libc test variant should run only if system headers define SEM_STAT_ANY.
>> Skip it if we're falling back to the LAPI definition.
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> Thanks!
> 
> ...
>> +#if !HAVE_DECL_SEM_STAT_ANY
> nit: I'd prefer
> #ifndef HAVE_DECL_SEM_STAT_ANY

That will not work. AC_CHECK_DECLS() will always define
HAVE_DECL_SEM_STAT_ANY, either with the value of 0 (macro not defined)
or 1 (defined).

>> +	if (tst_variant == 1)
>> +		tst_brk(TCONF, "libc does not support semctl(SEM_STAT_ANY)");
>> +#endif
> Although I understand why you want to quit only tests with root
> (only these fail), it's a bit confusing to test with user nobody
> and then quit the same testing with root.

tst_variant has nothing to do with UID.
tst_variant == 0 => run the test using tst_syscall(__NR_semctl)
tst_variant == 1 => run the test again using libc semctl()

But if you want to make the test output a little more clear, I could
move the test_info() call at the end of setup() a few lines up before
the new #if.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
