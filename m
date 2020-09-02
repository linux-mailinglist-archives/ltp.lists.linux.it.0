Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A433825A887
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 11:24:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 169BB3C5A76
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 11:24:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 3063B3C2D58
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 11:24:03 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 6D1E51400C60
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 11:24:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599038641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KDwCpq208vEE12f7S22sUhBq1sXJM28a36SxE91HXn8=;
 b=PhT3L70qxfgu24bmsD4iToZ6PPmtjrwGBvsgY2aMtLNhcGrUXAQ5svPYixdMOC9eEPDps3
 YcomBbBlXR6Keawl3ABoczd0771KZkIN8AlwDLJDQxJg4CpxELp39bhy/VQ3veXbokp5e7
 z1b0rxGIqJpYZw/Z/KAAwRNJshD8+Ns=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-Bd0D9wpaP2iqEg5Hz3MPcQ-1; Wed, 02 Sep 2020 05:23:55 -0400
X-MC-Unique: Bd0D9wpaP2iqEg5Hz3MPcQ-1
Received: by mail-yb1-f198.google.com with SMTP id 207so4405065ybd.13
 for <ltp@lists.linux.it>; Wed, 02 Sep 2020 02:23:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KDwCpq208vEE12f7S22sUhBq1sXJM28a36SxE91HXn8=;
 b=bNGBjv2v3OWJWVVbj/aoUYWFqggbujtcnlzZlJdwryd/VibNQN/lO0xdtHQZN+aBv2
 R9zohYm1DQz0QOJgZ1P8pa8FKPLhjen71q6CXJMUvslATnS6S5sRMJ0kTWrjaknL4nkw
 4DNUfpWKQdFTSGT7bpolZveB7EsKNXdxqbhiqJItBon545XAkPSwxaqSWb+5o25fEJaE
 Q4GPmx6oI2Q1yXFLg3jFmAfwcXUTY3vmERONEoJP0Rmj/l6ltpO9+fzpO5Cl2jPsmdUi
 Y9aJgs59sICJYbnXYHc7FBSwRn8sPhW8TXDf+nH1CPiAc2BMzNt4l1AYg5KcRmgrdmDD
 rhhA==
X-Gm-Message-State: AOAM532bcY89g4ZKVQsE9Fi1AGdGY4622n9azlShFGabrjeHVkncSGh1
 Qe0qm+E/42YyOzYQeGWSMdaYbEdyoLEpu/2jtsGwxdrYxu+KQqxk8wjXCgFLtFysx7SBbliJIrZ
 JqX8UD6a9hphUkFzEPak2yw00UqE=
X-Received: by 2002:a25:7b44:: with SMTP id w65mr8839286ybc.243.1599038634265; 
 Wed, 02 Sep 2020 02:23:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwChI/uOW4qih+YA40y4S1/L4Vp3Q2j4Re2tGzyTHF4DazQnhaOOEGNUf2ozzWcdmKbRDmxR4T6FR4EagEmK9A=
X-Received: by 2002:a25:7b44:: with SMTP id w65mr8839271ybc.243.1599038634051; 
 Wed, 02 Sep 2020 02:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <b0d7642a89808c93e059beda06d8519361784686.1597839878.git.viresh.kumar@linaro.org>
 <a9e6d98c722a92d1981fcc2b7ddeba547195c40e.1597839878.git.viresh.kumar@linaro.org>
In-Reply-To: <a9e6d98c722a92d1981fcc2b7ddeba547195c40e.1597839878.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Wed, 2 Sep 2020 17:23:41 +0800
Message-ID: <CAEemH2cLiOn_a_1JTAdDJyt-Lk1uqFveLQXN1R8SQGEC0wtQ=A@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V9 2/2] syscalls/semtimedop: Add failure test for
 invalid timeout pointer
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============2062533192=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2062533192==
Content-Type: multipart/alternative; boundary="000000000000c419bf05ae5131d0"

--000000000000c419bf05ae5131d0
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 19, 2020 at 8:28 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

-       {1, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, BIGOPS, 1, E2BIG},
> -       {1, &noperm_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, EACCES},
> -       {1, &valid_sem_id, &faulty_buf, &sem_op_1, 0, 0, 0, NSOPS, 1,
> EFAULT},
> -       {1, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, 0, 1, EINVAL},
> -       {1, &bad_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, EINVAL},
> -       {1, &valid_sem_id, NULL, &sem_op_max, 0, 0, 0, 1, 1, ERANGE},
> -       {1, &valid_sem_id, NULL, &sem_op_1, 0, -1, SEM_UNDO, 1, 1, EFBIG},
> -       {1, &valid_sem_id, NULL, &sem_op_1, 0, PSEMS + 1, SEM_UNDO, 1, 1,
> EFBIG},
> -       {1, &valid_sem_id, NULL, &sem_op_zero, 2, 2, IPC_NOWAIT, 1, 1,
> EAGAIN},
> -       {1, &valid_sem_id, NULL, &sem_op_negative, 2, 2, IPC_NOWAIT, 1, 0,
> EAGAIN},
> -       {0, &valid_sem_id, NULL, &sem_op_zero, 0, 0, SEM_UNDO, 1, 1,
> EAGAIN},
> -       {0, &valid_sem_id, NULL, &sem_op_negative, 0, 0, SEM_UNDO, 1, 0,
> EAGAIN},
> +       {1, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, BIGOPS, 1, &valid_to,
> E2BIG},
> +       {1, &noperm_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, &valid_to,
> EACCES},
> +       {1, &valid_sem_id, &faulty_buf, &sem_op_1, 0, 0, 0, NSOPS, 1,
> &valid_to, EFAULT},
> +       {1, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, 0, 1, &valid_to,
> EINVAL},
> +       {1, &bad_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, &valid_to,
> EINVAL},
> +       {1, &valid_sem_id, NULL, &sem_op_max, 0, 0, 0, 1, 1, &valid_to,
> ERANGE},
> +       {1, &valid_sem_id, NULL, &sem_op_1, 0, -1, SEM_UNDO, 1, 1,
> &valid_to, EFBIG},
> +       {1, &valid_sem_id, NULL, &sem_op_1, 0, PSEMS + 1, SEM_UNDO, 1, 1,
> &valid_to, EFBIG},
> +       {1, &valid_sem_id, NULL, &sem_op_zero, 2, 2, IPC_NOWAIT, 1, 1,
> &valid_to, EAGAIN},
> +       {1, &valid_sem_id, NULL, &sem_op_negative, 2, 2, IPC_NOWAIT, 1, 0,
> &valid_to, EAGAIN},
> +       {0, &valid_sem_id, NULL, &sem_op_zero, 0, 0, SEM_UNDO, 1, 1,
> &valid_to, EAGAIN},
> +       {0, &valid_sem_id, NULL, &sem_op_negative, 0, 0, SEM_UNDO, 1, 0,
> &valid_to, EAGAIN},
> +       {0, &valid_sem_id, NULL, &sem_op_zero, 0, 0, SEM_UNDO, 1, 1,
> &invalid_to, EFAULT},
>  };
>

