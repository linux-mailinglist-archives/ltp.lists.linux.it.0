Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D37F735C805
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 15:57:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 837053C7566
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 15:57:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C90633C1BB4
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 15:57:22 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C87702000EE
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 15:57:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618235840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MG/F0zhdtfwirNl/1SXkUkZY7d0WuMWC8LbRTkByBRw=;
 b=IlfF2Slm/AAS0pBErneosQJgn7P/gnGYYbTj8tDFNDqJhIddaS1WrDgww53OPxPHIVZO9i
 s4PbAy3HQt/IN3y0eARdg1z8fhNaaijpzgKFrzIbyQHYI+bPe2haNZUuaD4B5rQzg7jHQs
 S3WvsWrXbcByhlM0L43bdUnW6xTnY7o=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-LLx4PcsjNZeLRz_8w3IMGA-1; Mon, 12 Apr 2021 09:57:17 -0400
X-MC-Unique: LLx4PcsjNZeLRz_8w3IMGA-1
Received: by mail-qv1-f70.google.com with SMTP id b20so7753317qvf.2
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 06:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MG/F0zhdtfwirNl/1SXkUkZY7d0WuMWC8LbRTkByBRw=;
 b=TitDOY6OhnNdNxDxhbA8JZsx4N5lMc4KD7Dzq6NcE7AkeFPxa/bLHGN6lrcBi/x0WM
 sEBiz25uvqmb58e3EEy5NmcFTE2JbI3DMqk7bxpCpn7KYqMjbsMCqGCTvpRzBXkq9LeF
 vymI0CZ0vA7SEK3zZH1TlyZ6isqsCMtcotANPv+TYA8i4dEis6lL55mSGSqQpVLPdxtF
 6SSxTu8c+8eATSmIca5r9ZH5TZKojS51GhMpU1Fm90DMmiG2XhJVXmvuQxV9a1LGF3NW
 V1AhMUqjFat0y5BBYS1w7G7/0wQQ/xw4GMynVKnx/oEyVpJC6tW4GxR71ip95jinUqRh
 PAWw==
X-Gm-Message-State: AOAM533pe1R7yuI5OBISYVvMCuZ+ku+ZFhgejGr4FnWgv9KW4MFWRrKb
 YUWo0cydYNMXS80klT25b0jPuquYqNW4VKxd9cOPbG4tNtSOLgaeZUy5lpzt3guxGRMqasDaRHr
 CTwicmrDR2ZDYsi0eORK9IjJtgsI=
X-Received: by 2002:a25:e6d0:: with SMTP id
 d199mr11343175ybh.110.1618235837115; 
 Mon, 12 Apr 2021 06:57:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4EbpPICWym/xbFsgIlZI6RteJ5aENbO2CJ/E64cm0heJhbkzdQ/zEKXu6o4O3gyK0F0qSuRpfAQDKKIup4ys=
X-Received: by 2002:a25:e6d0:: with SMTP id
 d199mr11343147ybh.110.1618235836869; 
 Mon, 12 Apr 2021 06:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210319091837.27319-1-rpalethorpe@suse.com>
 <20210319091837.27319-2-rpalethorpe@suse.com>
In-Reply-To: <20210319091837.27319-2-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 12 Apr 2021 21:57:03 +0800
Message-ID: <CAEemH2f1OtzmP+Vh+afVHuZvHNZSq0kwG0HrK79z7THEu1smmQ@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/7] fzsync: Add self tests
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
Content-Type: multipart/mixed; boundary="===============1503914930=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1503914930==
Content-Type: multipart/alternative; boundary="0000000000003847e205bfc6e465"

--0000000000003847e205bfc6e465
Content-Type: text/plain; charset="UTF-8"

> +/* The time signatures of threads A and B */
> +struct race {
> +       const struct window a;
> +       const struct window b;
> +};
> +
> +static int c;
>

Maybe define a volatile 'c' here will be better?



> +
> +       tst_res(critical > 50 ? TPASS : TFAIL,
> +               "cs:%-2d ct:%-2d rt:%-2d | =:%-4d -:%-4d +:%-4d",
> +               a.critical_s, a.critical_t, a.return_t,
>

A tiny issue on output is, 'a.critical_s' abbreviate to 'cs' which
has duplicated name with above variable, a bit confused for me
a while:).

Anyway, the patches look quite good to me.
Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--0000000000003847e205bfc6e465
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
+/* The time signatures of threads A and B */<br>
+struct race {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct window a;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct window b;<br>
+};<br>
+<br>
+static int c;<br></blockquote><div><br></div><div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Maybe define a volatile &#39;c&#39; here wil=
l be better?<br></div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(critical &gt; 50 ? TPASS : TFAIL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;cs:%-2d ct:%-=
2d rt:%-2d | =3D:%-4d -:%-4d +:%-4d&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a.critical_s, a.cri=
tical_t, a.return_t,<br></blockquote><div><br></div><div><div class=3D"gmai=
l_default" style=3D"font-size:small">A tiny issue on output is, &#39;a.crit=
ical_s&#39; abbreviate to &#39;cs&#39; which</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">has duplicated name with above variable, a bi=
t confused for me</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">a while:).</div></div><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Anyway, the patches look quite good to me.</div></=
div><div><div class=3D"gmail_default" style=3D"font-size:small">Reviewed-by=
: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang=
@redhat.com</a>&gt;</div></div></div><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--0000000000003847e205bfc6e465--


--===============1503914930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1503914930==--

