Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5639E2757CF
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 14:24:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 001ED3C4D3C
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 14:24:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 686603C4D55
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 14:24:07 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id F36EB600071
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 14:24:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600863844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BvAm426bJIAQqjpWvyxVDCoA1PPG/RGNzQRaw2+YtGc=;
 b=W2p1BREHe4RjwuiDFOn9inEcamj6B70bfTyOEIOJw/u4KhuMFsR0fTv8EFkLEAPq7BSN9J
 lTX58DTDwxMHqG4Gs1+eipZJRg73Uq8tjosLQOgBFK+v2bACpl+ED8LJ+o59d7pZdM+66Z
 SNm1/Da+m1M3uTC9Y8SCaD+0TYduTy0=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-AagpNvh0NpyvP8VWYkBZSQ-1; Wed, 23 Sep 2020 08:24:02 -0400
X-MC-Unique: AagpNvh0NpyvP8VWYkBZSQ-1
Received: by mail-yb1-f200.google.com with SMTP id z40so18802137ybi.3
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 05:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BvAm426bJIAQqjpWvyxVDCoA1PPG/RGNzQRaw2+YtGc=;
 b=I60XNtW2vW/T2PxVw9DGotzFqdJXwLIzCFJiDjqVP3z9dJaFv8wzLuJwdlh3moUH+c
 kbBO0seFBbZlWMEJBYez252wO1vrYw5h1jMBF1vYb7gS82js4BoPQYI1/df48imsKqhn
 VGMBF0f67ZCB1fijH1ZFyAq+HuSE2kJCgHysgqDWuOnZQO7BAL8nJpnrmtR7B7nynClH
 aZHBNQNS+N+Es/e89G0GWY0zHgD98ZohrydbduaFNHVLuqumNPuZtUbbJQVgVOS0TiYL
 SYxLT4QJlMdVfQOyX+Nb+U7gIWLP9uekQJpB+1AqLCtkrtAbqrEbLyMmGoSOep3NKQ8M
 PvHA==
X-Gm-Message-State: AOAM532EuhAhlxY8WxmrQ5KoAiDykH9yh2lnKqJ+74TurhQYYB6vTHd5
 Krkshg0BbuMLLQCWUs0wHXfswP1yvcUf2RDT1NB2v+QF6Q0QWUwkG4LG50dsYgQXI87v7b8kSld
 fNH948e/gsPtbhMYs8n6Oc3m22AE=
X-Received: by 2002:a25:1cc3:: with SMTP id
 c186mr13548879ybc.252.1600863841644; 
 Wed, 23 Sep 2020 05:24:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoQIghp5aLGqS0wStFjm+t5RLNnwVPu8B3ec6sw20xcO3zoZfbTeYvxloeEb26FdxoQp4mbKsQwSJVAYJAsHs=
X-Received: by 2002:a25:1cc3:: with SMTP id
 c186mr13548858ybc.252.1600863841396; 
 Wed, 23 Sep 2020 05:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200609095102.21153-1-liwang@redhat.com> <87pn6cycui.fsf@suse.de>
In-Reply-To: <87pn6cycui.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Wed, 23 Sep 2020 20:23:49 +0800
Message-ID: <CAEemH2eqPgS=2n5NAgiVgE6Q+mie0=hiu-wn1OCrxPNEHnd1BA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/4] lib: add new cgroup test API
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
Cc: chrubis@suze.cz, pvorel@suze.cz, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0796871047=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0796871047==
Content-Type: multipart/alternative; boundary="00000000000099cb0a05affa288d"

--00000000000099cb0a05affa288d
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 23, 2020 at 7:03 PM Richard Palethorpe <rpalethorpe@suse.de>
wrote:

