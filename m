Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D959E265AA5
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 09:42:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 582E23C2BF7
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 09:42:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 16C223C262C
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 09:42:28 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 5D9F814001F4
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 09:42:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599810145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iXw1FBYfyw63P+orxol1OQnXrLfvEpp9Sq2jhTeFIbg=;
 b=YiuOJ8KGlqzo6wV8QqtKNtCSt5+yievW9z3+MMW8MVGbi4I2BmbthBaAH6v7RrZeLeUVb9
 9DPjpatX5Q70/MXtPyhRtSATlpaIM/O5v8g4SkKyLn58RZalABo90JXUz4viOK24Us7gtB
 kaaInFS2jUf/t7vnQjgrPHWbd0AlnaU=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-3m5Msw4DOFG30Z60DNV7DA-1; Fri, 11 Sep 2020 03:42:23 -0400
X-MC-Unique: 3m5Msw4DOFG30Z60DNV7DA-1
Received: by mail-yb1-f200.google.com with SMTP id u128so8038045ybg.17
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 00:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iXw1FBYfyw63P+orxol1OQnXrLfvEpp9Sq2jhTeFIbg=;
 b=jPibRVV9gul9ORim/0iS1wb7K9JJl6lwYJdyJXm+r3gg3B09Ewf+w8BgsmdeUvRqUH
 fQYv2FsU5EJsEL7avylM5TN+SsEU6Gu2vUtNzzw314qtbzyEJX3H7mhkWTAEdrqXgyUv
 mVe4wVWu6Gb+KQql1hjXeCHt+NGM/FCcl1bfDuDcM3VgfwEhju9Q19JD0krC9f1hhcAu
 6xtqLHANCZrgOP3RvgnFk6s3rHaU3R6oIONxilHd2mtDXgyXBjvr/NT5ieVZwRObCmGV
 LmpfJcKbxas5O7s6g6zZi2U03400vuoOGq/qIJQgcOv4DM6o0INNUMiCYmF0Q2y3lAMa
 lL7A==
X-Gm-Message-State: AOAM532ixu0ZW7Sk/jTD+Uneb2grAcvLIZlREnBgNiIakf+Rk4e+vmSb
 IqBIYU7Xwcv2nYQY33HeTNg+MtMLLdkenGf4lud8NZ160fis4vE1FYtOJv5yyrhTk/VYJtIv5lw
 dRnc4VbO60mFeJlsJDIeSlfVTrNs=
X-Received: by 2002:a25:2d59:: with SMTP id s25mr819146ybe.86.1599810143238;
 Fri, 11 Sep 2020 00:42:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR7eVTh89UcyfbeTW4tEpdGETykLzMHggXhPtf+32SiSyRPZ73x9hs2CbUDKIImJFcOH3KK+9OHRlCfRAA6v0=
X-Received: by 2002:a25:2d59:: with SMTP id s25mr819121ybe.86.1599810142981;
 Fri, 11 Sep 2020 00:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200911035533.30538-1-liwang@redhat.com>
 <20200911070540.GA22970@dell5510>
In-Reply-To: <20200911070540.GA22970@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Fri, 11 Sep 2020 15:42:11 +0800
Message-ID: <CAEemH2eC-2SckKbWbQXLYZa=W8RM3hzA4-vWTKJasVFW_HnQKw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Content-Type: multipart/mixed; boundary="===============0443202178=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0443202178==
Content-Type: multipart/alternative; boundary="00000000000047f0b805af04d304"

