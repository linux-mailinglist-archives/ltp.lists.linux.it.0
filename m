Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E67083229CC
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 13:00:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E5833C60D8
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 13:00:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B89633C58D5
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 13:00:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 958A36008E5
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 13:00:13 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D74A6AE57
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 12:00:12 +0000 (UTC)
To: Petr Vorel <pvorel@suse.cz>
References: <20210222172043.24294-1-mdoucha@suse.cz> <YDTrAVVmOXB98Xjt@pevik>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <d95f8ec9-9d0b-4178-c735-80cdbd313932@suse.cz>
Date: Tue, 23 Feb 2021 13:00:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDTrAVVmOXB98Xjt@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add test for possible writev() issues with
 NULL buffer in iovec
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

On 23. 02. 21 12:46, Petr Vorel wrote:
> It takes some time to run due .all_filesystems, but I guess there is a reason to
> test it on all available fs.

Yes, test results depend on FS-specific backend implementation bugs.
ext2, ext3 and vfat fail; ext4, xfs and btrfs pass on unpatched kernels.

> ...
>> diff --git a/testcases/kernel/syscalls/writev/writev03.c b/testcases/kernel/syscalls/writev/writev03.c
>> new file mode 100644
>> index 000000000..58d6931d2
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/writev/writev03.c
>> @@ -0,0 +1,145 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (C) 2021 SUSE LLC <mdoucha@suse.cz>
>> + *
>> + * Check for potential issues in writev() if the first iovec entry is NULL
>> + * and the next one is not present in RAM. This can result in a brief window
>> + * where writev() first writes uninitialized data into the file (possibly
>> + * exposing internal kernel structures) and then overwrites it with the real
>> + * iovec contents later. Bugs fixed in:
> Maybe this doc part should be in * [DESCRIPTION] to get into docparse.

Yes, please add it before pushing the patch.

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
