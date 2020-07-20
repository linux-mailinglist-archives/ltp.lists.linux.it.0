Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EE22255E2
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 04:27:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DF953C4E35
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 04:27:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 5D72B3C097D
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 04:27:16 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id A2B8F1A00EE8
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 04:27:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595212034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OeVoXdYwsz8HcpxahokwaFREmSJTIusu5PUT/6VjXg8=;
 b=Y83cmB7oT9A+cCbkl5/Jt2uZXYcohd3SZSYfPWCGGdnkXPqiZlf1KfsRh4OazvZ5EuyUpZ
 aQt+8KHKj3K/LSLHg+NGtMfgaiW7wAy/QA3xuw79R0WC2i45e3Mu9KeYnsJFswDmyUFRrj
 6EY+Y/rmGKfxmuge/yt87pXVEyJ/rtE=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-jApha9B2OUO9X2yv8vYBmA-1; Sun, 19 Jul 2020 22:27:11 -0400
X-MC-Unique: jApha9B2OUO9X2yv8vYBmA-1
Received: by mail-lf1-f71.google.com with SMTP id b16so611414lfs.10
 for <ltp@lists.linux.it>; Sun, 19 Jul 2020 19:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OeVoXdYwsz8HcpxahokwaFREmSJTIusu5PUT/6VjXg8=;
 b=iGOIOT83t8eXq4YCYMALbos5hVzYz9fwsMbRTMZTs0TwI/6+Cb1/CegpQKg+MdOMOa
 lDYr01euqU4M2SPHSkypH0YCq+ZGwySoHHeooCt0RovKHE81tXIpIAiLm9uIuZkF9XMX
 5t12bdVrqOIp6ujwBd/gk4SIodPmiWvW5pY4/dU0o6q6jDbjng+Qs10JCNphBbSSdaiR
 UzKQbMThZDXT2/bgplGOc+kz5CxYk8uB+sB9MJ8IcWgesmlaoiFH4X7VN1SQUjH0n54x
 91DXJdxwnpqlpNvgm7HDEvdDV/ZleBgab66cOqyfIW0oSM60AptJv3Jm0i3b08RlgQY6
 F3tg==
X-Gm-Message-State: AOAM532UUArtpaswRoVVHlejhhQaabvClKOU5PhcjM+2MM7ZwgqMSCzs
 +Dhd3f3xXV/F6mEoJBY0r/jdMggJgAfA6N0M1+UCYKt3JPsAhzi7cYrEdtEYSnlO5Lm38DsLLj4
 6TQ71YH1PrVmxFvOowPpgkSzn5Gw=
X-Received: by 2002:a2e:5d8:: with SMTP id 207mr9013126ljf.257.1595212029992; 
 Sun, 19 Jul 2020 19:27:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPqlT4/ytmVlfpV2rgdG+ilUZ1dFxUZXy01FVqx02OuunyDqxTcCHt6hXMg+ck400u1BUAkk04fdDvQwwh7CU=
X-Received: by 2002:a2e:5d8:: with SMTP id 207mr9013120ljf.257.1595212029799; 
 Sun, 19 Jul 2020 19:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200717163453.9587-1-chrubis@suse.cz>
 <20200717163453.9587-9-chrubis@suse.cz>
In-Reply-To: <20200717163453.9587-9-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Mon, 20 Jul 2020 10:26:58 +0800
Message-ID: <CAEemH2c6CKEgyUtk3B=Gm+GL4wH=3cR=h3TA2d7WHg1-0Vg5pg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 8/9] syscalls/ipc: Add shmctl IPC_SET test
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
Content-Type: multipart/mixed; boundary="===============0961845313=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0961845313==
Content-Type: multipart/alternative; boundary="00000000000060ca8c05aad63e5c"

--00000000000060ca8c05aad63e5c
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 18, 2020 at 12:36 AM Cyril Hrubis <chrubis@suse.cz> wrote:

> ...
> +static void verify_shmset(void)
> +{
> +       struct shmid_ds ds;
> +       unsigned short old_mode;
> +       time_t old_ctime;
> +
> +       SAFE_SHMCTL(shm_id, IPC_STAT, &ds);
> +
> +       old_mode = ds.shm_perm.mode;
> +       old_ctime = ds.shm_ctime;
> +
> +       sleep(1);
> +
> +       ds.shm_perm.mode &= ~0066;
> +
> +       if (test_ipc_set(&ds))
> +               return;
> +
> +       memset(&ds, 0, sizeof(ds));
> +       SAFE_SHMCTL(shm_id, IPC_STAT, &ds);
> +       check_mode(&ds, old_mode & ~0066);
> +
> +       if (ds.shm_ctime - old_ctime > 10) {
>

Maybe we also need to consider a situation that timestamp is just as
previous value?
i.e.
    if (ds.shm_ctime - old_ctime > 10 || ds.shm_ctime - old_ctime == 0)

> +               tst_res(TFAIL, "shm_ctime not updated old %li new %li",
> +                       (long)old_ctime, (long)ds.shm_ctime);
> +       } else {
> +               tst_res(TPASS, "shm_ctime updated correctly diff=%li",
> +                       (long)(ds.shm_ctime - old_ctime));
> +       }
> +
>


-- 
Regards,
Li Wang

--00000000000060ca8c05aad63e5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Jul 18, 2020 at 12:36 AM Cyril Hrubis &lt;<=
a href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_defau=
lt" style=3D"font-size:small">...</span><br>
+static void verify_shmset(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct shmid_ds ds;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned short old_mode;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0time_t old_ctime;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_SHMCTL(shm_id, IPC_STAT, &amp;ds);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0old_mode =3D ds.shm_perm.mode;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0old_ctime =3D ds.shm_ctime;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sleep(1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ds.shm_perm.mode &amp;=3D ~0066;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (test_ipc_set(&amp;ds))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;ds, 0, sizeof(ds));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_SHMCTL(shm_id, IPC_STAT, &amp;ds);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0check_mode(&amp;ds, old_mode &amp; ~0066);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ds.shm_ctime - old_ctime &gt; 10) {<br></bl=
ockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-siz=
e:small">Maybe we also need to consider a situation that timestamp is just =
as previous value?</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"></div><div class=3D"gmail_default" style=3D"font-size:small">i.e.</div>=
</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =
if (ds.shm_ctime - old_ctime &gt; 10 || ds.shm_ctime - old_ctime =3D=3D 0)=
=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quo=
t;shm_ctime not updated old %li new %li&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(long)old_ctime, (long)ds.shm_ctime);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quo=
t;shm_ctime updated correctly diff=3D%li&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(long)(ds.shm_ctime - old_ctime));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br></blockquote><div><br></div><div>=C2=A0</div></div>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div=
>Li Wang<br></div></div></div></div>

--00000000000060ca8c05aad63e5c--


--===============0961845313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0961845313==--

