Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA8A160FF6
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 11:28:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B16BE3C25C7
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 11:28:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id ED9003C0430
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 11:28:22 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 6DF26600BBB
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 11:28:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581935299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HHSl8/qTLQSPayHZzZpLrEQxxij4c7dly1YJQ94noso=;
 b=OEoTT1zHQ+4B/sKFTcufIqOfla9JBqeOF04ymEJAeJ/KGam1Z89ckvAwKSs2SjpuRjQ0SO
 teObvmGaql4h7N+9SH6BCZQSS0BgyjjXoUXB8CRTkzMuy285QWUl59PoSYn1V50OJYZ2e4
 dKqTXkOUgI+iJA2nPDmNkknEzQ3pLo0=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-e8SyNT9XPT2oCkRh5zgWDw-1; Mon, 17 Feb 2020 05:28:15 -0500
Received: by mail-ot1-f72.google.com with SMTP id p13so10260488oto.12
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 02:28:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HHSl8/qTLQSPayHZzZpLrEQxxij4c7dly1YJQ94noso=;
 b=JXx8jxFdxjdsW7JXqrNmwChmaXA9U5vPfKAhqGCJRqZymSguyj5k+aQsHBmXPn1CiF
 f/HPpg+xU9KDTEBq2GPMbjoA584MSA+b1iprk/NAj3oh1IFniHT4nVza22qOqAaVoarO
 MFOiE4Ekv2V2mGn+hfvsxN78JkMbLOaO3e42p9rAjpJuJXM3eWDuEeIMB9ydJQmaxzYz
 GdwxGm/BSdzYK7etsMuyJBOgFRQMptQ6kpUQJdsjrTxzkTUxixvParm4jVErzUNxicxv
 A89YxqYGLrexmOCiGT3m+L0duYVBdEEgX/AULm1QnkP8pFhYDwyIkqrI2Z80999IerAZ
 xKDg==
X-Gm-Message-State: APjAAAVhOyTqD17Ld8BXh+PmMuSOhF0yxm1eeetHrtSCUkbfDiLTcImB
 KigcWBlBqKNiqFDJr4zhAs8XGTBKuHZkR9U8nPXza6N8yWG7tQ3ZfcreZF7L9oTFcn3SNCd5aUk
 tU1F64fvnnYT8nIPA8723Lmc4sgM=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr11203203otl.118.1581935295109; 
 Mon, 17 Feb 2020 02:28:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqxlbecQtH1F+WWXxuIONnUFRvmrjUyNl0b07x1hXA238jrcSTjNxQTsf4mD96iIdHdltRzENNByYHl2UjWVFZU=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr11203198otl.118.1581935294829; 
 Mon, 17 Feb 2020 02:28:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <1c61c673a02152c30edac0e25438257c23c3322e.1581680021.git.viresh.kumar@linaro.org>
 <CAEemH2f2pR1KhLAoKKphzh9fP++yyALbv4TiAh=4Vyv0M3SEdw@mail.gmail.com>
 <20200217082931.vbjkg2f53lek4uf3@vireshk-i7>
 <CAEemH2c28zj-+pec+sgoLzCq6iV627YvyH2hRpQN98eYZ_8geg@mail.gmail.com>
 <20200217095810.GC13398@dell5510>
In-Reply-To: <20200217095810.GC13398@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Mon, 17 Feb 2020 18:28:03 +0800
Message-ID: <CAEemH2dZboTZX00t0Kt6n_-sV+9StvJ24-ZLpdU3xFegBuLncQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: e8SyNT9XPT2oCkRh5zgWDw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/7] syscalls/fsmount: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1515942003=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1515942003==
Content-Type: multipart/alternative; boundary="0000000000004e6e9e059ec3033d"

--0000000000004e6e9e059ec3033d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 5:58 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> > On Mon, Feb 17, 2020 at 4:29 PM Viresh Kumar <viresh.kumar@linaro.org>
> > wrote:
>
> > > ...
> > > > Adding #include "lapi/fcntl.h" in case of =E2=80=98AT_FDCWD=E2=80=
=99 undeclared. It
> seems
> > > > we have to do this for all the tests involves  =E2=80=98AT_FDCWD=E2=
=80=99.
>
> > > my fsmount.h header includes <fcntl.h>, won't that be enough ?
>
>
> > I'm afraid it's not enough.
>
> > After having a closer look, the reason is that the AT_FDCWD is defined
> with
> > condition __USE_ATFILE,  the __USE_ATFILE depends on _ATFILE_SOURCE
> > defined, and _ATFILE_SOURCE needs enable _GNU_SOURCE.
>
> > So another effective way is to add '#define _GNU_SOURCE' in front of yo=
ur
> > test then that <fcntl.h> will be work for you.
>
> OK, we can add #define _GNU_SOURCE to fsmount01.c, which actually needs i=
t
> + keep <fcntl.h> there and load lapi/fsmount.h later (see below).
> But generally this will be the approach for all uses of <fcntl.h> (and
> probably
> some other headers) for old distros. IMHO this change is caused by:
>
> c941736c92 Remove _BSD_SOURCE and _SVID_SOURCE. (glibc-2.20)
> c688b41960 Add _DEFAULT_SOURCE feature test macro. (glibc-2.19)
>

