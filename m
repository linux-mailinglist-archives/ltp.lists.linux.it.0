Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 415DC2E7FCB
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Dec 2020 12:55:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFAC93C55BD
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Dec 2020 12:55:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id CE9DB3C2869
 for <ltp@lists.linux.it>; Thu, 31 Dec 2020 12:55:08 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id C704A1A00A31
 for <ltp@lists.linux.it>; Thu, 31 Dec 2020 12:55:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609415706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rAZHRyN8JIXOhHhFZfsyAdXV0Lb7xbu2YebChbqiSo0=;
 b=H95dtQ3RLHAF82L2ppUZPl/blPaogFO4aFD3zdvmcrymmPhvIBpk10vJtCwBrsDLctuq8i
 ofznuFDqZz3fmLOfum5UVllQ3xPTha2qWxqYDCzE09uWXKmKQgkFmbdI6E7nStY53cuupT
 P73GWQEo2vQMCZes9LT8hMcvatLWEwA=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-EnDnq7WyOsayesC1vIID3Q-1; Thu, 31 Dec 2020 06:55:03 -0500
X-MC-Unique: EnDnq7WyOsayesC1vIID3Q-1
Received: by mail-yb1-f200.google.com with SMTP id g17so33354212ybh.5
 for <ltp@lists.linux.it>; Thu, 31 Dec 2020 03:55:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rAZHRyN8JIXOhHhFZfsyAdXV0Lb7xbu2YebChbqiSo0=;
 b=J4MtOJEv2pQHIA0mV4ZN/sNl22xf4feuGuzUIV2wTJvhSHo8J4FfFcPUeYIM25TrVD
 t0MPS7Fgc7p2FlGSVj2dctHTMRTIsxEfoLfkbV3C1fNZLFVIQcNzk+gA0nbmL9UzKVbY
 DVrJ85GMs9ej5cpTCg3csrny9G5V17h5APqFaUwNlaJ5+1MmNfz5iyqfcOD36iYxiaSl
 tZNyqIL98y8zR4jBoGviUI0HquveKnAf4fB/jlCXd71hxjJE9aTefM7Pj1DE/c0hlAGT
 kG86LD76ZM2vFNDhGBddsZMW45TdJ6OMZStDADn7xguvVuLW8fIlWmz45AZhVoUu9r1T
 IbtA==
X-Gm-Message-State: AOAM530Pgua1VkJcRHuWl+TBIRFA0Vk1h/gANrKBrFxjfKZY/Cnw/Bkg
 GJXqwHQleIoIgchk//+J3Oez55D0/3sK+nGS30JK98tgg1PxLE1d+VWOXzibijodqVV5I66TnlW
 +Q+AFxdizLvgkpS+pJPy1tmehNqY=
X-Received: by 2002:a5b:810:: with SMTP id x16mr81950051ybp.86.1609415702488; 
 Thu, 31 Dec 2020 03:55:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3hoXIrTwqHQ6WmAVEqJMhOsMucOYXDsKfVxjsKK5yG7agj0Jc7JgJWzY5KHz1qBGKhfhMz+Z7LL40LU34/Vg=
X-Received: by 2002:a5b:810:: with SMTP id x16mr81950030ybp.86.1609415702250; 
 Thu, 31 Dec 2020 03:55:02 -0800 (PST)
MIME-Version: 1.0
References: <20201216100121.16683-1-rpalethorpe@suse.com>
In-Reply-To: <20201216100121.16683-1-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 31 Dec 2020 19:19:29 +0800
Message-ID: <CAEemH2dR+W8ypMED_xqw2JVO7E_Y0Kp+0iS=QVH_h2r0pDBVJA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
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
Subject: Re: [LTP] [RFC PATCH 0/5] CGroups
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
Content-Type: multipart/mixed; boundary="===============1985383425=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1985383425==
Content-Type: multipart/alternative; boundary="0000000000003ac0ca05b7c14b49"

--0000000000003ac0ca05b7c14b49
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Thanks for your work, comments see below.

