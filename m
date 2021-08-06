Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BD33E2620
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 10:30:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C5C73C7AEE
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 10:29:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CE1A53C181C
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 10:29:55 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 094181A01447
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 10:29:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628238593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mdZRMyt6HdFL+81Q4GgKP3yFv9kMcdJR59aIftNCn64=;
 b=bgQMjwR/CyEJqePzjvcfBUrflUfR9DHNOONoS0LvLz6x/KaiZ1/QKjlWraBV+8/KjC4rJo
 HWub2UXmKtIccurwj5fCH2/bpPoJw8jNnSoDwBToeenT4nxD+gIQWV7OuCPTe3k7xhWuIY
 mIPbrrjLZibqqiQvMajoEXxvqFRCOC8=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-fSUzw8oeMvqY96dOQrqOag-1; Fri, 06 Aug 2021 04:29:51 -0400
X-MC-Unique: fSUzw8oeMvqY96dOQrqOag-1
Received: by mail-yb1-f198.google.com with SMTP id
 i32-20020a25b2200000b02904ed415d9d84so8827046ybj.0
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 01:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ifxk82ljQssYL5viFddlXDCXuwNUjBlwayPa9VtSUI=;
 b=Vtxn/mqAJKDeNyrQrwA73u5/F9yn9sfGQTrVzQFTe99HWqT3OoLbtoS9qJPG7WQ6+F
 x/PWtTmKMKMmnBlww8fnPj8ehTumr15MyGFKpCbBEbeIceEnWo1xjtm6OR2Xs/kSWxOV
 mum6m7wNVbiKBtpE5pAMQQJBjeZb1hmSrQAjW1hpSfJUuQvc97XiMmMzIi7ME7c8a3e0
 rSOtLjpkK5mKkrBhlxGJD6nct8wEVwT/pdkirYHQduDkvwrV+QrM4hjfQ5c9eRvzDOfA
 jYme0rwuKDTMFOEi3CuPNGH7iiqzCGbF94B+GZifZC4csnrz3uSMDKzx/YrH53ydbOH+
 vrLg==
X-Gm-Message-State: AOAM531HdCab+UYB41ZHPsLLV9L0pj4T6RA0MRHzS9YmVLFN3W38LWZI
 7EqM9w6TyN1iaFz0e7gXU9nbboh52iW0t8mLcpF2JpSSfyVP3xy1y8qSKCPvjDe0zAxS4iSBfsl
 4SdqbEuUebPo4pGIQ2sjg//kPwUM=
X-Received: by 2002:a25:6e05:: with SMTP id j5mr11676949ybc.86.1628238590467; 
 Fri, 06 Aug 2021 01:29:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOnGYkNmQHQXzsBVEhkgEOZXKQ1kbB/zoUu49zG0U+s1j+iPY0rBNi4pdcNdWUXFzab/L+XXYHiKfTRRuVCGw=
X-Received: by 2002:a25:6e05:: with SMTP id j5mr11676921ybc.86.1628238590156; 
 Fri, 06 Aug 2021 01:29:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210806025659.1962902-1-liwang@redhat.com>
 <YQzLUUKbLcoJjRVb@pevik> <YQzOxg35JjpDOj7X@pevik>
In-Reply-To: <YQzOxg35JjpDOj7X@pevik>
From: Li Wang <liwang@redhat.com>
Date: Fri, 6 Aug 2021 16:29:38 +0800
Message-ID: <CAEemH2cNk-L1kRRHy=vvLVjcEm0HPQXaz8fJR00M1TyzoJAynw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED] setsockopt08: includes netinet/in.h
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
Cc: LTP List <ltp@lists.linux.it>, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: multipart/mixed; boundary="===============0815108236=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0815108236==
Content-Type: multipart/alternative; boundary="000000000000c6c28d05c8dfd679"

--000000000000c6c28d05c8dfd679
Content-Type: text/plain; charset="UTF-8"

Hi Petr,



> > > See:
> https://www.mail-archive.com/netdev@vger.kernel.org/msg132711.html
>
> > Thanks for fixing it, it's not a first time we got hit by this.
> > I wonder where <linux/in.h> is included. It's not directly in
> setsockopt08.c,
> > it must be in our lapi header. But it's not in tst_safe_net.h, not in
> > safe_net_fn.h nor in tst_net.h and both actually include <netinet/in.h>,
> thus it must be
> > before. But there is only tst_test.h.
>
> > I'm asking because it'd be better to add <netinet/in.h> into header
> before
> > <linux/in.h>.
>
> OK, it's in lapi/ip_tables.h, which includes
> <linux/netfilter_ipv4/ip_tables.h>
> which includes <linux/if.h>. But I wonder why inclusion of <netinet/in.h>
> from
>

