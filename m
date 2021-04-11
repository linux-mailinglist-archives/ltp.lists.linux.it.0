Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C60A35B1C4
	for <lists+linux-ltp@lfdr.de>; Sun, 11 Apr 2021 06:48:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B26A3C1D5C
	for <lists+linux-ltp@lfdr.de>; Sun, 11 Apr 2021 06:48:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 77ADD3C1CF1
 for <ltp@lists.linux.it>; Sun, 11 Apr 2021 06:47:56 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7542C1000525
 for <ltp@lists.linux.it>; Sun, 11 Apr 2021 06:47:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618116472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=2YxmnH3+flA0RZxBD9f3QA9McpT1AAiP/kwUAzxPLBw=;
 b=C5S5plrWw8DyyVk+lO5mXUIJZ+ZaGpofXHDrC/WsTn2V+uqkpee57Zw9rH3XNU8I+srLfQ
 3RLFJLTabq8NJVDQpJmSfDm5QIK+ukSQis7tUJn6gLYIe4XECFPh50Fik5iWqpHwpwncfI
 bONlwVDybXaPXudpzRPiP8B3J/BaMMc=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-gLQIvzwNObSAk6yihjX55w-1; Sun, 11 Apr 2021 00:47:48 -0400
X-MC-Unique: gLQIvzwNObSAk6yihjX55w-1
Received: by mail-yb1-f199.google.com with SMTP id i6so10001347ybk.2
 for <ltp@lists.linux.it>; Sat, 10 Apr 2021 21:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=2YxmnH3+flA0RZxBD9f3QA9McpT1AAiP/kwUAzxPLBw=;
 b=dh84X/nzXeLlRL9v5z7wQNhD6heHuNRho6pDZtMFL5uY455tt92fAWcm1ugvCMKBOI
 B4oHfMtJdVAfR9FT6oV44XoYIpPDVbm4ARNgEAG9Gvj9VwtPOf73G0mTkF8JR73+w32o
 bzudSSG+VRwrgMoJ4/OZ2kSgGHYjgYXNN8/uyJZmBnwohUgPZsAjL3OjRtPn+4hd4ojE
 NTMfXUK3Fv37Bs9lQtGwfvre1xptmZKNe/Pf1GxgHBS7vxq4mCL4Ohqov+FvYHaWs3HH
 7k1KtDkDlplqQhxPt2pjNGNnRWr4z1qsreFVZMWdvVNpwvpopwrXGGSOM7H/xbSfemia
 9msg==
X-Gm-Message-State: AOAM532zPvXKrwKUDfAW7dEji15E1MViWldt23n6h428O/81hE+l5UYv
 wYFDpbKU0eTbEpmcgfDqnbCEGcx/2tGa3flsowYmpEw5puX2IEevg6XcHCL1QTTs7VGbl5ZDEc8
 rkZbf6qzedd4KdzHOQjNKzlPd7PU=
X-Received: by 2002:a25:aca4:: with SMTP id x36mr29409341ybi.97.1618116467458; 
 Sat, 10 Apr 2021 21:47:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxH7A37d3ZqLVDvc+DH4kgCY/f4imuw26hz9kKbFoTqo2Tfyww9BE5SFIljEH+2zxx4lNMYS8o17ehmc+/eMWs=
X-Received: by 2002:a25:aca4:: with SMTP id x36mr29409318ybi.97.1618116467159; 
 Sat, 10 Apr 2021 21:47:47 -0700 (PDT)
MIME-Version: 1.0
From: Li Wang <liwang@redhat.com>
Date: Sun, 11 Apr 2021 12:47:35 +0800
Message-ID: <CAEemH2c63GXZosG+e3=c9FgisYdgx02PnV7pknMpWg6EyjM-AQ@mail.gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <guro@fb.com>,
 Michal Hocko <mhocko@suse.com>, Linux-MM <linux-mm@kvack.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [OVERCOMMIT_GUESS] Broken mmap() for MAP_FAILED (ENOMEM)
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
Cc: Paul Bunyan <pbunyan@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Eirik Fuller <efuller@redhat.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0833068670=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0833068670==
Content-Type: multipart/alternative; boundary="0000000000003b13b805bfab1954"

--0000000000003b13b805bfab1954
Content-Type: text/plain; charset="UTF-8"

Hi Johannes, Roman, and MM experts,