On Wed, Dec 16, 2020 at 6:02 PM Richard Palethorpe via ltp <
ltp@lists.linux.it> wrote:

> This is a request for comment on a new CGroups API. I have tried to
> keep the existing API functions, but there are many changes in the
> implementation. Please see the commit message to "CGroup API rewrite"
> in this series.
>
> A previous failed attempt to correct some problems and discussion is
> here: http://lists.linux.it/pipermail/ltp/2020-November/019586.html
> This is a much bigger change than I would like, but CGroups make it
> very difficult to do anything simply.
>
> I have done a direct conversion of the test cases to the new API, but
> I am not sure that it makes sense to call tst_cgroup_move_current
> within the run method of a test because after the first iteration it
>

Hmm, I feel that is a rare scenario in our real test. Mostly we
just need to set it once in a process.

Also, another race condition we are facing is to set the same
hierarchy in a different process parallel. i.e.

// Child_1: set MEMSIZE maxbytes
if (fork() == 0) {
    tst_cgroup_move_current(TST_CGROUP_MEMORY);
    tst_cgroup_mem_set_maxbytes(MEMSIZE);
}
// Child_2: set MEMSIZE/2 maxbytes
if (fork() == 0) {
    tst_cgroup_move_current(TST_CGROUP_MEMORY);
    tst_cgroup_mem_set_maxbytes(MEMSIZE/2);
}

For the previous CGroup test-lib, we solved that via mount the
same controller at different places. In this new CGroup lib, I guess
creating dynamic directories in tst_cgroup_move_current might
work for us, and I'll comment more about it in patch2/5.


> will be a NOP. There is also the issue that on the unified hierarchy
> when calling
>
> tst_cgroup_move_current(TST_CGROUP_MEMORY);
> ... testing ...
> tst_cgroup_move_current(TST_CGROUP_CPUSET);
>
> the second call is a NOP as there is only one CGroup, but when the
> hierarchies are mounted seperately on V1 the current process will not
> be added to cpuset CGroup until the second call. We probably do not
> want different behaviour between commonly used hierarchies.
>

That's true, but it is mainly caused by different versions of
CGroup. We could NOT unify the unsupported behavior, so
maybe the wiser choice is to let _CPUSET test skipping(TCONF)
directly on CGroup_V2?


>
> In a lot of cases, the test probably only requires the process to be
> moved into a CGroup during setup, but this requires an investigation
> of each test. Some tests scan for NUMA information and use this in the
> CGroup config which complicates matters. However it seems unlikely to
> me that the available NUMA nodes will change between test iterations
> unless we are testing hotplugging or failover.
>
> For tests which are actually testing CGroups themselves, most of the
> API is too high-level. Please see the kernel self tests for what may
> be required for those kinds of tests.
>
> This is not meant for full review and has not been tested on older
> setups yet.


-- 
Regards,
Li Wang

--0000000000003ac0ca05b7c14b49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Richard,</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>Thanks for your work, comments=C2=A0see below.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 16, 2020=
 at 6:02 PM Richard Palethorpe via ltp &lt;<a href=3D"mailto:ltp@lists.linu=
x.it">ltp@lists.linux.it</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">This is a request for comment on a new CGroups API.=
 I have tried to<br>
keep the existing API functions, but there are many changes in the<br>
implementation. Please see the commit message to &quot;CGroup API rewrite&q=
uot;<br>
in this series.<br>
<br>
A previous failed attempt to correct some problems and discussion is<br>
here: <a href=3D"http://lists.linux.it/pipermail/ltp/2020-November/019586.h=
tml" rel=3D"noreferrer" target=3D"_blank">http://lists.linux.it/pipermail/l=
tp/2020-November/019586.html</a><br>
This is a much bigger change than I would like, but CGroups make it<br>
very difficult to do anything simply.<br>
<br>
I have done a direct conversion of the test cases to the new API, but<br>
I am not sure that it makes sense to call <span class=3D"gmail_default" sty=
le=3D"font-size:small"></span>tst_cgroup_move_current<br>
within the run method of a test because after the first iteration it<br></b=
lockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-si=
ze:small">Hmm, I feel that is a rare scenario in our real test. Mostly we</=
div><div class=3D"gmail_default" style=3D"font-size:small">just need to set=
 it once in a process.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Al=
