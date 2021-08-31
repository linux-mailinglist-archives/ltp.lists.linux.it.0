Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 060E63FC4B6
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:26:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A0A943C2AAC
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:26:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 028463C2435
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:26:10 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 740B91A00CA7
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:26:10 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 11E429F66D;
 Tue, 31 Aug 2021 09:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1630401969; bh=lGy+YDDFcF7eHR4C67ZpOk/+REfxqOA02tMrH69ov1c=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=UhDlZJS/Zf7amH95cdOEn4qtsHT77CGkberKN/+UgGoLfny4iKu34ZFtQ3cp+JMcH
 XoafvgC4fbu6rQekcNLb4KDL/t46QCxcqoznXqA8j7g5HJi5BEUsSmtOFLHnut6Tu3
 V+3pkTzdfc6H/R2Kxpbn1T9vsTNlD+lakbwI9DPQ=
To: rpalethorpe@suse.de
References: <20210831090002.1431298-1-lkml@jv-coder.de>
 <87eeaakm4y.fsf@suse.de>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <2278cad7-66ab-d014-ca2b-ab3081f1284d@jv-coder.de>
Date: Tue, 31 Aug 2021 11:26:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87eeaakm4y.fsf@suse.de>
Content-Language: en-US
X-Spam-Status: No, score=-0.8 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] cfs_bandwidth01: Fix cleanup on failure in
 set_cpu_quota
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richard,

On 8/31/2021 11:18 AM, Richard Palethorpe wrote:
> Hello Joerg,
>
> Joerg Vehlow <lkml@jv-coder.de> writes:
>
>> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
>>
>> If set_cpu_quota failed, mk_cpu_cgroup did not return
>> and cg_workers[n] was not set. This lead to a failure during
>> cleanup, because the worker cgroups were not deleted.
>>
>> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
>> ---
>>   .../sched/cfs-scheduler/cfs_bandwidth01.c       | 17 +++++++----------
>>   1 file changed, 7 insertions(+), 10 deletions(-)
>>
>> diff --git a/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c b/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
>> index 9301ee458..e8032d65a 100644
>> --- a/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
>> +++ b/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
>> @@ -57,17 +57,14 @@ static void set_cpu_quota(const struct tst_cgroup_group *const cg,
>>   		tst_cgroup_group_name(cg), quota_us, period_us);
>>   }
>>   
>> -static struct tst_cgroup_group *
>> -mk_cpu_cgroup(const struct tst_cgroup_group *const cg_parent,
>> +static void mk_cpu_cgroup(struct tst_cgroup_group **cg,
>> +          const struct tst_cgroup_group *const cg_parent,
> Seems like there are spaces instead of a tab at the start.
Right, I wanted to keep the same format you had, but did not realize it 
was one tab and 5 spaces instead of 9 spaces.
I guess this can be fixed during merging.

>
> Otherwise LGTM, thanks.
>
> Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>
Thanks

Joerg


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