No, it's not caused by the lapi/ip_tables.h which finally includes
<linux/if.h>.
See experiment commit:
https://github.com/wangli5665/ltp/commit/f1a37712c63472b19d3355446fb66e651b4a186e

The conflict happened early in tst_test.h and I guess some header files
between line#14 to line#44 probably involves <linux/if.h>, but I'm not sure
which one is the culprit.

If we simply put the <netinet/in.h> at the top of tst_test.h, the
conflict disappears
as well.
See experiment commit:
https://github.com/wangli5665/ltp/commit/0155df479811d9a51f30e09accb330238607f73d

$ cat include/tst_test.h  -n
...
    14 #include <unistd.h>
    15 #include <limits.h>
    16 #include <string.h>
    17 #include <errno.h>
    18
    19 #include "tst_common.h"
    20 #include "tst_res_flags.h"
    21 #include "tst_test_macros.h"
    22 #include "tst_checkpoint.h"
    23 #include "tst_device.h"
    24 #include "tst_mkfs.h"
    25 #include "tst_fs.h"
    26 #include "tst_pid.h"
    27 #include "tst_cmd.h"
    28 #include "tst_cpu.h"
    29 #include "tst_process_state.h"
    30 #include "tst_atomic.h"
    31 #include "tst_kvercmp.h"
    32 #include "tst_kernel.h"
    33 #include "tst_minmax.h"
    34 #include "tst_get_bad_addr.h"
    35 #include "tst_path_has_mnt_flags.h"
    36 #include "tst_sys_conf.h"
    37 #include "tst_coredump.h"
    38 #include "tst_buffers.h"
    39 #include "tst_capability.h"
    40 #include "tst_hugepage.h"
    41 #include "tst_assert.h"
    42 #include "tst_lockdown.h"
    43 #include "tst_fips.h"
    44 #include "tst_taint.h"
...
    93 #include "tst_safe_macros.h"
    94 #include "tst_safe_file_ops.h"
    95 #include "tst_safe_net.h"    <===== includes the <netinet/in.h> here
    96 #include "tst_clone.h"

-- 
Regards,
Li Wang

--000000000000c6c28d05c8dfd679
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><div class=3D"gmail_quote"><div>=C2=A0</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &gt; See: <a href=3D"https://www.mail-archive.com/netdev@vger.kernel.o=
rg/msg132711.html" rel=3D"noreferrer" target=3D"_blank">https://www.mail-ar=
chive.com/netdev@vger.kernel.org/msg132711.html</a><br>
<br>
&gt; Thanks for fixing it, it&#39;s not a first time we got hit by this.<br=
>
&gt; I wonder where &lt;linux/in.h&gt; is included. It&#39;s not directly i=
n setsockopt08.c,<br>
&gt; it must be in our lapi header. But it&#39;s not in tst_safe_net.h, not=
 in<br>
&gt; safe_net_fn.h nor in tst_net.h and both actually include &lt;netinet/i=
n.h&gt;, thus it must be<br>
&gt; before. But there is only tst_test.h.<br>
<br>
&gt; I&#39;m asking because it&#39;d be better to add &lt;netinet/in.h&gt; =
into header before<br>
&gt; &lt;linux/in.h&gt;.<br>
<br>
OK, it&#39;s in lapi/ip_tables.h, which includes &lt;linux/netfilter_ipv4/i=
p_tables.h&gt;<br>
which includes &lt;linux/if.h&gt;. But I wonder why inclusion of &lt;netine=
t/in.h&gt; from<br></blockquote><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">No, it&#39;s not caused by the lapi/ip_tabl=
es.h which finally includes &lt;linux/if.h&gt;.</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">See experiment commit:=C2=A0</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><a href=3D"https://github.co=
m/wangli5665/ltp/commit/f1a37712c63472b19d3355446fb66e651b4a186e">https://g=
ithub.com/wangli5665/ltp/commit/f1a37712c63472b19d3355446fb66e651b4a186e</a=
></div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">The conflict happened e=
arly in tst_test.h and I guess some header files</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">between line#14 to line#44 probably invol=
ves &lt;linux/if.h&gt;, but I&#39;m not sure</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">which one is the=C2=A0culprit.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">If we simply put the=C2=A0<span class=
=3D"gmail_default"></span>&lt;netinet/in.h&gt;<span class=3D"gmail_default"=
> at the top of tst_test.h, the conflict=C2=A0</span>disappears as well.</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">See experiment co=
mmit:</div><div class=3D"gmail_default" style=3D"font-size:small"><a href=
=3D"https://github.com/wangli5665/ltp/commit/0155df479811d9a51f30e09accb330=
238607f73d">https://github.com/wangli5665/ltp/commit/0155df479811d9a51f30e0=
9accb330238607f73d<br></a></div><br></div><div><div class=3D"gmail_default"=
 style=3D"font-size:small">$ cat include/tst_test.h =C2=A0-n</div><span cla=