Both Xinpeng and PaulB reports that LTP/ioctl_sg01 always gets OOM killed
on aarch64
( confirmed "x86_64 + kernel-v5.12-rc6" influenced as well) when system
MemAvailable
less than MemFree. With help of Eirik and Chunyu, we found that the problem
only
occurred since below kernel commit:

    commit 8c7829b04c523cdc732cb77f59f03320e09f3386
    Author: Johannes Weiner <hannes@cmpxchg.org>
    Date:   Mon, 13 May 2019 17:21:50 -0700

        mm: fix false-positive OVERCOMMIT_GUESS failures

The mmap() behavior changed in GUESS mode from that, we can NOT receive
MAP_FAILED on ENOMEM in userspace anymore unless the process one-time
allocating memory larger than "total_ram+ total_swap" explicitly, hence, it
does
not look like a heuristics way in memory allocation.

Chunyu and I concern that might be more trouble for users in memory
allocation.

mmap2
 ksys_mmap_pgoff
  vm_mmap_pgoff
   do_mmap
    mmap_region
     // Private writeable mmaping: check memory availability
     security_vm_enough_memory_mm
     __vm_enough_memory

"
   872    int __vm_enough_memory(struct mm_struct *mm, long pages, int
cap_sys_admin)
             ...
   884    if (sysctl_overcommit_memory == OVERCOMMIT_GUESS) {
   885       if (pages > totalram_pages() + total_swap_pages)
   886           goto error;
   887        return 0;
   888    }
"

As __vm_enough_memory() using a consistent upbound on return ENOMEM which
only
make sense for the one-time requested memory size larger than "total_ram +
total_swap",
so all processes in userspace will more easily hit OOM (in
OVERCOMMIT_GUESS) roughly.

Maybe the acceptable way should be to dynamically detect the available/free
memory
according to the running system "free_pages + free_swap_pages" as before.

Any thoughts or suggestions?

=================
To simply show the above issue, I extract a C reproducer as:

Without the kernel commit
# ./mmap_failed
...
map_blocks[1493] = 0xffc525c60000
PASS: MAP_FAILED as expected

After the kernel commit:
# ./mmap_failed
...
map_blocks[1617] = 0x3c0836b0000
map_blocks[1618] = 0x3c0796b0000
Killed                <===== Always Killed by OOM-Killer

-------------------------
# cat mmap_failed.c

#include <stdio.h>
#include <sys/sysinfo.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

#define BLOCKSIZE (160 * 1024 * 1024)

void main(void)
{
    size_t i, maxsize, map_count = 0, blocksize = BLOCKSIZE;
    void **map_blocks;
    struct sysinfo info;

    sysinfo(&info);
    maxsize = (info.freeram + info.freeswap) * info.mem_unit;

    map_count = maxsize / blocksize;
    map_blocks = malloc(map_count * sizeof(void *));

    for (i = 0; i < map_count; i++) {
            map_blocks[i] = mmap(NULL, blocksize, PROT_READ | PROT_WRITE,
            MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);

            // we'd better get MAP_FAILED and break here but not OOM
instantly
            if (map_blocks[i] == MAP_FAILED) {
                map_count = i;
                printf("PASS: MAP_FAILED as expected\n");
                break;
        }

        printf("map_blocks[%d] = %p\n", i, map_blocks[i]);
        memset(map_blocks[i], 1, blocksize);
    }

    for (i = 0; i < map_count; i++)
    munmap(map_blocks[i], blocksize);

    free(map_blocks);
}


--
P.s there is another issue about MemAvailable < MemFree because of reserve
ing
by khugepaged for allocating transparent hugepage, but I don't want to mix
them
in this thread to make things complicated.  @Chunyu, if you can start a new
email
thread that'd be appreciated.

-- 
Regards,
Li Wang

--0000000000003b13b805bfab1954
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"">Hi Johannes, Roman=
, and MM experts,</div><div class=3D"gmail_default" style=3D""><br></div><d=
iv class=3D"gmail_default" style=3D"">Both Xinpeng and PaulB reports that L=
TP/ioctl_sg01 always gets OOM killed on aarch64</div><div class=3D"gmail_de=
fault" style=3D"">( confirmed &quot;x86_64 + kernel-v5.12-rc6&quot; influen=
ced as well) when system MemAvailable</div><div class=3D"gmail_default" sty=
le=3D"">less than MemFree. With help of Eirik and Chunyu, we found that the=
 problem only</div><div class=3D"gmail_default" style=3D"">occurred since b=
