Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 75530197498
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 08:35:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 952333C3166
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 08:35:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 546673C3137
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 08:35:27 +0200 (CEST)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 997B21A00EC4
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 08:35:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585550125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GZtFWH2FCmHB1KJfeLmaTALRYPFKTZ4xoN8AZ2ilIzw=;
 b=Gy9VONaBCj0X7ZWpzeeCyPXx1BwTuGpsMAwkspJ8aHaBtrlLvSSy3Y3h9dT0hRzjBEqNJG
 8tr2Xo3af4QPdUiKK1bIEqmh/HhXqXonoZnG9RRoRHo2soAds1ngKDx97ZS5REcrQ6/NsX
 z+zth9DLwYGfz+8ScjItG5+V1IuMlIU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-qCpBb8RHMbq9j0U2U0XsTA-1; Mon, 30 Mar 2020 02:35:22 -0400
X-MC-Unique: qCpBb8RHMbq9j0U2U0XsTA-1
Received: by mail-lf1-f70.google.com with SMTP id k15so5380228lfc.11
 for <ltp@lists.linux.it>; Sun, 29 Mar 2020 23:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xIgYoj7mQ8D/Z1/J21oPdVI3lvayETkLQM8rFDLHwXE=;
 b=kZW9kMcEiKgDVliQFqKvGT3BVIxYuRPDlfivhmNOprAiRPYRmcCMtpc2hC5jXO+VEo
 yhJFsbvicLf3MMtEJztCWq/VrBOaRMVXJctYnyhmikxSeH0FH0hI/WjGvrry+4p2+Pcm
 to3JRofSHelyuX/4jzoHhLMwtyyt2kpJQfL/tZ1GHZxRcKH2ba/HACtMx2ECGuPCdYIa
 HV0cj6ulC8uYGBDA/8++wr7KY4d+Jyqb64k6/lizXwX6px5CEEoBfpQLLyeyuK1MoYpD
 TsX9oBdx0OPFf/Z59CDVlGXzSP/RZ/OEavoiScPnfBiAbhymMCo8qWGD0tiQ79XtLfCy
 89Cw==
X-Gm-Message-State: AGi0Pua3fu3kh7oI/PUPuP8cZaZP+A2e69mezO6DvewuEJEi11Gs6PWX
 mrj7pgEc1NKpsuf56g8ntR00Uttfvqg8hHF72H0fSFOaRQNPsRltik9uwVs+gRMkWoBDW2gnux4
 +EXPnQoCak4kxHt5NkiAsTIZ2AFQ=
X-Received: by 2002:a05:6512:308e:: with SMTP id
 z14mr7252881lfd.110.1585550120761; 
 Sun, 29 Mar 2020 23:35:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypI4A76lqFpUi1gsI9Eeb+J/JcY4oapcyA3o2orUOnKVIviBuPxe6ruuZkWWcMgn4gJI9gRnHtlM7k5j+uYUHPM=
X-Received: by 2002:a05:6512:308e:: with SMTP id
 z14mr7252876lfd.110.1585550120613; 
 Sun, 29 Mar 2020 23:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200327213924.18816-1-pvorel@suse.cz>
 <20200327213924.18816-6-pvorel@suse.cz>
In-Reply-To: <20200327213924.18816-6-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Mon, 30 Mar 2020 14:35:09 +0800
Message-ID: <CAEemH2fusvyGAnDmfFEYqhnsbHwzrT+B3+FFD6bnJGpz3oB-QA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/6] lib: Implement SAFE_RUN_CMD() macro (new API
 only)
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
Content-Type: multipart/mixed; boundary="===============1762912168=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1762912168==
Content-Type: multipart/alternative; boundary="000000000000b6907705a20ca76c"

--000000000000b6907705a20ca76c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

Thanks for your work on this.

>
> +static inline void safe_run_cmd(const char *file, const int lineno,
> +                                                          const char
> *const argv[],
>

Be cautious of the code indent here, otherwise patchset looks good.


> +                             const char *stdout_path,
> +                             const char *stderr_path)
> +{
>

--=20
Regards,
Li Wang

--000000000000b6907705a20ca76c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div class=3D"gmail_default" st=
yle=3D"font-size:small">Hi Petr,</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">Thanks for your work on this.</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
+static inline void safe_run_cmd(const char *file, const int lineno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *const a=
rgv[],<br></blockquote><div><br></div><div><div class=3D"gmail_default" sty=
le=3D"font-size:small">Be cautious of the code indent here, otherwise patch=
set looks good.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *stdout_path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *stderr_path)<br>
+{<br></blockquote><div><br></div></div>-- <br><div dir=3D"ltr"><div dir=3D=
"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000b6907705a20ca76c--


--===============1762912168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1762912168==--

