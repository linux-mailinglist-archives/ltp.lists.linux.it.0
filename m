Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D5591279E
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2024 16:26:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E95913D0EC1
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2024 16:26:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 870EF3D0E3B
 for <ltp@lists.linux.it>; Fri, 21 Jun 2024 11:42:44 +0200 (CEST)
Authentication-Results: in-4.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=arndb.de (client-ip=103.168.172.152;
 helo=fhigh1-smtp.messagingengine.com; envelope-from=arnd@arndb.de;
 receiver=lists.linux.it)
Received: from fhigh1-smtp.messagingengine.com
 (fhigh1-smtp.messagingengine.com [103.168.172.152])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B6DE9100035A
 for <ltp@lists.linux.it>; Fri, 21 Jun 2024 11:42:43 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id D8CC711401FF;
 Fri, 21 Jun 2024 05:42:41 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Fri, 21 Jun 2024 05:42:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1718962961; x=1719049361; bh=lJXqjdPTQI
 taFSDd10WfQGJxSki8+9Ze2rE4p5l7G8Y=; b=kSi1J5v8ppTJzytghvi1egT/Ia
 9+ldYodLYyQldPhXZRr0j1nxE8kP4yF9rHPsPspfJ841d5Q5ViQCWPuzmJZYJhT0
 fIPEcp9V5qyFi7AEspKXJAcZ8Qnrpck3uIjdg9iw88FiJ2Wo2LaQWYbgwGImcW7C
 SpIcDx9Toe1sQYoHixkBqQoDzyIS5FDmxlQhwooSdNQAdklgoz+seVjqfk4aHoHW
 A4nhpIj6RE6BQA1UWJz+o6XPMovw6j7YWgktwR2q22qomJ85HYJ9k056LTXLoiRz
 WD9ilToyXgKaO9cFbF1gMcl7y3CNzrqtd1tPSWbkBskpZg5jBtQcCdYH8f0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1718962961; x=1719049361; bh=lJXqjdPTQItaFSDd10WfQGJxSki8
 +9Ze2rE4p5l7G8Y=; b=pA/sp92CHnJRaYFltnW5QQm7YBjn/jr/ORskiDkKKzJl
 es2qBBGdWZliar0A5Kt0UJqrpEU4HfKnpliN/sw1rbQRc8GZN17uqvH62Xdp65aO
 HH4ZKtJaiUAEtH7SeW0V3fTHziEaAELtfXcAj6AnMTZ3k0lepGRrxJCxl9OSjxhO
 lrVQJp4nYJovgRwRBg3lJyy+XhTf+vZxUn0FaYa+EL1F28QKT9bkP7mjgvvecyX2
 rx/x7rRF+kOUWLCm+uckYztrfeWrqKylwbWptaWMLC7rcnOXK0JF9wcYkrUL02Ld
 uvsGXTrQA/s11hPdfq45FwQ1U6lT/5DWR0yPsQsVig==
X-ME-Sender: <xms:EEt1ZvB6G2PmM5kie6pjx4J0kwhwapMYWSw4DcrX6M9h7hocxKHJ8w>
 <xme:EEt1ZlgUXaDSD8WQ0CEL_JlssJqq4EDGp4Ney_-vJAO7ERiU2itSUwJrrWPUB5SR8
 7BAJDLbUpC-lBdGYRE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefgedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:EEt1ZqkRafADEQrJf8fGwDRNf9qLPmQttrQTA8SJE5VMXyUp47q0OA>
 <xmx:EEt1ZhzHSd2BpK5qLZBCt85dxk3lTUQgTd6Yq5zXPpL7vx6j5FvYDA>
 <xmx:EEt1ZkSzYJMxhTWj-DTlPeLtH4YVzU09BgRS1XV2zTJycJrFNGNNnA>
 <xmx:EEt1ZkYI0lwtPdvtdsfprTMcjjfBdPzDgJZAoKQiLXDF_QmFyq4zOg>
 <xmx:EUt1Zlc-JXdIYOCpzBrwI2UwFLz8XWzD9oFzvIkQq9DRBjTUQjstWQl->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B4DADB6008D; Fri, 21 Jun 2024 05:42:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
MIME-Version: 1.0
Message-Id: <9d4ba5e5-bb7f-432e-9354-47cc84eaa9e1@app.fastmail.com>
In-Reply-To: <366548c1a0d9749e42c0d0c993414a353c9b0b02.camel@physik.fu-berlin.de>
References: <20240620162316.3674955-1-arnd@kernel.org>
 <20240620162316.3674955-10-arnd@kernel.org>
 <366548c1a0d9749e42c0d0c993414a353c9b0b02.camel@physik.fu-berlin.de>
Date: Fri, 21 Jun 2024 11:41:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Arnd Bergmann" <arnd@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-kernel@vger.kernel.org
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Fri, 21 Jun 2024 16:26:08 +0200
Subject: Re: [LTP] [PATCH 09/15] sh: rework sync_file_range ABI
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>,
 guoren <guoren@kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-sh@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 "musl@lists.openwall.com" <musl@lists.openwall.com>,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 LTP List <ltp@lists.linux.it>, Brian Cain <bcain@quicinc.com>,
 Christian Brauner <brauner@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Xi Ruoyao <libc-alpha@sourceware.org>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, stable@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Jun 21, 2024, at 10:44, John Paul Adrian Glaubitz wrote:
