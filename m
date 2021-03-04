Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA9832CDF1
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 08:52:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7EA733C5676
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 08:52:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 144C53C5411
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 08:52:46 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id E117F140076D
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 08:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614844364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bXT4rGZHcI+Peo0TJYta1ryFnajzeK2SNSCNWOmbhok=;
 b=gJcsFSHNMpwSG498W8bTk7gvZ3dKffOHN8rgSs3nN0vBJZTC3xda86wvVjC1UMTtXEB041
 V7M/wd2I+dbzTzw0pHSs1FAAhRTqUYNvI9x75OfPC0W1fK+5esnXrS4OlSEuEZubhj0khA
 F9xSK/iLtKKZrSA9y2AWYTq5gnb1s84=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-HBG1_3M3OEyF4kwqWCbwjQ-1; Thu, 04 Mar 2021 02:52:39 -0500
X-MC-Unique: HBG1_3M3OEyF4kwqWCbwjQ-1
Received: by mail-yb1-f197.google.com with SMTP id v6so29804917ybk.9
 for <ltp@lists.linux.it>; Wed, 03 Mar 2021 23:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bXT4rGZHcI+Peo0TJYta1ryFnajzeK2SNSCNWOmbhok=;
 b=QOufdjX+lvl50Mlq08xHyuqcBDjSFhy00j+NZUK8tGmP8kpsqwLBCjksn+hrK0UCGm
 drQ2FYCyzNUFJSOA3ZITVPghqxhgcVDj4WFYBqaqQtjW73cKKRxgTSC4CwkQDmZN1VPp
 AjwXMcMKAxhlL+1sfwdxXqr4qzJj2H9vBU58HTie/mU+OWhNyZPPnHeiDDJG1wCQIvv2
 /BbiPUXa26/UELCiRWLsZ+M8pgiaQkTLHC5c4+NYF4F+Z6WOete2DnmjYLy0O+FenVQw
 CxO0q24MG43mwPXOiOMZ+EEiCLhcmHbVom2RKfbOPgLtLyNPNvLddgf+KEnc/aFOZOt9
 QQ9Q==
X-Gm-Message-State: AOAM531/voBRFBgL17a6Jivv4v+5X7vehEk0wBtD8esNDgCAgYKk14K8
 bUDJv6CctCu92AEi2IbhDGfGVAUVo51z/dAVRKoFrOvzQqPu21qGmJeRhXSFysqQ9Ma0doi81ZB
 BfTllb7wjntLpdq0z3/b8ak49Rgg=
X-Received: by 2002:a25:af05:: with SMTP id a5mr4901107ybh.86.1614844359133;
 Wed, 03 Mar 2021 23:52:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKM61EnGGm9n7Srat7qU2CgqDtPo9WrHsWBHHhi76nZQbUCOrylI2Cy0yanltvHncF6LgsTzZo7xnAVEiECes=
X-Received: by 2002:a25:af05:: with SMTP id a5mr4901085ybh.86.1614844358867;
 Wed, 03 Mar 2021 23:52:38 -0800 (PST)
MIME-Version: 1.0
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>
 <YBE03REJywKIlM0X@yuki.lan> <2021012718043566596022@chinatelecom.cn>
In-Reply-To: <2021012718043566596022@chinatelecom.cn>
From: Li Wang <liwang@redhat.com>
Date: Thu, 4 Mar 2021 15:52:27 +0800
Message-ID: <CAEemH2dA0T1F3wsdwtG2hsfDUUJsY8gFeTLTHyGz+pu034gH4g@mail.gmail.com>
To: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,MANY_SPAN_IN_TEXT,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01
 invoked oom-killer
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0570741636=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0570741636==
Content-Type: multipart/alternative; boundary="00000000000060d32805bcb140d6"

--00000000000060d32805bcb140d6
Content-Type: text/plain; charset="UTF-8"

Hi Xinpeng,

[root@test-env-nm05-compute-14e5e72e38 ~]# cat /proc/meminfo
> MemTotal:       526997420 kB
> MemFree:        520224908 kB
> MemAvailable:   519936744 kB
> Buffers:               0 kB
> Cached:          2509036 kB
> SwapCached:            0 kB
> ...
> SwapTotal:             0 kB
> SwapFree:              0 kB
> ...
> CommitLimit:    263498708 kB
> Committed_AS:   10263760 kB
>
> [root@test-env-nm05-compute-14e5e72e38 ~]# cat
>  /proc/sys/vm/min_free_kbytes
> 90112
>

