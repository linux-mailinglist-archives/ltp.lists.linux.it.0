Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BBE26615F
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 16:42:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F85F3C4FD1
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 16:42:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E039F3C224B
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 16:42:06 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 559C5600995
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 16:42:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599835324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TGO6l3kZvBblx6/aP8tCfJ5AongtofwRw0De++9hlY4=;
 b=gekKFYoJo3uzkaDMcKw7jfWi+8lV5reOsy1fJiwVd6zzQ4beW5iSz+XOIqKAs/mTWrHNVU
 LIgOOpaB1HZ1M+7c2zicjRMVd+TVBOZXD9C85TpKmV30hhuCKZ2kBe3S4AdLVpvE4U247o
 4rR4hSjdFGlv5rflt8t/dDCNXIC9VYI=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-ZdUiQwVPOlKYvm61WOM04A-1; Fri, 11 Sep 2020 10:42:02 -0400
X-MC-Unique: ZdUiQwVPOlKYvm61WOM04A-1
Received: by mail-yb1-f198.google.com with SMTP id i199so1797275ybg.22
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 07:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TGO6l3kZvBblx6/aP8tCfJ5AongtofwRw0De++9hlY4=;
 b=hfFMxO/KLMzmPyK7DikOxYhvoyn+w6xzsQ56F8LSeKjRKaeKQkUy5bfEiTdle0+USJ
 0v6JX6F41h4I+80nfRCsjSdvfpqyBY543pX284U67ahrTPXFMIny3Yfe+CWXcdGKjiRY
 uJVHcL2OP6UZ6/S8kiOUJMkxGOL9jLgD+z7BUgwQyfZ0tiWetNyTZm+MRLYlR1DL4Hat
 MtYKW2S8pynd5mKlo1SVENjyeseX4+ohRleRLAcX3aMx3h9QUEk049slC6rBQJ1G9uiQ
 Pf+cJ0JoFmVLRCLhAIwa0338QB5nypnUP3bwOdc0b0t+I/veMBtj65DVVxBdFCm1cIBE
 jyuw==
X-Gm-Message-State: AOAM530PWu2jYJVYBV7RPW6o0nyr2a5wGctCk7OtihjMOXBUAyuCphEv
 yoR49UmUkr8syvbE27P9+Lc/wXbz7nQ7P1Qlcns6q6ihGjm+Wv8Du1u8V7oVALk0DyVDmUYVdcU
 O/A7Z88kVk5YXubaew00NEVVu0co=
X-Received: by 2002:a25:d14b:: with SMTP id i72mr3007791ybg.286.1599835321673; 
 Fri, 11 Sep 2020 07:42:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVONniacIMbAHelG8cUhOM4PFg+/fRtcRXOhJAszQ7wrID6BJ+4TnRI59TUoOeB8hNjR+LfOCRgj9fZ+QYwMM=
X-Received: by 2002:a25:d14b:: with SMTP id i72mr3007762ybg.286.1599835321391; 
 Fri, 11 Sep 2020 07:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200911035533.30538-1-liwang@redhat.com>
 <20200911130836.GA2582@yuki.lan>
In-Reply-To: <20200911130836.GA2582@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Fri, 11 Sep 2020 22:41:49 +0800
Message-ID: <CAEemH2fPRTh6drs=h=U7OG07SZDgpDfEB0xRadF8Y1FbaHR8Nw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5] Add a test case for mmap MAP_GROWSDOWN flag
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
Content-Type: multipart/mixed; boundary="===============0062734515=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0062734515==
Content-Type: multipart/alternative; boundary="00000000000007e90205af0ab0d3"

