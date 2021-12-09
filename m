Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0DF46EA32
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Dec 2021 15:42:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5EAD63C7F59
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Dec 2021 15:42:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 204743C075B
 for <ltp@lists.linux.it>; Thu,  9 Dec 2021 15:11:17 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 1A0F814004FF
 for <ltp@lists.linux.it>; Thu,  9 Dec 2021 15:11:15 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 480FC1FB;
 Thu,  9 Dec 2021 06:11:14 -0800 (PST)
Received: from [10.57.33.188] (unknown [10.57.33.188])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 250F93F73B;
 Thu,  9 Dec 2021 06:11:13 -0800 (PST)
To: Petr Vorel <pvorel@suse.cz>, linux-perf-users@vger.kernel.org
References: <YbH0hQbQw3KNSLOQ@pevik>
From: James Clark <james.clark@arm.com>
Message-ID: <9030714a-35b4-a10b-d8a6-ae56843b841f@arm.com>
Date: Thu, 9 Dec 2021 14:11:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YbH0hQbQw3KNSLOQ@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.8 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 09 Dec 2021 15:42:15 +0100
Subject: Re: [LTP] LTP test perf_event_open02.c: possible rounding issue on
 aarch64 KVM
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
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org, ltp@lists.linux.it,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



On 09/12/2021 12:20, Petr Vorel wrote:
> Hi,
> 
> I have problem with LTP test perf_event_open02.c [1] on QEMU using KVM on
> openSUSE aarch64 kernel 5.15.5-1-default (not much different from stable kernel
> from kernel.org):
> 
> # /opt/ltp/testcases/bin/perf_event_open02
> ...
> perf_event_open02.c:104: TINFO: bench_work estimated loops = 8083 in 500 ms
> perf_event_open02.c:149: TINFO: [0] value:2425293761 time_enabled:749092800 time_running:749092800
> perf_event_open02.c:149: TINFO: [1] value:2425287027 time_enabled:749141475 time_running:749141475
> perf_event_open02.c:149: TINFO: [2] value:2433046583 time_enabled:757346300 time_running:757346300
> perf_event_open02.c:149: TINFO: [3] value:2432771537 time_enabled:753369300 time_running:753369300
> perf_event_open02.c:149: TINFO: [4] value:2432551620 time_enabled:753784075 time_running:753784075
> perf_event_open02.c:149: TINFO: [5] value:2432386104 time_enabled:753481750 time_running:753481750
> perf_event_open02.c:149: TINFO: [6] value:2095086137 time_enabled:768866050 time_running:660021525
> perf_event_open02.c:308: TINFO: nhw: 6, overall task clock: 4098138525
> perf_event_open02.c:309: TINFO: hw sum: 116450294745, task clock sum: 24589636350
> perf_event_open02.c:321: TINFO: ratio: 6.000196
> perf_event_open02.c:323: TFAIL: test failed (ratio was greater than 6)
> ...
> 
> The test tries to assert the precision of hardware counters (using struct
> perf_event_attr hw_event.type = PERF_TYPE_HARDWARE), but sometimes it fails with
> slight overrun. We suppose that this is a rounding error, but it'd be nice to
> get this confirmed from kernel developers.
> 

I don't believe this is a rounding error because the test uses long longs for the totals and then
has a single division into a double. A difference of 0.000196 is too big to be explained by
rounding from a single division.

There is at least one other fix (f4bf9ba01802) in the commit history that involves
very close but failing values, and the fix wasn't to change the tolerance. So I'd say there is
probably a bug in the test, or you've found a real bug.

