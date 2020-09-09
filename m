Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE43262B5F
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 11:10:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCD4B3C2F2B
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 11:10:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 051C93C267D
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 11:10:22 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 5F03B1A00CA9
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 11:10:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599642620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NqgW8UpLiBztYIq+Ke/y9+KxmFBtWwS14bNQxJbbR10=;
 b=Q6RuLBKHDFNfbsuZcBE8EoBSOSrQXYJs7zU+UbHd6gquil0eF9LgxwzNtlji6O6aGyj/Pw
 Eyw64KTjPZyEHZz0djpVaVFF/sNzXtW6pZAXXk/JgLVCPfAMbFltJ5U6yd/zHtTo46Fykz
 +r0cM4cKpfvqmnVbNsfVkEobb7RzA6k=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-_EhWW1cQOJCfcFglVDartg-1; Wed, 09 Sep 2020 05:10:16 -0400
X-MC-Unique: _EhWW1cQOJCfcFglVDartg-1
Received: by mail-yb1-f198.google.com with SMTP id 207so1846541ybd.13
 for <ltp@lists.linux.it>; Wed, 09 Sep 2020 02:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NqgW8UpLiBztYIq+Ke/y9+KxmFBtWwS14bNQxJbbR10=;
 b=EjNmtHCKIGzvZEVRyVUC3wSpxPKc67QWBwD4BhvWL0iBigb2DtRM/JJl8RYcwRG9wS
 GKux3bqjVS2pxauXfrOReoLsNWd818vCZx6fq8yc7DvLJZ74uL0Gc3t3ZSssq/iXpRD2
 hNA40Z26VIZfrPY9ZdgZ0amHyK3p5/YwDsuaLN20Vn6SvkVjqY2FyMU7MGEGn8LqxLOW
 6e+uLMienuBeHX/FHDppnLVT327fEbOFDtceIRVDI2kNN7hopl3PPEZr5xm5YJJYMgJN
 DRJhFkHiRAAfr3VHeiugKuWJ/2+7QhNuc29sDwG/gBgxR2yn5+flREPjzJj4N9HlySgi
 m+Rw==
X-Gm-Message-State: AOAM532lJivyz450e2wjpVmWhGHrNOBgrdO4dO+bagjJIS2lhvMJa9M0
 ceWob0jHw1/XTkxa+gM+jOWq6WytXY706Y8cW3Yj0flR8G+cT6g0m/Fji1RATGnsguSbOKZytiN
 qOfOEjDOb3L1GKlsEIF0CEM4mItU=
X-Received: by 2002:a25:d14b:: with SMTP id i72mr4463858ybg.286.1599642615427; 
 Wed, 09 Sep 2020 02:10:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpoSl+nJm41CuexzEvV5otVIpyE8eoFejdcLh3lEzYUu5u2v0gxMO51P+O2bRM/9j8mRkOSD5C3XgM87KgoQs=
X-Received: by 2002:a25:d14b:: with SMTP id i72mr4463839ybg.286.1599642615262; 
 Wed, 09 Sep 2020 02:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200909075347.2863-1-liwang@redhat.com>
 <1908270893.11577594.1599641047815.JavaMail.zimbra@redhat.com>
In-Reply-To: <1908270893.11577594.1599641047815.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 9 Sep 2020 17:10:03 +0800
Message-ID: <CAEemH2d8CRnhN6b9-g+6E1v-vMSmenW90u1mChCuHBS6SPaRdA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ioctl: take use of TST_RETRY_FN* macro
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
Content-Type: multipart/mixed; boundary="===============0271161720=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0271161720==
Content-Type: multipart/alternative; boundary="000000000000d9c7ba05aeddd181"

--000000000000d9c7ba05aeddd181
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 9, 2020 at 4:44 PM Jan Stancek <jstancek@redhat.com> wrote:


> > +     value ? (time_delay = 30) : (time_delay = 1);
> > +
> > +     ret = TST_RETRY_FN_EXP_BACKOFF(access(sys_loop_partpath, F_OK),
> > TST_RETVAL_EQ0, time_delay);
>
> Shouldn't we invert also the check when value == 0? At the moment
> there's TST_RETVAL_EQ0 for all cases, but we expect path to exist
> only for value == 1, correct?
>

Obviously yes, and I have thought a while to decrease the
waiting time for the nonzero return, but didn't realize there is also
a macro named TST_RETVAL_NOTNULL(x) can be used:).

Thanks for the suggestion, I think your method is better.


