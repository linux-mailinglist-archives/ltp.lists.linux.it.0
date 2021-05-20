Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA55389FEA
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 10:35:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 545093C2FF5
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 10:35:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 265503C0BB1
 for <ltp@lists.linux.it>; Thu, 20 May 2021 10:35:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 91785140122C
 for <ltp@lists.linux.it>; Thu, 20 May 2021 10:35:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C57A3AAFD
 for <ltp@lists.linux.it>; Thu, 20 May 2021 08:35:35 +0000 (UTC)
References: <20210513152125.25766-1-rpalethorpe@suse.com>
 <20210513152125.25766-5-rpalethorpe@suse.com> <YKT27nlItfECLuYw@yuki>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <YKT27nlItfECLuYw@yuki>
Date: Thu, 20 May 2021 09:35:35 +0100
Message-ID: <877djtls4o.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/6] API/cgroups: Add cpu controller
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>>  lib/tst_cgroup.c | 18 +++++++++++++++++-
>>  1 file changed, 17 insertions(+), 1 deletion(-)
>> 
>> diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
>> index 54636fd7e..da177a1ad 100644
>> --- a/lib/tst_cgroup.c
>> +++ b/lib/tst_cgroup.c
>> @@ -82,7 +82,8 @@ struct cgroup_root {
>>  /* Controller sub-systems */
>>  enum cgroup_ctrl_indx {
>>  	CTRL_MEMORY = 1,
>> -	CTRL_CPUSET = 2,
>> +	CTRL_CPU,
>> +	CTRL_CPUSET,
>>  };
>>  #define CTRLS_MAX CTRL_CPUSET
>>  
>> @@ -162,6 +163,18 @@ static const files_t memory_ctrl_files = {
>>  	{ }
>>  };
>>  
>> +static const files_t cpu_ctrl_files = {
>> +	/* The V1 quota and period files were combined in the V2 max
>> +	 * file. The quota is in the first column and if we just print
>> +	 * a single value to the file, it will be treated as the
>> +	 * quota. To get or set the period we need to branch on the
>> +	 * API version.
>> +	 */
>
> I wonder if this is worth a helper function, something as:
>
> #define SAFE_CGROUP_CPU_SET_MAX(cg, quota_us, period_us) \
> 	tst_cgroup_cpu_set_max(__FILE__, __LINENO__, cg, quota_us, period_us)
>
> void tst_cgroup_cpu_set_max(const char *const file, const int lineno,
>                             const struct tst_cgroup_group *const cg,
>                             unsigned int quota_us, unsigned int period_us);
>
> #define SAFE_CGROUP_CPU_GET_MAX(cg, quota_us, period_us) \
> 	tst_cgroup_cpu_get_max(__FILE__, __LINENO__, cg, quota_us, period_us)
>
> void tst_cgroup_cpu_get_max(const char *const file, const int lineno,
>                             const struct tst_cgroup_group *const cg,
>                             unsigned int *quota_us, unsigned int *period_us);
>
> I guess that if we are going to add more tests we would end up with such
> functions somewhere anyways.

Yes, when we have more tests. Because there is an alternative that we
add a mapping/filter layer to transform V2 writes into V1 writes. e.g.

SAFE_CGROUP_PRINTF(cg, "cpu.max", "%d %d", "50 100");

When done on V1 it will write to a buffer with sprintf and then split
that into two writes to the V1 files.

This is much more complicated for this case, but there are hundreds of
these knobs. In some cases we just need to convert a string to an
integer e.g. "max" => "-1" or whatever memory.max takes.

In most cases it will just be a case of sprintf into a buffer and then
do something with that.

I can think of problems with both approaches. :-)

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