so, another race condition we are facing is to set the same</div><div class=
=3D"gmail_default" style=3D"font-size:small">hierarchy in a different proce=
ss parallel. i.e.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">// Chil=
d_1: set MEMSIZE maxbytes</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">if (fork() =3D=3D 0) {</div><div class=3D"gmail_default" style=
=3D"font-size:small">=C2=A0 =C2=A0=C2=A0<span class=3D"gmail_default"></spa=
n>tst_cgroup_move_current(TST_CGROUP_MEMORY);</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">=C2=A0 =C2=A0=C2=A0tst_cgroup_mem_set_maxbyt=
es(MEMSIZE);</div><div class=3D"gmail_default" style=3D"font-size:small">}<=
/div><div class=3D"gmail_default" style=3D"font-size:small">// Child_2: set=
 MEMSIZE/2 maxbytes</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">if (fork() =3D=3D 0) {</div><div class=3D"gmail_default">=C2=A0 =C2=A0=
=C2=A0<span class=3D"gmail_default"></span>tst_cgroup_move_current(TST_CGRO=
UP_MEMORY);</div><div class=3D"gmail_default">=C2=A0 =C2=A0 tst_cgroup_mem_=
set_maxbytes(MEMSIZE/2);</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">}</div><br></div><div><div class=3D"gmail_default" style=3D"font-=
size:small">For the previous CGroup test-lib, we solved that via mount the<=
/div><div class=3D"gmail_default" style=3D"font-size:small">same controller=
 at different places. In this new CGroup lib, I guess</div><div class=3D"gm=
ail_default" style=3D"font-size:small">creating dynamic directories in tst_=
cgroup_move_current might</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">work for us, and I&#39;ll comment more about=C2=A0it=C2=A0in pat=
ch2/5.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
will be a NOP. There is also the issue that on the unified hierarchy<br>
when calling<br>
<br>
<span class=3D"gmail_default" style=3D"font-size:small"></span>tst_cgroup_m=
ove_current(TST_CGROUP_MEMORY);<br>
... testing ...<br>
tst_cgroup_move_current(TST_CGROUP_<span class=3D"gmail_default" style=3D"f=
ont-size:small"></span>CPUSET);<br>
<br>
the second call is a NOP as there is only one CGroup, but when the<br>
hierarchies are mounted seperately on V1 the current process will not<br>
be added to cpuset CGroup until the second call. We probably do not<br>
want different behaviour between commonly used hierarchies.<br></blockquote=
><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small"=
>That&#39;s true, but it is mainly caused by different versions of</div><di=
v class=3D"gmail_default" style=3D"font-size:small">CGroup. We could NOT un=
ify the unsupported behavior, so</div><div class=3D"gmail_default" style=3D=
"font-size:small">maybe the wiser choice is to let=C2=A0<span class=3D"gmai=
l_default"></span>_CPUSET test skipping(TCONF)</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">directly on CGroup_V2?</div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
In a lot of cases, the test probably only requires the process to be<br>
moved into a CGroup during setup, but this requires an investigation<br>
of each test. Some tests scan for NUMA information and use this in the<br>
CGroup config which complicates matters. However it seems unlikely to<br>
me that the available NUMA nodes will change between test iterations<br>
unless we are testing hotplugging or failover.<br>
<br>
For tests which are actually testing CGroups themselves, most of the<br>
API is too high-level. Please see the kernel self tests for what may<br>
be required for those kinds of tests.<br>
<br>
This is not meant for full review and has not been tested on older<br>
setups yet.</blockquote></div><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<b=
r></div></div></div></div>

--0000000000003ac0ca05b7c14b49--


--===============1985383425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1985383425==--

