Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 08226156336
	for <lists+linux-ltp@lfdr.de>; Sat,  8 Feb 2020 07:36:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AC6163C2284
	for <lists+linux-ltp@lfdr.de>; Sat,  8 Feb 2020 07:36:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A34003C207E
 for <ltp@lists.linux.it>; Sat,  8 Feb 2020 07:36:14 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 0A773200988
 for <ltp@lists.linux.it>; Sat,  8 Feb 2020 07:36:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581143770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vRetKZYa/EAxkOc6cvwJsXsTCJ2WLFP0DlE5Sg4SQiw=;
 b=jKqdqeoCzAh9o8lMNBPZA1YMZjOdyE/Z8g5Cpgd9zypnQxEW1ZNHZceQWgM3h2Ysb8Lpzg
 dH5ER6j3qYcnq8cziivV2U/sIwpn2c4r9wPDcF3k/jnAe+LkqPQ4E0AvwFRwRBFSOLApbf
 bLYZowSiqRtd/glVFbBYpgr9ZY6IPw4=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-D6W6_p-XMnm85R-1Qyrsqw-1; Sat, 08 Feb 2020 01:36:06 -0500
Received: by mail-oi1-f200.google.com with SMTP id 199so2263440oie.10
 for <ltp@lists.linux.it>; Fri, 07 Feb 2020 22:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8RWsOmLR2xFaNEfwZDCK2lhoD++sfgG+2QTuqu0rHi4=;
 b=RqqOUnGBZkXnZQuWOMhtl/FvFNkvkowH21Esrn5cUTz0cKQwRkySJLNCDaq2TR84hH
 Q2dPy+ALjhBz7/wLn5oz2cP/pSlLVDhBLgVyB/nUj8RLvYlx4I4DqO7kd8XcEelA7rBt
 Y3KW8MudYEWdISi7HS+I+isv9rwAQB9NqcteF/ovhFnbe8iNiipuXba2O9Qw1QsbQpuj
 51LnHZSYBHMnJs2YxBDnH+/qxHvHBfPra49KLNCm17R/G66YlSkf4UxmGpLsjysq/IB6
 rxK8emJrXudnkrPpLrAL11Ftl31Bdko9r4trZr75n2cAZ/OXQWrHh1D0LB9TOg6FkLtf
 9LGQ==
X-Gm-Message-State: APjAAAW1fNWcnoOIUoSPXz4nwq27EAWXTp/yLuDlFiwCdYfB7zFxVWB1
 kU8fzubyaGd4m9Svg0pRkRkGIgr+NvoluaIasoFRl6FZ3UV3bIjYud8GsAYTSZTMFb10WN/pVa1
 +slWXNHmZBo++xyGs9bjyKUG7qZs=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr2368339otl.118.1581143765987; 
 Fri, 07 Feb 2020 22:36:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqzpuFAfDCXPDDA+9iXfPHWHfWXv19AKh2+o9+113bmUk8G2y28G2UwMkyLDFw5lW/8HKcSctr/O7OzLrj9EIFs=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr2368324otl.118.1581143765675; 
 Fri, 07 Feb 2020 22:36:05 -0800 (PST)
MIME-Version: 1.0
References: <20200207112236.16462-1-mdoucha@suse.cz>
In-Reply-To: <20200207112236.16462-1-mdoucha@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Sat, 8 Feb 2020 14:35:54 +0800
Message-ID: <CAEemH2dEco268yqDyDjX25FPs3V7wTBija4HiMrf8nr0W7qVQQ@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
X-MC-Unique: D6W6_p-XMnm85R-1Qyrsqw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] Redesign TST_RETRY_FUNC()
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
Content-Type: multipart/mixed; boundary="===============1812808884=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1812808884==
Content-Type: multipart/alternative; boundary="0000000000007e0ccb059e0ab8ce"

--0000000000007e0ccb059e0ab8ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin,

On Fri, Feb 7, 2020 at 7:22 PM Martin Doucha <mdoucha@suse.cz> wrote:

