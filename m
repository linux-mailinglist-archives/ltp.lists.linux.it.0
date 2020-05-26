Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EC71E1F93
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 12:24:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 68B123C32C8
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 12:24:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 69A133C2235
 for <ltp@lists.linux.it>; Tue, 26 May 2020 12:24:04 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 8E581601078
 for <ltp@lists.linux.it>; Tue, 26 May 2020 12:23:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590488642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Wbj41MN/4r/ZCmsTOqQtkjnBadXc3Yw0GQLgwd3f/k=;
 b=bjAJl+4YnszIA5LPb7m5UE3OsIgghBTGFkxPUbczOD2JEP/tOy47MZtBQr2mxjq4Vij3iY
 vffwYiLfJf/cGo8g9aeSPlsdyFEvh51bdhLqWRKEfDvTR7RP9ccg2P2hHcfRUcu7zeYuFS
 eS+aYlJvKTn8oFVOESFYNksVFsF7WyQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-G8r_cosAPsilD6c2ytgXvg-1; Tue, 26 May 2020 06:24:00 -0400
X-MC-Unique: G8r_cosAPsilD6c2ytgXvg-1
Received: by mail-lj1-f199.google.com with SMTP id z9so243227ljn.4
 for <ltp@lists.linux.it>; Tue, 26 May 2020 03:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Wbj41MN/4r/ZCmsTOqQtkjnBadXc3Yw0GQLgwd3f/k=;
 b=KpkgnPOzsNmOjkM5diG2U3NP6AAk5dBoSOlVeWJFqHW0gO7wcdw1nWi2fmiCTD/GyS
 pYSFAHTz89EIVnsbfkGepZAbwKTiMRgguxEbbS4rAYH0HLcw1KHFwWf71pkYbX1Rl8Iy
 jWKtHJIaNRh62fo99+diqi95VGK4KJN/21ijUXtlzS5m0qLSYvMRT6Zi1RoHT4dsEEv2
 OqojOfScCFx9o9mTIv+1rac+tQyfv1BF7inY4DzKB9x/qWNkR+AgtQCbqwLcLLvjLHeS
 KW7ZJ7lVtn2T4eC/kJuuz70TT2FrBBLpsg4yT1VgUH8vE0spLvshhe2AucC9tFWM6YpS
 dgbQ==
X-Gm-Message-State: AOAM533s9+z6VR1cn+EWbMWAFXEjswxQRwcQ7N3wM/UsGQm/YJR9zqdO
 rSO+Skg0/Jsr1q9rJk2NLvuUe56K9LYWztvIvfB3yGSwGFOfq4pkYhynwPH4bG7/uwqTombsrGG
 tQGdwfwCHO2ULXxQuZXODG9D2slc=
X-Received: by 2002:a2e:9d95:: with SMTP id c21mr274332ljj.468.1590488638575; 
 Tue, 26 May 2020 03:23:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTvAod56FmtwzrWl+nkQ4fVF4rlYLQv1Zcbb14wyVVZjXPiyto4jVu8kSflVXN+4BAy7hKBt5Y4SqgH951WQc=
X-Received: by 2002:a2e:9d95:: with SMTP id c21mr274326ljj.468.1590488638402; 
 Tue, 26 May 2020 03:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200526070901.12957-1-liwang@redhat.com>
 <2000957070.13598874.1590483511876.JavaMail.zimbra@redhat.com>
In-Reply-To: <2000957070.13598874.1590483511876.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 26 May 2020 18:23:44 +0800
Message-ID: <CAEemH2enek2YivV+F9bLGXqnHEVVM7cLPyvyYUnrw5z9NPQcYg@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: use TCONF if hpage reserve failed in retry
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
Content-Type: multipart/mixed; boundary="===============0027807773=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0027807773==
Content-Type: multipart/alternative; boundary="0000000000004fd33805a68a7e65"

--0000000000004fd33805a68a7e65
Content-Type: text/plain; charset="UTF-8"

On Tue, May 26, 2020 at 4:58 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > Test still easy to get fail in hpages reserving (only 80% of
> > max_hpages) because of memory fragmentation.
> >
> >   tst_hugepage.c:46: BROK: nr_hugepages = 171, but expect 255
> >
> > But it seems unkind and useless to exit with TBROK when failed
> > in hpage reserve retrying. This patch proposes to use TCONF for
> > better log review.
> >
> > Signed-off-by: Li Wang <liwang@redhat.com>
> > Cc: Jan Stancek <jstancek@redhat.com>
>
> Acked-by: Jan Stancek <jstancek@redhat.com>
>

Pushed, thanks for the review.


-- 
Regards,
Li Wang

--0000000000004fd33805a68a7e65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, May 26, 2020 at 4:58 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; Test still easy to get fail in=C2=A0hpages=C2=A0reserving (only 80% of=
<br>
&gt; max_hpages) because of memory fragmentation.<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0tst_hugepage.c:46: BROK: nr_hugepages =3D 171, but expect =
255<br>
&gt; =C2=A0 =C2=A0<br>
&gt; But it seems unkind and useless to exit with TBROK when failed<br>
&gt; in hpage reserve retrying. This patch proposes to use TCONF for<br>
&gt; better log review.<br>
&gt; <br>
&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; Cc: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=3D"_=
blank">jstancek@redhat.com</a>&gt;<br>
<br>
Acked-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=3D"=
_blank">jstancek@redhat.com</a>&gt;<br></blockquote><div><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Pushed, thanks for the revie=
w.</div></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" clas=
s=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<=
br></div></div></div></div>

--0000000000004fd33805a68a7e65--


--===============0027807773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0027807773==--