> Related kernel setup (or you need to know something else)
> grep PERF_EVENTS config-5.15.5-1-default # aarch64
> CONFIG_HAVE_PERF_EVENTS=y
> CONFIG_PERF_EVENTS=y
> CONFIG_HW_PERF_EVENTS=y
> 
> Test is running inside testing framework with this setup:
> qemu-system-aarch64 -device virtio-gpu-pci -only-migratable -chardev ringbuf,id=serial0,logfile=serial0,logappend=on -serial chardev:serial0 -audiodev none,id=snd0 -device intel-hda -device hda-output,audiodev=snd0 -m 2048 -machine virt,gic-version=host -cpu host -mem-prealloc -mem-path /dev/hugepages/ -netdev user,id=qanet0 -device virtio-net,netdev=qanet0,mac=52:54:00:12:34:56 -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0 -boot menu=on,splash-time=5000 -device nec-usb-xhci -device usb-tablet -device usb-kbd -smp 2 -enable-kvm -no-shutdown -vnc :97,share=force-shared -device virtio-serial -chardev pipe,id=virtio_console,path=virtio_console,logfile=virtio_console.log,logappend=on -device virtconsole,chardev=virtio_console,name=org.openqa.console.virtio_console -chardev pipe,id=virtio_console1,path=virtio_console1,logfile=virtio_console1.log,logappend=on -device virtconsole,chardev=virtio_console1,name=org.openqa.console.virtio_console1 -chardev so
 cket,path=qmp_socket,server=on,wait=off,id=qmp_socket,logfile=qmp_socket.log,logappend=on -qmp chardev:qmp_socket -S -device virtio-scsi-pci,id=scsi0 -blockdev driver=file,node-name=hd0-overlay0-file,filename=/var/lib/openqa/pool/7/raid/hd0-overlay0,cache.no-flush=on -blockdev driver=qcow2,node-name=hd0-overlay0,file=hd0-overlay0-file,cache.no-flush=on -device virtio-blk-device,id=hd0-device,drive=hd0-overlay0,bootindex=0,serial=hd0 -blockdev driver=file,node-name=cd0-overlay0-file,filename=/var/lib/openqa/pool/7/raid/cd0-overlay0,cache.no-flush=on -blockdev driver=qcow2,node-name=cd0-overlay0,file=cd0-overlay0-file,cache.no-flush=on -device scsi-cd,id=cd0-device,drive=cd0-overlay0,serial=cd0 -drive id=pflash-code-overlay0,if=pflash,file=/var/lib/openqa/pool/7/raid/pflash-code-overlay0,unit=0,readonly=on -drive id=pflash-vars-overlay0,if=pflash,file=/var/lib/openqa/pool/7/raid/pflash-vars-overlay0,unit=1
