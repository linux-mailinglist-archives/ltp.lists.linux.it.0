Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 451CB197CC8
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 15:24:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5C353C3168
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 15:24:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id CEA893C181C
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 15:24:07 +0200 (CEST)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 02438600BA2
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 15:24:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585574645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h1FGGHZeiLWXy5SN7Y7dE5Yj7EEJi382F1CmDcHHieI=;
 b=FZ7IIwIcfZc/Ta9nyDa/HOdLCfNf+Yd8+8+5bMsmHIkPcHtE3+pOI4Im9ukAxoQY1864Ok
 7Zs+/UpxozGiydjWpdVKnY4CovOfWHYYpw5C6On+EG5WdMB1v6KZxElPqjSfZGXx+kB4Q9
 gq5QofQqpb7uQStmR9D5Lfd7G6yE4Ag=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-G-rPhXpfMDC0DmnRQbvKlg-1; Mon, 30 Mar 2020 09:24:02 -0400
X-MC-Unique: G-rPhXpfMDC0DmnRQbvKlg-1
Received: by mail-lf1-f70.google.com with SMTP id u13so25460lfo.10
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 06:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JF/RipC5FfNbbgEU7DLGAURxzLJmZG2amYfPlOBq8cg=;
 b=q2jNLI9++WP1uTvhewHmvHTm/Z9AXmRcz85PZUjUqPwgVO4QlQDaFnWSAf9stAFTZ9
 6MfxYDg+g0OXbehIX5uTMje/sTkdldPWIIJ3dELSGpmX+5MKJMWer2KFg7RmRq2pQdne
 ewA81CJD/QxfUorxRtSEZQfmttDys3JMFTLLm11g57qlr1xbTxbhQqHPyLksnPkvUW2m
 Xk8Yfmu1oOxplPAPnDbXWjCMTh+ABqLebqYz324Q6ohMUChSAV8O6xC5UBvIXYe+O1qg
 AMnt+vKCbBSemGoh3xFKeQohC32oeE/ljaoeTAfbA//CMlx9cBo0hgjnKx+wC/bGAaaB
 Txjg==
X-Gm-Message-State: AGi0PubReAqPyJ5dx6CY70eQcCrszi763tsAGrSPLb0abYaByZl98Ig7
 T7sbx034vFDtP1i0igs+O7l1Ug6v5yCAKAcbkZhvBFWev5qXhtpRrlblccKNqxjneMH4mYnVW2G
 dNnD+4JI70OIjdfdtX0jBoGYNB5U=
X-Received: by 2002:a2e:6c05:: with SMTP id h5mr6979638ljc.217.1585574641123; 
 Mon, 30 Mar 2020 06:24:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypJxRWl7LyBHXZioer6GYpDthCypliFgG9UK2EO07XzgZpW1DyXKvua67Rfox5lwLz7laBfcE955peg9Fq681FY=
X-Received: by 2002:a2e:6c05:: with SMTP id h5mr6979634ljc.217.1585574640895; 
 Mon, 30 Mar 2020 06:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200330124338.6764-1-pvorel@suse.cz>
 <20200330124338.6764-6-pvorel@suse.cz>
In-Reply-To: <20200330124338.6764-6-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Mon, 30 Mar 2020 21:23:49 +0800
Message-ID: <CAEemH2dQfpn9mEBY=CFfVj_8dLETD7zh4=j3KP-bt95m_CCBxg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/5] Use SAFE_CMD()
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
Content-Type: multipart/mixed; boundary="===============0745562436=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0745562436==
Content-Type: multipart/alternative; boundary="0000000000003c691805a2125d6d"

--0000000000003c691805a2125d6d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2020 at 8:43 PM Petr Vorel <pvorel@suse.cz> wrote:

