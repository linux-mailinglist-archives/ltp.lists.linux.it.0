Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 235F0264660
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 14:54:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B49533C5356
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 14:54:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C95853C2891
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 14:54:26 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 432601401197
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 14:54:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599742464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oSIExgAQ0ke//HIfvh4b3gpu2i8SEc50pKtZonuDAN8=;
 b=dA+1JNjJ5ZSVYVQjdbYGl7wGY/te/OSxNqnGQjHo0HILj74/iB2PFFrCtuUgDjXbUFmXRV
 y0pTv1tv1f0kS+Iu2TZ4M0HKqubQbVnAhPJYbkQM468GFXMjLucjDs2cJSHt50h+6bvSYn
 Ur8PAEXsyeMrT0C/lwRs74R2sreqOGA=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-7I6gTGdjOpm3VJ9VB-Anew-1; Thu, 10 Sep 2020 08:54:22 -0400
X-MC-Unique: 7I6gTGdjOpm3VJ9VB-Anew-1
Received: by mail-yb1-f199.google.com with SMTP id b127so5328608ybh.21
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 05:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oSIExgAQ0ke//HIfvh4b3gpu2i8SEc50pKtZonuDAN8=;
 b=XMQ/IYtczJ0EeI9QctrTylvsjIRZql2XHVkaAGiUXFSJOd+TCQoRtcVU1gtp8x2g4B
 O5k+WL3+VmLzRKJ8n1kHfNumIjSs+LBQ8WXP5CLXc1VPlik4HEIEikyTk7uTXApULKKB
 cZdaOVhgwcK2xWEbo/0zL0IyKXufqGOFG0C2Hjwev/DC1Zn0nW91dphK7/vuKuYnKz/6
 X4F06xUSeSsvUl8MXUhCaSdR8dj5vmFiQOOQCbTxUfUZIujH2gAa0m+qEczc6lrkmJZ8
 bR/hqOwh39KvMu0NwahE09eYqLTo65sh49kDnH4/qcafSj3uGeJUytvxtmhfhi4Vm6Fl
 HhtA==
X-Gm-Message-State: AOAM530a9C1Ew8V8x2xsPRNA0GCOxuIaoptpKNyEdwb12O0De7gNPcg0
 WvzNLg8cwm47tL7UAe3nP7/CSNXBvsEuxcgcW1FyXX2TDFIhy+DmOUljxUmUqwU/ZRg/KmTAOKX
 w9aYhwuGEZnOL2sEMlMpgjnJQd+c=
X-Received: by 2002:a05:6902:6c1:: with SMTP id
 m1mr12545519ybt.252.1599742462170; 
 Thu, 10 Sep 2020 05:54:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPe7Yi6nrnVoDMaYWscom1wtnCB4ARg6SUebEZjjlaFhInN8YDgU1iZLF3KVG3ANaTumX56YThnBOgIVWmX6I=
X-Received: by 2002:a05:6902:6c1:: with SMTP id
 m1mr12545496ybt.252.1599742461891; 
 Thu, 10 Sep 2020 05:54:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200910093532.20223-1-liwang@redhat.com>
 <20200910095542.GA4275@yuki.lan>
In-Reply-To: <20200910095542.GA4275@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Thu, 10 Sep 2020 20:54:09 +0800
Message-ID: <CAEemH2eFR63=G-sJyRPv+KwAELh3ukCoZ4NMUsDFQcM=oCNc-A@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] Add a test case for mmap MAP_GROWSDOWN flag
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
Cc: pravin <pravinraghul@zilogic.com>, LTP List <ltp@lists.linux.it>,
 "Vijay Kumar B ." <vijaykumar@zilogic.com>
Content-Type: multipart/mixed; boundary="===============1622976815=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1622976815==
Content-Type: multipart/alternative; boundary="0000000000002c703905aef5114f"

--0000000000002c703905aef5114f
Content-Type: text/plain; charset="UTF-8"

> +     child_pid = SAFE_FORK();
> > +     if (!child_pid)
> > +             grow_stack(stack, stack_size, stack - stack_size +
> UNITS(1));
>
> Why don't we allocate the stack here in the child process? That way we
> can also get rid of the cleanup() function.
>

Ok, that's no problem.


> Also when we are at it, can we also add a second test where we mmap() a
> page in the space the stack is supposed to grow into i.e. do
> allocate_stack() then mmap() a page in the free address space and check
> that the child is killed by a SIGSEGV?
>

Sure, it is a strict way to verify everything goes well with
MAP_GROWSDOWN:).
And to guarantee SIGSEGV, it needs mapping into the address higher than the
(void *)(stack - stack_size), because older kernel set 'stack_guard_gap' as
1 page.

I'll try this in V5 tomorrow.


>
> > +     SAFE_WAIT(&wstatus);
> > +     if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) == 0)
> > +             tst_res(TPASS, "Stack grows in unmapped region");
> > +     else if (WIFSIGNALED(wstatus))
> > +             tst_res(TFAIL, "Child killed by %s",
> tst_strsig(WTERMSIG(wstatus)));
>
> There is no point in this else if and tst_res(), the tst_strstatus() will
> print that info
> for you.
>
Agree.

-- 
Regards,
Li Wang

--0000000000002c703905aef5114f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0child_pid =3D SAFE_FORK();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!child_pid)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grow_stack(stack, sta=
ck_size, stack - stack_size + UNITS(1));<br>
<br>
Why don&#39;t we allocate the stack here in the child process? That way we<=
br>
can also get rid of the cleanup() function.<br></blockquote><div><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Ok, that&#39;s no pr=
oblem.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small"></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
Also when we are at it, can we also add a second test where we mmap() a<br>
page in the space the stack is supposed to grow into i.e. do<br>
allocate_stack() then mmap() a page in the free address space and check<br>
that the child is killed by a SIGSEGV?<br></blockquote><div><br></div><div>=
<div class=3D"gmail_default" style=3D"font-size:small">Sure, it is a strict=
 way to verify everything goes well with MAP_GROWSDOWN:).</div></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">And to=C2=A0guarantee SIGS=
EGV, it needs=C2=A0mapping into the address higher than the</div><div class=
=3D"gmail_default" style=3D"font-size:small">(void *)(stack - stack_size), =
because older kernel set &#39;stack_guard_gap&#39; as 1 page.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">I&#39;ll try this in V5 tomorrow.</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_WAIT(&amp;wstatus);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (WIFEXITED(wstatus) &amp;&amp; WEXITSTATUS(wst=
atus) =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;=
Stack grows in unmapped region&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (WIFSIGNALED(wstatus))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quot;=
Child killed by %s&quot;, tst_strsig(WTERMSIG(wstatus)));<br>
<br>
There is no point in this else if and tst_res(), the tst_strstatus() will p=
rint that info<br>
for you.<br></blockquote><div><span class=3D"gmail_default" style=3D"font-s=
ize:small">Agree.</span></div><div><span class=3D"gmail_default" style=3D"f=
ont-size:small"></span>=C2=A0</div></div>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000002c703905aef5114f--


--===============1622976815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1622976815==--