Thanks for figure out this.

>
> So we can either add it to many places or detect this old glibc and
> compile with
> -D_GNU_SOURCE (but this might break other things).
>

-1 remove old Glibc is a bad choice.


> But that's another story.
>
> > # rpm -qa glibc-headers
> > glibc-headers-2.5-123
>
> > # cat /usr/include/fcntl.h |grep AT_FDCWD -B 2 -A 2
> > #ifdef __USE_ATFILE
> > # define AT_FDCWD -100   /* Special value used to indicate
> >                                                 the *at functions shoul=
d
> > use the
> >                                                 current working
> directory.
> > */
>
> So is this diff to v7 better?
>

To use "lapi/fcntl.h" in v7 is simpler I guess, sometimes we just need to
get compile pass on old distros but not perform it indeed. And that's the
purpose why we need lapi/*.

--=20
Regards,
Li Wang

--0000000000004e6e9e059ec3033d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Feb 17, 2020 at 5:58 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
&gt; On Mon, Feb 17, 2020 at 4:29 PM Viresh Kumar &lt;<a href=3D"mailto:vir=
esh.kumar@linaro.org" target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br>
&gt; wrote:<br>
<br>
&gt; &gt; ...<br>
&gt; &gt; &gt; Adding #include &quot;lapi/fcntl.h&quot; in case of =E2=80=
=98AT_FDCWD=E2=80=99 undeclared. It seems<br>
&gt; &gt; &gt; we have to do this for all the tests involves=C2=A0 =E2=80=
=98AT_FDCWD=E2=80=99.<br>
<br>
&gt; &gt; my fsmount.h header includes &lt;fcntl.h&gt;, won&#39;t that be e=
nough ?<br>
<br>
<br>
&gt; I&#39;m afraid it&#39;s not enough.<br>
<br>
&gt; After having a closer look, the reason is that the AT_FDCWD is defined=
 with<br>
&gt; condition __USE_ATFILE,=C2=A0 the __USE_ATFILE depends on _ATFILE_SOUR=
CE<br>
&gt; defined, and _ATFILE_SOURCE needs enable _GNU_SOURCE.<br>
<br>
&gt; So another effective way is to add &#39;#define _GNU_SOURCE&#39; in fr=
ont of your<br>
&gt; test then that &lt;fcntl.h&gt; will be work for you.<br>
<br>
OK, we can add #define _GNU_SOURCE to fsmount01.c, which actually needs it<=
br>
+ keep &lt;fcntl.h&gt; there and load lapi/fsmount.h later (see below).<br>
But generally this will be the approach for all uses of &lt;fcntl.h&gt; (an=
d probably<br>
some other headers) for old distros. IMHO this change is caused by:<br>
<br>
c941736c92 Remove _BSD_SOURCE and _SVID_SOURCE. (glibc-2.20)<br>
c688b41960 Add _DEFAULT_SOURCE feature test macro. (glibc-2.19)<br></blockq=
uote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Thanks for figure out this.</div><div class=3D"gmail_default" style=3D"font=
-size:small"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
So we can either add it to many places or detect this old glibc and compile=
 with<br>
-D_GNU_SOURCE (but this might break other things).<br></blockquote><div>=C2=
=A0</div><div><span class=3D"gmail_default" style=3D"font-size:small">-1=C2=
=A0</span>remove old Glibc is a bad choice.</div><div><span class=3D"gmail_=
default" style=3D"font-size:small"></span>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
But that&#39;s another story.<br>
<br>
&gt; # rpm -qa glibc-headers<br>
&gt; glibc-headers-2.5-123<br>
<br>
&gt; # cat /usr/include/fcntl.h |grep AT_FDCWD -B 2 -A 2<br>
&gt; #ifdef __USE_ATFILE<br>
&gt; # define AT_FDCWD -100=C2=A0 =C2=A0/* Special value used to indicate<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the *at functions should<br>
&gt; use the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0current working directory.<br>
&gt; */<br>
<br>
So is this diff to v7 better?<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">To use &quot;lapi/fcntl.h&quo=
t; in v7 is simpler I guess, sometimes we just need to get compile pass on =
old distros but not perform it indeed. And that&#39;s the purpose why we ne=
ed lapi/*.</div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D=
"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br><=
/div></div></div></div>

--0000000000004e6e9e059ec3033d--


--===============1515942003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1515942003==--

