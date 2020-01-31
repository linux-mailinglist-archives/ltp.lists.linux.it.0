Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 059AD14EE44
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jan 2020 15:21:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C29D3C25AA
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jan 2020 15:21:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id DE9863C2342
 for <ltp@lists.linux.it>; Fri, 31 Jan 2020 15:21:05 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 6C35B14019B2
 for <ltp@lists.linux.it>; Fri, 31 Jan 2020 15:21:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580480462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ua1KMYMGWevyeujfWI2+0PE6OCZXEE4HoHwK4kAbnWA=;
 b=aynog5ds/7lBFWq/U/JYd977j5xpnSLusy3ZKbd7T0Y/ZLyQz2drzSmewgI18RJIa3/Nt5
 gZmvFqiVKztkJV7KkOJTiM1fajpoz9IN3o/YIAaC96f+4/IBSqqaWGZbIpnt877OxT4iBT
 vnTU7kCtQdB5JQAIP1T7UrVNit3yMoA=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-yDKU7si1Owey12CV4cAghA-1; Fri, 31 Jan 2020 09:20:59 -0500
Received: by mail-ot1-f72.google.com with SMTP id e11so3599820otq.1
 for <ltp@lists.linux.it>; Fri, 31 Jan 2020 06:20:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YH5BLQSbQIodU6k677RQ1Xt2lGOF6BqIJkrWUSjcnok=;
 b=lCR6G7qaNPCRDvVXbhxVAhBILtxxScLGqwzDLLM9hQr52Z1T7tlmEMSmCTvX87CDyy
 5NwjMM1z+gsyFnCOp2lSX59a3Q4Z0Y6bEhhGRLbaSaLxyJ3ra/KuJ1W/2UJAY1cSF3P0
 gDvktTUYfgiSlnjmIC58oMRnVXghi/W01DNrUVLbqGcFsBLA7/+V67O4mCQou8j2TmGj
 hOxMuGBkdlNBJ9nd4mrS4QP58x5aJMiTi8cGxRejDCyoPhZkMiFMOwc7UO139lSWMjDZ
 Jp13tB7txems8nJl+N4GvzL/YbJZ8dTfbw4Esg533eyo0M3bvmGuDssgxM9tAN13yZhQ
 xUWA==
X-Gm-Message-State: APjAAAU2SVmcNcuFMhfy1MP2xAx5OT6BLQkA9JntrClYQmzMjzm7yLgl
 rYXbPu9RQQru073AOKW1CpzINjPQ6Quq/lt8pDe8xfFrHoy4UWh1bZwkJKz91n8hLBlihhZ5VJW
 PoXOJMO75JjhpK4EaMWVIHW0pEiU=
X-Received: by 2002:a9d:67c9:: with SMTP id c9mr7914567otn.67.1580480458106;
 Fri, 31 Jan 2020 06:20:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqzhnaqqDGi2+cLXCDJYEtukkierEnP0nnh1bmkPLKbdOJs6NES5B+eUA4pCLuJF93/dN3byyyBSrNnTsonsDPs=
X-Received: by 2002:a9d:67c9:: with SMTP id c9mr7914550otn.67.1580480457865;
 Fri, 31 Jan 2020 06:20:57 -0800 (PST)
MIME-Version: 1.0
References: <20200130161337.31614-1-mdoucha@suse.cz>
 <CAEemH2f7s+q1upnaikCnQZSqxb-xgdN73aPxhKhLo2i5_M7FkA@mail.gmail.com>
 <1041474174.5093428.1580463462902.JavaMail.zimbra@redhat.com>
 <26784292-af8d-7a5e-981c-43d4da2dfcdc@suse.cz>
In-Reply-To: <26784292-af8d-7a5e-981c-43d4da2dfcdc@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 31 Jan 2020 22:20:46 +0800
Message-ID: <CAEemH2c_5D+GJ=xfFSr5vesiOwG6iKV2dF1vdg2-Js_ZG665qw@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
X-MC-Unique: yDKU7si1Owey12CV4cAghA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Taunt OOM killer in fork12 setup()
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
Content-Type: multipart/mixed; boundary="===============2060958384=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2060958384==
Content-Type: multipart/alternative; boundary="000000000000440f16059d704814"

--000000000000440f16059d704814
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2020 at 8:40 PM Martin Doucha <mdoucha@suse.cz> wrote:

> On 1/31/20 10:37 AM, Jan Stancek wrote:
> > ----- Original Message ----
> >> It sounds more like the OOM-Killer defect but not fork12.
> >
> > Badness score is based on proportion of rss/swap. It doesn't seem
> > like defect to me, we just quickly spawn many small tasks.
>
> Yes, OOM killer is working as intended here. fork12 is basically a fork
> bomb test so it spawns thousands of processes with almost no allocated
> memory. Since kernel 2.6.36, OOM killer uses only two criteria to decide
> which process to kill:
> - how much memory/swap it has allocated
> - whether the process is privileged
>
> Since fork12 children have low memory footprint, most system processes
> look like better targets for OOM killer right now. But we're not testing
> userspace resilience against fork bomb here. We're trying to crash the
> kernel itself.
>

Sounds reasonable to me, thanks!


