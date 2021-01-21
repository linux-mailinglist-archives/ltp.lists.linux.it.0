Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 684572FE699
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 10:44:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BB553C639F
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 10:44:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D6FCA3C304E
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 10:44:33 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 336B61400F8C
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 10:44:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611222270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tVChGhEO9OQwAluET/3ujyQ6NNwP1xJlAfD/LE4MYNU=;
 b=gONx28RopMjxG41LCAN/n2izVMJzJ6L2+/rlPLqOzc/kECHi7dpyw+rwJYuI1pjpL1DzXC
 wJuEkEdBoj6ncONm861uP1HKnOH8iRj+zQUJWsbZYwM10HOIiWuSZdr9T2IZv87vy+KPPJ
 //cw1lUPjER0WBDExgYlGNC8qLkURmo=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-2IyHqFPVOfGyC8HIXqzqTA-1; Thu, 21 Jan 2021 04:44:28 -0500
X-MC-Unique: 2IyHqFPVOfGyC8HIXqzqTA-1
Received: by mail-yb1-f199.google.com with SMTP id 9so1721581ybj.16
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 01:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tVChGhEO9OQwAluET/3ujyQ6NNwP1xJlAfD/LE4MYNU=;
 b=ZGuST02bj07J+0Pq7EJnLvuWZUyicgZX4MQlSmzt8dfE6D7slJEJr4tRD2Botz8Ps7
 Bo1Ng3O2AgW27zVSU4Cx3wfxoJ0OurWSq7xwL1GCsq0TGsCY9ffoiPUDGyh40KXPmzzp
 2RVmntz0PnMG3qbv2g9KZB529HFPoK5V+My/Zhn2vfplt58QvFeO1HL2MmWXsiggH9oc
 5+1gatKZkTeps6HnmfhJcUxgX/8Jwz9FIprE30zuZzfHBCkw6MgyO1Aq1y8WzjE35TEw
 VQ82yausrYLJs9HDGr7nscg830E+tZc/OMBSeIRcZ3f8xsdzss4t37l9kYbG/HczD1cX
 jSJg==
X-Gm-Message-State: AOAM533f+D1ucbv/lVinpAJO18+0HsxeO8/cetMzqGFnQJozA9mGfrpt
 YMl3j5nVeHlv6gCRPgnjIFLZJOF8N1s1au7Kgt4UymRuUsUJsxfLp62agE3YoUudnedRE1Pjhdu
 jLh1uX2x6W0Ts6AbwOG5aBq4TW5w=
X-Received: by 2002:a25:4b86:: with SMTP id y128mr5317274yba.403.1611222267711; 
 Thu, 21 Jan 2021 01:44:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9LyW3Htxwr+Ycz3uR2wI2orVysXVqP5vmmJ6p1p2euu2gfSIHpNGVY2vtsbX04shI+ppG9nSmJb+L/COtJVo=
X-Received: by 2002:a25:4b86:: with SMTP id y128mr5317263yba.403.1611222267534; 
 Thu, 21 Jan 2021 01:44:27 -0800 (PST)
MIME-Version: 1.0
References: <20210115143246.369676-1-egorenar@linux.ibm.com>
 <CAEemH2fDzPp3D6KZ_G0UDbS=eh2tWDAcy7CTt_4Yw7FUT4zGxg@mail.gmail.com>
 <87zh14rrxm.fsf@oc8242746057.ibm.com> <YAgmPjaf8iRn20x2@pevik>
In-Reply-To: <YAgmPjaf8iRn20x2@pevik>
From: Li Wang <liwang@redhat.com>
Date: Thu, 21 Jan 2021 17:44:16 +0800
Message-ID: <CAEemH2cseOGtSem9vhChygLNeYz6E0bVEu+u-UH8agLBoHJo4Q@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] swapping01: make test more robust
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1723261748=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1723261748==
Content-Type: multipart/alternative; boundary="000000000000e936d705b965ea6c"

--000000000000e936d705b965ea6c
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

Thanks for your debugging.

