Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BF033E991
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 07:21:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3694D3C609C
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 07:21:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 222DF3C2D07
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 07:21:07 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 243AE1A0117B
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 07:21:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615962065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A77UYLY96ScZ7b/Lc29fMy38len1FY4XVtPl36kkQaU=;
 b=MMYFzRMgQAHDC04r6O1izj9lIBo/GMmpoGNNU8S2yymz0raARaNj1B6DwrQWo7IoQDfGkf
 qxurAanrX4WwV6xnWxXJRSImaMwfHj9uAgACDlf+OPLM0RaA2snOlmWZSFwyVFQZ8UfZh6
 0Dwngi1a99XO7HdyCoCrEUJdV6B6q/k=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-E6s6GYJNO1CSq7EOxS2TVg-1; Wed, 17 Mar 2021 02:21:03 -0400
X-MC-Unique: E6s6GYJNO1CSq7EOxS2TVg-1
Received: by mail-yb1-f199.google.com with SMTP id k189so5095606ybb.17
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 23:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A77UYLY96ScZ7b/Lc29fMy38len1FY4XVtPl36kkQaU=;
 b=gKIsvonoxaxS/vzzLmAJ9vJyU05eOtr3rr8XNmDH3T4CBrcIzTvnZH3XSHJNy04XWn
 SKuS6FtW4zhdU34QJibcZ52X+QNKoLU8TgOpXh6qFb2BlGIN6HfWbh5tN1tjPoLhnfjQ
 Ab0/2KF1a3yznVZmDkTIlcOLHgvqc5bPNUKxssJPVtNpJMH+ShpbyJDtEEJO/tJ+/FSq
 IqpIllF+tWlfHVOdDi7+9jdLY6vQkPT2PVir1mdM2rEyMe83BA2B+oHmqZ97ZJhXCLNS
 MWXEUmWxBJ4Dt7YvQYVEyc//yBo6jbNkIuNQhAYdfCcC7PtM/jcP0+t08OmIUAUd1A0+
 7Yjw==
X-Gm-Message-State: AOAM531oLNv9WBfal/WTh62ahemYckQLBbv/U20drwWliZlTBbQheYTy
 BIYcRt2BvJhHy+S9VdLSv39B0Tdxa78aTcAK7CPmvE7vGdiwGYxcnMO+7jr/fxTRBtdr4Lom/dW
 bkxRK5I+IpS6Bcqa7KryTKxGXgmw=
X-Received: by 2002:a25:dd06:: with SMTP id u6mr2939607ybg.97.1615962062867;
 Tue, 16 Mar 2021 23:21:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjld0+5fH/VPG8h7Ga4He5fXs7cikgZNe3izcukAwJYuVOcxQT0mO/oF2sAh7Wy82b6Gh2RQMBHoU4GBFpW6c=
X-Received: by 2002:a25:dd06:: with SMTP id u6mr2939603ybg.97.1615962062696;
 Tue, 16 Mar 2021 23:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210316130036.1838169-1-lkml@jv-coder.de>
 <CAEemH2dxiFi_6VUOpyaufkOecE8TCi-m8bVT=xY9GREzOfKW-A@mail.gmail.com>
 <4e99e625-07f1-e0c1-ab23-30f0ee8e59ef@jv-coder.de>
In-Reply-To: <4e99e625-07f1-e0c1-ab23-30f0ee8e59ef@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Wed, 17 Mar 2021 14:20:51 +0800
Message-ID: <CAEemH2ej++f-e17ifn2eFqaQJmECgei62nXR7LnD-X1ypQ3czQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0911125277=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0911125277==
Content-Type: multipart/alternative; boundary="000000000000b7dbed05bdb57cad"

--000000000000b7dbed05bdb57cad
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 17, 2021 at 2:12 PM Joerg Vehlow <lkml@jv-coder.de> wrote:

> Hi,
> > It'd be great if a passing string end with the suffix "_", be used to
> > clearly distinguish the PID number.
> >
> > Something like:
> > LTP_GET_TMP_FILENAME(tmpfname, "pts_aio_cancel_1_1_");
> >
> > This comment applies to all of the changing files in this patch, or we
> > can modify it in the macro prototype.
> Is this really of any use? I was also thinking about removing the prefix
> part of the filename completely.
>

In fact useless, and nobody cares about the temp file name.
But that'll make naming make some sense or tidy, IMO.


> I just decided to keep it, so files, that are not deleted automatically
> can be identified as belonging to the test.
> If I would implement this, then only in the macro definition.
>

If I was the author, prefer to do that in macro definition too:).

-- 
Regards,
Li Wang

--000000000000b7dbed05bdb57cad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Mar 17, 2021 at 2:12 PM Joerg Vehlow &lt;<a=
 href=3D"mailto:lkml@jv-coder.de">lkml@jv-coder.de</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
&gt; It&#39;d be great if a=C2=A0passing string end=C2=A0with the suffix &q=
uot;_&quot;, be used to <br>
&gt; clearly distinguish the PID number.<br>
&gt;<br>
&gt; Something like:<br>
&gt; LTP_GET_TMP_FILENAME(tmpfname, &quot;pts_aio_cancel_1_1_&quot;);<br>
&gt;<br>
&gt; This comment applies to all of the changing files in this patch, or we=
 <br>
&gt; can modify it in the macro prototype.<br>
Is this really of any use? I was also thinking about removing the prefix <b=
r>
part of the filename completely.<br></blockquote><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">In fact useless, and nobod=
y cares about the temp file=C2=A0name.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">But that&#39;ll make naming make some sense or tidy=
, IMO.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
I just decided to keep it, so files, that are not deleted automatically <br=
>
can be identified as belonging to the test.<br>
If I would implement this, then only in the macro definition.<br></blockquo=
te><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">If=
 I was the author, prefer to do that in macro definition too:).</div></div>=
<div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000b7dbed05bdb57cad--


--===============0911125277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0911125277==--