After looking back on this problem, I prefer to think the reasons were
caused by lower CommitLimit.

    CommitLimit:    263498708 kB < MemAvailable:   519936744 kB

If you try to enable all swap-disk or reset to a high ratio in
overcommit_ratio
to make it larger than MemAvailable, probably no OOM occurs anymore.

Btw, I also observed that ioctl_sg01 almost being killed by OOM
every time on an aarch64 with little swap space, but if I add more
swap or set a high value of overcommit_ratio, the problem is gone.
(I manually tried with another x86_64 to confirm this too)

              total        used        free      shared  buff/cache   available
Mem:         259828        5365      247383          68        7079      231296
Swap:          4095          55        4040

---

MemTotal:       266063872 kB
MemFree:        253320768 kB
MemAvailable:   236848064 kB
Buffers:            1472 kB
Cached:          6755456 kB
SwapCached:        12160 kB
...
CommitLimit:    137226176 kB
Committed_AS:    1206912 kB
---


The previous method in the patch[1] seems not good enough, but that can
help to verify if OOM disappears when resetting the overcommit_ratio.
[1] http://lists.linux.it/pipermail/ltp/2021-February/020907.html

Hence, another improvement way based on the above is to allocate proper
memory-size according to CommitLimit value when detecting the value of
CommitLimit is less than MemAvailable. That will make the test happy with
a little swap-space size system.

Any thoughts, or comments?

--- a/lib/tst_memutils.c
+++ b/lib/tst_memutils.c
@@ -36,6 +36,13 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
        if (info.freeram - safety < maxsize / info.mem_unit)
                maxsize = (info.freeram - safety) * info.mem_unit;

+       /*
+        * To respect CommitLimit to prevent test invoking OOM killer,
+        * this may appear on system with a smaller swap-disk (or disabled).
+        */
+       if (SAFE_READ_MEMINFO("CommitLimit:") <
SAFE_READ_MEMINFO("MemAvailable:"))
+               maxsize = SAFE_READ_MEMINFO("CommitLimit:") * 1024 -
(safety * info.mem_unit);
+
        blocksize = MIN(maxsize, blocksize);
        map_count = maxsize / blocksize;
        map_blocks = SAFE_MALLOC(map_count * sizeof(void *));


========================

About the  MemAvailable < MemFree, I think that is correct behavior on
your system and not the OOM root-cause.

Generally, we assumed the MemAvailable higher than MemFree,
but we sometimes also allow situations to break that. We'd better
count all of the different free watermarks from /proc/zoneinfo, then
add the sum of the low watermarks to MemAvailable, if get a value
larger than MemFree, that should be OK from my perspective.

-----
# echo 675840 > /proc/sys/vm/min_free_kbytes

# cat /proc/meminfo |grep -i mem
MemTotal:        5888584 kB
MemFree:         4518064 kB
MemAvailable:    3692008 kB
Shmem:             21128 kB
ShmemHugePages:        0 kB
ShmemPmdMapped:        0 kB


# cat /proc/zoneinfo |grep low -B 3
...
  pages free     3840
        min      440
        low      550
--
Node 0, zone    DMA32
  pages free     355602
        min      79706
        low      99632
--
Node 0, zone   Normal
  pages free     0
        min      0
        low      0
--
Node 0, zone  Movable
  pages free     0
        min      0
        low      0
--
Node 0, zone   Device
  pages free     0
        min      0
        low      0
--
Node 1, zone      DMA
  pages free     0
        min      0
        low      0
--
Node 1, zone    DMA32
  pages free     0
        min      0
        low      0
--
      nr_kernel_misc_reclaimable 0
  pages free     769192
        min      88812
        low      111015

(111015+99632+550)*4 + 3692008(MemAvailable) > 5888584(MemFree)

Btw the formula to count MemAvailable is:

available = MemFree - totalreserve_pages + pages[LRU_ACTIVE_FILE] +
pages[LRU_INACTIVE_FILE] - min(pagecache / 2, wmark_low)

-- 
Regards,
Li Wang

--00000000000060d32805bcb140d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xinpeng,</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<div><span></span><div>[root@test-env-nm05-compute-14e5e72e38 ~]# cat /proc=
/meminfo</div><div>MemTotal: =C2=A0 =C2=A0 =C2=A0 526997420 kB</div><div>Me=
mFree: =C2=A0 =C2=A0 =C2=A0 =C2=A0520224908 kB</div><div><span class=3D"gma=
il_default" style=3D"font-size:small"></span>MemAvailable: =C2=A0 519936744=
 kB</div><div>Buffers: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 k=
