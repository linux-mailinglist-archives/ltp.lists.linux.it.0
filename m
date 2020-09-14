Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF4E2682E3
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Sep 2020 05:06:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 800543C2BFB
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Sep 2020 05:06:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id CDBB63C1351
 for <ltp@lists.linux.it>; Mon, 14 Sep 2020 05:06:23 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 8A194600490
 for <ltp@lists.linux.it>; Mon, 14 Sep 2020 05:06:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600052780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2uwgwb56fAXlvLTTToezi6CiNcGMwkVt+eGb8zWN2Pw=;
 b=VZ+834BrsKg/WuwO9/vWzYlhGA5Al2t6g/cAkyumkv0lvg9JRReSNk9MX+zBY8GCbIc184
 WrGQkQK7yX91u5J0P0bkf31tTHZXtEQPSvSjeb0tSTJGOsahDAu4fC4coeXG+HfWUN6FlJ
 5b0h7sNP3lC8NwFB5dTC0YXT6CYLrdE=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-AJorH6WhNpWyLYlpby46rA-1; Sun, 13 Sep 2020 23:06:18 -0400
X-MC-Unique: AJorH6WhNpWyLYlpby46rA-1
Received: by mail-yb1-f200.google.com with SMTP id 125so15436575ybg.12
 for <ltp@lists.linux.it>; Sun, 13 Sep 2020 20:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2uwgwb56fAXlvLTTToezi6CiNcGMwkVt+eGb8zWN2Pw=;
 b=stMRGMQ7+ktWrlMOn+hX8AF1rF3sKnMBqDcwHzmt25xWQAxKG3axTHZrC9O4aEqc5K
 ZfZmf3z07H4Ec3LKMEZq7ugng2tIGoIiLRbnPCxBX+bpc+ZeyIXPspBIcqpueaWw6PH/
 XQt4+3FWRY0C1mvSVE1G3WHOc9S9QbOSwgTrjuGE6wFX3R0BmNosoN1BAwVJ464kLQtO
 7bHAknfJtz+dHvq5mBkZ/U+7y9Ir09v1eKWY3fodSmUErfMIYNSjT6YolDPwfqqcDIwq
 shmNMOJO08ukvvr1ulQvgALkGE4VH8kMzDA5vyLyV1HEZlXd8iz6tEZAOaIiLzN4kG7+
 4KRg==
X-Gm-Message-State: AOAM530Y2hKbqUPhUiefNXCd5K6/T+mJcjfYIURhn3qBDefvL38OklCs
 lj+c1pbRXunsjyAG49/m0FXU2BhluVSDLCC2Jvi6pAZlrr2zqOvpwuSnTxegVEarT7O+7tadIr7
 H55Lt+5t02u/LcDbCiB95NE9FRcM=
X-Received: by 2002:a25:69cb:: with SMTP id e194mr2356655ybc.243.1600052777815; 
 Sun, 13 Sep 2020 20:06:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3f2zSsl4bwYqu9oOOHx2vznZyFnZuiqWGXNTGU/5K7DzWYVOMVzktrNR8c56aTkPuH3IXu5C5kaTNRaZLdBI=
X-Received: by 2002:a25:69cb:: with SMTP id e194mr2356626ybc.243.1600052777550; 
 Sun, 13 Sep 2020 20:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200911035533.30538-1-liwang@redhat.com>
 <20200911130836.GA2582@yuki.lan>
 <CAEemH2fPRTh6drs=h=U7OG07SZDgpDfEB0xRadF8Y1FbaHR8Nw@mail.gmail.com>
 <20200911145730.GA6157@yuki.lan>
In-Reply-To: <20200911145730.GA6157@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Mon, 14 Sep 2020 11:06:05 +0800
Message-ID: <CAEemH2cXY+-Dgq8PB-ZunzRnjM1iH0KiB5gK5=CLnFDSEiKLdQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1232349698=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1232349698==
Content-Type: multipart/alternative; boundary="0000000000006da22805af3d5187"

--0000000000006da22805af3d5187
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 11, 2020 at 10:57 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > > Well it's not wrong per se but as it is we do not use the pre-allocated
> > > part of the stack at all, we directly jump for the guard page as we use
> > >
> >
> > Really? But I think the pthread_attr_setstack(&attr, stack, stack_size)
> will
> > take use of the whole stack memory in function recursive performing.
> > How can we say NOT use the pre-allocated stack? I fell a bit confused
> > about your words here.
>
> I've been confused as well I looked at pthread_attr_setstack() function
> manual and it's expecting to get the lowest pointer of the stack. So I
> suppose that the stack really started at the stack + stack_size address.
>