On Wed, Jan 20, 2021 at 8:47 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Alexander, Li,
>
> First I found quite hard to have correct setup to avoid TCONF "Not enough
> swap
> space to test". It often requires to add additional swap file via mkswap
> && swapon
> and use some RAM with:
>
> dd if=/dev/zero of=/dev/shm/fill bs=1k count=14024k
>
> It'd be great if test could do required setup itself.
> And it'd also help at least to print swap_free_init and mem_over_max in
> that TCONF:
>
>         if (swap_free_init < mem_over_max)
> -               tst_brk(TCONF, "Not enough swap space to test.");
> +               tst_brk(TCONF, "Not enough swap space to test (%ld <
> %ld)", swap_free_init, mem_over_max);
>
>
> I tried to debug swapping01 on s390x (without this patch) with using
> additional
> swap and eat RAM with dd. and got bus error (core dumped). Is that due too
> aggressive memory eating? I'm not able to crash it on intel arch.
>

I think it is the correct behavior on your system, noticed that you tried
with almost 14G(1k*14024k) on /dev/shm, but the MemFree is only
3218768 kB on your system. Since the size of /dev/shm is limited by
excess RAM, so that couldn't provide such a huge ramdisk for your test
and get SIGBUS eventually.

(you can have a look the size of /dev/shm/fill is far less than 14G, I
believe)


