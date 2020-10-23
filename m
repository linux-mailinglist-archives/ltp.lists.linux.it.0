Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C782296C31
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 11:36:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 880883C5678
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 11:36:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id DB10B3C2480
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 11:36:43 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 034161A01233
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 11:36:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603445801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IvtpLCjGuv84/Jhzwf0YKbRmOTPllwjmIg/evFFqxwg=;
 b=G7M2h0Ly9YtfcdE4kayy/poAUeDs1s6nwttqf0qcjHbY7GzUea9L880tjJFEihZ3si1i9G
 uDNSvBYQNAqT4KBGlsYTeEvthSEi+faiF5sMk9/cCGyDFrJQVJ426itpLFLk+w+vPb5rkG
 w7l9ey5uK15igPB+ST/fZI8JOfO3vrU=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-EM9YZRQAMnSKk9jDkUusjw-1; Fri, 23 Oct 2020 05:36:39 -0400
X-MC-Unique: EM9YZRQAMnSKk9jDkUusjw-1
Received: by mail-yb1-f199.google.com with SMTP id v4so1203362ybp.3
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 02:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IvtpLCjGuv84/Jhzwf0YKbRmOTPllwjmIg/evFFqxwg=;
 b=gSLNNjYsh7rgegUUtzeShokBAuqIjKlRHvt3T024Z2ATSUSzEUC8SVDR2UKIy3YJcL
 qOmn7q8fvu67IQ0KO/ncOLJLwcxlcMLEfP7cuGPX+0m1yEtefk4J16JLjOGetAIAYkmP
 7HlsNM4OFKi5ouMKRxRczXYQLfZwbzgNELTpXQGHYXtJ0O5zAJ/+AAy0StbbpIFmvvLY
 1l1LBOwir3q3XSKW3gQjHO6f54XOMXbxryoPcg5D5aBZq4l/WEW1Q0np/sIbpvjlSZyG
 N1cdVaYx+SAREENolDwMzvhf0aTyCoJhZPCYb5Ep3dXVnXMeIvmic3rfyHE7Ic80Dxbb
 Rk3g==
X-Gm-Message-State: AOAM532gpbwF+p1qFZlm6h2aHwx+9kv22xQkM8sMOGMqIIc+7hatx5B1
 zMSQMcyLtPjoIZ9obyyYWlRJvYdPxNML3+dZ/2/n2dCo9UIIcO5q8VrhK/Sh7sEcEKQm3tMMc/2
 ToovZCxOlHPefFFUaIuNm/WLDSz0=
X-Received: by 2002:a25:ae47:: with SMTP id g7mr2336296ybe.110.1603445798595; 
 Fri, 23 Oct 2020 02:36:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeCxbdAjJ1EdtdU4tf9/vw/K0S+L+22uBpVQ2glZ3+1lRtuKeYuSZiznyettDgEs0CsT9n4iz8umC1ygUaELo=
X-Received: by 2002:a25:ae47:: with SMTP id g7mr2336274ybe.110.1603445798255; 
 Fri, 23 Oct 2020 02:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201005133054.23587-1-chrubis@suse.cz>
 <20201005133054.23587-4-chrubis@suse.cz>
 <CAEemH2e397yh+sa68_YkHwEr+QAV+NC0ROhbXHUm0CvrEd9gng@mail.gmail.com>
In-Reply-To: <CAEemH2e397yh+sa68_YkHwEr+QAV+NC0ROhbXHUm0CvrEd9gng@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 23 Oct 2020 17:36:26 +0800
Message-ID: <CAEemH2cKVRnSbifdEmjxdTX3Pkmvy5cwcZWQ8QBTVK0g2xA+0A@mail.gmail.com>
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
Subject: Re: [LTP] [PATCH 03/11] docparse: Add test documentation parser
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
Cc: Cyril Hrubis <metan@ucw.cz>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0967753506=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0967753506==
Content-Type: multipart/alternative; boundary="00000000000038e09805b253513c"

--00000000000038e09805b253513c
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 23, 2020 at 3:01 PM Li Wang <liwang@redhat.com> wrote:

