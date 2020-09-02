Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4DE25A859
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 11:10:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51AB13C5517
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 11:10:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2C8D43C2D58
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 11:09:54 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 3F40F2009A9
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 11:09:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599037791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ryneeMGTeq8HhR3Oh5qB8d9yeb2XApBm6XTdIXIGEmo=;
 b=PSJsSgikxZHLV7FvJ7qcjFSGTLhijP5n0Q5eM3qkVqz2I8735RMP8HfQ9sQ3spkyO7V8nK
 Amq4kKj3HgKod5y6CBj11vsN5CILi3sPHoPqRJUgL7OEed/QSDxfbjt2Y7HJOrgACt2UQv
 ZMAvOD6MZBzYQgfBAVhqYR7Lq+hvYWY=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-_DmBLLMJPEG8ivyBAnZRLQ-1; Wed, 02 Sep 2020 05:09:47 -0400
X-MC-Unique: _DmBLLMJPEG8ivyBAnZRLQ-1
Received: by mail-yb1-f200.google.com with SMTP id k11so4444576ybp.1
 for <ltp@lists.linux.it>; Wed, 02 Sep 2020 02:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ryneeMGTeq8HhR3Oh5qB8d9yeb2XApBm6XTdIXIGEmo=;
 b=VkhG5OO6IZYEhQzuOelL0sGJc15sUE6nF8JVqmAUA2eHPGKpIHEKrVDJgj/YAcLTlS
 h/kYKAKzy4nMNsLS6O9jOO9SdwnPuSDroaDo/bhmkpcijjlO6nHZpR87NAtjo184GujX
 Z2ST5te8oF1/9+3w75n/wbZFDMVKqBTMBKKE1O3hj/HA4nt3CpYtB/wu+Ma3gnM2q+GH
 +cJWVNROZa5iTPqtExUCdv7GqJSiqf2tlhaJDzXqRqItv1qVH6m9HIPqIrrcIanM8VSX
 Jrv4GKa3Bcci5M52GNsyiMWaTqJBk6QLieV7XczvrTWQi2MH4fUsaKOACHceTrlUNsas
 hWIA==
X-Gm-Message-State: AOAM530R0d6AF7Xu5noiL4aQKpf2cEufDAUTjDYw1rNlW7kRqiXA91dc
 C877K8U8/9Ps+krn6I6lTzqUHs3J0i2sa379paUbQwE9GpzqgFuaUJzKgTFYrbGJcIsSwiCTWd0
 WnXW1CvDXn1qlvW4bm25iqnHdAZc=
X-Received: by 2002:a25:cc14:: with SMTP id l20mr9298520ybf.110.1599037787408; 
 Wed, 02 Sep 2020 02:09:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvDaIXIap5oNglkSo90TI+/kDq7wgnubq9rk9rZMDjJU/Xv93qA7O/fAQqkHz/aWv87lKPCKRckmyeP8v0Elg=
X-Received: by 2002:a25:cc14:: with SMTP id l20mr9298479ybf.110.1599037787022; 
 Wed, 02 Sep 2020 02:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <b0d7642a89808c93e059beda06d8519361784686.1597839878.git.viresh.kumar@linaro.org>
 <a9e6d98c722a92d1981fcc2b7ddeba547195c40e.1597839878.git.viresh.kumar@linaro.org>
In-Reply-To: <a9e6d98c722a92d1981fcc2b7ddeba547195c40e.1597839878.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Wed, 2 Sep 2020 17:09:31 +0800
Message-ID: <CAEemH2eH6YnKXfVrAQmPGK5zj1x71f=gHZcDUN-QVjZ41F8_6A@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1668840804=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1668840804==
Content-Type: multipart/alternative; boundary="000000000000473dc605ae50ff35"

--000000000000473dc605ae50ff35
Content-Type: text/plain; charset="UTF-8"

Hi Viresh,

On Wed, Aug 19, 2020 at 8:28 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

>
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
>


> +       {0, &valid_sem_id, NULL, &sem_op_zero, 0, 0, SEM_UNDO, 1, 1,
> &invalid_to, EFAULT},
>

This '&invalid_to' can't be passed to the semtimedop(.., timeout) correctly,
because in that wrapper function call_semop(), you invoke
tst_ts_get(timeout)
to resolve an invalid address which will be caused a segmental fault
eventually.

Apart from this, the rest code looks good to me.

-- 
Regards,
Li Wang

--000000000000473dc605ae50ff35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Viresh,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Aug 19, 2020 at 8:28 PM Viresh Kumar =
&lt;<a href=3D"mailto:viresh.kumar@linaro.org" target=3D"_blank">viresh.kum=
ar@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><br>
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
ve, 0, 0, SEM_UNDO, 1, 0, &amp;valid_to, EAGAIN},<br></blockquote><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{0, &amp;valid_sem_id, NULL, &amp;sem_op_zero, =
0, 0, SEM_UNDO, 1, 1, &amp;invalid_to, EFAULT},<br></blockquote><div><br></=
div><div><div class=3D"gmail_default" style=3D"font-size:small">This &#39;&=
amp;invalid_to&#39; can&#39;t be passed to the semtimedop(.., timeout) corr=
ectly,</div><div class=3D"gmail_default" style=3D"font-size:small">because =
in that wrapper function call_semop(), you invoke tst_ts_get(timeout)=C2=A0=
</div><div class=3D"gmail_default" style=3D"font-size:small">to resolve an =
invalid address which will be caused a segmental fault eventually.</div></d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Apart from this, the rest c=
ode looks good to me.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regard=
s,<br></div><div>Li Wang<br></div></div></div>
</div>

--000000000000473dc605ae50ff35--


--===============1668840804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1668840804==--