> The TST_RETRY_FUNC() macro requires a single return value that'll be
> considered
> success. This cannot be used with system calls that e.g. return a new fil=
e
> descriptor because the success value is somewhat unpredictable.
>
> Redesign TST_RETRY_FUNC() to accept arbitrary macro/function ECHCK as the
> second
> parameter for validating the FUNC return value.
> - The loop will end succesfully if ECHCK(ret) evaluates to non-zero.
> - The loop will fall through on timeout instead of calling tst_brk().
> - errno will be cleared before every FUNC call.
> - Add standard check macros for the most common call conventions:
>   - TST_RETVAL_EQ0(x) - x =3D=3D 0
>   - TST_RETVAL_NOTNULL(x) - x !=3D 0 or x !=3D NULL
>   - TST_RETVAL_GE0(x) - x >=3D 0


Nice to see this enhancement! Few comments as below:

1. We need to update the doc/test-writing-guidelines.txt too.

2. Maybe better to let the shell version is consistent with this new?

3. I remember there were discussions to support enabling infinite loop
in TST_RETRY_FUNC, but not sure if it is possible to add in this patch, or
we can do that after your patch merged.
http://lists.linux.it/pipermail/ltp/2019-October/013896.html

...
>         sprintf(defunct_tid_path, "/proc/%d/task/%d", getpid(),
> defunct_tid);
> -       TST_RETRY_FN_EXP_BACKOFF(access(defunct_tid_path, R_OK), -1, 15);
> +       ret =3D TST_RETRY_FN_EXP_BACKOFF(access(defunct_tid_path, R_OK),
> +               CHECK_ENOENT, 15);
>

The test total timeout is set to 20 seconds, here reserve 15 seconds is too
much for the macro looping because doing exponential backoff in
15secs(1us+2us+4us+..) actually larger than the 20secs. So I suggest
raising the tst_test.timeout at the same time or set a smaller value to
MAX_DELAY.

--=20
Regards,
Li Wang

--0000000000007e0ccb059e0ab8ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Martin,</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 7, 2020 at 7:22 PM Martin Do=
ucha &lt;<a href=3D"mailto:mdoucha@suse.cz" target=3D"_blank">mdoucha@suse.=
cz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">The TST_RETRY_FUNC() macro requires a single return value that&#39;ll be =
considered<br>
success. This cannot be used with system calls that e.g. return a new file<=
br>
descriptor because the success value is somewhat unpredictable.<br>
<br>
Redesign TST_RETRY_FUNC() to accept arbitrary macro/function ECHCK as the s=
econd<br>
parameter for validating the FUNC return value.<br>
- The loop will end succesfully if ECHCK(ret) evaluates to non-zero.<br>
- The loop will fall through on timeout instead of calling tst_brk().<br>
- errno will be cleared before every FUNC call.<br>
- Add standard check macros for the most common call conventions:<br>
=C2=A0 - TST_RETVAL_EQ0(x) - x =3D=3D 0<br>
=C2=A0 - TST_RETVAL_NOTNULL(x) - x !=3D 0 or x !=3D NULL<br>
=C2=A0 - TST_RETVAL_GE0(x) - x &gt;=3D 0</blockquote><div><br></div><div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Nice to see this enhan=
cement! Few comments as below:</div><br></div><div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">1. We need to update the doc/test-writing-gu=
idelines.txt=C2=A0too.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">2.=
 Maybe better to let the shell version is consistent with this new?</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">3. I remember there were discu=
ssions to support enabling infinite loop in=C2=A0TST_RETRY_FUNC, but not su=
re if it is possible to add in this patch, or we can do that after your pat=
ch merged.</div></div><div class=3D"gmail_default" style=3D"font-size:small=
"><a href=3D"http://lists.linux.it/pipermail/ltp/2019-October/013896.html">=
http://lists.linux.it/pipermail/ltp/2019-October/013896.html</a><br></div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(defunct_tid_path, &quot;/proc/%d/task/%=
d&quot;, getpid(), defunct_tid);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_RETRY_FN_EXP_BACKOFF(access(defunct_tid_pat=
h, R_OK), -1, 15);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D TST_RETRY_FN_EXP_BACKOFF(access(defunct=
_tid_path, R_OK),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CHECK_ENOENT, 15);<=
br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"f=
ont-size:small">The test total timeout is set to 20 seconds, here reserve 1=
5 seconds is too much for the macro looping because doing exponential backo=
ff in 15secs(1us+2us+4us+..) actually larger than the 20secs. So I suggest =
raising the tst_test.timeout=C2=A0at the same time or set a smaller value t=
o MAX_DELAY.</div></div><div><br></div></div>-- <br><div dir=3D"ltr"><div d=
ir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000007e0ccb059e0ab8ce--


--===============1812808884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1812808884==--