And btw, these new changes should also be updated in the code comments
above the head.

-- 
Regards,
Li Wang

--000000000000c419bf05ae5131d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Aug 19, 2020 at 8:28 PM Viresh Kumar &lt;<a=
 href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.org</a>&gt; wr=
ote:</div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;valid_sem_id, NULL, &amp;sem_op_1, 0, =
0, 0, BIGOPS, 1, E2BIG},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;noperm_sem_id, NULL, &amp;sem_op_1, 0,=
 0, 0, NSOPS, 1, EACCES},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;valid_sem_id, &amp;faulty_buf, &amp;se=
m_op_1, 0, 0, 0, NSOPS, 1, EFAULT},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;valid_sem_id, NULL, &amp;sem_op_1, 0, =
0, 0, 0, 1, EINVAL},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;bad_sem_id, NULL, &amp;sem_op_1, 0, 0,=
 0, NSOPS, 1, EINVAL},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;valid_sem_id, NULL, &amp;sem_op_max, 0=
, 0, 0, 1, 1, ERANGE},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;valid_sem_id, NULL, &amp;sem_op_1, 0, =
-1, SEM_UNDO, 1, 1, EFBIG},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;valid_sem_id, NULL, &amp;sem_op_1, 0, =
PSEMS + 1, SEM_UNDO, 1, 1, EFBIG},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;valid_sem_id, NULL, &amp;sem_op_zero, =
2, 2, IPC_NOWAIT, 1, 1, EAGAIN},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;valid_sem_id, NULL, &amp;sem_op_negati=
ve, 2, 2, IPC_NOWAIT, 1, 0, EAGAIN},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{0, &amp;valid_sem_id, NULL, &amp;sem_op_zero, =
0, 0, SEM_UNDO, 1, 1, EAGAIN},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{0, &amp;valid_sem_id, NULL, &amp;sem_op_negati=
ve, 0, 0, SEM_UNDO, 1, 0, EAGAIN},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;valid_sem_id, NULL, &amp;sem_op_1, 0, =
0, 0, BIGOPS, 1, &amp;valid_to, E2BIG},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;noperm_sem_id, NULL, &amp;sem_op_1, 0,=
 0, 0, NSOPS, 1, &amp;valid_to, EACCES},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;valid_sem_id, &amp;faulty_buf, &amp;se=
m_op_1, 0, 0, 0, NSOPS, 1, &amp;valid_to, EFAULT},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;valid_sem_id, NULL, &amp;sem_op_1, 0, =
0, 0, 0, 1, &amp;valid_to, EINVAL},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;bad_sem_id, NULL, &amp;sem_op_1, 0, 0,=
 0, NSOPS, 1, &amp;valid_to, EINVAL},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;valid_sem_id, NULL, &amp;sem_op_max, 0=
, 0, 0, 1, 1, &amp;valid_to, ERANGE},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;valid_sem_id, NULL, &amp;sem_op_1, 0, =
-1, SEM_UNDO, 1, 1, &amp;valid_to, EFBIG},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;valid_sem_id, NULL, &amp;sem_op_1, 0, =
PSEMS + 1, SEM_UNDO, 1, 1, &amp;valid_to, EFBIG},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;valid_sem_id, NULL, &amp;sem_op_zero, =
2, 2, IPC_NOWAIT, 1, 1, &amp;valid_to, EAGAIN},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{1, &amp;valid_sem_id, NULL, &amp;sem_op_negati=
ve, 2, 2, IPC_NOWAIT, 1, 0, &amp;valid_to, EAGAIN},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{0, &amp;valid_sem_id, NULL, &amp;sem_op_zero, =
0, 0, SEM_UNDO, 1, 1, &amp;valid_to, EAGAIN},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{0, &amp;valid_sem_id, NULL, &amp;sem_op_negati=
ve, 0, 0, SEM_UNDO, 1, 0, &amp;valid_to, EAGAIN},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{0, &amp;valid_sem_id, NULL, &amp;sem_op_zero, =
0, 0, SEM_UNDO, 1, 1, &amp;invalid_to, EFAULT},<br>
=C2=A0};<br></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">And btw, these new changes should also be updated =
in the code comments above the head.</div></div><div>=C2=A0</div></div>-- <=
br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards=
,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000c419bf05ae5131d0--


--===============2062533192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2062533192==--

