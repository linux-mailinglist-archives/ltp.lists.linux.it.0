Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFE02250F6
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Jul 2020 11:51:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3BCAE3C287A
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Jul 2020 11:51:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 076473C0EC0
 for <ltp@lists.linux.it>; Sun, 19 Jul 2020 11:51:09 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 70FD6600845
 for <ltp@lists.linux.it>; Sun, 19 Jul 2020 11:49:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595152267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S7MHPWhi5UfJ2DK2BKMIL1aQTHgFnexQrbjF56Ym+ew=;
 b=J9unTBhCykKvkBopdAr94/XiqEgLhIfVfz1wTPoXaYLU7wxbgzk7UlJmG1iTLXa+VpCzv+
 NjUpC5yqYQBQFsyFfbB98nHkjXda7pN+byYD/0E9OXgIelxH06j0nVN0fA+ppVaMJff3lz
 9NN/7FdBrU6NO5eEXrqf2hx/J4pHvVo=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-Vtv1Mw5kM5qlqwIMCw_t4w-1; Sun, 19 Jul 2020 05:51:02 -0400
X-MC-Unique: Vtv1Mw5kM5qlqwIMCw_t4w-1
Received: by mail-lf1-f70.google.com with SMTP id c9so6710844lfr.6
 for <ltp@lists.linux.it>; Sun, 19 Jul 2020 02:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S7MHPWhi5UfJ2DK2BKMIL1aQTHgFnexQrbjF56Ym+ew=;
 b=bdYcqHWNQvLjuuDUSjlYW3B0dcXikxcxH5vYwEP6R1dQxMLo5+qUmHwVDa1xOqxC5z
 KsaV63uu/1vx6RJFHYwc26Jkm3+zrcqwJi4DsdxAz67m8rh2rNu+NoAiK6eYlPWHT310
 8LPhVAKBIgvMeRZdFzR/b5toWwUNwv0JwDSQaVWv48sFzY7wzwsM+ETs2VwO+/jJqrlO
 Tz0BruqBpVixoNMftLaSyLVk/GQGIhgQ//polT/mMWNsfyKeDbSSTgu37UlhxkeW4jjt
 rBTAtaLV3qxriDtYmX7KNTQGbk1v9Lx15waMVWv45A42EjVkFGPJOYmQehcmaC6508is
 m+7w==
X-Gm-Message-State: AOAM530bRF3vfhMryI8ZPHSKfLycYn8YUPedQ1H6JVXktrQ7Z3gwBjev
 h1JLawVrxlQsHkGzAPz/JmNQdbmlAsSjJg4kndCjmu56WRQ+ZO/za/bEk4yH6Lk3nD9OpwRidkq
 hJ5dAq1p8OSpl6zjUDIuf5uGjR04=
X-Received: by 2002:a19:4345:: with SMTP id m5mr8315267lfj.60.1595152260896;
 Sun, 19 Jul 2020 02:51:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRoewH5tr2+lh2D+fGLvF7jaz6+Sgwk+OZiVU5c2CP4XIaScwZmLh3HIMCOm1F8yatMRPY+gB+u4imAJoqoCY=
X-Received: by 2002:a19:4345:: with SMTP id m5mr8315258lfj.60.1595152260707;
 Sun, 19 Jul 2020 02:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200717163453.9587-1-chrubis@suse.cz>
 <20200717163453.9587-8-chrubis@suse.cz>
In-Reply-To: <20200717163453.9587-8-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Sun, 19 Jul 2020 17:50:47 +0800
Message-ID: <CAEemH2dJhxobkJtemb8sxx0cc9gfmVc+fq=ZNE0LfKWTdiMuoA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 7/9] syscalls/ipc: Add shmctl07 test
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
Content-Type: multipart/mixed; boundary="===============1377294724=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1377294724==
Content-Type: multipart/alternative; boundary="000000000000dcd01c05aac85317"

--000000000000dcd01c05aac85317
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 18, 2020 at 12:35 AM Cyril Hrubis <chrubis@suse.cz> wrote:

> ...
> +
> +static void verify_shmlock(void)
> +{
> +       struct shmid_ds ds;
> +
> +       TEST(shmctl(shm_id, SHM_LOCK, NULL));
> +
> +       if (TST_RET != 0)
> +               tst_res(TFAIL | TTERRNO, "shmctl(%i, SHM_LOCK, NULL)",
> shm_id);
> +       else
> +               tst_res(TPASS, "shmctl(%i, SHM_LOCK, NULL)", shm_id);
> +
> +
> +       SAFE_SHMCTL(shm_id, IPC_STAT, &ds);
> +
> +       if (ds.shm_perm.mode & SHM_LOCKED)
> +               tst_res(TPASS, "SMH_LOCKED bit is on in shm_perm.mode");
> +       else
> +               tst_res(TFAIL, "SHM_LOCKED bit is off in shm_perm.mode");
> +
> +       TEST(shmctl(shm_id, SHM_UNLOCK, NULL));
> +
> +       if (TST_RET != 0)
> +               tst_res(TFAIL | TTERRNO, "shmctl(%i, SHM_UNLOCK, NULL)",
> shm_id);
> +       else
> +               tst_res(TPASS, "shmctl(%i, SHM_UNLOCK, NULL)", shm_id);
> +
>

Shouldn't we do update 'ds' before checking the ds.shm_perm.mode?

--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c
@@ -42,10 +42,11 @@ static void verify_shmlock(void)
        else
                tst_res(TPASS, "shmctl(%i, SHM_UNLOCK, NULL)", shm_id);

+       SAFE_SHMCTL(shm_id, IPC_STAT, &ds);
        if (ds.shm_perm.mode & SHM_LOCKED)
-               tst_res(TPASS, "SHM_LOCKED bit is off in shm_perm.mode");
-       else
                tst_res(TFAIL, "SMH_LOCKED bit is on in shm_perm.mode");
+       else
+               tst_res(TPASS, "SHM_LOCKED bit is off in shm_perm.mode");
 }



