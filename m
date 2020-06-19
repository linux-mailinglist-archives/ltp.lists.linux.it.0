Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0320006E
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 04:56:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39AF93C2CA1
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 04:56:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 76E2D3C1D1C
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 04:56:30 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 6AA321A0112E
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 04:56:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592535387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NFbKkw0+GQi7hUrBBF8kJLwcsHHmN9cZJC9vLFNSuKY=;
 b=Fk04IF3GpxLSJNbfAcGWOqZEKvxzmLyR0sWP401JzTbnfYKgZLedBi0yeIWl0UYvfmqlVD
 1e+TFyu5qI/fFaYkK5bkNlzM/IEfSkL73rEVQlLqgTdTmyrJHilQSRscDyEFPIdZwyaU93
 jsm92C90N4tW6rP8N5GVD6flzUZrGB8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-v2_6SKs9NpKqnEC_v00m5Q-1; Thu, 18 Jun 2020 22:56:21 -0400
X-MC-Unique: v2_6SKs9NpKqnEC_v00m5Q-1
Received: by mail-lf1-f70.google.com with SMTP id n17so2787409lfe.15
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 19:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NFbKkw0+GQi7hUrBBF8kJLwcsHHmN9cZJC9vLFNSuKY=;
 b=OAvYAPsKVk4E9aJGlzjQtDyBE+p0tNoDmmBTzpvR0peZRpAtjlbGpTVFyt8CUxr6pe
 F7Cd7jTWOiPins6Xp6af4ACLfIwT+c75Gu9x2ShciuWYKHnTC+UcpZV5zA3RhW73LrPv
 PpjzgbMzFOR4npqjWAFVY38aDELkHN7bXO4o6gubGUAUPBJD+xFVjnOFfZoIDVqbdSQO
 x5BENY1yYOO/kqv02iUVgbLSEq0DkbL459hZG+/MetksLfOiN0KwuoG99n7tvlZx3i2P
 fszA+t2RSao7f/Knt06kOUYeVrlnsH/GntL4EI3lUDJT2mAC9YH2obaen+sr6MwQ+5HI
 jMeA==
X-Gm-Message-State: AOAM533m5A/F1XuLm5CO49zH580h0oOteNi6npOu/7sMgM8D7scX7977
 TGMM9Q3x3AOXpsY4QFBC1hyLhpyzvVwWJJwn2lKHgKX6wr48FrVMnYetBkylKMyXpkzHekAOEWD
 uecOIUHtzNqz4Kn6JOIypPyOx5rI=
X-Received: by 2002:a2e:5757:: with SMTP id r23mr691075ljd.468.1592535379495; 
 Thu, 18 Jun 2020 19:56:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLNJwQtaCcep+QE1UUEmNowd3NcDyMG79MQ+4JpxK1oLir9tOzzlaCRWfcA9M5n2RZ6e6hhCQ2NtaMOB+zjtQ=
X-Received: by 2002:a2e:5757:: with SMTP id r23mr691069ljd.468.1592535379264; 
 Thu, 18 Jun 2020 19:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200617154926.32588-1-alexey.kodanev@oracle.com>
 <CAEemH2dOxAnaaMXhKyj36FqmYDQ_p_kfi-=pMQhrE3O9oQO8LA@mail.gmail.com>
 <20200618055105.GA42990@x230> <20200618093646.GA11962@dell5510>
 <8b5eef18-1c3e-d89c-9af2-b27828f3cb02@oracle.com>
 <20200618134945.GA21692@dell5510>
In-Reply-To: <20200618134945.GA21692@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Fri, 19 Jun 2020 10:56:07 +0800
Message-ID: <CAEemH2d1Qkv114Fpy=Np-eNPic7VymQJDSrGayt0oUpRY1k8uw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/nsf_lib.sh: TCONF on mount (udp/udp6)
 failure for Linux v5.6+
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
Content-Type: multipart/mixed; boundary="===============0484276613=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0484276613==
Content-Type: multipart/alternative; boundary="00000000000092e46a05a86709dc"

--00000000000092e46a05a86709dc
Content-Type: text/plain; charset="UTF-8"

Hi Petr, Alexey,

