Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2AA593A90
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Aug 2022 22:09:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 710973C966D
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Aug 2022 22:09:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 159263C879E
 for <ltp@lists.linux.it>; Mon, 15 Aug 2022 22:09:44 +0200 (CEST)
Received: from sandeen.net (sandeen.net [63.231.237.45])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 23869100054E
 for <ltp@lists.linux.it>; Mon, 15 Aug 2022 22:09:43 +0200 (CEST)
Received: from [10.0.0.146] (liberator.sandeen.net [10.0.0.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by sandeen.net (Postfix) with ESMTPSA id 0E76379F0;
 Mon, 15 Aug 2022 15:08:24 -0500 (CDT)
Message-ID: <8d33a7a0-7a7c-47a1-ed84-83fd25089897@sandeen.net>
Date: Mon, 15 Aug 2022 15:09:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Content-Language: en-US
To: Petr Vorel <pvorel@suse.cz>, Dave Chinner <david@fromorbit.com>
References: <YvZc+jvRdTLn8rus@pevik> <YvZUfq+3HYwXEncw@pevik>
 <YvZTpQFinpkB06p9@pevik> <20220814224440.GR3600936@dread.disaster.area>
 <YvoSeTmLoQVxq7p9@pevik>
From: Eric Sandeen <sandeen@sandeen.net>
In-Reply-To: <YvoSeTmLoQVxq7p9@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP test df01.sh detected different size of loop device
 in v5.19
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-xfs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-block@vger.kernel.org,
 Hannes Reinecke <hare@suse.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 8/15/22 4:31 AM, Petr Vorel wrote:
> Hi Dave,
> 
>> On Fri, Aug 12, 2022 at 03:20:37PM +0200, Petr Vorel wrote:
>>> Hi all,
> 
>>> LTP test df01.sh found different size of loop device in v5.19.
>>> Test uses loop device formatted on various file systems, only XFS fails.
>>> It randomly fails during verifying that loop size usage changes:
> 
>>> grep ${TST_DEVICE} output | grep -q "${total}.*${used}" [1]
> 
>>> How to reproduce:
>>> # PATH="/opt/ltp/testcases/bin:$PATH" df01.sh -f xfs # it needs several tries to hit
> 
>>> df saved output:
>>> Filesystem     1024-blocks    Used Available Capacity Mounted on
>>> ...
>>> /dev/loop0          256672   16208    240464       7% /tmp/LTP_df01.1kRwoUCCR7/mntpoint
>>> df output:
>>> Filesystem     1024-blocks    Used Available Capacity Mounted on
>>> ...
>>> tmpfs               201780       0    201780       0% /run/user/0
>>> /dev/loop0          256672   15160    241512       6% /tmp/LTP_df01.1kRwoUCCR7/mntpoint
>>> => different size
>>> df01 4 TFAIL: 'df -k -P' failed, not expected.
> 
>> Yup, most likely because we changed something in XFS related to
>> internal block reservation spaces. That is, the test is making
>> fundamentally flawed assumptions about filesystem used space
>> accounting.
> 
>> It is wrong to assuming that the available capacity of a given empty
>> filesystem will never change.  Assumptions like this have been
>> invalid for decades because the available space can change based on
>> the underlying configuration or the filesystem. e.g. different
>> versions of mkfs.xfs set different default parameters and so simply
>> changing the version of xfsprogs you use between the two comparision
>> tests will make it fail....
> 
>> And, well, XFS also has XFS_IOC_{GS}ET_RESBLKS ioctls that allow
>> userspace to change the amount of reserved blocks. They were
>> introduced in 1997, and since then we've changed the default
>> reservation the filesystem takes at least a dozen times.
> 
> Thanks a lot for valuable info.
> 
>>>> It might be a false positive / bug in the test, but it's at least a changed behavior.
> 
>> Yup, any test that assumes "available space" does not change from
>> kernel version to kernel version is flawed. There is no guarantee
>> that this ever stays the same, nor that it needs to stay the same.
> I'm sorry I was not clear. Test [1] does not measure "available space" between
> kernel releases. It just run df command with parameters, saves it's output
> and compares "1024-blocks" and "Used" columns of df output with stat output:

Annotating what these do...

> 		local total=$(stat -f mntpoint --printf=%b)  # number of blocks allocated
> 		local free=$(stat -f mntpoint --printf=%f)   # free blocks in filesystem
> 		local used=$((total-free))                   # (number of blocks free)
> 
> 		local bsize=$(stat -f mntpoint --printf=%s)  # block size ("for faster transfers")
> 		total=$((($total * $bsize + 512)/ 1024))     # number of 1k blocks allocated?
> 		used=$((($used * $bsize + 512) / 1024))      # number of 1k blocks used?
> 
> And comparison with "$used" is what sometimes fails.
> 
> BTW this happens on both distros when loop device is on tmpfs. I'm trying to
> trigger it on ext4 and btrfs, not successful so far. Looks like it's tmpfs
> related.
> 
> If that's really expected, we might remove this check for used for XFS
> (not sure if check only for total makes sense).

It's kind of hard to follow this test, but it seems to be trying to
ensure that df output is consistent with du (statfs) numbers, before
and after creating and removing a 1MB file.  I guess it's literally
testing df itself, i.e. that it actually presents the numbers it obtained
from statfs.

AFAICT the difference in the failure is 1024 1K blocks, which is the size
the file that's been created and removed during the test.

My best guess is that this is xfs inode deferred inode inactivation hanging
onto the space a little longer than the test expects.

This is probably because the new-ish xfs inode inactivation no longer blocks
on inode garbage collection during statfs().

IOWS, I think the test expects that free space is reflected in statfs numbers
immediately after a file is removed, and that's no longer the case here. They
change in between the df check and the statfs check.

(The test isn't just checking that the values are correct, it is checking that
the values are /immediately/ correct.)

Putting a "sleep 1" after the "rm -f" in the test seems to fix it; IIRC
the max time to wait for inodegc is 1s. This does slow the test down a bit.

-Eric

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