elow kernel commit:</div><div class=3D"gmail_default" style=3D""><br></div>=
<div class=3D"gmail_default" style=3D"">=C2=A0 =C2=A0 commit 8c7829b04c523c=
dc732cb77f59f03320e09f3386<br>=C2=A0 =C2=A0 Author: Johannes Weiner &lt;<a =
href=3D"mailto:hannes@cmpxchg.org">hannes@cmpxchg.org</a>&gt;<br>=C2=A0 =C2=
=A0 Date: =C2=A0 Mon, 13 May 2019 17:21:50 -0700<br><br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mm: fix false-positive OVERCOMMIT_GUESS failures</div><div class=
=3D"gmail_default" style=3D""><br></div><div class=3D"gmail_default" style=
=3D"">The mmap() behavior changed=C2=A0<span style=3D"color:rgb(0,0,0);font=
-size:12px">in GUESS mode from=C2=A0</span>that, we can NOT receive</div><d=
iv class=3D"gmail_default" style=3D"">MAP_FAILED on ENOMEM  in userspace=C2=
=A0anymore unless the process one-time</div><div class=3D"gmail_default" st=
yle=3D"">allocating memory larger than &quot;total_ram+=C2=A0total_swap&quo=
t;=C2=A0<span style=3D"color:rgb(51,51,51);font-size:14px">explicitly</span=
>, hence, it does</div><div class=3D"gmail_default" style=3D"">not look lik=
e a heuristics way in memory allocation.=C2=A0</div><div class=3D"gmail_def=
ault" style=3D""><br></div><div class=3D"gmail_default" style=3D"">Chunyu a=
nd I concern that might be more trouble for users in memory allocation.</di=
v><div class=3D"gmail_default" style=3D""><br></div><div><div>mmap2<br>=C2=
=A0ksys_mmap_pgoff<br>=C2=A0 vm_mmap_pgoff<br>=C2=A0 =C2=A0do_mmap<br>=C2=
=A0 =C2=A0 mmap_region<br>=C2=A0 =C2=A0 =C2=A0// Private writeable mmaping:=
 check memory availability<br>=C2=A0 =C2=A0 =C2=A0security_vm_enough_memory=
_mm<br><span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=
=A0 =C2=A0</span>__vm_enough_memory<br></div><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">&quot;</div></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0872=C2=A0 =C2=
=A0 int __vm_enough_memory(struct mm_struct *mm, long pages, int cap_sys_ad=
min)</div><div class=3D"gmail_default">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0...</div><div class=3D"gmail_default">=C2=A0 =C2=A0884=C2=A0 =
=C2=A0 if (sysctl_overcommit_memory =3D=3D OVERCOMMIT_GUESS) {<br>=C2=A0 =
=C2=A0885=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pages &gt; totalram_pages() + total=
_swap_pages)<br>=C2=A0 =C2=A0886=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0go=
to error;<br>=C2=A0 =C2=A0887=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br></div=
><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0888=C2=
=A0 =C2=A0 }</div><div class=3D"gmail_default" style=3D"font-size:small">&q=
uot;</div><br></div><div><div class=3D"gmail_default" style=3D"">As __vm_en=
ough_memory() using a consistent upbound on return ENOMEM which only</div><=
div class=3D"gmail_default" style=3D"">make sense for the one-time requeste=
d memory size larger than &quot;total_ram=C2=A0+ total_swap&quot;,<br>so al=
l processes in userspace will more easily hit OOM (in OVERCOMMIT_GUESS) rou=
ghly.</div><div class=3D"gmail_default" style=3D""><br>Maybe the acceptable=
 way should be to dynamically detect the available/free memory</div><div cl=
