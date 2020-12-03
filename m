Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8529D2CD93E
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 15:34:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D3903C4C32
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 15:34:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 64E973C2B70
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 15:34:19 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 16A121000F2B
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 15:34:18 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 56D3BAC65
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 14:34:18 +0000 (UTC)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20201113131428.13199-1-chrubis@suse.cz>
 <20201113131428.13199-2-chrubis@suse.cz>
 <0c6f7b59-c1ec-5ff9-d261-7b4772ed9b1a@suse.cz>
 <20201203123041.GB5809@yuki.lan>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <400e683b-97a6-bab6-702c-365937c406e8@suse.cz>
Date: Thu, 3 Dec 2020 15:34:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201203123041.GB5809@yuki.lan>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 01/10] lib: Introduce more TEST_* macros
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

On 03. 12. 20 13:30, Cyril Hrubis wrote:
> Hi!
>> I'd recommend adding TEST_*_IMPL() variant with extra arguments that'll
>> allow special handling of ENOSYS, ENOTSUP and possibly also a
>> zero-terminated array of allowed errnos. TEST_FD() etc. would then call
>> the respective IMPL macro with default arguments:
>>
>> #define TEST_FD_IMPL(SCALL, NOSYS_RES, NOTSUP_RES, ERRNO_LIST, ...) \
>>     ...
>>
>> #define TEST_FD(SCALL, ...) \
>>     TEST_FD_IMPL((SCALL), TFAIL, TFAIL, NULL, ##__VA_ARGS__)
> 
> I do plan adding something like this later on once I run out of the
> simple cases to convert, then I would like to review what is left there
> and how to make best interface for the rest of the testcases.
> 
> So for now I would like to proceed with the patchset as it is in order
> not to make it overly complicated.

Great, looking forward to the follow-up patchset. I haven't reviewed
everything so I won't add any signoff but consider my comments resolved.
Feel free to push the patchset when you have enough reviews from others.

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
