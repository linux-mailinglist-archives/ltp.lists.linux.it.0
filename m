Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 687E382A0ED
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jan 2024 20:17:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1EE633CE4C6
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jan 2024 20:17:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A07B23C8603
 for <ltp@lists.linux.it>; Wed, 10 Jan 2024 20:17:17 +0100 (CET)
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 225D8200C0B
 for <ltp@lists.linux.it>; Wed, 10 Jan 2024 20:17:16 +0100 (CET)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7831b3a48e7so254201085a.3
 for <ltp@lists.linux.it>; Wed, 10 Jan 2024 11:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20230601.gappssmtp.com; s=20230601; t=1704914235; x=1705519035;
 darn=lists.linux.it; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dVeghFTfEKwCnZqoaITfL2C3OqeDo91GFIUdqHYe6xU=;
 b=purV+4B7Cn6gM89J5pUzZ4rApfsz7bL+3a1IQWRx1OIqAQdGgF2xt9wtVJHFWAgZua
 8Ue7I6iYNmqIcFgRZ4qQf++1V0mnAYz8Eyqj+LdikpfC4G8fMUp5FcGJm3FY78qfvnuV
 CmxU6mGC0D7LsQWYf1TV4+7O/jjeyYvPXAolP29vw2da7tUxhAiavz07yHL9h9/Rcxka
 KVakFPaHs91Z8swk80U2ktpYAqEO8s6ygIWBaDdZkcvDrBEoxFTv1FRxzA1oOCYr+gBx
 TzzEHLOykNBeCpiqtR6yxA5UxlbKlzkCdVoiQU8dQR6XLvzLoVFbigQEixkKKa3OTroi
 1xeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704914235; x=1705519035;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dVeghFTfEKwCnZqoaITfL2C3OqeDo91GFIUdqHYe6xU=;
 b=MZr30HogdyLyq3L3ePosZwqE5gtkx3lZwiLJuMYY6c3pWKRFSocguj5pLxbwkFmCut
 ppES+oI7hwz6uqV6076gZ1bfUe+FW7NtkYMBIPTxRXY6fHm48s5BA7767xYQamyvI8s5
 CL9YPcNGZkR8+zhffqjvKVKcux1njkNxY27+mqmXkv2iR2hTU7mnReOaWr1b3M+/eEVF
 3Ok+2BqfLI71Pzyj41Lmu0zPx9x8RdMCFT40a6pP1gBRDS2qNQbfMKdq3gvFCmeji5zO
 WPcBnnBg1oJiEzyP4VCU+heaPi433u+kMrZwgNMqRXCVSXUwbj18Ehn63SUfQvObTCIV
 KV+w==
X-Gm-Message-State: AOJu0Yyf0OEmyFI4TcUpQqacGMYoiHhGgbAVhJT9CM7FQFbSdxN9yd0V
 i5vSc2vy6c9Ki4hUfO2GQNYhZX1l9WG9jA==
X-Google-Smtp-Source: AGHT+IFBLddxdTc58MefjwJbm3rpNUvZuoZw01f+SN8/20c7qP+g4Wbqx7KwDLaVAoQ2dQCOfpGd4w==
X-Received: by 2002:ac8:57cf:0:b0:429:bc00:ef25 with SMTP id
 w15-20020ac857cf000000b00429bc00ef25mr24399qta.122.1704914234609; 
 Wed, 10 Jan 2024 11:17:14 -0800 (PST)
Received: from [172.16.32.83] ([198.232.126.202])
 by smtp.gmail.com with ESMTPSA id
 hb5-20020a05622a2b4500b0042830a16af7sm1985351qtb.62.2024.01.10.11.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 11:17:14 -0800 (PST)
Message-ID: <40996ea1-3417-1c2f-ddd2-e6ed45cb6f4b@landley.net>
Date: Wed, 10 Jan 2024 13:23:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Petr Vorel <pvorel@suse.cz>, Tim Bird <tim.bird@sony.com>
References: <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
 <20240103114957.GD1073466@pevik>
 <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
 <ZZVOhlGPg5KRyS-F@yuki> <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
 <20240105131135.GA1484621@pevik>
 <90c1ddc1-c608-30fc-d5aa-fdf63c90d055@landley.net>
 <20240108090338.GA1552643@pevik> <ZZvJXTshFUYSaMVH@yuki>
 <SA3PR13MB6372498CC6372F8B16237244FD6A2@SA3PR13MB6372.namprd13.prod.outlook.com>
 <20240110141455.GC1698252@pevik>