> On Thu, 2024-06-20 at 18:23 +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The unusual function calling conventions on superh ended up causing
>                                               ^^^^^^
>                                        It's spelled SuperH

Fixed now.

>> diff --git a/arch/sh/kernel/sys_sh32.c b/arch/sh/kernel/sys_sh32.c
>> index 9dca568509a5..d5a4f7c697d8 100644
>> --- a/arch/sh/kernel/sys_sh32.c
>> +++ b/arch/sh/kernel/sys_sh32.c
>> @@ -59,3 +59,14 @@ asmlinkage int sys_fadvise64_64_wrapper(int fd, u32 offset0, u32 offset1,
>>  				 (u64)len0 << 32 | len1, advice);
>>  #endif
>>  }
>> +
>> +/*
>> + * swap the arguments the way that libc wants it instead of
>
> I think "swap the arguments to the order that libc wants them" would
> be easier to understand here.

Done

>> diff --git a/arch/sh/kernel/syscalls/syscall.tbl b/arch/sh/kernel/syscalls/syscall.tbl
>> index bbf83a2db986..c55fd7696d40 100644
>> --- a/arch/sh/kernel/syscalls/syscall.tbl
>> +++ b/arch/sh/kernel/syscalls/syscall.tbl
>> @@ -321,7 +321,7 @@
>>  311	common	set_robust_list			sys_set_robust_list
>>  312	common	get_robust_list			sys_get_robust_list
>>  313	common	splice				sys_splice
>> -314	common	sync_file_range			sys_sync_file_range
>> +314	common	sync_file_range			sys_sh_sync_file_range6
>                                                                  ^^^^^^ 
> Why the suffix 6 here?

In a later part of my cleanup, I'm consolidating all the
copies of this function (arm64, mips, parisc, powerpc,
s390, sh, sparc, x86) and picked the name
sys_sync_file_range6() for common implementation.

I end up with four entry points here, so the naming is a bit
confusing:

- sys_sync_file_range() is only used on 64-bit architectures,
  on x32 and on mips-n32. This uses four arguments, including
  two 64-bit wide ones.

- sys_sync_file_range2() continues to be used on arm, powerpc,
  xtensa and now on sh, hexagon and csky. I change the
  implementation to take six 32-bit arguments, but the ABI
  remains the same as before, with the flags before offset.

- sys_sync_file_range6() is used for most other 32-bit ABIs:
  arc, m68k, microblaze, nios2, openrisc, parisc, s390, sh, sparc
  and x86. This also has six 32-bit arguments but in the
  default order (fd, offset, nbytes, flags).

- sys_sync_file_range7() is exclusive to mips-o32, this one
  has an unused argument and is otherwise the same as
  sys_sync_file_range6().

My plan is to then have some infrastructure to ensure
userspace tools (libc, strace, qemu, rust, ...) use the
same calling conventions as the kernel. I'm doing the
same thing for all other syscalls that have architecture
specific calling conventions, so far I'm using

fadvise64_64_7
fanotify_mark6
truncate3
truncate4
ftruncate3
ftruncate4
fallocate6
pread5
pread6
pwrite5
pwrite6
preadv5
preadv6
pwritev5
pwritev6
sync_file_range6
fadvise64_64_2
fadvise64_64_6
fadvise64_5
fadvise64_6
readahead4
readahead5

The last number here is usually the number of 32-bit
arguments, except for fadvise64_64_2 that uses the
same argument reordering trick as sync_file_range2.

I'm not too happy with the naming but couldn't come up with
anything clearer either, so let me know if you have any
ideas there.

>>  315	common	tee				sys_tee
>>  316	common	vmsplice			sys_vmsplice
>>  317	common	move_pages			sys_move_pages
>> @@ -395,6 +395,7 @@
>>  385	common	pkey_alloc			sys_pkey_alloc
>>  386	common	pkey_free			sys_pkey_free
>>  387	common	rseq				sys_rseq
>> +388	common	sync_file_range2		sys_sync_file_range2
>>  # room for arch specific syscalls
>>  393	common	semget				sys_semget
>>  394	common	semctl				sys_semctl
>
> I wonder how you discovered this bug. Did you look up the calling 
> convention on SuperH
> and compare the argument order for the sys_sync_file_range system call 
> documented there
> with the order in the kernel?

I had to categorize all architectures based on their calling
conventions to see if 64-bit arguments need aligned pairs or
not, so I wrote a set of simple C files that I compiled for
all architectures to see in which cases they insert unused
arguments or swap the order of the upper and lower halves.

SuperH, parisc and s390 are each slightly different from all the
others here, so I ended up reading the ELF psABI docs and/or
the compiler sources to be sure.
I also a lot of git history.

> Did you also check what order libc uses? I would expect libc on SuperH 
> misordering the
> arguments as well unless I am missing something. Or do we know that the 
> code is actually
> currently broken?

Yes, I checked glibc, musl and uclibc-ng for all the cases in
which the ABI made no sense, as well as to check that my analysis
of the kernel sources matches the expectations of the libc.

     Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