ass=3D"gmail_default" style=3D"">according to the running system &quot;free=
_pages + free_swap_pages&quot; as before.</div></div><div class=3D"gmail_de=
fault" style=3D""><br></div><div class=3D"gmail_default" style=3D"">Any tho=
ughts or suggestions?</div><div><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small"></div></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</d=
iv><div class=3D"gmail_default" style=3D"">To simply show the above issue, =
I extract a C reproducer as:</div><div class=3D"gmail_default" style=3D""><=
br></div><div class=3D"gmail_default" style=3D"">Without the kernel commit<=
/div><div class=3D"gmail_default" style=3D""># ./mmap_failed</div><div clas=
s=3D"gmail_default" style=3D"">...</div>map_blocks[1493] =3D 0xffc525c60000=
<br><div>PASS: MAP_FAILED as expected</div><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">After the kernel commit:</div>=
<div class=3D"gmail_default" style=3D""># ./mmap_failed</div><div class=3D"=
gmail_default" style=3D"">...<br>map_blocks[1617] =3D 0x3c0836b0000<br>map_=
blocks[1618] =3D 0x3c0796b0000<br>Killed=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &lt;=3D=3D=3D=3D=3D Always Killed by OOM-Killer<br></d=
iv><div class=3D"gmail_default" style=3D""><br></div><div class=3D"gmail_de=
fault" style=3D"">-------------------------</div><div class=3D"gmail_defaul=
t" style=3D""># cat mmap_failed.c<br></div><div class=3D"gmail_default" sty=
le=3D""><br></div><div class=3D"gmail_default" style=3D"">#include &lt;stdi=
o.h&gt;<br>#include &lt;sys/sysinfo.h&gt;<br>#include &lt;stdlib.h&gt;<br>#=
include &lt;string.h&gt;<br>#include &lt;sys/mman.h&gt;<br><br>#define BLOC=
KSIZE (160 * 1024 * 1024)<br><br>void main(void)<br>{<br>=C2=A0 =C2=A0 size=
_t i, maxsize, map_count =3D 0, blocksize =3D BLOCKSIZE;<br>=C2=A0 =C2=A0 v=
oid **map_blocks;<br>=C2=A0 =C2=A0 struct sysinfo info;<br><br>=C2=A0 =C2=
=A0 sysinfo(&amp;info);<br>=C2=A0 =C2=A0 maxsize =3D (info.freeram + info.f=
reeswap) * info.mem_unit;<br><br>=C2=A0 =C2=A0 map_count =3D maxsize / bloc=
ksize;<br>=C2=A0 =C2=A0 map_blocks =3D malloc(map_count * sizeof(void *));<=
br><br>=C2=A0 =C2=A0 for (i =3D 0; i &lt; map_count; i++) {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 map_blocks[i] =3D mmap(NULL, blocksize, PRO=
T_READ | PROT_WRITE,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAP_PRIVA=
TE | MAP_ANONYMOUS, -1, 0);<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // we&#39;d better get MAP_FAILED and break here but not OOM instantly<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (map_blocks[i] =3D=3D MAP_F=
AILED) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 map_cou=
nt =3D i;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf=
(&quot;PASS: MAP_FAILED as expected\n&quot;);<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;map_blocks[%d] =3D %p\n&quot;,=
 i, map_blocks[i]);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(map_blocks[i], 1,=
 blocksize);<br>=C2=A0 =C2=A0 }<br><br>=C2=A0 =C2=A0 for (i =3D 0; i &lt; m=
ap_count; i++)<br>=C2=A0 =C2=A0 munmap(map_blocks[i], blocksize);<br><br>=
=C2=A0 =C2=A0 free(map_blocks);<br>}<br></div><div><br></div><div><br></div=
><div><div><div class=3D"gmail_default" style=3D"font-size:small">--</div>P=
.s<span class=3D"gmail_default"></span>=C2=A0<span class=3D"gmail_default" =
style=3D"font-size:small">there</span>=C2=A0is another issue<span class=3D"=
gmail_default" style=3D"font-size:small"> about</span> MemAvailable &lt; Me=
mFree<span class=3D"gmail_default" style=3D"font-size:small"> because of</s=
pan>=C2=A0<span class=3D"gmail_default" style=3D"font-size:small"></span><s=
pan style=3D"color:rgb(0,0,0);white-space:pre-wrap">reserve<span class=3D"g=
mail_default" style=3D"font-size:small">ing</span></span></div><div><span s=
tyle=3D"color:rgb(0,0,0);white-space:pre-wrap">by<span class=3D"gmail_defau=
lt" style=3D"font-size:small"> </span></span><span style=3D"color:rgb(0,0,0=
);white-space:pre-wrap">khugepaged for<span class=3D"gmail_default"> </span=
></span><span style=3D"color:rgb(0,0,0);white-space:pre-wrap">allocating tr=
ansparent hugepage</span>, but I don&#39;t want to <span class=3D"gmail_def=
ault" style=3D"font-size:small">mix</span>=C2=A0<span class=3D"gmail_defaul=
t">them</span></div><div>in this thread to make<span class=3D"gmail_default=
"> </span>things <span class=3D"gmail_default" style=3D"font-size:small">co=
mplicated</span><span class=3D"gmail_default">.=C2=A0 @</span><span class=
=3D"gmail_default">Chunyu, if you can start a new email</span></div><div><s=
pan class=3D"gmail_default">thread that&#39;d be appreciated.</span></div><=
/div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-=
smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>=
Li Wang<br><br><br></div></div></div></div></div></div>

--0000000000003b13b805bfab1954--


--===============0833068670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0833068670==--