On Thu, Jun 18, 2020 at 9:49 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li, Alexey, Cyril,
>
> > > Requiring kernel config is ok for traditional distros (and even here is
> > > sometimes readable only for root, e.g. Debian/Ubuntu), but it's still
> rare on
> > > arm (other embedded archs). I guess it'd be nice to have some
> variable, which
> > > would turn kernel config based requirement into warning.
>
>
> > Also the option's name can be renamed in new releases, so the decision
> > should be made only if the option is found (i.e. if we check without the
> > the kernel version).
> FYI (you may have noticed) there was an effort to add boolean OR for C
> implementation:
> https://patchwork.ozlabs.org/project/ltp/list/?series=149804&state=*
>
> > tst_check_kconfig - will be really nice to have.
> +1. Is anybody planning to work on it?
>

I have no plan to work on this, but my pleasure to help review/test
the patch if possible.


>
> > Then, we will tconf
> > earlier in the setup if this option is found.
>
> > What about TCONF_IF_KCONFIG, in addition to NEEDS_KCONFIG?
> +1 (+ add it to C as well).
>
NEEDS_KCONFIG - this is optional to me, my previous thought is
only to have tst_check_kconfig to match the situation we need to
perform some special commands for the kernel with different kconfig,
but it is also acceptable to TCONF in setup phase like what we do in
C library.

TCONF_IF_KCONFIG - And I haven't realized what the TCONF_IF_KCONFIG
the behavior here, maybe needs read code then.

-- 
Regards,
Li Wang

--00000000000092e46a05a86709dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr, Alexey,</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 18, 2020 at 9:49 PM Pe=
tr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li, Alexey,=
 Cyril,<br>
<br>
&gt; &gt; Requiring kernel config is ok for traditional distros (and even h=
ere is<br>
&gt; &gt; sometimes readable only for root, e.g. Debian/Ubuntu), but it&#39=
;s still rare on<br>
&gt; &gt; arm (other embedded archs). I guess it&#39;d be nice to have some=
 variable, which<br>
&gt; &gt; would turn kernel config based requirement into warning.<br>
<br>
<br>
&gt; Also the option&#39;s name can be renamed in new releases, so the deci=
sion<br>
&gt; should be made only if the option is found (i.e. if we check without t=
he<br>
&gt; the kernel version).<br>
FYI (you may have noticed) there was an effort to add boolean OR for C<br>
implementation:<br>
<a href=3D"https://patchwork.ozlabs.org/project/ltp/list/?series=3D149804&a=
mp;state=3D*" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs=
.org/project/ltp/list/?series=3D149804&amp;state=3D*</a><br>
<br>
&gt; tst_check_kconfig - will be really nice to have.<br>
+1. Is anybody planning to work on it?<br></blockquote><div><br></div><div>=
<div class=3D"gmail_default" style=3D"font-size:small">I have no plan to wo=
rk on this, but my pleasure to help review/test</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">the patch if possible.</div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Then, we will tconf<br>
&gt; earlier in the setup if this option is found.<br>
<br>
&gt; What about <span class=3D"gmail_default" style=3D"font-size:small"></s=
pan><span class=3D"gmail_default" style=3D"font-size:small"></span>TCONF_IF=
_KCONFIG, in addition to NEEDS_KCONFIG?<br>
+1 (+ add it to C as well).<br>
</blockquote></div><div class=3D"gmail_default" style=3D"font-size:small"><=
/div>NEEDS_KCONFIG -<span class=3D"gmail_default" style=3D"font-size:small"=
> this is optional to me, my previous thought is</span><div><span class=3D"=
gmail_default" style=3D"font-size:small">only to have tst_check_kconfig to =
match the situation we need to=C2=A0</span></div><div><span class=3D"gmail_=
default" style=3D"font-size:small">perform some special commands for the ke=
rnel with different kconfig,</span></div><div><span class=3D"gmail_default"=
 style=3D"font-size:small">but it is also acceptable to TCONF=C2=A0in setup=
 phase like what we do in</span></div><div><span class=3D"gmail_default" st=
yle=3D"font-size:small">C library.</span><div><span class=3D"gmail_default"=
 style=3D"font-size:small">=C2=A0</span></div><div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><span class=3D"gmail_default"></span>TCONF_I=
F_KCONFIG - And I haven&#39;t realized what the <span class=3D"gmail_defaul=
t"></span>TCONF_IF_KCONFIG</div><div class=3D"gmail_default" style=3D"font-=
size:small">the behavior here, maybe needs read code then.</div><div><br></=
div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div=
>Regards,<br></div><div>Li Wang<br></div></div></div></div></div></div>

--00000000000092e46a05a86709dc--


--===============0484276613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0484276613==--