>
> >> What we do for that is to protect the parent shell and its harness
> >> to avoid oom_kill_process() acting on them.
> >>
> >> On the other side, if we do raise the oom score of fork12, that
> >> would not guarantee OOM-Killer do right evaluation but just makes
> >> fork12 easily to be killed in testing.
> >
> > fork12 is not an OOM test, so I don't see problem with this. We only
> > need OOM to kill something we don't care about, in case it triggers.
> >
> > I'd move oom_score_adj after fork, so only child processes are better
> > target, not the parent.
>
> oom_score_adj is inherited by child processes and OOM killer tries to
> kill first-level children if it can. So setting oom_score_adj on the
> main fork12 process will work exactly the way we want - OOM killer will
> kill one of the child processes, fork12 will notice on line 80 and exit
> gracefully.
>

Theoretically yes! Isn't it makes the main fork12 more robust if not set
high score to it?


> There could be problems only on kernels older than 2.6.36 where the
> number of forked children was included in OOM score calculation and the
> main worker process might get targeted directly (not sure if the
> kill-children-first approach was used back then).
>

It sounds a little tricky. The method I can think of now is to reset the
max process limitation for the lower memory system, to make the test
includes fork bomb but NOT costs too much resource in fork12?


>
> Either way, trying to protect the parent shell is a bad idea. We'd have
> to set negative oom_score_adj on it and if fork12 crashes before it can
> reset it back to zero, all further test processes would inherit the OOM
> protection.
>

My bad! The way we have tried is to set a negative score for the test
harness and LTP related process, then reset parent shell score to 0, which
avoids other tests inherit OOM protection from the shell.

--=20
Regards,
Li Wang

--000000000000440f16059d704814
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jan 31, 2020 at 8:40 PM Martin Doucha &lt;<=
a href=3D"mailto:mdoucha@suse.cz">mdoucha@suse.cz</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On 1/31/20 10:37 AM, Jan S=
tancek wrote:<br>
&gt; ----- Original Message ----<br>
&gt;&gt; It sounds more like the OOM-Killer defect but not fork12.<br>
&gt; <br>
&gt; Badness score is based on proportion of rss/swap. It doesn&#39;t seem<=
br>
&gt; like defect to me, we just quickly spawn many small tasks.<br>
<br>
Yes, OOM killer is working as intended here. fork12 is basically a fork<br>
bomb test so it spawns thousands of processes with almost no allocated<br>
memory. Since kernel 2.6.36, OOM killer uses only two criteria to decide<br=
>
which process to kill:<br>
- how much memory/swap it has allocated<br>
- whether the process is privileged<br>
<br>
Since fork12 children have low memory footprint, most system processes<br>
look like better targets for OOM killer right now. But we&#39;re not testin=
g<br>
userspace resilience against fork bomb here. We&#39;re trying to crash the<=
br>
kernel itself.<br></blockquote><div><br></div><div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Sounds reasonable=C2=A0to me, thanks!</div><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;&gt; What we do for that is to protect the parent shell and its harness=
<br>
&gt;&gt; to avoid oom_kill_process() acting on them.<br>
&gt;&gt; <br>
&gt;&gt; On the other side, if we do raise the oom score of fork12, that<br=
>
&gt;&gt; would not guarantee OOM-Killer do right evaluation but just makes<=
br>
&gt;&gt; fork12 easily to be killed in testing.<br>
&gt; <br>
&gt; fork12 is not an OOM test, so I don&#39;t see problem with this. We on=
ly<br>
&gt; need OOM to kill something we don&#39;t care about, in case it trigger=
s.<br>
&gt; <br>
&gt; I&#39;d move oom_score_adj after fork, so only child processes are bet=
ter<br>
&gt; target, not the parent.<br>
<br>
oom_score_adj is inherited by child processes and OOM killer tries to<br>
kill first-level children if it can. So setting oom_score_adj on the<br>
main fork12 process will work exactly the way we want - OOM killer will<br>
kill one of the child processes, fork12 will notice on line 80 and exit<br>
gracefully.<br></blockquote><div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">Theoretically yes! Isn&#39;t it makes the main =
fork12 more robust if not set high score to it?<br></div></div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
There could be problems only on kernels older than 2.6.36 where the<br>
number of forked children was included in OOM score calculation and the<br>
main worker process might get targeted directly (not sure if the<br>
kill-children-first approach was used back then).<br></blockquote><div><br>=
</div><div><div class=3D"gmail_default" style=3D"font-size:small">It sounds=
 a little tricky. The method I can think of now is to reset the max process=
 limitation for the lower memory system, to make the test includes fork bom=
b but NOT costs too much resource in fork12?</div></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Either way, trying to protect the parent shell is a bad idea. We&#39;d have=
<br>
to set negative oom_score_adj on it and if fork12 crashes before it can<br>
reset it back to zero, all further test processes would inherit the OOM<br>
protection.<br></blockquote><div><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">My bad! The way we have tried is to set a negative s=
core for the test harness and LTP related process, then reset parent shell =
score to 0, which avoids other tests inherit OOM protection from the shell.=
</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature=
"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div=
></div>

--000000000000440f16059d704814--


--===============2060958384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2060958384==--

