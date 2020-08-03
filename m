Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B846323A08A
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 09:59:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 881F53C6ABC
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 09:59:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9CBA03C6AB2
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 09:59:25 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 093902348DF
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 09:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596441563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=11LSgD3uGzqu8ZYsw2jSbR1p0PaJIUYFRBhmFgRYLJA=;
 b=DfKot7TqRjCmTOcAGlCLS3tpiazqV+LiZJbf3e0JgW6azFp7VLgLTHgtHiuLEbLDa8mYWo
 kORLoHpU/Y9Z2ABJyD3VAlPL5K1KBUhehi1qH9rK6F8klwDuoDPtNtlNiztpMsR+WrcJx6
 Ozq/HRCSAz1CFGRwkPUMrf1vOTkPaug=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-ysTgftH7N-q1GbwPR-SRWw-1; Mon, 03 Aug 2020 03:59:20 -0400
X-MC-Unique: ysTgftH7N-q1GbwPR-SRWw-1
Received: by mail-lj1-f199.google.com with SMTP id i4so1241696lji.14
 for <ltp@lists.linux.it>; Mon, 03 Aug 2020 00:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=11LSgD3uGzqu8ZYsw2jSbR1p0PaJIUYFRBhmFgRYLJA=;
 b=jNbvupOPlSm89LZscRUGspaLkHXQ5Pv4GxDRVQeveoWrpGLGb00E24VMJYd3R8NvRa
 H+hCcfzoWB/8sB0cATHhdbwRiijZObXfRgIpL4WC14RV32DaBy4M4CQjyRoiQWHV7EiX
 VUgP5D0lHI4ysudDP5rlYoj6ADUCahSGtM+HNVcDxZKlw0QkCl4QddHXjA0F56IyogVK
 a8iehQ7W/6WK2BKRErYkn/vdglyIbsVeSJx23FU2PHQPYPtJZm42MHT5XvKlAZuzAXJN
 UIjU+yoargCbRYf4p2bD1mW53mdBOKeCiqGAV2RDEPsmhZhP2YMUEdLkJ72SEjwut0Q2
 G8Ag==
X-Gm-Message-State: AOAM532cdjrR0p5j4RCWAu7v3y43jgGYsDds3xadWEoLcfMeiyKp2phe
 T4gY5ZbfpTbdZ4+z7L5nK9948YrBNyyr5JrV2eWceMzbufM9VPsj30cSf04KLGjGEwcZYT6JTsE
 HQlLta0WwIXD+Q162igkvCogf9m0=
X-Received: by 2002:a05:651c:110b:: with SMTP id
 d11mr3496959ljo.353.1596441558567; 
 Mon, 03 Aug 2020 00:59:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcNF30DLx0nsfBVvStm7VNyrh6C+6812FOJoBM6JaOQOKbntHMM7BXYLHmQGSI7sQHQm8D5ZPfkg/9Xt6sYhA=
X-Received: by 2002:a05:651c:110b:: with SMTP id
 d11mr3496952ljo.353.1596441558352; 
 Mon, 03 Aug 2020 00:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200731121508.12805-2-chrubis@suse.cz>
 <550701550.5736445.1596440755258.JavaMail.zimbra@redhat.com>
In-Reply-To: <550701550.5736445.1596440755258.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 3 Aug 2020 15:59:06 +0800
Message-ID: <CAEemH2dXq2S9Ep3Q8BYGh8XneA=xWa=mKqQPfE5Fn8739iMC_A@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] build system: Add explicit make rules
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
Content-Type: multipart/mixed; boundary="===============1318782213=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1318782213==
Content-Type: multipart/alternative; boundary="000000000000fd9eed05abf483d6"

--000000000000fd9eed05abf483d6
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 3, 2020 at 3:48 PM Jan Stancek <jstancek@redhat.com> wrote:

