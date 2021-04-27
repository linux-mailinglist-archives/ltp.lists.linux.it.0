Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0114636C7D4
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 16:36:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 77C523C65E7
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 16:36:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5F1F73C1DA6
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 16:36:26 +0200 (CEST)
Received: from vipregular1.263.net (vipregular1.263.net [211.150.80.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AC4DB601B17
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 16:36:22 +0200 (CEST)
Received: from localhost (unknown [192.168.167.235])
 by vipregular1.263.net (Postfix) with ESMTP id 830F8720;
 Tue, 27 Apr 2021 22:36:18 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [192.168.31.127] (unknown [114.222.123.68])
 by smtp.263.net (postfix) whith ESMTP id
 P2750T140649307305728S1619534179600507_; 
 Tue, 27 Apr 2021 22:36:19 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <0020dbcea6450bfa5b5c2a0d63e0fc05>
X-RL-SENDER: zhanglianjie@uniontech.com
X-SENDER: zhanglianjie@uniontech.com
X-LOGIN-NAME: zhanglianjie@uniontech.com
X-FST-TO: ltp@lists.linux.it
X-RCPT-COUNT: 2
X-SENDER-IP: 114.222.123.68
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
To: Petr Vorel <pvorel@suse.cz>
References: <20210425030440.12762-1-zhanglianjie@uniontech.com>
 <YIcTuE34yq8KISC5@pevik> <726f49eb-a185-6637-44e3-232d5e9b6fab@uniontech.com>
 <YIgRWZFymSmCKFyS@pevik>
From: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <53b80b9e-42f6-90f7-1199-3592b4e5fcaa@uniontech.com>
Date: Tue, 27 Apr 2021 22:36:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YIgRWZFymSmCKFyS@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Ignore ntfs file system
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

Hi,

> 
>>>> If the fuse file system is ignored and the kernel enable CONFIG_NTFS_FS,
>>>> then the mount.ntfs of fuse is used when mounting ntfs,
>>>> which is equivalent to not ignoring the fuse file system.
> 
>>> ...
>>>> +++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
>>>> @@ -123,6 +123,7 @@ static struct tst_test test = {
>>>>    	.all_filesystems = 1,
>>>>    	.skip_filesystems = (const char *const []){
>>>>    		"fuse",
>>>> +		"ntfs",
> 
>>> Shouldn't "ntfs" *replace* "fuse"?
>> Can't replace fuse.
> Not sure if we understand each other: I mean add "ntfs" and *remove* "fuse",
> as "fuse" is now redundant when we whitelist ntfs (see
> tst_get_supported_fs_types()), unless there is problem with other fuse
> filesystems. I tested with CONFIG_FUSE_FS=m CONFIG_EXFAT_FS=m.
> 
> But maybe removing "fuse" should be a separate step.
> 
I can understand what you mean, but I can't remove the fuse. If the fuse 
is removed and the kernel is not configured with CONFIG_EXFAT_FS=m, it 
will cause the test exfat to fail.

>>> Testing on SLES kernel 5.3 (heavily patched) which is without CONFIG_NTFS_FS:
>>> ...
>>> tst_supported_fs_types.c:51: TINFO: mkfs.vfat does exist
>>> ...
>>> Summary:
>>> passed   21
>>> failed   0
>>> broken   0
>>> skipped  0
>>> warnings 0
>> If there is no CONFIG_NTFS_FS, the test of the ntfs file system will be
>> ignored. Because there is fuse in skip_filesystems, the test can pass.
> 
> See above.
> 
>>> Testing Debian kernel 4.9.0-11-amd64 which is with CONFIG_NTFS_FS:
>>> tst_supported_fs_types.c:148: TINFO: Skipping ntfs as requested by the test
>>> ...
>>> Summary:
>>> passed   15
>>> failed   0
>>> broken   0
>>> skipped  0
>>> warnings 0
> 
>> CONFIG_NTFS_FS is configured, are you sure there is no ntfs
>> in skip_filesystems? Why does it output "Skipping ntfs as requested by
>> the test"?
>> There should be no mount.ntfs command provided by ntfs-3g in your
>> system.
> See above.
> 
> Kind regards,
> Petr
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