ss=3D"gmail_default" style=3D"font-size:small">...</span><br>=C2=A0 =C2=A0 =
14=09#include &lt;unistd.h&gt;<br>=C2=A0 =C2=A0 15=09#include &lt;limits.h&=
gt;<br>=C2=A0 =C2=A0 16=09#include &lt;string.h&gt;<br>=C2=A0 =C2=A0 17=09#=
include &lt;errno.h&gt;<br>=C2=A0 =C2=A0 18=09<br>=C2=A0 =C2=A0 19=09#inclu=
de &quot;tst_common.h&quot;<br>=C2=A0 =C2=A0 20=09#include &quot;tst_res_fl=
ags.h&quot;<br>=C2=A0 =C2=A0 21=09#include &quot;tst_test_macros.h&quot;<br=
>=C2=A0 =C2=A0 22=09#include &quot;tst_checkpoint.h&quot;<br>=C2=A0 =C2=A0 =
23=09#include &quot;tst_device.h&quot;<br>=C2=A0 =C2=A0 24=09#include &quot=
;tst_mkfs.h&quot;<br>=C2=A0 =C2=A0 25=09#include &quot;tst_fs.h&quot;<br>=
=C2=A0 =C2=A0 26=09#include &quot;tst_pid.h&quot;<br>=C2=A0 =C2=A0 27=09#in=
clude &quot;tst_cmd.h&quot;<br>=C2=A0 =C2=A0 28=09#include &quot;tst_cpu.h&=
quot;<br>=C2=A0 =C2=A0 29=09#include &quot;tst_process_state.h&quot;<br>=C2=
=A0 =C2=A0 30=09#include &quot;tst_atomic.h&quot;<br>=C2=A0 =C2=A0 31=09#in=
clude &quot;tst_kvercmp.h&quot;<br>=C2=A0 =C2=A0 32=09#include &quot;tst_ke=
rnel.h&quot;<br>=C2=A0 =C2=A0 33=09#include &quot;tst_minmax.h&quot;<br>=C2=
=A0 =C2=A0 34=09#include &quot;tst_get_bad_addr.h&quot;<br>=C2=A0 =C2=A0 35=
=09#include &quot;tst_path_has_mnt_flags.h&quot;<br>=C2=A0 =C2=A0 36=09#inc=
lude &quot;tst_sys_conf.h&quot;<br>=C2=A0 =C2=A0 37=09#include &quot;tst_co=
redump.h&quot;<br>=C2=A0 =C2=A0 38=09#include &quot;tst_buffers.h&quot;<br>=
=C2=A0 =C2=A0 39=09#include &quot;tst_capability.h&quot;<br>=C2=A0 =C2=A0 4=
0=09#include &quot;tst_hugepage.h&quot;<br>=C2=A0 =C2=A0 41=09#include &quo=
t;tst_assert.h&quot;<br>=C2=A0 =C2=A0 42=09#include &quot;tst_lockdown.h&qu=
ot;<br>=C2=A0 =C2=A0 43=09#include &quot;tst_fips.h&quot;<br>=C2=A0 =C2=A0 =
44=09#include &quot;tst_taint.h&quot;<br><div class=3D"gmail_default" style=
=3D"font-size:small">...</div>=C2=A0 =C2=A0 93=09#include &quot;tst_safe_ma=
cros.h&quot;<br>=C2=A0 =C2=A0 94=09#include &quot;tst_safe_file_ops.h&quot;=
<br>=C2=A0 =C2=A0 95=09#include &quot;tst_safe_net.h&quot;<span class=3D"gm=
ail_default" style=3D"font-size:small">=C2=A0 =C2=A0 &lt;=3D=3D=3D=3D=3D in=
cludes the </span>&lt;netinet/in.h&gt;<span class=3D"gmail_default" style=
=3D"font-size:small"> here</span><br>=C2=A0 =C2=A0 96=09#include &quot;tst_=
clone.h&quot;<br><div class=3D"gmail_default" style=3D"font-size:small"></d=
iv></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signat=
ure"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></=
div></div>

--000000000000c6c28d05c8dfd679--


--===============0815108236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0815108236==--

