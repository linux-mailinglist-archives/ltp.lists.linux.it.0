Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA04936C608
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 14:25:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 858CE3C65D3
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 14:25:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 80E023C199D
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 14:25:15 +0200 (CEST)
Received: from vipregular1.263.net (vipregular1.263.net [211.150.80.17])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BB3B3140114C
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 14:25:12 +0200 (CEST)
Received: from localhost (unknown [192.168.167.105])
 by vipregular1.263.net (Postfix) with ESMTP id 7F613286;
 Tue, 27 Apr 2021 20:25:10 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [10.4.23.9] (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P13444T140178149033728S1619526310129203_; 
 Tue, 27 Apr 2021 20:25:10 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <274e65dd298fff1893a0ab5b8881832a>
X-RL-SENDER: zhanglianjie@uniontech.com
X-SENDER: zhanglianjie@uniontech.com
X-LOGIN-NAME: zhanglianjie@uniontech.com
X-FST-TO: ltp@lists.linux.it
X-RCPT-COUNT: 2
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: zhanglianjie <zhanglianjie@uniontech.com>
To: Petr Vorel <pvorel@suse.cz>
References: <20210425030440.12762-1-zhanglianjie@uniontech.com>
 <YIcTuE34yq8KISC5@pevik>
Message-ID: <726f49eb-a185-6637-44e3-232d5e9b6fab@uniontech.com>
Date: Tue, 27 Apr 2021 20:25:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YIcTuE34yq8KISC5@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
>> If the fuse file system is ignored and the kernel enable CONFIG_NTFS_FS,
>> then the mount.ntfs of fuse is used when mounting ntfs,
>> which is equivalent to not ignoring the fuse file system.
> 
> ...
>> +++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
>> @@ -123,6 +123,7 @@ static struct tst_test test = {
>>   	.all_filesystems = 1,
>>   	.skip_filesystems = (const char *const []){
>>   		"fuse",
>> +		"ntfs",
> 
> Shouldn't "ntfs" *replace* "fuse"?
Can't replace fuse.

> 
> Testing on SLES kernel 5.3 (heavily patched) which is without CONFIG_NTFS_FS:
> ...
> tst_supported_fs_types.c:51: TINFO: mkfs.vfat does exist
> ...
> Summary:
> passed   21
> failed   0
> broken   0
> skipped  0
> warnings 0
If there is no CONFIG_NTFS_FS, the test of the ntfs file system will be
ignored. Because there is fuse in skip_filesystems, the test can pass.
> 
> Testing Debian kernel 4.9.0-11-amd64 which is with CONFIG_NTFS_FS:
> tst_supported_fs_types.c:148: TINFO: Skipping ntfs as requested by the test
> ...
> Summary:
> passed   15
> failed   0
> broken   0
> skipped  0
> warnings 0
>
CONFIG_NTFS_FS is configured, are you sure there is no ntfs
in skip_filesystems? Why does it output "Skipping ntfs as requested by
the test"?
There should be no mount.ntfs command provided by ntfs-3g in your
system.

Testing Ubuntu kernel 5.8.0-50-generic:

ub-PC$ cat /boot/config-5.8.0-50-generic | grep -E "EXFAT_FS|NTFS_FS"
CONFIG_EXFAT_FS=m
CONFIG_NTFS_FS=m

tst_supported_fs_types.c:89: TINFO: Kernel supports ntfs
tst_supported_fs_types.c:51: TINFO: mkfs.ntfs does exist
...
tst_test.c:1379: TINFO: Testing on ntfs
tst_test.c:888: TINFO: Formatting /dev/loop10 with ntfs opts='' extra 
opts=''
tst_test.c:899: TINFO: Trying FUSE...
tst_test.c:1311: TINFO: Timeout per run is 0h 05m 00s
sync_file_range02.c:73: TFAIL: Sync equals write: Synced 0, expected 
33554432
sync_file_range02.c:73: TFAIL: Sync inside of write: Synced 0, expected 
16777216
sync_file_range02.c:73: TFAIL: Sync overlaps with write: Synced 0, 
expected 8388608
Summary:
passed   15
failed   3
broken   0
skipped  0
warnings 0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
