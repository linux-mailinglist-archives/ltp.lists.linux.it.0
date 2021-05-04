Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF363727BB
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 11:03:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E7F2D3C57D7
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 11:03:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1C7C63C57D7
 for <ltp@lists.linux.it>; Tue,  4 May 2021 11:03:23 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7C31B1400FB0
 for <ltp@lists.linux.it>; Tue,  4 May 2021 11:03:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D6F92B149
 for <ltp@lists.linux.it>; Tue,  4 May 2021 09:03:22 +0000 (UTC)
References: <20210430112649.16302-1-rpalethorpe@suse.com>
 <20210430112649.16302-7-rpalethorpe@suse.com> <YI/clrb4houmTsY7@yuki>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <YI/clrb4houmTsY7@yuki>
Date: Tue, 04 May 2021 10:03:22 +0100
Message-ID: <87zgxalvl1.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 6/7] mem: Convert tests to new CGroups API
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
>> diff --git a/testcases/kernel/mem/ksm/ksm02.c b/testcases/kernel/mem/ksm/ksm02.c
>> index 51f5d4cca..e6de61ece 100644
>> --- a/testcases/kernel/mem/ksm/ksm02.c
>> +++ b/testcases/kernel/mem/ksm/ksm02.c
>> @@ -59,6 +59,9 @@
>>  #ifdef HAVE_NUMA_V2
>>  #include <numaif.h>
>>  
>> +static const struct tst_cgroup_group *cg;
>> +static const struct tst_cgroup_group *cg_drain;
>> +
>>  static void verify_ksm(void)
>>  {
>>  	unsigned long nmask[MAXNODES / BITS_PER_LONG] = { 0 };
>> @@ -76,9 +79,10 @@ static void verify_ksm(void)
>>  	}
>>  	create_same_memory(size, num, unit);
>>  
>> -	write_cpusets(PATH_TMP_CG_CST, node);
>> -	tst_cgroup_move_current(PATH_TMP_CG_CST);
>> +	write_cpusets(cg, node);
>> +	SAFE_CGROUP_PRINTF(cg, "cgroup.procs", "%d", getpid());
>>  	create_same_memory(size, num, unit);
>> +	SAFE_CGROUP_PRINTF(cg_drain, "cgroup.procs", "%d", getpid());
>>  }
>>  
>>  static void cleanup(void)
>> @@ -87,7 +91,7 @@ static void cleanup(void)
>>  		FILE_PRINTF(PATH_KSM "merge_across_nodes",
>>  				 "%d", merge_across_nodes);
>>  
>> -	tst_cgroup_umount(PATH_TMP_CG_CST);
>> +	tst_cgroup_cleanup();
>>  }
>>  
>>  static void setup(void)
>> @@ -103,7 +107,8 @@ static void setup(void)
>>  		SAFE_FILE_PRINTF(PATH_KSM "merge_across_nodes", "1");
>>  	}
>>  
>> -	tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_TMP_CG_CST);
>> +	tst_cgroup_require("cpuset", NULL);
>> +	cg = tst_cgroup_get_test_group();
>
> Forgotten cg_drain = tst_cgroup_get_drain_group() ?

+1

>
> Other than that the rest is pretty much straightforward, so with the
> above fixed:
>
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
