Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDC519229D
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 09:28:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 528763C4BB2
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 09:28:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 98C073C4BA8
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 09:28:06 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id BE9A01A00617
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 09:28:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585124884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Q7JDGqXtZZjTYID32e39BYxU1wDzDuwT4V7FZRBpZE=;
 b=VNME/GqW0CzJoiCgcFqIoFkDw0ct/hHNGWlVrNZ2KmZvyevH7YBcwy9Tr0S/ti+d1IQ9gs
 SKQZNv4mVwdzQak7ZdiVQqEKUbwnUveDb6D1xB1Wab0sLoYPgZg8OLnbnALtQa2AGjf5bJ
 bR7nnrowjZ7DnDMK31bkVifaiVS5IHs=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-_kxg6NxXMjm4cyoA4BcXFg-1; Wed, 25 Mar 2020 04:28:01 -0400
X-MC-Unique: _kxg6NxXMjm4cyoA4BcXFg-1
Received: by mail-oi1-f199.google.com with SMTP id v198so1196927oia.15
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 01:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7RU6BTPnTUMn7iYK3jZWCDNbXkDK+YhY4VRwj7t71Ws=;
 b=azU8TPjhfvLsy733+y9DoGWnT7oy6OveV9gXyBj4I2idotJP7axkBOFzcbwbDXqoyp
 baONIJ+gskENp/IONp+z7hFZ8q2fxnzwZPH/bQ0O4eYlSPWCQ+PDbI2+cBe2Rf7+IP2m
 dSQeBd6SzQl16J8fR/AHCYJm1+cKjgWH+3ypvWxN7w+0Pb5v4YxLgJfnxX0ZiiXo8ebJ
 LFHzDbFRVRa7fbSMI+dUD4LmHTJFxC6xdLSesy0YsnyJuhA65UMVBRK9zOzIylw0v7Wd
 uJVmjI9s9ylFwbZL0HHhu3ePjMCTbNAIj2aoiOkmRDdBtyHWy4sTkFzI2kvfM+zYTBHx
 yAMA==
X-Gm-Message-State: ANhLgQ0kjWKhUgO8yXfR67ysUPXmU/RAoiE/7EQq86qO4ShkIc2nDo/O
 oYVz6IhKREdDEpyHh8+V8BtmyGj/oTbrTUiiGAWmJxKKVg7W1Y6QhIfx5fS8SWPkNNHOFuDsf6j
 lbFl8r56TJcy6sdJS0p/ea2KlnPw=
X-Received: by 2002:a05:6830:11c1:: with SMTP id
 v1mr1653938otq.264.1585124880803; 
 Wed, 25 Mar 2020 01:28:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vujX4I26/GPpvehR6TjKV3oUBOFAvN6wOcMNSjyN+y5yd+85/LwlG55ZokGDuEq8TtrAcfpZ3rPcZe5kAODDJc=
X-Received: by 2002:a05:6830:11c1:: with SMTP id
 v1mr1653930otq.264.1585124880582; 
 Wed, 25 Mar 2020 01:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200323091852.29106-1-pvorel@suse.cz>
In-Reply-To: <20200323091852.29106-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 25 Mar 2020 16:27:49 +0800
Message-ID: <CAEemH2fdecDCWuRhhDq6og=gtcHPO5hUxxzt-7F4vxqR6bW7KA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib: Implement SAFE_RUN() macro (new API
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
Content-Type: multipart/mixed; boundary="===============0202180968=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0202180968==
Content-Type: multipart/alternative; boundary="0000000000006ea1bb05a1a9a5d7"

--0000000000006ea1bb05a1a9a5d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Mon, Mar 23, 2020 at 5:19 PM Petr Vorel <pvorel@suse.cz> wrote:

> Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
>
Reviewed-by: Li Wang <liwang@redhat.com>


> +       switch ((rval =3D tst_run_cmd(argv, stdout_path, stderr_path, 1))=
) {
> +       case 0:
> +               break;
> +       case 255:
> +               tst_brk(TCONF, "%s:%d: %s not found in $PATH", file,
> lineno, argv[0]);
> +               break;
>

Yes, we can remove this TCONF after adding the command checking in
tst_run_cmd_fds_(). So now I think it's OK to apply this patchset and do
the remaining work separately. Thanks Petr!

--=20
Regards,
Li Wang

--0000000000006ea1bb05a1a9a5d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr,</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 23, 2020 at 5:19 PM Petr Vorel=
 &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Revi=
ewed-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=
=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br></blockquote><div><span class=3D"gmail_def=
ault" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:=
liwang@redhat.com">liwang@redhat.com</a>&gt;</span></div><div><span class=
=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch ((rval =3D tst_run_cmd(argv, stdout_path=
, stderr_path, 1))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 255:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quo=
t;%s:%d: %s not found in $PATH&quot;, file, lineno, argv[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br></blockqu=
ote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Yes, we can remove this TCONF after=C2=A0adding the command checking in=
 tst_run_cmd_fds_(). So now I think it&#39;s OK to apply this patchset and =
do the remaining work separately. Thanks Petr!</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div></div></div>-- <br><div dir=3D"lt=
r"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></di=
v></div>

--0000000000006ea1bb05a1a9a5d7--


--===============0202180968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0202180968==--