> Hello,
>
> Li Wang <liwang@redhat.com> writes:
>
> > Many of our LTP tests need Control Group in the configuration,
> > this patch makes cgroup unified mounting at setup phase to be
> > possible. The method is extracted from mem.h with the purpose
> > of extendible for further developing, and trying to compatible
> > the current two versions of cgroup,
> >
> > It's hard to make all APIs be strictly consistent because there
> > are many differences between v1 and v2. But it capsulate the detail
> > of cgroup mounting in high-level functions, which will be easier
> > to use cgroup without considering too much technical thing.
> >
> > Btw, test get passed on RHEL7(x86_64), RHEL8(ppc64le),
> > Fedora32(x86_64).
>
> This appears to be broken on SUSE.
>
> > +enum tst_cgroup_ver tst_cgroup_version(void)
> > +{
> > +     if (tst_cgroup_check("cgroup2")) {
> > +             if (!tst_is_mounted("cgroup2") && tst_is_mounted("cgroup"))
>
> Unfortunately this is backwards: if a cgroup controller is mounted
> (e.g. memory) in the v1 separated hierarchy then it is not available in
> the cgroup v2 unified hierarchy even though the v2 unified hierarchy
> exists.
>

That's on purpose because we don't want the user to mix v1 and v2 in using.
In other words, if a version of cgroup has been chosen on a SUT then LTP
follows in the same version.

The cgroup lib choose cgroup version likes:
      * system doesn't support any cgroup(v1, v2): TCONF
      * system only support cgroup v1: choose v1
      * system only support cgroup v2: choose v2
      * system support v1 & v2 but mounting v1: chosse v1   <=== this is
what you met
      * system support v1 & v2 but mounting v2: choose v2
      * system support v1 & v2 but mounting none: choose v2



>
> So ksm{03,04} fails with:
>
> safe_file_ops.c:299: BROK: Failed to close FILE
> '/tmp/cgroup_mem/cgroup.subtree_control' at tst_cgroup.c:301: ENOENT (2)
>
> because we have the memory controller (in fact all the controllers)
> mounted in the V1 way, but we also have the cgroup2 mounted. If I
>

Hmm, this is a situation that system mount v1&v2 at the same time.

So the ksm03/4 choose v2 automatically but hit a problem in cgroup_v2 using.
I pesonally think it mainly imputes to the SUT config in cgroup, because
that
makes cgroup_v2 has no actuall controllers in the cgroup.controllers. After
umounting all V1 hierarchies, the controllers get back into V2.



> unmount the memory controller from V1 then the test passes.
>
> Another potential problem is that it may be possible to remove access to
> controllers some other way in which case you have to check
> cgroup.controllers to see what is available. OTOH maybe this is not
> possible because you mount a new cgroup2 hierarchy?
>

I'm not sure about this.

To be honest, I hope a Linux distribution provides a pure way in cgroup
using, which means just mounting V1 or V2 but not to mix together. Or, do
you think LTP should handle the situation for the v1&v2 mixing mount?

-- 
Regards,
Li Wang

--00000000000099cb0a05affa288d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 23, 2020 at 7:03 PM Richard Palethorpe =
&lt;<a href=3D"mailto:rpalethorpe@suse.de">rpalethorpe@suse.de</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@r=
edhat.com</a>&gt; writes:<br>
<br>
&gt; Many of our LTP tests need Control Group in the configuration,<br>
&gt; this patch makes cgroup unified mounting at setup phase to be<br>
&gt; possible. The method is extracted from mem.h with the purpose<br>
&gt; of extendible for further developing, and trying to compatible<br>
&gt; the current two versions of cgroup,<br>
&gt;<br>
&gt; It&#39;s hard to make all APIs be strictly consistent because there<br=
>
&gt; are many differences between v1 and v2. But it capsulate the detail<br=
>
&gt; of cgroup mounting in high-level functions, which will be easier<br>
&gt; to use cgroup without considering too much technical thing.=C2=A0 =C2=
=A0<br>
&gt;<br>
&gt; Btw, test get passed on RHEL7(x86_64), RHEL8(ppc64le),<br>
&gt; Fedora32(x86_64).<br>
<br>
This appears to be broken on SUSE.<br>
<br>
&gt; +enum tst_cgroup_ver tst_cgroup_version(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (tst_cgroup_check(&quot;cgroup2&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tst_is_mounted(&=
quot;cgroup2&quot;) &amp;&amp; tst_is_mounted(&quot;cgroup&quot;))<br>
<br>
Unfortunately this is backwards: if a cgroup controller is mounted<br>
(e.g. memory) in the v1 separated hierarchy then it is not available in<br>
the cgroup v2 unified hierarchy even though the v2 unified hierarchy<br>
exists.<br></blockquote><div><br></div><div><div class=3D"gmail_default" st=
yle=3D"font-size:small">That&#39;s on purpose because we don&#39;t want the=
 user to mix v1 and v2 in using.</div><div class=3D"gmail_default" style=3D=
"font-size:small">In other words, if a version of cgroup has been chosen=C2=
=A0on a SUT then LTP=C2=A0</div><div class=3D"gmail_default" style=3D"font-=
size:small">follows in the same version.</div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">The cgroup lib choose cgroup versi=
on likes:</div></div><div><div class=3D"gmail_default" style=3D"font-size:s=
mall">=C2=A0 =C2=A0 =C2=A0 * system doesn&#39;t support any cgroup(v1, v2):=
 TCONF</div>=C2=A0 =C2=A0 =C2=A0 * system only support cgroup v1: choose v1=
<br>=C2=A0 =C2=A0 =C2=A0 * system only support cgroup v2: choose v2<br>=C2=
=A0 =C2=A0 =C2=A0 * system support v1 &amp; v2 but mounting v1: chosse v1<s=
pan class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0&lt;=3D=
=3D=3D this is what you met</span><br>=C2=A0 =C2=A0 =C2=A0 * system support=
 v1 &amp; v2 but mounting v2: choose v2<br>=C2=A0 =C2=A0 =C2=A0 * system su=
pport v1 &amp; v2 but mounting none: choose v2<br><br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
So ksm{03,04} fails with:<br>
<br>
safe_file_ops.c:299: BROK: Failed to close FILE<br>
&#39;/tmp/cgroup_mem/cgroup.subtree_control&#39; at tst_cgroup.c:301: ENOEN=
T (2)<br>
<br>
because we have the memory controller (in fact all the controllers)<br>
mounted in the V1 way, but we also have the cgroup2 mounted. If I<br></bloc=
kquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:=
small">Hmm, this is a situation that system mount v1&amp;v2 at the same tim=
e.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">So the ksm03/4 choose =
v2 automatically but hit a problem in cgroup_v2 using.</div><div class=3D"g=
mail_default" style=3D"font-size:small">I pesonally think it mainly=C2=A0im=
putes to the SUT config in cgroup, because that<br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">makes cgroup_v2 has no actuall control=
lers in the=C2=A0<span class=3D"gmail_default"></span>cgroup.controllers. A=
fter</div><div class=3D"gmail_default" style=3D"font-size:small">umounting =
all V1 hierarchies, the controllers=C2=A0get back into V2.</div><br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
unmount the memory controller from V1 then the test passes.<br>
<br>
Another potential problem is that it may be possible to remove access to<br=
>
controllers some other way in which case you have to check<br>
<span class=3D"gmail_default" style=3D"font-size:small"></span>cgroup.contr=
ollers to see what is available. OTOH maybe this is not<br>
possible because you mount a new cgroup2 hierarchy?<br></blockquote><div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m=
 not sure about this.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">To =
be honest, I hope a Linux distribution=C2=A0provides a pure way in cgroup</=
div><div class=3D"gmail_default" style=3D"font-size:small">using, which mea=
ns just mounting V1 or V2 but not to mix together. Or, do</div></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">you think LTP should handl=
e the situation for the v1&amp;v2 mixing mount?</div></div><div><br></div>-=
- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Rega=
rds,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000099cb0a05affa288d--


--===============0796871047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0796871047==--