--00000000000007e90205af0ab0d3
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 11, 2020 at 9:08 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> ...
> > +static void allocate_stack(size_t size)
> > +{
> > +     void *start;
> > +
> > +     /*
> > +      * Since the newer kernel does not allow a MAP_GROWSDOWN mapping
> to grow
> > +      * closer than 'stack_guard_gap' pages away from a preceding
> mapping.
> > +      * The guard then ensures that the next-highest mapped page
> remains more
> > +      * than 'stack_guard_gap' below the lowest stack address, and if
> not then
> > +      * it will trigger a segfault. So, here adding 256 pages memory
> spacing
> > +      * for stack growing safely.
> > +      *
> > +      * Btw, kernel default 'stack_guard_gap' size is '256 *
> getpagesize()'.
> > +      */
> > +     long total_size = 256 * getpagesize() + size * 2;
> > +
> > +     start = SAFE_MMAP(NULL, total_size, PROT_READ | PROT_WRITE,
> > +                     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > +     SAFE_MUNMAP(start, total_size);
> > +
> > +     /* start                             stack
> > +      * +-----------+---------------------+----------------------+
> > +      * | 256 pages | unmapped (size)     | mapped (size)        |
> > +      * +-----------+---------------------+----------------------+
> > +      *
> > +      */
> > +     stack = SAFE_MMAP((start + total_size - size), size, PROT_READ |
> PROT_WRITE,
> > +                       MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS |
> MAP_GROWSDOWN,
> > +                       -1, 0);
>
> Well it's not wrong per se but as it is we do not use the pre-allocated
> part of the stack at all, we directly jump for the guard page as we use
>

Really? But I think the pthread_attr_setstack(&attr, stack, stack_size) will
take use of the whole stack memory in function recursive performing.
How can we say NOT use the pre-allocated stack? I fell a bit confused
about your words here.

> the stack pointer as a base for the pthread stack. The actual pointer
> that points to the start of the region is stack - stack_size.
>

If that's true, it might belong to the internal operation of stack grows,
should we take care of it in the userspace case?

> There is no point in adding size * 2 here. We can as well reserve 256 *
> page_size + size. Then map() a single page at the end, which would be at
> start + total_size - page_size and finally return start + total_size
> from this function and pass that to pthread_attr_setstack().
>

I guess that will be work, but sounds a bit stingy. Since the modern system
does not short of such memory for testing:). And if we decide to go with
this,
the code design comments above should be all rewrite.


>
> That way it would look like:
>
> | 256 pages | unmapped | 1 mapped page |
>
>             | - - -  stack_size  - - - |
>
>
> ...
> > +     SAFE_PTHREAD_CREATE(&test_thread, &attr, check_depth_recursive,
> limit);
> > +     SAFE_PTHREAD_JOIN(test_thread, NULL);
> > +
> > +     if (stack)
> > +             SAFE_MUNMAP(stack, stack_size);
>
> I'ts a bit unexpected to unmap the stack here. I guess that unamping it
> in the run_test() after the grow_stack() call would be a bit cleaner but
> we would have to move the exit(0) there as well.
>

I agree with this.


> > +     /* Test 2 */
> > +     child_pid = SAFE_FORK();
> > +     if (!child_pid) {
> > +             tst_no_corefile(0);
>                   ^
>                  This should go to the test setup.
>

Only the child_2 will get SIGSEGV, why should we move it to affect the
whole test?

-- 
Regards,
Li Wang

--00000000000007e90205af0ab0d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Sep 11, 2020 at 9:08 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_defaul=
t" style=3D"font-size:small">...</span><br>
&gt; +static void allocate_stack(size_t size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void *start;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Since the newer kernel does not allow a MAP_GR=
OWSDOWN mapping to grow<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * closer than &#39;stack_guard_gap&#39; pages aw=
ay from a preceding mapping.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * The guard then ensures that the next-highest m=
apped page remains more<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * than &#39;stack_guard_gap&#39; below the lowes=
t stack address, and if not then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * it will trigger a segfault. So, here adding 25=
6 pages memory spacing<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * for stack growing safely.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Btw, kernel default &#39;stack_guard_gap&#39; =
size is &#39;256 * getpagesize()&#39;.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0long total_size =3D 256 * getpagesize() + size * =
2;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0start =3D SAFE_MMAP(NULL, total_size, PROT_READ |=
 PROT_WRITE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_MUNMAP(start, total_size);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* start=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stack<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * +-----------+---------------------+-----------=
-----------+<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * | 256 pages | unmapped (size)=C2=A0 =C2=A0 =C2=
=A0| mapped (size)=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * +-----------+---------------------+-----------=
-----------+<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0stack =3D SAFE_MMAP((start + total_size - size), =
size, PROT_READ | PROT_WRITE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS | MAP_GROWSDOWN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0-1, 0);<br>
<br>
Well it&#39;s not wrong per se but as it is we do not use the pre-allocated=
<br>
part of the stack at all, we directly jump for the guard page as we use<br>=
</blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">Really? But I think the=C2=A0pthread_attr_setstack(&amp;attr, stack=
, stack_size) will</div><div class=3D"gmail_default">take use of the whole =
stack memory in function recursive performing.</div><div class=3D"gmail_def=
ault">How can we say NOT use the pre-allocated=C2=A0stack? I fell a bit con=
fused</div><div class=3D"gmail_default" style=3D"font-size:small">about you=
r words here.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
the stack pointer as a base for the pthread stack. The actual pointer<br>
that points to the start of the region is stack - stack_size.<br></blockquo=
te><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:smal=
l">If that&#39;s true, it might belong to the internal operation of stack g=
rows,</div><div class=3D"gmail_default" style=3D"font-size:small">should we=
 take care of it in the=C2=A0userspace case?</div></div><div class=3D"gmail=
_default" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
There is no point in adding size * 2 here. We can as well reserve 256 *<br>
page_size + size. Then map() a single page at the end, which would be at<br=
>
start + total_size - page_size and finally return start + total_size<br>
from this function and pass that to pthread_attr_setstack().<br></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">I guess that will be work, but sounds a bit stingy. Since the modern syst=
em</div><div class=3D"gmail_default" style=3D"font-size:small">does not sho=
rt of such memory for testing:). And if we decide to go with this,</div></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">the code design c=
omments above should be all rewrite.</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
That way it would look like:<br>
<br>
| 256 pages | unmapped | 1 mapped page |<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | - - -=C2=A0 stack_size=C2=A0 - =
- - |<br>
<br>
<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_PTHREAD_CREATE(&amp;test_thread, &amp;attr, =
check_depth_recursive, limit);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_PTHREAD_JOIN(test_thread, NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (stack)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_MUNMAP(stack, st=
ack_size);<br>
<br>
I&#39;ts a bit unexpected to unmap the stack here. I guess that unamping it=
<br>
in the run_test() after the grow_stack() call would be a bit cleaner but<br=
>
we would have to move the exit(0) there as well.<br></blockquote><div><br><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small">I agree wi=
th this.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0/* Test 2 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0child_pid =3D SAFE_FORK();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!child_pid) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_no_corefile(0);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This should g=
o to the test setup.<br></blockquote><div><br></div><div><div class=3D"gmai=
l_default" style=3D"font-size:small">Only the child_2 will get SIGSEGV, why=
 should we move it to affect the whole test?</div></div></div><div><br></di=
v>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>R=
egards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000007e90205af0ab0d3--


--===============0062734515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0062734515==--