>
> Cyril Hrubis <chrubis@suse.cz> wrote:
>
> > +const char *next_token(FILE *f, struct data_node *doc)
> > +{
> > +       size_t i = 0;
> > +       static char buf[4096];
> > +       int c;
> > +       int in_str = 0;
> > +
> > +       for (;;) {
> > +               c = fgetc(f);
> > +
> > +               if (c == EOF)
> > +                       goto exit;
> > +
> > +               if (in_str) {
> > +                       if (c == '"') {
> > +                               if (i == 0 || buf[i-1] != '\\')
> > +                                       goto exit;
> > +                       }
>
> There is a problem in handle a special string token here,
> which can not parse the "" correctly in many test cases.
>
> e.g.
>
> # ./docparse ../testcases/kernel/syscalls/fsopen/fsopen01.c
> # ./docparse ../testcases/kernel/fs/ftest/ftest02.c
>

The ftest02.c has not been converted to new API, please ignore.

To fix this problem I propose to add a simple line as:

@@ -137,8 +138,10 @@ const char *next_token(FILE *f, struct data_node *doc)

                if (in_str) {
                        if (c == '"') {
-                               if (i == 0 || buf[i-1] != '\\')
+                               if (i == 0 || buf[i-1] != '\\') {
+                                       buf[i++] = c;
                                        goto exit;
+                               }
                        }



> ....
>
> We got nothing output from the above two tests parsing because they
> contains "" in their sentence, it makes next_token() exit too early.
>
>      TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
>             MOVE_MOUNT_F_EMPTY_PATH));
>


-- 
Regards,
Li Wang

--00000000000038e09805b253513c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Oct 23, 2020 at 3:01 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><br>Cyril H=
rubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse=
.cz</a>&gt; wrote:<br><br>&gt; +const char *next_token(FILE *f, struct data=
_node *doc)<br>&gt; +{<br>&gt; + =C2=A0 =C2=A0 =C2=A0 size_t i =3D 0;<br>&g=
t; + =C2=A0 =C2=A0 =C2=A0 static char buf[4096];<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 int c;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 int in_str =3D 0;<br>&gt; +<br=
>&gt; + =C2=A0 =C2=A0 =C2=A0 for (;;) {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 c =3D fgetc(f);<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (c =3D=3D EOF)<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exi=
t;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
(in_str) {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if (c =3D=3D &#39;&quot;&#39;) {<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if (i =3D=3D 0 || buf[i-1] !=3D &#39;\\&#39;)<br>&=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit;<=
br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br><br>There is a problem in handle a special string token =
here,<br>which can not parse the &quot;&quot; correctly in many test cases.=
<div><br></div><div>e.g.<br><br># ./docparse ../testcases/kernel/syscalls/f=
sopen/fsopen01.c<br># ./docparse ../testcases/kernel/fs/ftest/ftest02.c</di=
v></div></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">The ftest02.c has not been converted to new API, pleas=
e ignore.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">To fix this pro=
blem I propose to add a simple line as:</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">@@ -137,8 +138,10 @@ const char *next_token(FILE *f, struct =
data_node *doc)<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (in_str) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (c =3D=3D &#39;&quot;&#39;) {<br>=
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i =3D=3D 0 || buf[i-1] !=3D &#39;\\&#39=
;)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i =3D=3D 0 || buf[i-1] !=3D &#39=
;\\&#39;) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 buf[i++] =3D c;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 goto exit;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br></div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div><div>....<br><br>We got nothing<span clas=
s=3D"gmail_default" style=3D"font-size:small"> output</span> from the above=
 two tests parsing because they<br>contains &quot;&quot; in their sentence,=
 it makes next_token() exit too early.</div><div><br><div>=C2=A0=C2=A0 =C2=
=A0 TEST(move_mount(fsmfd, &quot;&quot;, AT_FDCWD, MNTPOINT, <br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 <span class=3D"gmail_default" style=3D"font-size:small">=
=C2=A0 =C2=A0 </span>MOVE_MOUNT_F_EMPTY_PATH));</div></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000038e09805b253513c--


--===============0967753506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0967753506==--