From: Rob Landley <rob@landley.net>
In-Reply-To: <20240110141455.GC1698252@pevik>
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-3.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] Call for nommu LTP maintainer [was:
 Re: [PATCH 00/36] Remove UCLINUX from LTP]
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Jonathan Corbet <corbet@lwn.net>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Greg Ungerer <gerg@linux-m68k.org>, "ltp@lists.linux.it" <ltp@lists.linux.it>,
 "automated-testing@lists.yoctoproject.org"
 <automated-testing@lists.yoctoproject.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 1/10/24 08:14, Petr Vorel wrote:
> There is MAP_PRIVATE_EXCEPT_UCLINUX constant to avoid using MAP_PRIVATE on
> uClinux, who knows if this is relevant on nommu?

MAP_PRIVATE creates a copy-on-write mapping, and doing copy-on-write requires an
MMU. (You mark it read only in the page table, take a fault when they try to
write, the fault handler allocates a new physical page, copies the old contents
to it, marks it writeable, and returns allowing the write to complete to the new
page.)

On NOMMU you can MAP_SHARED and MAP_ANON, but not MAP_PRIVATE.

Swap is implemented kind of similarly, except when you recycle pages you mark
them as neither readable nor writeable in the page table, schedule the page's
contents to be written to disk, suspend the process so the scheduler can go run
something else, and then when you get the I/O completion interrupt you mark the
page free so whatever else needed a page can use it. And then when the process
tries to access the page the fault handler reverses the process, allocating a
new physical page and load in the contents back in while the process is
suspended waiting for that to finish. Can't do that without an MMU either.

>> 3) what the desired roadmap going forward would be, to continue to support this code.
> 
> All LTP tests are being rewritten to use new API since 2016 (new API was
> introduced in 20160510), thus we are loosing the support with old API going
> away. Sure, I can hold on this patchset and we continue removing the
> functionality tests manually. But sooner or later it's gone.

You can't fork() on nommu because copies of the mappings have different
addresses, meaning any pointers in the copied mappings would point into the OLD
mappings (belonging to the parent process), and fixing them up is 100%
equivalent to the "garbage collection in C" problem. (It's AI-complete. Of the
C3PO kind, not the "autocorrect with syntax checking" kind.) People get hung up
on the "it would be very inefficient to do that because no copy-on-write"
problem and miss the "the child couldn't FUNCTION because its pointer variables
all contain parent addresses" problem.

So instead vfork() creates a child with all the same memory mappings (a bit like
a thread) and freezes the parent process until that child discards those
mappings, either by calling exec() or _exit(). (At which point the parent gets
un-suspended.)

The child can do quite a lot of setup before calling exec, it already has its
own filehandle table for example, but it has to be really careful about MEMORY.
Anything it writes to global variables the parent will see, any changes to the
heap persist in the parent, and anything it writes to local variables the parent
MAY see. (Systems have historically differed about whether the vfork() child
gets a new stack like a thread would, or keeps using the parent's mapping since
the new stack would be quickly discarded anyway. If you call into a new setup()
function after vfork() it doesn't matter much either way, but do NOT return from
the function that called vfork(): either your new stack hasn't got anything to
return to or you'll corrupt the parent's stack by overwriting its return address
so when the parent exits from its current function it jumps to la-la land.)

The OTHER fun thing about nommu is you can't run conventional ELF binaries,
because everything is linked at fixed address. So you might be able to run ONE
instance of the program as your init task, assuming those addresses were
available even then, but as soon as you try to run a second one it's a conflict.

The quick and dirty work around is to make PIE binaries, which can relocate
everything into available space, which works but doesn't scale. The problem with
ELF PIE is that everything is linked contiguously from a single base pointer,
meaning your text, rodata, data, and bss segments are all one linear blob. So if
you run two instances of bash, you've loaded two copies of the test and the
rodoata. This fills up your memory fast.