> diff --git a/testcases/kernel/syscalls/ioctl/ioctl09.c
> b/testcases/kernel/syscalls/ioctl/ioctl09.c
> index 151618df41db..dff31d58a054 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl09.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl09.c
> @@ -28,6 +28,9 @@ static void change_partition(const char *const cmd[])
>                 tst_brk(TBROK, "parted return %i", ret);
>  }
>
> +#define RETVAL_CHECK(x) \
> +       ({ value ? TST_RETVAL_EQ0(x) : TST_RETVAL_NOTNULL(x); })
> +
>  static void check_partition(int part_num, bool value)
>  {
>         int ret;
> @@ -36,7 +39,7 @@ static void check_partition(int part_num, bool value)
>                 dev_num, dev_num, part_num);
>         sprintf(loop_partpath, "%sp%d", dev_path, part_num);
>
> -       ret = access(sys_loop_partpath, F_OK);
> +       ret = TST_RETRY_FN_EXP_BACKOFF(access(sys_loop_partpath, F_OK),
> RETVAL_CHECK, 30);
>         if (ret == 0)
>                 tst_res(value ? TPASS : TFAIL, "access %s succeeds",
>                         sys_loop_partpath);
> @@ -44,7 +47,7 @@ static void check_partition(int part_num, bool value)
>                 tst_res(value ? TFAIL : TPASS, "access %s fails",
>                         sys_loop_partpath);
>
> -       ret = access(loop_partpath, F_OK);
> +       ret = TST_RETRY_FN_EXP_BACKOFF(access(loop_partpath, F_OK),
> RETVAL_CHECK, 30);
>         if (ret == 0)
>                 tst_res(value ? TPASS : TFAIL, "access %s succeeds",
>                         loop_partpath);
>
>

-- 
Regards,
Li Wang

--000000000000d9c7ba05aeddd181
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 9, 2020 at 4:44 PM Jan Stancek &lt;<a h=
ref=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com</a=
>&gt; wrote:<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0value ? (time_delay =3D 30) : (time_delay =3D 1);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D TST_RETRY_FN_EXP_BACKOFF(access(sys_loop_=
partpath, F_OK),<br>
&gt; TST_RETVAL_EQ0, time_delay);<br>
<br>
Shouldn&#39;t we invert also the check when value =3D=3D 0? At the moment<b=
r>
there&#39;s TST_RETVAL_EQ0 for all cases, but we expect path to exist<br>
only for value =3D=3D 1, correct?<br></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">Obviously=C2=A0yes, and I=
 have thought a while to decrease the</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">waiting time for the nonzero return, but didn&#39;t =
realize there is also</div><div class=3D"gmail_default" style=3D"font-size:=
small">a macro named=C2=A0<span class=3D"gmail_default"></span>TST_RETVAL_N=
OTNULL(x) can be used:).</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Thanks for the suggestion, I think your method is better.</div></div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/testcases/kernel/syscalls/ioctl/ioctl09.c b/testcases/kernel/s=
yscalls/ioctl/ioctl09.c<br>
index 151618df41db..dff31d58a054 100644<br>
--- a/testcases/kernel/syscalls/ioctl/ioctl09.c<br>
+++ b/testcases/kernel/syscalls/ioctl/ioctl09.c<br>
@@ -28,6 +28,9 @@ static void change_partition(const char *const cmd[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TBROK, &quo=
t;parted return %i&quot;, ret);<br>
=C2=A0}<br>
<br>
<span class=3D"gmail_default" style=3D"font-size:small"></span>+#define RET=
VAL_CHECK(x) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0({ value ? TST_RETVAL_EQ0(x) : <span class=3D"g=
mail_default" style=3D"font-size:small"></span>TST_RETVAL_NOTNULL(x); })<br=
>
+<br>
=C2=A0static void check_partition(int part_num, bool value)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
@@ -36,7 +39,7 @@ static void check_partition(int part_num, bool value)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_num, dev_num, p=
art_num);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(loop_partpath, &quot;%sp%d&quot;, dev_p=
ath, part_num);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D access(sys_loop_partpath, F_OK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D TST_RETRY_FN_EXP_BACKOFF(access(sys_loo=
p_partpath, F_OK), RETVAL_CHECK, 30);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(value ? TPA=
SS : TFAIL, &quot;access %s succeeds&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sys_loop_partpath);<br>
@@ -44,7 +47,7 @@ static void check_partition(int part_num, bool value)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(value ? TFA=
IL : TPASS, &quot;access %s fails&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sys_loop_partpath);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D access(loop_partpath, F_OK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D TST_RETRY_FN_EXP_BACKOFF(access(loop_pa=
rtpath, F_OK), RETVAL_CHECK, 30);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(value ? TPA=
SS : TFAIL, &quot;access %s succeeds&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 loop_partpath);<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--000000000000d9c7ba05aeddd181--


--===============0271161720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0271161720==--

