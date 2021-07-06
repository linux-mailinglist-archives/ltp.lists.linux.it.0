Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 438333BC8DB
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 11:57:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 154433C68B9
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 11:57:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D1D3F3C0F90
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 11:57:15 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 03CE860027F
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 11:57:14 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 4273B9F7F3;
 Tue,  6 Jul 2021 09:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1625565433; bh=heUuGOk3t3LIb9/POpjDrI6LPCae9RmsLM4g2pcJhwc=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=Y6OiBX/Y0apH0lw1l7XFY71/6rd5f7CxYL133mHxmwtdj1lomndT4843dyaKuckHe
 T5sMJGwskxesy8/CcwDl1lv63XVmI+efbNGYH2XIZjVfNOVOLEls+l+rOft484+vYg
 yjk3TPKFEe/JDjxWVgxi27bFL9+f5jxpCuKtY8aw=
To: rpalethorpe@suse.de
References: <20210705135014.679200-1-lkml@jv-coder.de>
 <20210705135014.679200-2-lkml@jv-coder.de> <87zguz7par.fsf@suse.de>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <54b89a5f-17fd-cc48-b0f7-a247abadd0fb@jv-coder.de>
Date: Tue, 6 Jul 2021 11:57:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87zguz7par.fsf@suse.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] fs_bind: Convert to ltp tests
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

On 7/6/2021 11:41 AM, Richard Palethorpe wrote:
> Hello Joerg,
>
> Joerg Vehlow <lkml@jv-coder.de> writes:
>
>> diff --git a/testcases/kernel/fs/fs_bind/cloneNS/fs_bind_cloneNS02.sh b/testcases/kernel/fs/fs_bind/cloneNS/fs_bind_cloneNS02.sh
>> new file mode 100755
>> index 000000000..9e0f5fe05
>> --- /dev/null
>> +++ b/testcases/kernel/fs/fs_bind/cloneNS/fs_bind_cloneNS02.sh
>> @@ -0,0 +1,53 @@
>> +#!/bin/sh
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +# Copyright (c) International Business Machines  Corp., 2005
>> +# Copyright (c) 2021 Joerg Vehlow <joerg.vehlow@aox-tech.de>
>> +# Author: Avantika Mathur (mathurav@us.ibm.com)
>> +
>> +FS_BIND_TESTFUNC=test
>> +
>> +. fs_bind_lib.sh
>> +
>> +test()
>> +{
>> +    tst_res TINFO "cloneNS: namespaces with parent-slave"
>> +
>> +	fs_bind_makedir rshared dir1
>> +	EXPECT_PASS mount --bind "$FS_BIND_DISK1" dir1
>> +
>> +	mkdir dir2
>> +	EXPECT_PASS mount --bind dir1 dir2
> There seems to be a section of tabs instead of spaces here. Also in
> other places.
Hmm strange. But I'd say rather spaces instead of tabs in some places. 
As far as I see ltp mostly uses tabs and not spaces.
I guess mixed tab/spaces is an artifact from the way I worked on the 
tests. fs_bind was mixed spaces/tabs to begin with and I did not check.
I will fix this for a v2.
> I wonder how you converted these?
It was a mixed approach:
1. Try to understand the building blocks and reimplement them as a shell 
code library instead of several binaries.
I also realized, that nothing implemented in test_fs_bind.sh was really 
required (except for creating the "sandbox").
I replaced the mount and /proc/mount checks with just a /proc/mount 
check, because I don't see a reason to do
two checks, that should be based on the same data (mount and /proc/mount).
2. Convert some tests manually and adapt library.
I did multiple rewrites of some functions and especially of the 
unmounting code.
At first I was trying to collect all mounts in the library, to know what 
has to be unmounted,
but due to the nature of bind and move mounts, this is not really 
possible without extensive logic.
3. Convert lots of tests automatically using a python script. The 
structure of most tests was them same
(there are hints that the test boilerplate was automatically generated 
from some other source.)
This only required minor manual changes
4. Understand convert and fix the cloneNS tests. This was one of the 
bigger challenges, because
these tests were not executed since they were committed 13 years ago and 
had some bugs.
I am not even sure if the boilerplate for these tests was correct, but 
it was good enough, to understand
what it was supposed to do.

>
> Looks promising.
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