> 
> Running the same OS and kernel (aarch64 JeOS Tumbleweed 20211202) on RPI it's working:
> perf_event_open02.c:104: TINFO: bench_work estimated loops = 3601 in 500 ms
> perf_event_open02.c:149: TINFO: [0] value:1080601748 time_enabled:480527015 time_running:480527015
> perf_event_open02.c:149: TINFO: [1] value:1080599535 time_enabled:480540573 time_running:480540573
> perf_event_open02.c:149: TINFO: [2] value:1080592770 time_enabled:480533868 time_running:480533868
> perf_event_open02.c:149: TINFO: [3] value:1080607121 time_enabled:480571573 time_running:480571573
> perf_event_open02.c:149: TINFO: [4] value:1080598264 time_enabled:480568330 time_running:480568330
> perf_event_open02.c:149: TINFO: [5] value:1080608798 time_enabled:480600001 time_running:480600001
> perf_event_open02.c:149: TINFO: [6] value:923390393 time_enabled:480919479 time_running:410947611
> perf_event_open02.c:308: TINFO: nhw: 6, overall task clock: 4990107074
> perf_event_open02.c:309: TINFO: hw sum: 51868804135, task clock sum: 29940616417
> perf_event_open02.c:321: TINFO: ratio: 5.999995
> perf_event_open02.c:325: TPASS: test passed
> 
> Test is not supported ENOENT when running with similar setup on x86_64 and
> s390x quests:
> perf_event_open.h:31: TCONF: perf_event_open type/config not supported: ENOENT (2)
> 
> grep PERF_EVENTS config-5.15.5-1-default # x86_64
> CONFIG_HAVE_PERF_EVENTS=y
> CONFIG_PERF_EVENTS=y
> CONFIG_PERF_EVENTS_INTEL_UNCORE=y
> CONFIG_PERF_EVENTS_INTEL_RAPL=y
> CONFIG_PERF_EVENTS_INTEL_CSTATE=y
> CONFIG_PERF_EVENTS_AMD_POWER=m
> CONFIG_PERF_EVENTS_AMD_UNCORE=m
> CONFIG_HAVE_PERF_EVENTS_NMI=y
> 
> But it passes on ppc64le
> 
> perf_event_open02.c:104: TINFO: bench_work estimated loops = 4075 in 500 ms
> perf_event_open02.c:151: TINFO: [0] value:815279669 time_enabled:316461566 time_running:316461566
> perf_event_open02.c:151: TINFO: [1] value:815281799 time_enabled:316462740 time_running:316462740
> perf_event_open02.c:151: TINFO: [2] value:815280588 time_enabled:316534086 time_running:316534086
> perf_event_open02.c:151: TINFO: [3] value:815283285 time_enabled:316465672 time_running:316465672
> perf_event_open02.c:151: TINFO: [4] value:815305390 time_enabled:316492698 time_running:316492698
> perf_event_open02.c:151: TINFO: [5] value:686550649 time_enabled:316631866 time_running:266632316
> perf_event_open02.c:308: TINFO: nhw: 5, overall task clock: 2534004200
> perf_event_open02.c:309: TINFO: hw sum: 32612814180, task clock sum: 12669966232
> perf_event_open02.c:321: TINFO: ratio: 4.999978
> perf_event_open02.c:325: TPASS: test passed
> 
> grep PERF_EVENTS config # ppc64le
> CONFIG_HAVE_PERF_EVENTS=y
> CONFIG_PERF_EVENTS=y
> CONFIG_HAVE_PERF_EVENTS_NMI=y
> 
> When I tried running aarch64 quest with stable kernel 5.10.76 from kernel.org on
> my intel laptop, using simplified setup, the event was not supported (not sure
> whether that was caused unavailable -enable-kvm or something else; I also
> haven't checked kernel config):
> 
> qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp $SMP -kernel Image -append "rootwait root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0
> ...
> perf_event_open.h:26: TINFO: perf_event_open event.type: 0, event.config: 1
> perf_event_open.h:30: TCONF: perf_event_open type/config not supported: ENOENT (2)
> 
> I also tested that stable kernel 5.10.76 on RPI but that passed (the same as openSUSE 5.15.5-1-default)
> perf_event_open02.c:104: TINFO: bench_work estimated loops = 1496 in 500 ms
> perf_event_open02.c:149: TINFO: [0] value:449725668 time_enabled:500191054 time_running:500191054
> perf_event_open02.c:149: TINFO: [1] value:449728803 time_enabled:500204795 time_running:500204795
> perf_event_open02.c:149: TINFO: [2] value:449732944 time_enabled:500210665 time_running:500210665
> perf_event_open02.c:149: TINFO: [3] value:449738099 time_enabled:500210443 time_running:500210443
> perf_event_open02.c:149: TINFO: [4] value:449745104 time_enabled:500234961 time_running:500234961
> perf_event_open02.c:149: TINFO: [5] value:449756676 time_enabled:500247647 time_running:500247647
> perf_event_open02.c:149: TINFO: [6] value:385474224 time_enabled:502975813 time_running:430976612
> perf_event_open02.c:308: TINFO: nhw: 6, overall task clock: 4031349522
> perf_event_open02.c:309: TINFO: hw sum: 21590362808, task clock sum: 24187113827
> perf_event_open02.c:321: TINFO: ratio: 5.999756
> perf_event_open02.c:325: TPASS: test passed
> 
> So is it a rounding issue on aarch64 QEMU/KVM?
> Thanks for any hint what to check / try.
> 
> Kind regards,
> Petr
> 
> [1] https://github.com/linux-test-project/ltp/tree/c2d4836c057fb9f78e7f625d71638d4f40f98659/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