I guess you probably misread the "lowest pointer of the stack", it is not
mean
the bottom of the stack, it is actually the lowest addressable byte of a
buffer of
stacksize. From what I understand, we should NOT pass the 'stack +
stack_size'
address to pthread_attr_setstack().



> But still the code wasn't exactly right, because the lowest address of
> the stack in the previous code was stack - stack_size, which would be
> start of the unmapped region and the size of the stack would be 2 *
> stack_size, as we expected the mapping to grow.
>

No, I don't think so, the lowest address of the stack in the previous code
is:
    stack = start + total_size - size;
and we pass this stack pointer to ptrehad_attr_setstack() is correct here,
indeed the stack really starts at stack + stack_size, that's internal steps.

If we go with 'stack + stack_size' as you suggested, that will easily get
segmental fault. So I stand by myself understanding unless someone can
give enough explanation/demo :).

PTHREAD_ATTR_SETSTACK(3) manual says:
  "stackaddr should point to the lowest addressable byte of a buffer of
stacksize bytes that was allocated by the caller.  The pages of the
allocated buffer should be both readable and writable."

-- 
Regards,
Li Wang

--0000000000006da22805af3d5187
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Sep 11, 2020 at 10:57 PM Cyril Hrubis &lt;<=
a href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt; Well it&#39;s not wrong per se but as it is we do not use the pre=
-allocated<br>
&gt; &gt; part of the stack at all, we directly jump for the guard page as =
we use<br>
&gt; &gt;<br>
&gt; <br>
&gt; Really? But I think the pthread_attr_setstack(&amp;attr, stack, stack_=
size) will<br>
&gt; take use of the whole stack memory in function recursive performing.<b=
r>
&gt; How can we say NOT use the pre-allocated stack? I fell a bit confused<=
br>
&gt; about your words here.<br>
<br>
I&#39;ve been confused as well I looked at pthread_attr_setstack() function=
<br>
manual and it&#39;s expecting to get the lowest pointer of the stack. So I<=
br>
suppose that the stack really started at the stack + stack_size address.<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">I guess you probably misread the &quot;lowest pointer of the =
stack&quot;, it is not mean</div><div class=3D"gmail_default" style=3D"font=
-size:small">the bottom of the stack, it is actually the lowest addressable=
 byte of a buffer of</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">stacksize. From what I understand, we should NOT pass the &#39;stack=
=C2=A0+ stack_size&#39;</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">address to=C2=A0pthread_attr_setstack().=C2=A0</div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
But still the code wasn&#39;t exactly right, because the lowest address of<=
br>
the stack in the previous code was stack - stack_size, which would be<br>
start of the unmapped region and the size of the stack would be 2 *<br>
stack_size, as we expected the mapping to grow.<br></blockquote><div><br></=
div><div><div class=3D"gmail_default" style=3D"font-size:small">No, I don&#=
39;t think so, the lowest address of the stack in the previous code is:</di=
v><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 stac=
k =3D start + total_size - size;</div></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">and we pass this stack pointer to=C2=A0ptrehad_attr=
_setstack() is correct here,</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">indeed the stack really starts at stack=C2=A0+ stack_size, th=
at&#39;s internal steps.</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
If we go with &#39;stack=C2=A0+ stack_size&#39; as you suggested, that will=
 easily get</div><div class=3D"gmail_default" style=3D"font-size:small">seg=
mental fault. So I stand by myself understanding unless someone can</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">give enough explanatio=
n/demo :).</div><div><br></div><div><div class=3D"gmail_default" style=3D"f=
ont-size:small">PTHREAD_ATTR_SETSTACK(3) manual says:</div><div class=3D"gm=
ail_default" style=3D"font-size:small">=C2=A0 &quot;stackaddr should point =
to the lowest addressable byte of a buffer of stacksize bytes that was allo=
cated by the caller.=C2=A0 The pages of the allocated buffer should be both=
 readable and writable.&quot;</div><br></div></div>-- <br><div dir=3D"ltr" =
class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li W=
ang<br></div></div></div></div>

--0000000000006da22805af3d5187--


--===============1232349698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1232349698==--