>
> # strace ./swapping01
> execve("./swapping01", ["./swapping01"], 0x3ffdd9fdd30 /* 163 vars */) = 0
> brk(NULL)                               = 0x18ce000
> mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
> 0x3ffb41fc000
> access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or
> directory)
> openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
> fstat(3, {st_mode=S_IFREG|0644, st_size=51982, ...}) = 0
> mmap(NULL, 51982, PROT_READ, MAP_PRIVATE, 3, 0) = 0x3ffb4100000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib64/libpthread.so.0", O_RDONLY|O_CLOEXEC) = 3
> read(3,
> "\177ELF\2\2\1\0\0\0\0\0\0\0\0\0\0\3\0\26\0\0\0\1\0\0\0\0\0\0\205\370"...,
> 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=160168, ...}) = 0
> mmap(NULL, 143720, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
> 0x3ffb4080000
> mprotect(0x3ffb409d000, 4096, PROT_NONE) = 0
> mmap(0x3ffb409e000, 8192, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1d000) = 0x3ffb409e000
> mmap(0x3ffb40a0000, 12648, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x3ffb40a0000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
> read(3,
> "\177ELF\2\2\1\3\0\0\0\0\0\0\0\0\0\3\0\26\0\0\0\1\0\0\0\0\0\2\263\250"...,
> 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=2012560, ...}) = 0
> mmap(NULL, 1765032, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
> = 0x3ffb3e80000
> mprotect(0x3ffb4025000, 4096, PROT_NONE) = 0
> mmap(0x3ffb4026000, 24576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1a5000) = 0x3ffb4026000
> mmap(0x3ffb402c000, 11944, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x3ffb402c000
> close(3)                                = 0
> mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
> 0x3ffb41fa000
> mprotect(0x3ffb4026000, 12288, PROT_READ) = 0
> mprotect(0x3ffb409e000, 4096, PROT_READ) = 0
> mprotect(0x1025000, 4096, PROT_READ)    = 0
> mprotect(0x3ffb41a7000, 4096, PROT_READ) = 0
> munmap(0x3ffb4100000, 51982)            = 0
> set_tid_address(0x3ffb41fb060)          = 124658
> set_robust_list(0x3ffb41fb070, 24)      = 0
> rt_sigaction(SIGRTMIN, {sa_handler=0x3ffb4088050, sa_mask=[],
> sa_flags=SA_SIGINFO}, NULL, 8) = 0
> rt_sigaction(SIGRT_1, {sa_handler=0x3ffb4088108, sa_mask=[],
> sa_flags=SA_RESTART|SA_SIGINFO}, NULL, 8) = 0
> rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
> prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024,
> rlim_max=RLIM64_INFINITY}) = 0
> getpid()                                = 124658
> geteuid()                               = 0
> openat(AT_FDCWD, "/sys/devices/system/cpu/online", O_RDONLY|O_CLOEXEC) = 3
> read(3, "0-1\n", 8192)                  = 4
> close(3)                                = 0
> access("/dev/shm", F_OK)                = 0
> getpid()                                = 124658
> openat(AT_FDCWD, "/dev/shm/ltp_swapping01_124658", O_RDWR|O_CREAT|O_EXCL,
> 0600) = 3
> chmod("/dev/shm/ltp_swapping01_124658", 0666) = 0
> ftruncate(3, 4096)                      = 0
> mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_SHARED, 3, 0) = 0x3ffb4100000
> unlink("/dev/shm/ltp_swapping01_124658") = 0
> close(3)                                = 0
> rt_sigaction(SIGALRM, {sa_handler=0x1005a88, sa_mask=[ALRM],
> sa_flags=SA_RESTART}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
> rt_sigaction(SIGUSR1, {sa_handler=0x1005910, sa_mask=[USR1],
> sa_flags=SA_RESTART}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
> --- SIGBUS {si_signo=SIGBUS, si_code=BUS_ADRERR, si_addr=0x3ffb4100000} ---
> +++ killed by SIGBUS (core dumped) +++
> Bus error (core dumped)
>
> $ cat /proc/meminfo
> MemTotal:       12300520 kB
> MemFree:         3218768 kB
> MemAvailable:    5748908 kB
> Buffers:            6956 kB
> Cached:          8756848 kB
> SwapCached:            0 kB
> Active:          6651856 kB
> Inactive:        2152212 kB
> Active(anon):    6198384 kB
> Inactive(anon):    24904 kB
> Active(file):     453472 kB
> Inactive(file):  2127308 kB
> Unevictable:       18292 kB
> Mlocked:           18292 kB
> SwapTotal:       2538488 kB
> SwapFree:        2538488 kB
> Dirty:                16 kB
> Writeback:             0 kB
> AnonPages:         56544 kB
> Mapped:            32840 kB
> Shmem:           6175368 kB
> KReclaimable:     105912 kB
> Slab:             156604 kB
> SReclaimable:     105912 kB
> SUnreclaim:        50692 kB
> KernelStack:        6672 kB
> PageTables:         1976 kB
> NFS_Unstable:          0 kB
> Bounce:                0 kB
> WritebackTmp:          0 kB
> CommitLimit:     8688748 kB
> Committed_AS:    6360300 kB
> VmallocTotal:   132120576 kB
> VmallocUsed:       49520 kB
> VmallocChunk:          0 kB
> Percpu:            67680 kB
> AnonHugePages:     22528 kB
> ShmemHugePages:        0 kB
> ShmemPmdMapped:        0 kB
> CmaTotal:              0 kB
> CmaFree:               0 kB
> HugePages_Total:       0
> HugePages_Free:        0
> HugePages_Rsvd:        0
> HugePages_Surp:        0
> Hugepagesize:       1024 kB
> Hugetlb:               0 kB
> DirectMap4k:        6144 kB
> DirectMap1M:     4188160 kB
> DirectMap2G:     8388608 kB
>
> Kind regards,
> Petr
>
>

-- 
Regards,
Li Wang

--000000000000e936d705b965ea6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Th=
anks for your debugging.</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Jan 20, 2021 at 8:47 PM Petr Vorel &l=
t;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi Alexander, Li,<br>
<br>
First I found quite hard to have correct setup to avoid TCONF &quot;Not eno=
ugh swap<br>
space to test&quot;. It often requires to add additional swap file via mksw=
ap &amp;&amp; swapon<br>
and use some RAM with:<br>
<br>
dd if=3D/dev/zero of=3D/dev/shm/fill bs=3D1k count=3D14024k<br>
<br>
It&#39;d be great if test could do required setup itself.<br>
And it&#39;d also help at least to print swap_free_init and mem_over_max in=
 that TCONF:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (swap_free_init &lt; mem_over_max)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quo=
t;Not enough swap space to test.&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quo=
t;Not enough swap space to test (%ld &lt; %ld)&quot;, swap_free_init, mem_o=
ver_max);<br>
<br>
<br>
I tried to debug swapping01 on s390x (without this patch) with using additi=
onal<br>
swap and eat RAM with dd. and got bus error (core dumped). Is that due too<=
br>
aggressive memory eating? I&#39;m not able to crash it on intel arch.<br></=
blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-s=
ize:small">I think it is the correct behavior on your system, noticed that =
you tried</div><div class=3D"gmail_default" style=3D"font-size:small">with =
almost 14G(1k*14024k) on /dev/shm, but the=C2=A0MemFree is only</div><div c=
lass=3D"gmail_default" style=3D"">3218768 kB on your system.=C2=A0Since the=
 size of /dev/shm is limited by</div><div class=3D"gmail_default" style=3D"=
">excess RAM, so that couldn&#39;t=C2=A0provide such a huge ramdisk for you=
r test</div><div class=3D"gmail_default" style=3D"">and get=C2=A0SIGBUS eve=
ntually.</div><div class=3D"gmail_default" style=3D""><br></div><div class=
=3D"gmail_default" style=3D"">(you can have a look the size of /dev/shm/fil=
l is far less than 14G, I believe)</div></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
# strace ./swapping01<br>
execve(&quot;./swapping01&quot;, [&quot;./swapping01&quot;], 0x3ffdd9fdd30 =
/* 163 vars */) =3D 0<br>
brk(NULL)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x18ce000<br>
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x3ffb41fc000<br>
access(&quot;/etc/ld.so.preload&quot;, R_OK)=C2=A0 =C2=A0 =C2=A0 =3D -1 ENO=
ENT (No such file or directory)<br>
openat(AT_FDCWD, &quot;/etc/ld.so.cache&quot;, O_RDONLY|O_CLOEXEC) =3D 3<br=
>
fstat(3, {st_mode=3DS_IFREG|0644, st_size=3D51982, ...}) =3D 0<br>
mmap(NULL, 51982, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x3ffb4100000<br>
close(3)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0<br>
openat(AT_FDCWD, &quot;/lib64/libpthread.so.0&quot;, O_RDONLY|O_CLOEXEC) =
=3D 3<br>
read(3, &quot;\177ELF\2\2\1\0\0\0\0\0\0\0\0\0\0\3\0\26\0\0\0\1\0\0\0\0\0\0\=
205\370&quot;..., 832) =3D 832<br>
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D160168, ...}) =3D 0<br>
mmap(NULL, 143720, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0x3ffb4080000<br>
mprotect(0x3ffb409d000, 4096, PROT_NONE) =3D 0<br>
mmap(0x3ffb409e000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_D=
ENYWRITE, 3, 0x1d000) =3D 0x3ffb409e000<br>
mmap(0x3ffb40a0000, 12648, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
ANONYMOUS, -1, 0) =3D 0x3ffb40a0000<br>
close(3)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0<br>
openat(AT_FDCWD, &quot;/lib64/libc.so.6&quot;, O_RDONLY|O_CLOEXEC) =3D 3<br=
>
read(3, &quot;\177ELF\2\2\1\3\0\0\0\0\0\0\0\0\0\3\0\26\0\0\0\1\0\0\0\0\0\2\=
263\250&quot;..., 832) =3D 832<br>
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D2012560, ...}) =3D 0<br>
mmap(NULL, 1765032, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0x3ffb3e80000<br>
mprotect(0x3ffb4025000, 4096, PROT_NONE) =3D 0<br>
mmap(0x3ffb4026000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x1a5000) =3D 0x3ffb4026000<br>
mmap(0x3ffb402c000, 11944, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
ANONYMOUS, -1, 0) =3D 0x3ffb402c000<br>
close(3)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0<br>
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x3ffb41fa000<br>
mprotect(0x3ffb4026000, 12288, PROT_READ) =3D 0<br>
mprotect(0x3ffb409e000, 4096, PROT_READ) =3D 0<br>
mprotect(0x1025000, 4096, PROT_READ)=C2=A0 =C2=A0 =3D 0<br>
mprotect(0x3ffb41a7000, 4096, PROT_READ) =3D 0<br>
munmap(0x3ffb4100000, 51982)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0=
<br>
set_tid_address(0x3ffb41fb060)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 124658=
<br>
set_robust_list(0x3ffb41fb070, 24)=C2=A0 =C2=A0 =C2=A0 =3D 0<br>
rt_sigaction(SIGRTMIN, {sa_handler=3D0x3ffb4088050, sa_mask=3D[], sa_flags=
=3DSA_SIGINFO}, NULL, 8) =3D 0<br>
rt_sigaction(SIGRT_1, {sa_handler=3D0x3ffb4088108, sa_mask=3D[], sa_flags=
=3DSA_RESTART|SA_SIGINFO}, NULL, 8) =3D 0<br>
rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) =3D 0<br>
prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=3D8192*1024, rlim_max=3DRLIM64_I=
NFINITY}) =3D 0<br>
getpid()=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 124658<br>
geteuid()=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0<br>
openat(AT_FDCWD, &quot;/sys/devices/system/cpu/online&quot;, O_RDONLY|O_CLO=
EXEC) =3D 3<br>
read(3, &quot;0-1\n&quot;, 8192)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D 4<br>
close(3)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0<br>
access(&quot;/dev/shm&quot;, F_OK)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D 0<br>
getpid()=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 124658<br>
openat(AT_FDCWD, &quot;/dev/shm/ltp_swapping01_124658&quot;, O_RDWR|O_CREAT=
|O_EXCL, 0600) =3D 3<br>
chmod(&quot;/dev/shm/ltp_swapping01_124658&quot;, 0666) =3D 0<br>
ftruncate(3, 4096)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D 0<br>
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_SHARED, 3, 0) =3D 0x3ffb4100000<=
br>
unlink(&quot;/dev/shm/ltp_swapping01_124658&quot;) =3D 0<br>
close(3)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0<br>
rt_sigaction(SIGALRM, {sa_handler=3D0x1005a88, sa_mask=3D[ALRM], sa_flags=
=3DSA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D =
0<br>
rt_sigaction(SIGUSR1, {sa_handler=3D0x1005910, sa_mask=3D[USR1], sa_flags=
=3DSA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D =
0<br>
--- SIGBUS {si_signo=3DSIGBUS, si_code=3DBUS_ADRERR, si_addr=3D0x3ffb410000=
0} ---<br>
+++ killed by SIGBUS (core dumped) +++<br>
Bus error (core dumped)<br>
<br>
$ cat /proc/meminfo<br>
MemTotal:=C2=A0 =C2=A0 =C2=A0 =C2=A012300520 kB<br>
MemFree:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03218768 kB<br>
MemAvailable:=C2=A0 =C2=A0 5748908 kB<br>
Buffers:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6956 kB<br>
Cached:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8756848 kB<br>
SwapCached:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
Active:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6651856 kB<br>
Inactive:=C2=A0 =C2=A0 =C2=A0 =C2=A0 2152212 kB<br>
Active(anon):=C2=A0 =C2=A0 6198384 kB<br>
Inactive(anon):=C2=A0 =C2=A0 24904 kB<br>
Active(file):=C2=A0 =C2=A0 =C2=A0453472 kB<br>
Inactive(file):=C2=A0 2127308 kB<br>
Unevictable:=C2=A0 =C2=A0 =C2=A0 =C2=A018292 kB<br>
Mlocked:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A018292 kB<br>
SwapTotal:=C2=A0 =C2=A0 =C2=A0 =C2=A02538488 kB<br>
SwapFree:=C2=A0 =C2=A0 =C2=A0 =C2=A0 2538488 kB<br>
Dirty:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16 kB<br>
Writeback:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB<br>
AnonPages:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A056544 kB<br>
Mapped:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 32840 kB<br>
Shmem:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06175368 kB<br>
KReclaimable:=C2=A0 =C2=A0 =C2=A0105912 kB<br>
Slab:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0156604 kB<br>
SReclaimable:=C2=A0 =C2=A0 =C2=A0105912 kB<br>
SUnreclaim:=C2=A0 =C2=A0 =C2=A0 =C2=A0 50692 kB<br>
KernelStack:=C2=A0 =C2=A0 =C2=A0 =C2=A0 6672 kB<br>
PageTables:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01976 kB<br>
NFS_Unstable:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
Bounce:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
WritebackTmp:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
CommitLimit:=C2=A0 =C2=A0 =C2=A08688748 kB<br>
Committed_AS:=C2=A0 =C2=A0 6360300 kB<br>
VmallocTotal:=C2=A0 =C2=A0132120576 kB<br>
VmallocUsed:=C2=A0 =C2=A0 =C2=A0 =C2=A049520 kB<br>
VmallocChunk:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
Percpu:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 67680 kB<br>
AnonHugePages:=C2=A0 =C2=A0 =C2=A022528 kB<br>
ShmemHugePages:=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
ShmemPmdMapped:=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
CmaTotal:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
CmaFree:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB<br>
HugePages_Total:=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
HugePages_Free:=C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
HugePages_Rsvd:=C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
HugePages_Surp:=C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
Hugepagesize:=C2=A0 =C2=A0 =C2=A0 =C2=A01024 kB<br>
Hugetlb:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB<br>
DirectMap4k:=C2=A0 =C2=A0 =C2=A0 =C2=A0 6144 kB<br>
DirectMap1M:=C2=A0 =C2=A0 =C2=A04188160 kB<br>
DirectMap2G:=C2=A0 =C2=A0 =C2=A08388608 kB<br>
<br>
Kind regards,<br>
Petr<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000e936d705b965ea6c--


--===============1723261748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1723261748==--