--00000000000047f0b805af04d304
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2020 at 3:05 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> > From: pravin <pravinraghul@zilogic.com>
>
> > We assign the memory region allocated using MAP_GROWSDOWN to a thread,
> > as a stack, to test the effect of MAP_GROWSDOWN. This is because the
> > kernel only grows the memory region when the stack pointer, is within
> > guard page, when the guard page is touched.
>
> >   1. Map an anyonymous memory region of size X, and unmap it.
> >   2. Split the unmapped memory region into two.
> >   3. The lower memory region is left unmapped.
> >   4. The higher memory region is mapped for use as stack, using
> MAP_FIXED | MAP_GROWSDOWN.
> >   5. The higher memory region is provided as stack to a thread, where
> >      a recursive function is invoked.
> >   6. The stack grows beyond the allocated region, into the lower memory
> area.
> >   7. If this results in the memory region being extended, into the
> >      unmapped region, the test is considered to have passed.
>
> > Also, to verify that(Test2) the stack grows to within a page of the hig=
h
> > end of the next lower map=E2=80=90ping will result in a SIGSEGV signal.
>
> > Resolves #300
> > Signed-off-by: Pravin Raghul S. <pravinraghul@zilogic.com>
> > Reviewed-by: Vijay Kumar B. <vijaykumar@zilogic.com>
> > Signed-off-by: Li Wang <liwang@redhat.com>
> > Cc: Cyril Hrubis <chrubis@suse.cz>
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> LGTM.
>
> Just please fix using spaces instead of tabs in check_stackgrow_up() and
> run_test() (I suppose your modifications to pravis's code):
>

Sorry for the chaotic indent, I guess it was caused by my editor.

Anyway, thanks for the review, will fix it after getting Cyril's reviewing.

--=20
Regards,
Li Wang

--00000000000047f0b805af04d304
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Sep 11, 2020 at 3:05 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
&gt; From: pravin &lt;<a href=3D"mailto:pravinraghul@zilogic.com" target=3D=
"_blank">pravinraghul@zilogic.com</a>&gt;<br>
<br>
&gt; We assign the memory region allocated using MAP_GROWSDOWN to a thread,=
<br>
&gt; as a stack, to test the effect of MAP_GROWSDOWN. This is because the<b=
r>
&gt; kernel only grows the memory region when the stack pointer, is within<=
br>
&gt; guard page, when the guard page is touched.<br>
<br>
&gt;=C2=A0 =C2=A01. Map an anyonymous memory region of size X, and unmap it=
.<br>
&gt;=C2=A0 =C2=A02. Split the unmapped memory region into two.<br>
&gt;=C2=A0 =C2=A03. The lower memory region is left unmapped.<br>
&gt;=C2=A0 =C2=A04. The higher memory region is mapped for use as stack, us=
ing MAP_FIXED | MAP_GROWSDOWN.<br>
&gt;=C2=A0 =C2=A05. The higher memory region is provided as stack to a thre=
ad, where<br>
&gt;=C2=A0 =C2=A0 =C2=A0 a recursive function is invoked.<br>
&gt;=C2=A0 =C2=A06. The stack grows beyond the allocated region, into the l=
ower memory area.<br>
&gt;=C2=A0 =C2=A07. If this results in the memory region being extended, in=
to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unmapped region, the test is considered to have pa=
ssed.<br>
<br>
&gt; Also, to verify that(Test2) the stack grows to within a page of the hi=
gh<br>
&gt; end of the next lower map=E2=80=90ping will result in a SIGSEGV signal=
.<br>
<br>
&gt; Resolves #300<br>
&gt; Signed-off-by: Pravin Raghul S. &lt;<a href=3D"mailto:pravinraghul@zil=
ogic.com" target=3D"_blank">pravinraghul@zilogic.com</a>&gt;<br>
&gt; Reviewed-by: Vijay Kumar B. &lt;<a href=3D"mailto:vijaykumar@zilogic.c=
om" target=3D"_blank">vijaykumar@zilogic.com</a>&gt;<br>
&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; Cc: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"_bla=
nk">chrubis@suse.cz</a>&gt;<br>
<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br>
LGTM.<br>
<br>
Just please fix using spaces instead of tabs in check_stackgrow_up() and<br=
>
run_test() (I suppose your modifications to pravis&#39;s code):<br></blockq=
uote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Sorry for the=C2=A0chaotic indent, I guess it was caused by my editor.</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Anyway, thanks for the review=
, will fix it after getting Cyril&#39;s reviewing.</div></div><div><br></di=
v>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>R=
egards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000047f0b805af04d304--


--===============0443202178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0443202178==--

