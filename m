Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9CE3BA0B5
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:48:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D205A3C8E02
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:48:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 663623C8259
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:48:23 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 646D61A0175F
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:48:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625230101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7hLpOTd5t9PafvB7pOKfScP0rm6EWsXAcF6FNZcqqno=;
 b=IeVH1ePrjOsCYsuDA53DQ/t+v0ZU1KxHUNYnw9tpj7MwZtFwk0VXpNbA9q+kaJwASg3Xe9
 kVFBzEtyxWsxQ7YEbYB+qKSgnHPSqLQRloTqF2gZyALDFntaxLdUYnIBVvAWP0Iluao/BX
 zbRAZjARoAs1PVDNXBN6OXdZU8u8AyE=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-Hl3GAesZO4aAwBZzT9_6KQ-1; Fri, 02 Jul 2021 08:48:19 -0400
X-MC-Unique: Hl3GAesZO4aAwBZzT9_6KQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 6-20020a9f24060000b029027872bb5b5dso2687975uaq.1
 for <ltp@lists.linux.it>; Fri, 02 Jul 2021 05:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7hLpOTd5t9PafvB7pOKfScP0rm6EWsXAcF6FNZcqqno=;
 b=EnJhLVwVCHfow9Bpo+ni/6t4rKFb3GjAmT6pI+53t/NZ8/OiAwU81RDd39uKEHl++1
 wGkrjM9sxOggcVptlp7B1ihzZ4Bv2bhsSMqeCdcrnGtqI8VcrRfCcc7VMT9Nc1qJ4FUA
 OBxru9tgcfx591rtxSrLFvJ1/sGHKOI1Dwa9EXlN9UPmXl2eSvD6SQ8MyuOeXsHYJmO1
 gpIeMKkZ+s7GMjyCa85qz/NpCFlCJkTfWNEfsE5cWaVxYRewM57fUSmXRkwO5TRQ7NPd
 bk5g9rLXEd8k01c5kwiRk9Hk/iVq0Rg2A0xD4P/+nNfiZu5JNRWkmKd15VJLWm96mK4S
 75XA==
X-Gm-Message-State: AOAM531czmJNra9KqvkTIrx+AqCLfSS/rk6SbcRa8xo7Nu/DJH76w6/m
 8DvtUce/aKKuVyecj2fqrRVLFKIAM/5YXyX4N4m/XtjxgulTM8UFz6YbJnCCH//CvZyKobRqY/V
 nOdmM0URto9X4ilaB+Igm9am+wYE=
X-Received: by 2002:a25:bad1:: with SMTP id a17mr2032720ybk.286.1625228449662; 
 Fri, 02 Jul 2021 05:20:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvYMPdFn+t6/mfxJKPj3VIyMrUGWCX7ICaXepCMLaBJtyktmJSBUUDalY7bR4oFxiZFbjnsJgu1xyd6LAE1/0=
X-Received: by 2002:a25:bad1:: with SMTP id a17mr2032708ybk.286.1625228449494; 
 Fri, 02 Jul 2021 05:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210701055208.715395-1-liwang@redhat.com> <YN7afAs3Mup5UbIf@yuki>
 <CAEemH2dJ4FYh-7-8C5na-uB1jg31mdV8wC+7w_DHG1463XudHA@mail.gmail.com>
 <YN77SxjQ2tHeXJfp@yuki>
In-Reply-To: <YN77SxjQ2tHeXJfp@yuki>
From: Li Wang <liwang@redhat.com>
Date: Fri, 2 Jul 2021 20:20:37 +0800
Message-ID: <CAEemH2cDM819aXG7yGwP77FjUNG8GSp-qYxbzZa-RWyJgtFVMw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: limit the size of tmpfs in LTP
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
Content-Type: multipart/mixed; boundary="===============2142852976=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2142852976==
Content-Type: multipart/alternative; boundary="000000000000694dd105c622fc13"

--000000000000694dd105c622fc13
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 2, 2021 at 8:06 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > > > +
> > > > +             if (!strcmp(tdev.fs_type, "tmpfs"))
> > > > +                     tst_test->mnt_data = mnt_data;
> > >
> > > I guess that we are doing this in order to export the changes in the
> > > mnt_data to the test, right?
> > >
> > > Is that needed for something or are you doing this just in a case that
> > > somebody will use that?
> > >
> >
> > No, you probably mis-read this part.
> >
> > In contrast, this is just to restore it to the original value,
> > because we don't want to export the changed tst_test->mnt_data
> > take effect on other filesystems.
>
> I'm just asking why we are setting it in the first place?
>
> If we do not change it there is no need to restore the value, so the
> real question is, do we need to change the tst_test->mnt_data at all?
>

Alright, we can just return a new pointer buf, and do nothing
for the tst_test->mnt_data itself.

Seems the misread person is me (I need more coffee now:).

-- 
Regards,
Li Wang

--000000000000694dd105c622fc13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jul 2, 2021 at 8:06 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strcmp=
(tdev.fs_type, &quot;tmpfs&quot;))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0tst_test-&gt;mnt_data =3D mnt_data;<br>
&gt; &gt;<br>
&gt; &gt; I guess that we are doing this in order to export the changes in =
the<br>
&gt; &gt; mnt_data to the test, right?<br>
&gt; &gt;<br>
&gt; &gt; Is that needed for something or are you doing this just in a case=
 that<br>
&gt; &gt; somebody will use that?<br>
&gt; &gt;<br>
&gt; <br>
&gt; No, you probably mis-read this part.<br>
&gt; <br>
&gt; In contrast, this is just to restore it to the original value,<br>
&gt; because we don&#39;t want to export the changed tst_test-&gt;mnt_data<=
br>
&gt; take effect on other filesystems.<br>
<br>
I&#39;m just asking why we are setting it in the first place?<br>
<br>
If we do not change it there is no need to restore the value, so the<br>
real question is, do we need to change the tst_test-&gt;mnt_data at all?<br=
></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-siz=
e:small">Alright, we can just return a new pointer buf, and do nothing</div=
><div class=3D"gmail_default" style=3D"font-size:small">for the tst_test-&g=
t;mnt_data itself. </div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Seems=
 the misread person is me (I need more coffee now:).</div></div><div><br></=
div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div=
>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000694dd105c622fc13--


--===============2142852976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2142852976==--