> +       if (ds.shm_perm.mode & SHM_LOCKED)
> +               tst_res(TPASS, "SHM_LOCKED bit is off in shm_perm.mode");
>

And in this branch, the status should be "on" but not "off".



> +       else
> +               tst_res(TFAIL, "SMH_LOCKED bit is on in shm_perm.mode");
> +}
> +
> +static void setup(void)
> +{
> +       shm_id = SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | SHM_RW);
> +}
> +
> +static void cleanup(void)
> +{
> +       if (shm_id >= 0)
> +               SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
> +}
> +
> +static struct tst_test test = {
> +       .setup = setup,
> +       .cleanup = cleanup,
> +       .test_all = verify_shmlock,
> +};
> --
> 2.26.2
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--000000000000dcd01c05aac85317
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Jul 18, 2020 at 12:35 AM Cyril Hrubis &lt;<=
a href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_defau=
lt" style=3D"font-size:small">...</span><br>
+<br>
+static void verify_shmlock(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct <span class=3D"gmail_default" style=3D"f=
ont-size:small"></span>shmid_ds ds;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(shmctl(shm_id, SHM_LOCK, NULL));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL | TTE=
RRNO, &quot;shmctl(%i, SHM_LOCK, NULL)&quot;, shm_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quo=
t;shmctl(%i, SHM_LOCK, NULL)&quot;, shm_id);<br>
+<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_SHMCTL(shm_id, IPC_STAT, &amp;ds);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ds.shm_perm.mode &amp; SHM_LOCKED)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quo=
t;SMH_LOCKED bit is on in shm_perm.mode&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quo=
t;SHM_LOCKED bit is off in shm_perm.mode&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(shmctl(shm_id, SHM_UNLOCK, NULL));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL | TTE=
RRNO, &quot;shmctl(%i, SHM_UNLOCK, NULL)&quot;, shm_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quo=
t;shmctl(%i, SHM_UNLOCK, NULL)&quot;, shm_id);<br>
+<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">Shouldn&#39;t we do update &#39;<span class=3D"gmail_defa=
ult"></span>ds&#39; before checking the=C2=A0<span class=3D"gmail_default">=
</span>ds.shm_perm.mode?</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div>--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c<b=
r>+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c<br>@@ -42,10 +42,11=
 @@ static void verify_shmlock(void)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS, &qu=
ot;shmctl(%i, SHM_UNLOCK, NULL)&quot;, shm_id);<br>=C2=A0<br>+ =C2=A0 =C2=
=A0 =C2=A0 SAFE_SHMCTL(shm_id, IPC_STAT, &amp;ds);<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (ds.shm_perm.mode &amp; SHM_LOCKED)<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS, &quot;SHM_LOCKED bit is off in shm_=
perm.mode&quot;);<br>- =C2=A0 =C2=A0 =C2=A0 else<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL, &quot;SMH_LOCKED bit is o=
n in shm_perm.mode&quot;);<br>+ =C2=A0 =C2=A0 =C2=A0 else<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS, &quot;SHM_LOCKED bit =
is off in shm_perm.mode&quot;);<br>=C2=A0}<br><div class=3D"gmail_default" =
style=3D"font-size:small"></div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (<span class=3D"gmail_default" style=3D"font=
-size:small"></span>ds.shm_perm.mode &amp; SHM_LOCKED)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quo=
t;SHM_LOCKED bit is off in shm_perm.mode&quot;);<br></blockquote><div><br><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small">And in thi=
s branch, the status should be &quot;on&quot; but not &quot;off&quot;.</div=
><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quo=
t;SMH_LOCKED bit is on in shm_perm.mode&quot;);<br>
+}<br>
+<br>
+static void setup(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0shm_id =3D SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, I=
PC_CREAT | SHM_RW);<br>
+}<br>
+<br>
+static void cleanup(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (shm_id &gt;=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_SHMCTL(shm_id,=
 IPC_RMID, NULL);<br>
+}<br>
+<br>
+static struct tst_test test =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.setup =3D setup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.cleanup =3D cleanup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_all =3D verify_shmlock,<br>
+};<br>
-- <br>
2.26.2<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000dcd01c05aac85317--


--===============1377294724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1377294724==--

