Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2721D33EC7A
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 10:15:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED18C3C2D4E
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 10:15:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 4AAF93C2D04
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 10:15:12 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id B34F71A011DC
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 10:15:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615972509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MoX1Pv6ASHRV35dubJG0VL7FkksKo9aclY+cDcuedis=;
 b=HpSMY7c0mv7KCIT9Wz7COkatAm33ZL3iinBtIW+S9ClAkz97DOirtdTYrIx2s5Aj5d1LIH
 nvpbgNHMbCnY1TpT+0plD/yKymioKLjEVkQ6J/pO+SlbEfljqVpojs616aiHcZPH/Uvk1l
 W3ufHl3rX1v0k3AINgEXIflqd5er8nY=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-7NeiKXtuNauKEQgSkXRrdQ-1; Wed, 17 Mar 2021 05:14:57 -0400
X-MC-Unique: 7NeiKXtuNauKEQgSkXRrdQ-1
Received: by mail-yb1-f199.google.com with SMTP id f81so44195519yba.8
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 02:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MoX1Pv6ASHRV35dubJG0VL7FkksKo9aclY+cDcuedis=;
 b=hQv4uRJF0DqFljT+MKKsdMSWxhuhncQc4OdWfdrOjpC5zmSzyR8g2F4LVRwZT8CPXy
 DtfIjyie/6nXCE7zBiA2n0wCkC08Oz9c7NG27mYEDKmzabR/s9VNCJvkHZ7dPQYUJ+Ox
 TORMtSCf2KCyPEDfJDAwPBEVdxLABqdvacMNeV9NoXL+GShf80+VtKFghgGu3dpM/WqX
 a8pfv4AEnarxVTMr9wGMkU+MLws2eeeSp59r67x7IAAr+06J4sGR6dJMh+xlaetVOo+E
 GsgNX24DzETStyWKPPYJGAqdtqssolqEMp6Zh+c9fyXUPqQlX2zx9nA0ftkQ61jj7/Wi
 zxZw==
X-Gm-Message-State: AOAM531gQIwGxevRI+T0mkYRN0o9omysvQJOdbim5SwYvEVJNsyjme+r
 FBeQZAMoceQqnOXCwZspLgH+GIfdMKJvecaQIUUXmQw+G9O4s26h8ZZe1NndbB6eob0te/H7Lhi
 epl+Bs5gTsTnIb7afgrHqt+HEwyw=
X-Received: by 2002:a25:58c5:: with SMTP id m188mr3457456ybb.286.1615972497319; 
 Wed, 17 Mar 2021 02:14:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycZolG7gKujEP6FXL93Zt7+oanNnJiCEQGxd92EFCD7DYo5O1gPz9il+Ext9pt9qk27CmYvGV7bc2TadG7CHo=
X-Received: by 2002:a25:58c5:: with SMTP id m188mr3457440ybb.286.1615972497064; 
 Wed, 17 Mar 2021 02:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210316130036.1838169-1-lkml@jv-coder.de>
 <CAEemH2dxiFi_6VUOpyaufkOecE8TCi-m8bVT=xY9GREzOfKW-A@mail.gmail.com>
 <4e99e625-07f1-e0c1-ab23-30f0ee8e59ef@jv-coder.de>
 <CAEemH2ej++f-e17ifn2eFqaQJmECgei62nXR7LnD-X1ypQ3czQ@mail.gmail.com>
 <dbebbb6b-b2d1-c95a-3a8d-d92aae7a83f3@jv-coder.de>
In-Reply-To: <dbebbb6b-b2d1-c95a-3a8d-d92aae7a83f3@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Wed, 17 Mar 2021 17:14:45 +0800
Message-ID: <CAEemH2e5xZvJQSYgBXqhgEpqYyQyM=VTb6sWBJr0REzBDVnr5A@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
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
Subject: Re: [LTP] [PATCH] open_posix: Remove hardcoded /tmp
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0815822249=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0815822249==
Content-Type: multipart/alternative; boundary="000000000000a79ddd05bdb7ea26"

--000000000000a79ddd05bdb7ea26
Content-Type: text/plain; charset="UTF-8"

Hi Joerg,

On Wed, Mar 17, 2021 at 3:58 PM Joerg Vehlow <lkml@jv-coder.de> wrote:

> Hi Li,
>
> > In fact useless, and nobody cares about the temp file name.
> > But that'll make naming make some sense or tidy, IMO.
> >
> >     I just decided to keep it, so files, that are not deleted
> >     automatically
> >     can be identified as belonging to the test.
> >     If I would implement this, then only in the macro definition.
> >
> >
> > If I was the author, prefer to do that in macro definition too:).
> If it makes you happy, I think this can be done while merging.
>

Patch applied with two minor tweaks. Thanks!

1. add "_pid-" subfix to the mark PID number
2. fix the "\ No newline at end of file" issue caused by your $EDITOR,
which points out by Cyril last email
http://lists.linux.it/pipermail/ltp/2021-March/021515.html

-- 
Regards,
Li Wang

--000000000000a79ddd05bdb7ea26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Joerg,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Mar 17, 2021 at 3:58 PM Joerg Vehlow =
&lt;<a href=3D"mailto:lkml@jv-coder.de" target=3D"_blank">lkml@jv-coder.de<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
i Li,<br>
<br>
&gt; In fact useless, and nobody cares about the temp file=C2=A0name.<br>
&gt; But that&#39;ll make naming make some sense or tidy, IMO.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I just decided to keep it, so files, that are not d=
eleted<br>
&gt;=C2=A0 =C2=A0 =C2=A0automatically<br>
&gt;=C2=A0 =C2=A0 =C2=A0can be identified as belonging to the test.<br>
&gt;=C2=A0 =C2=A0 =C2=A0If I would implement this, then only in the macro d=
efinition.<br>
&gt;<br>
&gt;<br>
&gt; If I was the author, prefer to do that in macro definition too:).<br>
If it makes you happy, I think this can be done while merging.<br></blockqu=
ote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">P=
atch applied with two minor tweaks. Thanks!</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div>1. add <span class=3D"gmail_default"=
 style=3D"font-size:small">&quot;</span>_pid-<span class=3D"gmail_default" =
style=3D"font-size:small">&quot;</span> subfix<span class=3D"gmail_default"=
 style=3D"font-size:small"> to the mark PID number</span><br>2. fix the &qu=
ot;\ No newline at end of file&quot;<span class=3D"gmail_default" style=3D"=
font-size:small">=C2=A0issue caused by your $EDITOR, which points out by Cy=
ril last email</span></div><div><div class=3D"gmail_default" style=3D"font-=
size:small"><a href=3D"http://lists.linux.it/pipermail/ltp/2021-March/02151=
5.html">http://lists.linux.it/pipermail/ltp/2021-March/021515.html</a></div=
><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div>=
<div>Li Wang<br></div></div></div></div>

--000000000000a79ddd05bdb7ea26--


--===============0815822249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0815822249==--