> Reviewed-by: Li Wang <liwang@redhat.com>
> Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  doc/test-writing-guidelines.txt                 |  4 ++--
>  include/tst_safe_macros.h                       |  5 ++---
>  testcases/kernel/syscalls/add_key/add_key05.c   | 14 ++++----------
>  testcases/kernel/syscalls/quotactl/quotactl01.c | 11 ++---------
>  testcases/kernel/syscalls/quotactl/quotactl06.c |  9 +--------
>  5 files changed, 11 insertions(+), 32 deletions(-)
>
> diff --git a/doc/test-writing-guidelines.txt
> b/doc/test-writing-guidelines.txt
> index 6f1eee490..75c2e517a 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -1283,8 +1283,8 @@ return value is '255' if 'execvp()' failed with
> 'ENOENT' and '254' otherwise.
>  'stdout_path' and 'stderr_path' determine where to redirect the program
>  stdout and stderr I/O streams.
>
> -The 'SAFE_CMD()' macro can be used automatic handling non zero exits
> (exits
> -with 'TBROK') or 'ENOENT' (exits with 'TCONF').
> +The 'SAFE_CMD()' macro can be used automatic handling non-zero exits
> (exits
> +with 'TBROK') and 'ENOENT' (exits with 'TCONF').
>
>  .Example
>  [source,c]
> diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
> index 38eb67d1d..bcd4b9c9e 100644
> --- a/include/tst_safe_macros.h
> +++ b/include/tst_safe_macros.h
> @@ -540,9 +540,8 @@ void safe_cmd(const char *file, const int lineno,
> const char *const argv[],
>  {
>         int rval;
>
> -       switch ((rval =3D tst_run_cmd(argv, stdout_path, stderr_path,
> -                                   TST_RUN_CMD_PASS_EXIT_VAL |
> -                                   TST_RUN_CMD_CHECK_CMD))) {
> +       switch ((rval =3D tst_cmd(argv, stdout_path, stderr_path,
> TST_CMD_PASS_RETVAL
> +                                                       |
> TST_CMD_CHECK_CMD))) {
>

Oh, you did the renaming in patch 5/5, but pity that the
TST_CMD_TCONF_ON_MISSING still not being used:). I guess this modification
should belong to patch4/5.

--=20
Regards,
Li Wang

--0000000000003c691805a2125d6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Mar 30, 2020 at 8:43 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Reviewed-by: =
Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@r=
edhat.com</a>&gt;<br>
Reviewed-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" ta=
rget=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
Reviewed-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"=
_blank">chrubis@suse.cz</a>&gt;<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br>
---<br>
=C2=A0doc/test-writing-guidelines.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0include/tst_safe_macros.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++---<br>
=C2=A0testcases/kernel/syscalls/add_key/add_key05.c=C2=A0 =C2=A0| 14 ++++--=
--------<br>
=C2=A0testcases/kernel/syscalls/quotactl/quotactl01.c | 11 ++---------<br>
=C2=A0testcases/kernel/syscalls/quotactl/quotactl06.c |=C2=A0 9 +--------<b=
r>
=C2=A05 files changed, 11 insertions(+), 32 deletions(-)<br>
<br>
diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.=
txt<br>
index 6f1eee490..75c2e517a 100644<br>
--- a/doc/test-writing-guidelines.txt<br>
+++ b/doc/test-writing-guidelines.txt<br>
@@ -1283,8 +1283,8 @@ return value is &#39;255&#39; if &#39;execvp()&#39; f=
ailed with &#39;ENOENT&#39; and &#39;254&#39; otherwise.<br>
=C2=A0&#39;stdout_path&#39; and &#39;stderr_path&#39; determine where to re=
direct the program<br>
=C2=A0stdout and stderr I/O streams.<br>
<br>
-The &#39;SAFE_CMD()&#39; macro can be used automatic handling non zero exi=
ts (exits<br>
-with &#39;TBROK&#39;) or &#39;ENOENT&#39; (exits with &#39;TCONF&#39;).<br=
>
+The &#39;SAFE_CMD()&#39; macro can be used automatic handling non-zero exi=
ts (exits<br>
+with &#39;TBROK&#39;) and &#39;ENOENT&#39; (exits with &#39;TCONF&#39;).<b=
r>
<br>
=C2=A0.Example<br>
=C2=A0[source,c]<br>
diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h<br>
index 38eb67d1d..bcd4b9c9e 100644<br>
--- a/include/tst_safe_macros.h<br>
+++ b/include/tst_safe_macros.h<br>
@@ -540,9 +540,8 @@ void safe_cmd(const char *file, const int lineno, const=
 char *const argv[],<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int rval;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch ((rval =3D tst_run_cmd(argv, stdout_path=
, stderr_path,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TST_RUN_CMD_PASS_EXIT_V=
AL |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TST_RUN_CMD_CHECK_CMD))=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch ((rval =3D tst_cmd(argv, stdout_path, st=
derr_path, TST_CMD_PASS_RETVAL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| TST_CMD_CHECK_CMD))) {<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Oh, you did the renaming in patch 5/5, but pity that the TST_=
CMD_TCONF_ON_MISSING still not being used:). I guess this modification shou=
ld belong to patch4/5.</div></div><div><br></div></div>-- <br><div dir=3D"l=
tr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></d=
iv></div>

--0000000000003c691805a2125d6d--


--===============0745562436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0745562436==--