B</div><div>Cached: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02509036 kB</div><div>=
SwapCached: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB</div><div><span c=
lass=3D"gmail_default" style=3D"font-size:small">...</span></div><div>SwapT=
otal: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB</div><div>SwapFree: =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB</div><div><span class=
=3D"gmail_default" style=3D"font-size:small">...</span></div><div><span cla=
ss=3D"gmail_default" style=3D"font-size:small"></span>CommitLimit: =C2=A0 =
=C2=A0263498708 kB</div><div>Committed_AS: =C2=A0 10263760 kB</div></div><d=
iv><br></div><div><div>[root@test-env-nm05-compute-14e5e72e38 ~]# cat =C2=
=A0/proc/sys/vm/min_free_kbytes</div><div>90112</div></div></blockquote><di=
v><br></div><span class=3D"gmail_default" style=3D"font-size:small">After l=
ooking back on this problem</span>,=C2=A0<span class=3D"gmail_default" styl=
e=3D"font-size:small">I prefer to think </span><span class=3D"gmail_default=
" style=3D"font-size:small">the reasons were caused by lower CommitLimit.</=
span></div><div class=3D"gmail_quote"><span class=3D"gmail_default" style=
=3D"font-size:small"><br></span></div><div class=3D"gmail_quote"><span clas=
s=3D"gmail_default">=C2=A0 =C2=A0=C2=A0</span>CommitLimit: =C2=A0 =C2=A0263=
498708 kB<span class=3D"gmail_default"> &lt; </span><span class=3D"gmail_de=
fault"></span>MemAvailable: =C2=A0 519936744 kB<br></div><div class=3D"gmai=
l_quote"><br></div><div class=3D"gmail_quote"><span class=3D"gmail_default"=
 style=3D"font-size:small">If you try to enable all swap-disk or reset to a=
 high ratio in overcommit_ratio</span></div><div class=3D"gmail_quote"><spa=
n class=3D"gmail_default" style=3D"font-size:small">to make it larger than =
MemAvailable, probably no OOM occurs anymore.</span></div><div class=3D"gma=
il_quote"><br></div><div class=3D"gmail_quote"><div class=3D"gmail_default"=
 style=3D"font-size:small">Btw, I also observed that ioctl_sg01 almost bein=
g killed by OOM</div><div class=3D"gmail_default" style=3D"font-size:small"=
>every time on<span class=3D"gmail_default">=C2=A0an aarch64=C2=A0</span>wi=
th little swap space<span class=3D"gmail_default">, but if I add more</span=
></div><div class=3D"gmail_default" style=3D"font-size:small"><span class=
=3D"gmail_default">swap=C2=A0</span><span class=3D"gmail_default">or set a =
high=C2=A0</span>value of overcommit_ratio, the=C2=A0problem is gone.</div>=
<div class=3D"gmail_default" style=3D"font-size:small">(I manually tried wi=
th another x86_64 to confirm this too)</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><pre style=3D"color:rgb(0,0,0);white-space:pre-wrap=
">              total        used        free      shared  buff/cache   ava=
ilable
Mem:         259828        5365      247383          68        7079      23=
1296
Swap:          4095          55        4040</pre><pre style=3D"color:rgb(0,=
0,0);white-space:pre-wrap"><span style=3D"font-family:Arial,Helvetica,sans-=
serif">---</span>
</pre><pre style=3D"color:rgb(0,0,0);white-space:pre-wrap">MemTotal:       =
266063872 kB
MemFree:        253320768 kB
MemAvailable:   236848064 kB
Buffers:            1472 kB
Cached:          6755456 kB
SwapCached:        12160 kB
...
CommitLimit:    137226176 kB
Committed_AS:    1206912 kB
---</pre></div></div><div class=3D"gmail_quote"><span class=3D"gmail_defaul=
t" style=3D"font-size:small"><div class=3D"gmail_quote"><span class=3D"gmai=
l_default"><br></span></div><div class=3D"gmail_quote"><span class=3D"gmail=
_default">The previous method in the patch[1] seems not good enough, but th=
at can</span></div><div class=3D"gmail_quote"><span class=3D"gmail_default"=
>help=C2=A0</span>to verify if OOM <span class=3D"gmail_default">disappears=
</span>=C2=A0when resetting the=C2=A0overcommit_ratio.</div><div class=3D"g=
mail_quote"><span class=3D"gmail_default">[1] <a href=3D"http://lists.linux=
.it/pipermail/ltp/2021-February/020907.html" target=3D"_blank">http://lists=
.linux.it/pipermail/ltp/2021-February/020907.html</a></span></div><div clas=
s=3D"gmail_quote"><br></div></span></div><div class=3D"gmail_quote"><span c=
lass=3D"gmail_default" style=3D"font-size:small">Hence, another improvement=
 way based on the above is to allocate proper</span></div><div class=3D"gma=
