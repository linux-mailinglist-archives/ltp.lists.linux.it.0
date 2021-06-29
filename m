Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD5B3B779A
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 20:06:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A481F3C9398
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 20:06:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BE1093C19D7
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 20:06:33 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DB49B1A0061A
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 20:06:32 +0200 (CEST)
Received: from mail-ej1-f72.google.com ([209.85.218.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lyI7z-0005oJ-W6
 for ltp@lists.linux.it; Tue, 29 Jun 2021 18:06:32 +0000
Received: by mail-ej1-f72.google.com with SMTP id
 u4-20020a1709061244b02904648b302151so6048641eja.17
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 11:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1sVQNHAiS/W2i5o2hr99eStOUpYVcSh7ZDin7Mpc0cU=;
 b=E1fiO+Etmg7pU+BMc6FSwBzMCjZMPYrxDH3u4ph+/VpvVMIvZFnehFJIWmxgkBoAlN
 N8rDn0nTsV1U4w4rqEZhIkj+fA7p9QeAgarfGtQGI3OTOMh9AF4Q+ewr49oIUHw31mvS
 G22c8B0kI90q3yMmTIOi3RlEI5djfOueh4PLf0yAmabHsmwNXilh1+sRxBwAC0cz2XDO
 0iOWsWfM81lU6uEwtizFFRcoxAH8cdyjUwOHp99rLwnxyvwyUMHnCw7NlI3EU+lrvZfJ
 CBUuQ/MGdTgJp/HBZLjzHr1Dw05zP2Ay3W2Zdt3eoVdOw6MavmmHFwfU7IokrEbpPsGU
 MMJQ==
X-Gm-Message-State: AOAM533SX+I+YmSGGG5yUP4AM6kxYbcgVw1QQrOjcolFXXl4fV1G4OoA
 VIUwU5ImP7Eqebl5xyodKtfoOP4Umlxt3ZyfEC/YFxcF+0AS1QD+EPzOdHvKu9yz6wi0Ak7cu3U
 9HrHho/uq3n0Gvx/G0rMO3DamuMel
X-Received: by 2002:a50:935a:: with SMTP id n26mr42276816eda.8.1624989991235; 
 Tue, 29 Jun 2021 11:06:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTuOakoVILBoO7OTyCnoSp6AApNCYVL4pAvYGfXG5VRBZx+0rJbjTvqZHj1Uvtttw8JTlYRw==
X-Received: by 2002:a50:935a:: with SMTP id n26mr42276796eda.8.1624989991101; 
 Tue, 29 Jun 2021 11:06:31 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id e13sm6969604ejl.98.2021.06.29.11.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 11:06:30 -0700 (PDT)
To: Josef Bacik <josef@toxicpanda.com>, Chris Mason <clm@fb.com>,
 David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "kernel-team@lists.ubuntu.com" <kernel-team@lists.ubuntu.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>, Qu Wenruo <wqu@suse.com>,
 Filipe Manana <fdmanana@suse.com>
References: <a3b42abc-6996-ab06-ea9f-238e7c6f08d7@canonical.com>
 <124d7ead-6600-f369-7af1-a1bc27df135c@toxicpanda.com>
 <667133e5-44cb-8d95-c40a-12ac82f186f0@canonical.com>
 <0b6a502a-8db8-ef27-f48e-5001f351ef24@toxicpanda.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <2576a472-1c99-889a-685c-a12bbfb08052@canonical.com>
Date: Tue, 29 Jun 2021 20:06:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0b6a502a-8db8-ef27-f48e-5001f351ef24@toxicpanda.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [BUG] btrfs potential failure on 32 core LTP test
 (fallocate05)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 29/06/2021 19:28, Josef Bacik wrote:
> On 6/29/21 1:26 PM, Krzysztof Kozlowski wrote:
>> On 29/06/2021 19:24, Josef Bacik wrote:
>>> On 6/29/21 1:00 PM, Krzysztof Kozlowski wrote:
>>>> Dear BTRFS folks,
>>>>
>>>> I am hitting a potential regression of btrfs, visible only with
>>>> fallocate05 test from LTP (Linux Test Project) only on 32+ core Azure
>>>> instances (x86_64).
>>>>
>>>> Tested:
>>>> v5.8 (Ubuntu with our stable patches): PASS
>>>> v5.11 (Ubuntu with our stable patches): FAIL
>>>> v5.13 mainline: FAIL
>>>>
>>>> PASS means test passes on all instances
>>>> FAIL means test passes on other instance types (e.g. 4 or 16 core) but
>>>> fails on 32 and 64 core instances (did not test higher),
>>>> e.g.: Standard_F32s_v2, Standard_F64s_v2, Standard_D32s_v3,
>>>> Standard_E32s_v3
>>>>
>>>> Reproduction steps:
>>>> git clone https://github.com/linux-test-project/ltp.git
>>>> cd ltp
>>>> ./build.sh && make install -j8
>>>> cd ../ltp-install
>>>> sudo ./runltp -f syscalls -s fallocate05
>>>>
>>>> Failure output:
>>>> tst_test.c:1379: TINFO: Testing on btrfs
>>>> tst_test.c:888: TINFO: Formatting /dev/loop4 with btrfs opts='' extra opts=''
>>>> tst_test.c:1311: TINFO: Timeout per run is 0h 05m 00s
>>>> tst_fill_fs.c:32: TINFO: Creating file mntpoint/file0 size 21710183
>>>> tst_fill_fs.c:32: TINFO: Creating file mntpoint/file1 size 8070086
>>>> tst_fill_fs.c:32: TINFO: Creating file mntpoint/file2 size 3971177
>>>> tst_fill_fs.c:32: TINFO: Creating file mntpoint/file3 size 36915315
>>>> tst_fill_fs.c:32: TINFO: Creating file mntpoint/file4 size 70310993
>>>> tst_fill_fs.c:32: TINFO: Creating file mntpoint/file5 size 4807935
>>>> tst_fill_fs.c:32: TINFO: Creating file mntpoint/file6 size 90739786
>>>> tst_fill_fs.c:32: TINFO: Creating file mntpoint/file7 size 76896492
>>>> tst_fill_fs.c:32: TINFO: Creating file mntpoint/file8 size 72228649
>>>> tst_fill_fs.c:32: TINFO: Creating file mntpoint/file9 size 36207821
>>>> tst_fill_fs.c:32: TINFO: Creating file mntpoint/file10 size 81483962
>>>> tst_fill_fs.c:59: TINFO: write(): ENOSPC (28)
>>>> fallocate05.c:81: TPASS: write() wrote 65536 bytes
>>>> fallocate05.c:102: TINFO: fallocate()d 0 extra blocks on full FS
>>>> fallocate05.c:114: TPASS: fallocate() on full FS
>>>> fallocate05.c:130: TPASS: fallocate(FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE)
>>>> fallocate05.c:134: TFAIL: write(): ENOSPC (28)
>>>>
>>>> Test code:
>>>> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/fallocate/fallocate05.c#L134
>>>>
>>>> See also: https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/1933112
>>>>
>>>> Other FS tests succeed on that machines/kernels. Other file systems
>>>> also pass - only btrfs fails. The issue was not bisected. Full test
>>>> log attached.
>>>>
>>>
>>> Also it looks like you're using a loop device, the instructions you gave me
>>> aren't complete enough for me to reproduce.  What is the actual setup you are
>>> using?  How big is your loop device?  Is it a backing device?  I had to do -b
>>> <device> to get the test to even start to run, but I've got a 2tib ssd, am I
>>> supposed to be using something else?  Thanks,
>>
>> The test takes care about loop device, nothing is needed from your side.
>> Just run the test and wait till you see:
>> "tst_test.c:1379: TINFO: Testing on btrfs"
>>
>> That's where the interesting part starts :)
>>
> 
> *cough*
> # CONFIG_BLK_DEV_LOOP is not set
> *cough*
> 
> I think I found the problem, my bad,
> 

Minor update - it's not only Azure's. AWS m5.8xlarge and m5.16xlarge (32
and 64 cores) fail similarly. I'll try later also QEMU machines with
different amount of CPUs.

Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
