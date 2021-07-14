Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9559D3C8233
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 11:58:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28C943C7525
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 11:58:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B62CE3C562F
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 11:58:06 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 43562600A79
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 11:58:06 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.68.141])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 07B449F920;
 Wed, 14 Jul 2021 09:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1626256684; bh=j8LKx5sjlOOsfZp7rHjVS7HoVnI7/6BKCOAivsDiAbc=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=ZWXBGJDxz9sgyASnvJYFN0iijCN5K/+aUyVfLRuLS+uHYLwS6sZ5dTwFWqZNM4N38
 /YvPYbG1i/62emPydD2ZYn/LspkYSg5Zn0bEgmZHofnZU7fYScOeNfIVWu52PVfCvt
 h3WEKtes5IYgl8gZVR2AFJsFvBqMGz8kkdVEpClQ=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210714055253.1668374-1-lkml@jv-coder.de>
 <YO6hz+OQLThjUQA1@yuki> <c4012edf-226b-ef55-8872-44d7398282da@jv-coder.de>
 <YO6tv6cboxnLOuL+@yuki>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <2d7b26bf-8b6c-ca22-81e5-76be1bea25ab@jv-coder.de>
Date: Wed, 14 Jul 2021 11:58:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YO6tv6cboxnLOuL+@yuki>
Content-Language: en-US
X-Spam-Status: No, score=-0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] squashfs: Add regression test for sanity check
 bug
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

Hi,

On 7/14/2021 11:26 AM, Cyril Hrubis wrote:
> Hi!
>> Is there any guideline? I used regression suffix, because it
>> specifically is a regression test and there are several regression
>> tests, that use it.
>> I dropped a number prefix, because there are several tests without a
>> number...
>> I don't really care what the name is here. If you don't have a strong
>> opinion on the regression suffix, I will use squashfs_regression01.
> Unfortunatelly apart from syscalls there is no clear rule how to name
> tests and we are figuring out stuff as we go. Hoever most of the
> regression tests do not have regression in name and generally tests are
> named as "syscall/driver/filesystem/cve-nickname/etc" followed by a
> number.
Alright, then squashfs01 it is.
>
>>> We do have tst_umount() in the test library that retries the umount if
>>> it failed because the mount point was bussy. This is because certain
>>> damons scan all newly mounted filesystems and prevent us from umounting
>>> shortly after mount.
>>>
>>> Also we usually keep track if device was mounted in a global flag that
>>> is set after succesful mount and unset after successful umount and the
>>> cleanup does:
>>>
>>> 	if (device_mounted)
>>> 		tst_umount("mnt");
>> Ok, but this could leave the mount, if the test is aborted between
>> mounting and setting of the flag, but that should be a rare case.
> As long as the flag is set/cleared right after the mount/umount it will
> not happen.
>
> Also looking at the code, we have to handle the return value from
> tst_umount() in the run() function since it does not call tst_brk().
I guess SAFE_UMOUNT is the way to go here... It uses tst_umount 
internally and tst_brk in case of error.
>
>>> We do have tst_cmd() that can do all this easily in C including the
>>> redirection, it will look like:
>>>
>>> 	const char *argv[] = {"mksquashfs", "data", "image.raw", "-noI", "-noD", "-noX", "-noF"};
>>>
>>> 	tst_cmd(argv, "/dev/null", "/dev/null", 0);
>>>
>>> And this will redirect stdout and stderr to "/dev/null" and also do all
>>> the error checks and exit the test if mksquashfs has failed.
>> Did not know about that, also it requires a NULL at the end.
> We do have most of the library functions documented at:
>
> https://github.com/linux-test-project/ltp/wiki/C-Test-API
>
> And yes, the argv has to be NULL terminated, sorry for forgetting that
> part.
>
>>>> +	SAFE_MKDIR("mnt", 0777);
>>> This preparatory part should be in the test setup otherwise the test
>>> will fail with '-i 2'.
>> Right, I'll move the whole setup part to setup.
>>>> +	TST_EXP_PASS(tst_system("mount -tsquashfs -oloop image.raw mnt"));
>>> Can we please use the mount() syscall here instead? That should be as
>>> easy as mount("image.raw", "mnt", "squashfs", 0, "-oloop")
>> Nope, -oloop does not work, because this is interpreted by the mount
>> utility, not by the syscall.
>> I guess I'll use the need_device stuff, to get rid of mount utility call
>> then.
> Ah my bad, so the mount command discovers the device in userspace then,
> it makes much more sense to use the library to allocate free device for
> the test.
>
> But I guess that it would probably be better to use the raw
> tst_find_free_loopdev() because the .needs_device flag prepares a
> backing file for the device and attaches it as well.
I modified the test to use the backing file - or actually use the loop 
device as target for mksquashfs.
Otherwise it would add even more complexity (setting up and tearing down 
the loop device)
>
>>>> +
>>>> +	SAFE_UMOUNT("mnt");
>>> Here as well, please use tst_umount();
>> Ok
>>
>>>> +	tst_res(TPASS, "Test passed");
>>> This is redundant, isn't it? Or is the umount part that fails?
>> Since I cannot use TST_EXP_PASS further up, I will keep this and check
>> the return of mount manually like this:
>>
>> static void run(void)
>> {
>>   ?????? tst_res(TINFO, "Test squashfs sanity check regressions");
>>
>>   ?????? if (mount(tst_device->dev, MOUNT_DIR, "squashfs", 0, NULL) != 0) {
>>   ?????? ?????? tst_brk(TFAIL | TERRNO, "Mount failed");
>>   ?????? }
>>   ?????? mounted = 1;
>>
>>   ?????? tst_umount("mnt");
>>   ?????? mounted = 0;
>>
>>   ?????? tst_res(TPASS, "Test passed");
>> }
>>
>> Would that be ok for you or is there another variant of TST_EXP*, that
>> uses tst_brk?
> I guess that we should check the return value from tst_umount() here as
> well, so ti would be better as:
>
> 	if (tst_umount("mnt")) {
> 		tst_brk(TBROK, "Failed to unmount squashfs");
> 	} else {
> 		mounted = 0;
> 		tst_res(TPASS, "Squashfs unmounted");
> 	}
SAFE_UMOUNT here as well. I don't care about the return value. The mount 
is what fails, not the umount.

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