il_quote"><span class=3D"gmail_default">memory-size=C2=A0</span><span class=
=3D"gmail_default">according=C2=A0</span><span class=3D"gmail_default">to=
=C2=A0</span><span class=3D"gmail_default">CommitLimit value when detecting=
=C2=A0</span>the value of<span class=3D"gmail_default"></span></div><div cl=
ass=3D"gmail_quote"><span class=3D"gmail_default"></span>CommitLimit<span c=
lass=3D"gmail_default" style=3D"font-size:small"> is </span>less<span class=
=3D"gmail_default"> </span>than<span class=3D"gmail_default">=C2=A0</span><=
span class=3D"gmail_default"></span>MemAvailable.<span class=3D"gmail_defau=
lt"> </span>That will make the<span class=3D"gmail_default"> </span><span c=
lass=3D"gmail_default">test happy with</span><span class=3D"gmail_default">=
</span></div><div class=3D"gmail_quote"><span class=3D"gmail_default">a=C2=
=A0</span>little swap-space<span class=3D"gmail_default" style=3D"font-size=
:small"> </span><span class=3D"gmail_default"></span>size<span class=3D"gma=
il_default"> </span>system<span class=3D"gmail_default">.</span></div><div =
class=3D"gmail_quote"><span class=3D"gmail_default"><br></span></div><div c=
lass=3D"gmail_quote"><span class=3D"gmail_default">Any thoughts, or comment=
s?</span></div><div class=3D"gmail_quote"><span class=3D"gmail_default"><br=
></span></div><div class=3D"gmail_quote"><span class=3D"gmail_default">--- =
a/lib/tst_memutils.c<br>+++ b/lib/tst_memutils.c<br>@@ -36,6 +36,13 @@ void=
 tst_pollute_memory(size_t maxsize, int fillchar)<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (info.freeram - safety &lt; maxsize / info.mem_unit)<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 maxsize =3D (info.freeram =
- safety) * info.mem_unit;<br>=C2=A0<br>+ =C2=A0 =C2=A0 =C2=A0 /*<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0* To respect CommitLimit to prevent test invoking O=
OM killer,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0* this may appear on system with=
 a smaller swap-disk (or disabled).<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>+=
 =C2=A0 =C2=A0 =C2=A0 if (SAFE_READ_MEMINFO(&quot;CommitLimit:&quot;) &lt; =
SAFE_READ_MEMINFO(&quot;MemAvailable:&quot;))<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 maxsize =3D SAFE_READ_MEMINFO(&quot;CommitLimit:&q=
uot;) * 1024 - (safety * info.mem_unit);<br>+<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 blocksize =3D MIN(maxsize, blocksize);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 m=
ap_count =3D maxsize / blocksize;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 map_blocks=
 =3D SAFE_MALLOC(map_count * sizeof(void *));<br></span></div><div class=3D=
"gmail_quote"><br></div><div class=3D"gmail_quote"><br></div><div class=3D"=
gmail_quote"><div class=3D"gmail_default" style=3D"font-size:small">=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div></d=
iv><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><span cl=
ass=3D"gmail_default" style=3D"font-size:small">About the </span>=C2=A0<spa=
n class=3D"gmail_default" style=3D"font-size:small">MemAvailable &lt; MemFr=
ee, I think that is correct behavior on</span></div><div class=3D"gmail_quo=
te"><span class=3D"gmail_default" style=3D"font-size:small">your system and=
 not the OOM root-cause.</span></div><div class=3D"gmail_quote"><span class=
=3D"gmail_default" style=3D"font-size:small"><br></span></div><div class=3D=
"gmail_quote"><span class=3D"gmail_default" style=3D"font-size:small">Gener=
ally, we assumed the MemAvailable higher=C2=A0</span><span class=3D"gmail_d=
efault">than=C2=A0</span><span class=3D"gmail_default">MemFree,</span></div=
><div class=3D"gmail_quote">but we=C2=A0<span class=3D"gmail_default">somet=
imes also allow situations to break that.=C2=A0</span><span class=3D"gmail_=
default">We&#39;d better</span></div><div class=3D"gmail_quote"><span class=
=3D"gmail_default">count</span><span class=3D"gmail_default">=C2=A0</span>a=
ll of the different free watermarks from /proc/zoneinfo<span class=3D"gmail=
_default">,=C2=A0</span><span class=3D"gmail_default">then</span></div><div=
 class=3D"gmail_quote">add the sum of the low watermarks to MemAvailable, i=
f get a value</div><div class=3D"gmail_quote">larger<span class=3D"gmail_de=
fault" style=3D"font-size:small"> </span>than MemFree, that should be OK fr=
om my perspective.</div><div><div class=3D"gmail_default" style=3D"font-siz=
e:small"></div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">-----</div># ec=
ho 675840 &gt; /proc/sys/vm/min_free_kbytes</div><div><br># cat /proc/memin=
fo |grep -i mem<br>MemTotal: =C2=A0 =C2=A0 =C2=A0 =C2=A05888584 kB<br><span=
 class=3D"gmail_default" style=3D"font-size:small"></span>MemFree: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 4518064 kB<br><span class=3D"gmail_default" style=3D"f=
ont-size:small"></span>MemAvailable: =C2=A0 =C2=A03692008 kB<br>Shmem: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 21128 kB<br>ShmemHugePages: =C2=A0 =
=C2=A0 =C2=A0 =C2=A00 kB<br>ShmemPmdMapped: =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB=
</div><div><span class=3D"gmail_default" style=3D"font-size:small"></span><=
br><br># cat /proc/zoneinfo |grep low<span class=3D"gmail_default" style=3D=
"font-size:small"> -B 3 </span><br><span class=3D"gmail_default" style=3D"f=
ont-size:small">...</span><span class=3D"gmail_default" style=3D"font-size:=
small"></span><br>=C2=A0 pages free =C2=A0 =C2=A0 3840<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 min =C2=A0 =C2=A0 =C2=A0440<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 low =
=C2=A0 =C2=A0 =C2=A0550<br>--<br>Node 0, zone =C2=A0 =C2=A0DMA32<br>=C2=A0 =
pages free =C2=A0 =C2=A0 355602<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 min =C2=A0 =
=C2=A0 =C2=A079706<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 low =C2=A0 =C2=A0 =C2=A09=
9632<br>--<br>Node 0, zone =C2=A0 Normal<br>=C2=A0 pages free =C2=A0 =C2=A0=
 0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 min =C2=A0 =C2=A0 =C2=A00<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 low =C2=A0 =C2=A0 =C2=A00<br>--<br>Node 0, zone =C2=A0Mov=
able<br>=C2=A0 pages free =C2=A0 =C2=A0 0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 mi=
n =C2=A0 =C2=A0 =C2=A00<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 low =C2=A0 =C2=A0 =
=C2=A00<br>--<br>Node 0, zone =C2=A0 Device<br>=C2=A0 pages free =C2=A0 =C2=
=A0 0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 min =C2=A0 =C2=A0 =C2=A00<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 low =C2=A0 =C2=A0 =C2=A00<br>--<br>Node 1, zone =C2=A0=
 =C2=A0 =C2=A0DMA<br>=C2=A0 pages free =C2=A0 =C2=A0 0<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 min =C2=A0 =C2=A0 =C2=A00<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 low =C2=
=A0 =C2=A0 =C2=A00<br>--<br>Node 1, zone =C2=A0 =C2=A0DMA32<br>=C2=A0 pages=
 free =C2=A0 =C2=A0 0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 min =C2=A0 =C2=A0 =C2=
=A00<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 low =C2=A0 =C2=A0 =C2=A00<br>--<br>=C2=
=A0 =C2=A0 =C2=A0 nr_kernel_misc_reclaimable 0<br>=C2=A0 pages free =C2=A0 =
=C2=A0 769192<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 min =C2=A0 =C2=A0 =C2=A088812<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 low =C2=A0 =C2=A0 =C2=A0111015</div><div><br=
><div class=3D"gmail_default" style=3D"font-size:small"></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">(111015+99632+550)*4 + 36920=
08(<span class=3D"gmail_default"></span>MemAvailable) &gt;=C2=A05888584(<sp=
an class=3D"gmail_default"></span>MemFree)</div></div><div><br><div class=
=3D"gmail_quote"><div class=3D"gmail_default" style=3D"font-size:small">Btw=
 the=C2=A0formula to count MemAvailable is:</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">available =3D MemFree - totalreserve_pages + pages[LRU=
_ACTIVE_FILE] + pages[LRU_INACTIVE_FILE] - min(pagecache / 2, wmark_low)</d=
iv></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regar=
ds,<br></div><div>Li Wang<br></div></div></div></div></div></div>

--00000000000060d32805bcb140d6--


--===============0570741636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0570741636==--

