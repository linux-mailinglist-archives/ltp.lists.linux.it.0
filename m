Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1056B3C1922
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 20:23:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C58E43C7994
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 20:23:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E620E3C6823
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 20:23:02 +0200 (CEST)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 45100100052B
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 20:23:02 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id t10so3781706eds.2
 for <ltp@lists.linux.it>; Thu, 08 Jul 2021 11:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JFl0LjgH1haJ9egZVwARzONQIrHCD94G201MWXS30YQ=;
 b=I9+N0qTr22aTsVK7LEpCnGw7TsLKGvbpklb2td7x6KTi0dNQ+FxtozDdxhYw4kTJF1
 lroxgrn5HEOQfNXgTvqA7R26rjBKfz+2YjWpNGRUhhy2EGH9SQfPx3stUIgaNhBQT2yl
 Eeby5TSNTd2EJjYK4N4eHGAz7Bxbi5QceGiWmKxnhKgyHN91j8MNAv9lh7VZFIHHuh3X
 Hv9POmnvbvdC4V5LNtOp+M2vYwmAsmU7gGl14WY8gckxXyP9ngEDq4PRRLcYf7a6yEET
 75dfGxOfeOHYxQz1EZi4DoB6ZUIBZZxhl0EllJPhkeBmCmevxvsNby7Xhab8p4PSwkaV
 Do9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JFl0LjgH1haJ9egZVwARzONQIrHCD94G201MWXS30YQ=;
 b=N5OvMhtAHVD69EnwTL3pq5imqrWJccarRnqv7VkAtYnyc0PhC3qj2htHdzT6tMoQLj
 xcRW8nikHjMly38/o5WD5lXJ6qRmcw4PZzBYvWqQJ/ksv9WXM9pXkcT5ZzYpQ+7ttI4H
 DMzud31SQ53jQAqRI+2XCZGKBz8FNH7SoGCN4vE2ve1l/48+Q6bzrh/ctgYFj9+sEENe
 r6f6xmZ/PuskW3Z0ipptPRx7RsVAciNb2XX6AZqtXbwvLCqE+f2jaawSIdxG8+z13Eu0
 lOMpLbN4zEs/zs79TdJXEsUIa8bbRvUaPcC/y93Pp6Z7UXKIboNrJfGu+EH6J6hGqpwR
 C+Ng==
X-Gm-Message-State: AOAM533EtzMLJxJP+grU54zH/ZqsKL6jrfHsExdyvWhH1mfwo1ypkMvm
 lDOk8rEndAA+bNFjsW0lzug/9NVVtlL/rVGJ/1XV
X-Google-Smtp-Source: ABdhPJxDc8+BhKWb8S9c9zR0Qx7tgTE4qbqufagTjStgojxgVVQsm8pWaCTUwU47CFYpyA27s5DtCM/NASjC63KIMwE=
X-Received: by 2002:a05:6402:7c4:: with SMTP id
 u4mr40563946edy.69.1625768581468; 
 Thu, 08 Jul 2021 11:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAPd9Lg-feW5KF=BDUzfGnqZPYs4S4ypBemb3b=qgG2z-9YsCiw@mail.gmail.com>
 <YObGwky3Nb6cN6R6@yuki>
In-Reply-To: <YObGwky3Nb6cN6R6@yuki>
Date: Thu, 8 Jul 2021 14:22:50 -0400
Message-ID: <CAPd9Lg-1zDJXbKYb_veAGaR78MXgTiAUZ3jm-WVneo25EcWs2g@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] Existing kexec tests
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
From: David Hu via ltp <ltp@lists.linux.it>
Reply-To: David Hu <xuehaohu@google.com>
Cc: automated-testing@yoctoproject.org, ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============1535310486=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1535310486==
Content-Type: multipart/alternative; boundary="000000000000c9b56b05c6a0be5e"

--000000000000c9b56b05c6a0be5e
Content-Type: text/plain; charset="UTF-8"

Hi,
   I am starting from scratch trying to come up with tests for kexec, so