>
> ----- Original Message -----
> > This commit adds explicit build rules, the main motivation are recent
> > build failures caused by library orderings. To fix that this commit
> > introduces LTPLDLIBS special variable that is passed to linker before
> > the LDLIBS which avoids the need for tricks as
> > "LDLIBS := -lltpfoo $(LDLIBS)" in the Makefiles.
> >
> > This commit also silences the output by default a bit, the verbose
> > output could be enabled by VERBOSE=1 env variable, which is probably
> > what most of the build systems will do if this gets commited. I guess
> > that we can as well silence a bit the "make entering/leaving directory"
> > if this the right way to go.
>
> alias for V=0 / V=1 would be nice
>
> LTPLDLIBS should probably be mentioned in doc/build-system-guide.txt
>
>
> >
> > Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> > ---
> >  include/mk/env_post.mk |  2 ++
> >  include/mk/rules.mk    | 29 +++++++++++++++++++++++++++++
> >  2 files changed, 31 insertions(+)
> >  create mode 100644 include/mk/rules.mk
> >
> > diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
> > index f4169ad66..bdf8c696d 100644
> > --- a/include/mk/env_post.mk
> > +++ b/include/mk/env_post.mk
> > @@ -107,4 +107,6 @@ $(error You must define $$(prefix) before executing
> > install)
> >  endif # END $(filter-out install,$(MAKECMDGOALS)),$(MAKECMDGOALS)
> >  endif
> >
> > +include $(top_srcdir)/include/mk/rules.mk
> > +
> >  endif
> > diff --git a/include/mk/rules.mk b/include/mk/rules.mk
> > new file mode 100644
> > index 000000000..e9b9c35ef
> > --- /dev/null
> > +++ b/include/mk/rules.mk
> > @@ -0,0 +1,29 @@
> > +%.o: %.c
> > +ifdef VERBOSE
> > +     $(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<
> > +else
> > +     @$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<
> > +     @echo CC $@
> > +endif
>
> What if we wouldn't print "DIR" (for non-clean targets) and printed
> relative paths instead?
>

+1
This looks better, I'd give my vote to this.

-- 
Regards,
Li Wang

--000000000000fd9eed05abf483d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Aug 3, 2020 at 3:48 PM Jan Stancek &lt;<a h=
ref=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
----- Original Message -----<br>
&gt; This commit adds explicit build rules, the main motivation are recent<=
br>
&gt; build failures caused by library orderings. To fix that this commit<br=
>
&gt; introduces LTPLDLIBS special variable that is passed to linker before<=
br>
&gt; the LDLIBS which avoids the need for tricks as<br>
&gt; &quot;LDLIBS :=3D -lltpfoo $(LDLIBS)&quot; in the Makefiles.<br>
&gt; <br>
&gt; This commit also silences the output by default a bit, the verbose<br>
&gt; output could be enabled by VERBOSE=3D1 env variable, which is probably=
<br>
&gt; what most of the build systems will do if this gets commited. I guess<=
br>
&gt; that we can as well silence a bit the &quot;make entering/leaving dire=
ctory&quot;<br>
&gt; if this the right way to go.<br>
<br>
alias for V=3D0 / V=3D1 would be nice<br>
<br>
LTPLDLIBS should probably be mentioned in doc/build-system-guide.txt<br>
<br>
<br>
&gt; <br>
&gt; Signed-off-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" tar=
get=3D"_blank">chrubis@suse.cz</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 include/mk/<a href=3D"http://env_post.mk" rel=3D"noreferrer" tar=
get=3D"_blank">env_post.mk</a> |=C2=A0 2 ++<br>
&gt;=C2=A0 include/mk/<a href=3D"http://rules.mk" rel=3D"noreferrer" target=
=3D"_blank">rules.mk</a>=C2=A0 =C2=A0 | 29 +++++++++++++++++++++++++++++<br=
>
&gt;=C2=A0 2 files changed, 31 insertions(+)<br>
&gt;=C2=A0 create mode 100644 include/mk/<a href=3D"http://rules.mk" rel=3D=
"noreferrer" target=3D"_blank">rules.mk</a><br>
&gt; <br>
&gt; diff --git a/include/mk/<a href=3D"http://env_post.mk" rel=3D"noreferr=
er" target=3D"_blank">env_post.mk</a> b/include/mk/<a href=3D"http://env_po=
st.mk" rel=3D"noreferrer" target=3D"_blank">env_post.mk</a><br>
&gt; index f4169ad66..bdf8c696d 100644<br>
&gt; --- a/include/mk/<a href=3D"http://env_post.mk" rel=3D"noreferrer" tar=
get=3D"_blank">env_post.mk</a><br>
&gt; +++ b/include/mk/<a href=3D"http://env_post.mk" rel=3D"noreferrer" tar=
get=3D"_blank">env_post.mk</a><br>
&gt; @@ -107,4 +107,6 @@ $(error You must define $$(prefix) before executin=
g<br>
&gt; install)<br>
&gt;=C2=A0 endif # END $(filter-out install,$(MAKECMDGOALS)),$(MAKECMDGOALS=
)<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt; +include $(top_srcdir)/include/mk/<a href=3D"http://rules.mk" rel=3D"n=
oreferrer" target=3D"_blank">rules.mk</a><br>
&gt; +<br>
&gt;=C2=A0 endif<br>
&gt; diff --git a/include/mk/<a href=3D"http://rules.mk" rel=3D"noreferrer"=
 target=3D"_blank">rules.mk</a> b/include/mk/<a href=3D"http://rules.mk" re=
l=3D"noreferrer" target=3D"_blank">rules.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..e9b9c35ef<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/mk/<a href=3D"http://rules.mk" rel=3D"noreferrer" target=
=3D"_blank">rules.mk</a><br>
&gt; @@ -0,0 +1,29 @@<br>
&gt; +%.o: %.c<br>
&gt; +ifdef VERBOSE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $&lt;<br>
&gt; +else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $&lt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@echo CC $@<br>
&gt; +endif<br>
<br>
What if we wouldn&#39;t print &quot;DIR&quot; (for non-clean targets) and p=
rinted relative paths instead?<br></blockquote><div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">+1</div></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">This looks better, I&#39;d gi=
ve my vote to this.</div></div></div><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000fd9eed05abf483d6--


--===============1318782213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1318782213==--

