Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BDC341415
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 05:17:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92AAB3C90BF
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 05:17:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 0E6633C608C
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 05:17:36 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 286A6601B12
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 05:17:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616127454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iZuU5H4A7KToV66OFUXZqkUOZzOWJEXhD2STaWi9+Po=;
 b=SPha5YjvTvhIh29wAVDefZ6anLOZVCAmrIGXTAkymfMNvdBI9JovKJpvDyt0rzyzqR9grD
 JpIgdoMsZQFz+k2WPn5VjgDtnW+5ZBCc67nKdBGsoijitdZNwDR+PocM/z5HB1kDQbWI9v
 xxHwUKqUKPC0r+YCc878lVqUNNLhJIk=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-prm4O57uMrqprVHJxbB2RQ-1; Fri, 19 Mar 2021 00:17:29 -0400
X-MC-Unique: prm4O57uMrqprVHJxbB2RQ-1
Received: by mail-yb1-f197.google.com with SMTP id t1so3885989ybq.1
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 21:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iZuU5H4A7KToV66OFUXZqkUOZzOWJEXhD2STaWi9+Po=;
 b=Qv5Dj20c4Rxx1Qhc2Nye5KOToMU+re2n3w/HpH9+yu7Cb2iAjSR0GYQ7uAIoeGHzDC
 gbDGKqrDervLLusnhv8yLHHtINhQknaQiEJLqr2TzN7Xcs05rh2lv/a9pDBi7XLRd1EY
 6CxXCFg39hwOybihmOxJQWv/atjEM4n807YKHap9skrdBO72zpNuuEyhFSZyUbY+JlUC
 woQrqnQr+iOkAJwNeDcCtbSRwg5vUUs/jaqtt0J7MqPMz+lf+0Zd9DrKlkUBiwDlgkNe
 jTby31fweO+YDF2L6knWAx1dUN1MtIHMKAPGvPNBjH8PrGFvOUacywV0xzD7bHP2C4QX
 GHJg==
X-Gm-Message-State: AOAM5321Qunhq5ws8lsvwaTu+J//yrrAkLqKsqwhBmJuNYMT7WEhov5M
 jEZN1MV/dqjlRJUAfFsh1eO7zn+SOiIsYeFcqXYsG428nkJltBShBR19TmB8ZMvL1+SimAR3+0Y
 ab2B0EQ7FJxPLPPQXgPV0eXU6ZEE=
X-Received: by 2002:a25:874c:: with SMTP id e12mr3757181ybn.403.1616127449443; 
 Thu, 18 Mar 2021 21:17:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykqP5gOcY3pT1C/UVyMBpdRZ5Z0ij+5vOxy8s5DE5/g31xMMvwOQKnGDu3aTp2p01biz7DqjkW2AXsidezvIM=
X-Received: by 2002:a25:874c:: with SMTP id e12mr3757162ybn.403.1616127449223; 
 Thu, 18 Mar 2021 21:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210318181641.2062-1-pvorel@suse.cz>
 <20210318181641.2062-2-pvorel@suse.cz>
In-Reply-To: <20210318181641.2062-2-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 19 Mar 2021 12:17:17 +0800
Message-ID: <CAEemH2cGPW5KkS2rzU7PcZrLQaF9=O88n-rtOaHtHFoZaCYOSQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] doc: Document test tags
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
Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0205116157=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0205116157==
Content-Type: multipart/alternative; boundary="00000000000085f05605bddbfeb8"

--00000000000085f05605bddbfeb8
Content-Type: text/plain; charset="UTF-8"

Petr Vorel <pvorel@suse.cz> wrote:

+Glibc git commit in a regression test for a glibc bug:
> +[source,c]
>
> +-------------------------------------------------------------------------------
> +struct tst_test test = {
> +       ...
> +       .tags = (const struct tst_tag[]) {
> +               {"glibc-git", "574500a108be"},
> +               {}
> +       }
> +};
>
> +-------------------------------------------------------------------------------
> +
> +[source,c]
>
> +-------------------------------------------------------------------------------
> +struct tst_test test = {
> +       ...
> +       .tags = (const struct tst_tag[]) {
> +               {"glibc-git", "574500a108be"},
> +               {}
> +       }
> +};
>

I go through many times for the above two structures, but am not see any
difference:).

-- 
Regards,
Li Wang

--00000000000085f05605bddbfeb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_b=
lank">pvorel@suse.cz</a>&gt; wrote:<br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div></div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+Glibc git commit in a regression test for a glibc bug:<br>
+[source,c]<br>
+--------------------------------------------------------------------------=
-----<br>
+struct tst_test test =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.tags =3D (const struct tst_tag[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;glibc-git&qu=
ot;, &quot;574500a108be&quot;},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+};<br>
+--------------------------------------------------------------------------=
-----<br>
+<br>
+[source,c]<br>
+--------------------------------------------------------------------------=
-----<br>
+struct tst_test test =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.tags =3D (const struct tst_tag[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;glibc-git&qu=
ot;, &quot;574500a108be&quot;},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+};<br></blockquote><div>=C2=A0</div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">I go through many times for the above two structures,=
 but am not see any difference:).</div></div></div><div><br></div>-- <br><d=
iv dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></di=
v></div></div></div>

--00000000000085f05605bddbfeb8--


--===============0205116157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0205116157==--