there is not a
   specific framework I am working with now. any pointers / examples I can
look into
   to get a kexec test up on top of LTP ?

   The motivation is to improve kexec to address issues from this list
https://docs.google.com/document/d/1cbTOapDAA1MfDSS5bggvEGcqNCFsrsFnAM2xX1wsOnk/edit?ts=60ca3192#heading=h.4gti11dn65un

thanks,

--------
David

This email may be confidential or privileged. If you received this
communication by mistake, please don't forward it to anyone else, please
erase all copies and attachments, and please let me know that it went to
the wrong person. Thank you.


On Thu, Jul 8, 2021 at 6:00 AM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > I am looking existing tests that cover kexec (kexec_load and
> > kexec_file_load across LTS versions , platforms, etc)
> >
> > wondering if there are existing tests already ?
>
> I do not think that we do have anything working in LTP, the main problem
> here is that it has to be communicated to the test framework that these
> tests will reboot the machine under test, which is not easy task.
>
> So at this point I guess that it mostly depends on which framework you
> are using and if there are kexec tests available for it.
>
> The long term plan is to communicate such metadata in a json format from
> the test to the framework in a framework independed way, which should
> enable us for including all kinds of tests that need to reboot the SUT
> in LTP.
>
> Also CCying automated-testing ML.
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>

--000000000000c9b56b05c6a0be5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,=C2=A0</div><div>=C2=A0 =C2=A0I am starting from s=
cratch=C2=A0trying to come up with tests for kexec, so there is not a</div>=
<div>=C2=A0 =C2=A0specific framework I am working with now. any pointers / =
examples I can look into=C2=A0</div><div>=C2=A0 =C2=A0to get a kexec test u=
p on top of LTP ?</div><div><br></div><div>=C2=A0 =C2=A0The motivation is t=
o improve kexec to address issues from this list=C2=A0<a href=3D"https://do=
cs.google.com/document/d/1cbTOapDAA1MfDSS5bggvEGcqNCFsrsFnAM2xX1wsOnk/edit?=
ts=3D60ca3192#heading=3Dh.4gti11dn65un">https://docs.google.com/document/d/=
1cbTOapDAA1MfDSS5bggvEGcqNCFsrsFnAM2xX1wsOnk/edit?ts=3D60ca3192#heading=3Dh=
.4gti11dn65un</a></div><div><br></div><div>thanks,</div><br clear=3D"all"><=
div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_sign=
ature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">=
<div>--------<br></div><div>David</div><div><br></div><div dir=3D"ltr"><tab=
le cellspacing=3D"0" cellpadding=3D"0" style=3D"font-family:Times"><tbody><=
/tbody></table><span style=3D"color:rgb(102,102,102);font-family:arial,helv=
etica,sans-serif;font-size:x-small">This email may be confidential or privi=
leged. If you received this communication by mistake, please don&#39;t forw=
ard it to anyone else, please erase all copies and attachments, and please =
let me know that it went to the wrong person. Thank you.</span><br></div></=
div></div></div></div></div></div><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 8, 2021 at 6:00 AM Cyril =
Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; I am looking existing tests that cover kexec (kexec_load and<br>
&gt; kexec_file_load across LTS versions , platforms, etc)<br>
&gt; <br>
&gt; wondering if there are existing tests already ?<br>
<br>
I do not think that we do have anything working in LTP, the main problem<br=
>
here is that it has to be communicated to the test framework that these<br>
tests will reboot the machine under test, which is not easy task.<br>
<br>
So at this point I guess that it mostly depends on which framework you<br>
are using and if there are kexec tests available for it.<br>
<br>
The long term plan is to communicate such metadata in a json format from<br=
>
the test to the framework in a framework independed way, which should<br>
enable us for including all kinds of tests that need to reboot the SUT<br>
in LTP.<br>
<br>
Also CCying automated-testing ML.<br>
<br>
-- <br>
Cyril Hrubis<br>
<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a><br=
>
</blockquote></div>

--000000000000c9b56b05c6a0be5e--

--===============1535310486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1535310486==--
