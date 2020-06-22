Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 59244203482
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 12:07:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24FDA3C227B
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 12:07:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id AA8783C1D32
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 12:07:15 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 2442B14016B3
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 12:07:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592820433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=InfI5gC1LHnR0p+6KZ8IStKTTWUtmSYj1SpTDfpDNpc=;
 b=WZTih6TEFTSlB2Zla2ErOu5mO+24amZO4amVIkiH7VNxDFmGQL64W4TF+a8a2PTTqnTdKo
 mlZcO7Mnfe76Gz1G3MjCOnOdukoUtB5jOMNbxCi2d2R0HvXtYUh4W+LnlgsuwYTV7thIzy
 Ol7Q14JVtsDsPy7tnAnzBMpeIpj26t0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-j5KPEpVGO0K_QGtWfc64UA-1; Mon, 22 Jun 2020 06:06:57 -0400
X-MC-Unique: j5KPEpVGO0K_QGtWfc64UA-1
Received: by mail-lf1-f69.google.com with SMTP id k12so6079726lfg.7
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 03:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=InfI5gC1LHnR0p+6KZ8IStKTTWUtmSYj1SpTDfpDNpc=;
 b=ZYJ00ExLZf/nlFb+Q3pkh1IZGDBDtEURyJqxu7W6aaJJ31Bdk9JCW0JN7r/wMJ6tt/
 rpXgObD22FSYODA0Fwxdkf2W9+9ROrXGGgO9Yk8+buufpOk9FgRy5WrGeSrdxSTtWLp0
 CDoEp2rIgh6LAMqalS+CMs+iVfItnKg2nOFuDm76qo6QvhAQMOdkkkaatg0d3VwcEYvn
 GFquHXiRgmbEKY/YGiUPVGAmvSodwfI6gzUsJKDR2BcK2hJGfZaVaRfVia9nYlRHqaKD
 nTapryLmnidU+r4TPfNimEorpcH4uYaiZh8x3raWqt1K9n4Ny0M5+VCd9gLRiQQ6zOek
 4REQ==
X-Gm-Message-State: AOAM533oj97dC3AbdVD47w+MgT+2EBe827EgRiJ3Vs61LIYcUHghVCO9
 gn6iq9wY0Rr/VoCQtSUFSeXCcovU7WJswiMVd/ZMGdP46xypsI0fXOXBDSCZLajrnQ6ZT6QpJe3
 ElRSGWq0+R3brQFnBPAhAmyJuYJ8=
X-Received: by 2002:a2e:5757:: with SMTP id r23mr8263896ljd.468.1592820415882; 
 Mon, 22 Jun 2020 03:06:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqBLw41vP7IflcI/c3VYiSEHuBzNDgh7p3LLzuqRc0JXCn3nIqjATveGFsKumX2cvY9BPpSdk/fbV2VsG6eYU=
X-Received: by 2002:a2e:5757:: with SMTP id r23mr8263888ljd.468.1592820415664; 
 Mon, 22 Jun 2020 03:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200622074314.22098-1-petr.vorel@suse.com>
 <CAEemH2cz9s71E+VidezUAfYGarOzgpPTf0VucY+OYCYmjBjTGQ@mail.gmail.com>
 <20200622092213.GA27392@dell5510>
In-Reply-To: <20200622092213.GA27392@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Mon, 22 Jun 2020 18:06:43 +0800
Message-ID: <CAEemH2dhP-NQB4gedHRDh4Kz1ZSZSWG0TKtYFNt4WOT9PwO1kw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] cgroup: Fix build with -Werror=return-type
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
Cc: Petr Vorel <petr.vorel@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1482223012=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1482223012==
Content-Type: multipart/alternative; boundary="00000000000011249805a8a967aa"

--00000000000011249805a8a967aa
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 22, 2020 at 5:22 PM Petr Vorel <pvorel@suse.com> wrote:

> Hi Li,
>
> > >         tst_brk(TCONF, "Cgroup is not configured");
> > > +       return TST_CGROUP_V1; /* fix -Werror=return-type */
>
>
> > This return looks strange since it will never go to here.
>
> > How about this?
>
> I'm sorry, I overlooked your mail and push whole patchset.
>

Never mind:).

I resend a patch v2 to cover more situations, that would be great if you
can help review/test again.

-- 
Regards,
Li Wang

--00000000000011249805a8a967aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jun 22, 2020 at 5:22 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.com">pvorel@suse.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quot;Cgroup is n=
ot configured&quot;);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return TST_CGROUP_V1; /* fix -Werror=
=3Dreturn-type */<br>
<br>
<br>
&gt; This return looks strange since it will never go to here.<br>
<br>
&gt; How about this?<br>
<br>
I&#39;m sorry, I overlooked your mail and push whole patchset.<br></blockqu=
ote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Never mind:).</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I resen=
d a patch v2 to cover more situations, that would be great if you can help =
review/test again.</div></div><div><br></div></div>-- <br><div dir=3D"ltr" =
class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li W=
ang<br></div></div></div></div>

--00000000000011249805a8a967aa--


--===============1482223012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1482223012==--