AND PIE requires contiguous memory, which nommu is bad at providing because it
has no page tables to remap stuff. With an mmu it can coalesce scattered
physical pages into a virtually contiguous range, but without an mmu you can
have plenty of memory free but in tiny chunks, none big enough to satisfy an
allocation request.

So they invented FDPIC, which is ELF with FOUR base pointers. Each major section
(rodata, text, data, and bss) has its own base pointer, so you need to find
smaller chunks of memory to load them into (and thus it can work on a more
fragmented system), AND it means that two instances of the same program can
share the read-only sections (rodata and text) so you only need new copies of
the writeable segments (data and bss. And the heap. And the stack.)

(The earlier binflt format is an a.out variant with 4 base pointers. FDPIC is
the ELF version of the same idea. Since a.out went bye-bye binflt is obsolete,
but not everybody's moved off it yet because so many nommu people are still
using 2.6 or even earlier, and also using gcc 3.x or 2.x toolchains.)

Oh, the OTHER thing is none of this is deferred allocation, it's all up front.
On systems with mmu you can populate large empty virtual mappings that read as
zeroed but it's actually redundant copy-on-write instances of the zero page, and
when you write to them it takes a soft fault and the fault handler allocates the
page you dirtied when you dirty it. On nommu, if you want a 4 megabyte mapping
you have to find 4 contiguous megabyte and allocate it immediately, or else the
mmap() or malloc() returns failure. (On systems with mmu malloc() almost never
returns NULL, because you've got virtual address space coming out of your ears
and if you ACTUALLY run out of memory that's happens way later, the OOM killer
triggers long after malloc() returned success. But on a nommu system, malloc()
returns NULL all the time, even if you THINK you have enough memory, because
what's left is too fragmented to contain a free chunk THAT BIG...)

This impacts the stack. On MMU Linux, the default stack size is 8 megs but it's
seldom all used. On nommu linux, that would be RIDICULOUS because A) it would
always be allocated to its full size right up front, B) you'd need contiguous
memory for it. So instead you set the default stack size when building the
linker (you can also set it on the ld command line), and common sizes range from
8k to maybe 256k depending on what you expect to be running. Toybox tries not to
use more than 16k stack, although I usually test it with 32k on nommu. (There's
no guard page to tell you when you went off the edge, because no MMU so no page
faults, but you can check that the stack page at end-16k is still clean at exit
if you like. Some nommu hardware has range registers, but Linux has never
supported them that I'm aware of.)

There's not THAT much to learn about NOMMU. It could all be covered in an hour
presentation at a conference, I expect?

> One can check files which had special handling in the old API:
> 
> $ git grep -l UCLINUX 20160126 -- testcases/ | wc -l
> 173
> 
> What is supported now:
> 
> $ git grep -l UCLINUX  -- testcases/  |wc -l
> 55

UCLINUX is a long-dead distro. Linaro died in the dot-com crash and its founder
Jeff Dionne moved to Japan for his next gig and never came back. On the way out
he handed uclinux off to someone else, who didn't do a lot of work maintaining
it. Most of the actual support went "upstream" into various packages (linux and
busybox and gcc and so on) before the handoff, so you didn't NEED uclinux anymore.

The real nail in the coffin is the inheritor of uclinux never migrated it off
CVS, and then the disk holding the CVS archive crashed with no backup. He came
out with a couple more releases after that by monkey-patching the last release's
filesystem, but the writing was on the wall and it rolled to a stop.

I did a triage of its last release (from 2014) as part of my toybox roadmap:

https://landley.net/toybox/roadmap.html#uclinux

> => We have now removed nearly 2/3 of it (this means we're arguing about 1/3 of
> the tests which initially somehow supported nommu).

I'd like to get more tests supporting nommu. Possibly the approach here is just
get ANYTHING working with the new api, and then whack-a-mole more tests in as we go.

Other than lacking fork(), restricted mmap(), different executable packaging,
smaller stack size, having to actually test the return from malloc(), no page
faults if you follow a wild pointer, and the complete lack of swap space...

Unless I missed something, it's otherwise normal Linux? (People comfortable with
threads can still do all their thread tricks on nommu systems. And the Turtle
board I'm using is an SMP nommu system, they do exist. :)

Rob

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
