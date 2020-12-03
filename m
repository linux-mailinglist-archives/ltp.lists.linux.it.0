Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A962CD90F
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 15:28:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 163793C4C23
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 15:28:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 6BFD33C0194
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 15:28:02 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BF319201003
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 15:28:01 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7F10BAFB1;
 Thu,  3 Dec 2020 14:28:00 +0000 (UTC)
To: rpalethorpe@suse.de, Li Wang <liwang@redhat.com>
References: <20201203110616.28302-1-liwang@redhat.com>
 <20201203110616.28302-3-liwang@redhat.com> <878saf6pe1.fsf@suse.de>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <30b58fc3-ac3d-8bbc-345a-1384dfe52a65@suse.cz>
Date: Thu, 3 Dec 2020 15:27:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <878saf6pe1.fsf@suse.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] af_alg07: add dynamic bias for ARM
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

On 03. 12. 20 13:32, Richard Palethorpe wrote:
> Hello,
> 
> Li Wang <liwang@redhat.com> writes:
> 
>> We observed that af_alg07 sporadically failed on hpe-moonshot(aarch64) with
>> fixed kernel, but after trying manually we can NOT reproduce it again, one
>> possibility is that the FAIL is caused by an unaligned race window between
>> two threads, so here add dynamic bias adjustment to see if it helps.
>>
>> Point of view from Martin Doucha:
>> 1) fchownat() returns 0 => fchownat() was called too early or the kernel is vulnerable
>> 2) fchwonat() fails with ENOENT => kernel is fixed, print TPASS and exit
>> 3) fchownat() fails with EBADF => fchownat() was called too late
> 
> Just FYI, what really prevents fzsync from working is if the temporal
> behaviour (time to execute) of a syscall changes dramatically depending
> on the outcome of a race[1].
> 
> For example if fchownat returns very quickly after EBADF, but takes a
> long time otherwise, then the delay will be too small. I guess most
> syscalls will check the FD very early so this is likely to be the
> problem.
> 
>>
>> Signed-off-by: Li Wang <liwang@redhat.com>
>> CC: Richard Palethorpe <rpalethorpe@suse.com>
>> CC: Martin Doucha <mdoucha@suse.cz>
>> CC: Joerg Vehlow <lkml@jv-coder.de>
>> CC: Chunyu Hu <chuhu@redhat.com>
>> CC: Cyril Hrubis <chrubis@suse.cz>
>> ---
>>  testcases/kernel/crypto/af_alg07.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/testcases/kernel/crypto/af_alg07.c b/testcases/kernel/crypto/af_alg07.c
>> index 539ebee11..ee48c2edb 100644
>> --- a/testcases/kernel/crypto/af_alg07.c
>> +++ b/testcases/kernel/crypto/af_alg07.c
>> @@ -76,6 +76,16 @@ static void run(void)
>>  			return;
>>  		}
>>  
>> +		if (TST_RET == 0) {
>> +			tst_fzsync_pair_add_bias(&fzsync_pair, -1);
>> +			continue;
>> +		}
> 
> It may actually be better to remove this and only increase the delay if
> EBADF?

Agreed. Adjusting delay in both directions would be acceptable if the
test takes too much time or doesn't work at all without it. Otherwise
it's preferable to adjust delay only when syscalls return an error state
that clearly falls outside the race window.

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
