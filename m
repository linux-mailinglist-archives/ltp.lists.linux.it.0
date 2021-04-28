Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAC736D616
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 13:06:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0206E3C629B
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 13:06:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 66D753C1935
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 13:06:05 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B4484600960
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 13:06:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F5S95U0O1WKf0VopCS6wFy3zjugDgGdajxIdQlh2Ltc=;
 b=DP+jMd6C3H45sCnSwA3khzcLV7xOKqeK0d9ABWmMUa3YO8Q5UnToCdfCDfH5XylM+gfOTv
 a9RjmBLEyReZzJQoYO4C8LskUymkb/da7gciz3zGPphVt9scK9sgESzKo2pJDLqz+0JioU
 p5LmRv+opLlxCrvqVOsvuZG7wop74LY=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-dF8GmohHOQab10-WGQrRFg-1; Wed, 28 Apr 2021 07:05:59 -0400
X-MC-Unique: dF8GmohHOQab10-WGQrRFg-1
Received: by mail-yb1-f199.google.com with SMTP id
 n11-20020a25808b0000b02904d9818b80e8so40963606ybk.14
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 04:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F5S95U0O1WKf0VopCS6wFy3zjugDgGdajxIdQlh2Ltc=;
 b=LFdPjsMWxEaVOkVLXyyLLxMjgVSLx3Nl/mekBFg1Qw2yqFMlkOZU4Zj9do2+Dux0KY
 whAdmSY3noBhVeeJkR9DjU0bicFGbacfdY2WyiRkabP3IANlqssV4VYLzHBVt0sG2opB
 se2tssIVd3pxv1A55kHmvsJX9JvWY7Xe3NOorIlpSPDennZG0nlpWpwKETgbr3NXONj+
 SpNs0NpCQUm25t5FA0fOub0nuenxqx4K1TDSzJJGofv5nirmMoLIya8BmAUiz3uplAF6
 HhVZKzYFWzM4VUSig57gKuAAeiHHaxfJ3SiZz7t9VbUNDNEmxQYaLL71XbIMuO7zlRiw
 35Kg==
X-Gm-Message-State: AOAM533q1CCLeHXQj511yll4vZPUQaslUzPZyeV04H0rvC7sUam/Rk1Z
 OP0ZbKQc+8D/g7ev3TVpd/H6kiJqbtWXhniSollQgFcg2tHPtDH+tC0OT3IBVRf3cMLJSpaaMXW
 qdS7VvaSomWnQP5DHgZtO2lFO67M=
X-Received: by 2002:a5b:787:: with SMTP id b7mr40224163ybq.243.1619607959246; 
 Wed, 28 Apr 2021 04:05:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb3ApYV+Njn7wRq5McKVdkKs4O0fPvpznQP4sKxbhRWkxR8t+as3/4TyykqfhyWJTqKXEB1+UOxLkaCBhwNvQ=
X-Received: by 2002:a5b:787:: with SMTP id b7mr40224143ybq.243.1619607959075; 
 Wed, 28 Apr 2021 04:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210426031043.16212-1-zhaogongyi@huawei.com>
 <CAEemH2d8PK2uz9QpYefmhoaLm=g9NwsViUGMB=pJ4f0PKtSAvw@mail.gmail.com>
In-Reply-To: <CAEemH2d8PK2uz9QpYefmhoaLm=g9NwsViUGMB=pJ4f0PKtSAvw@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 28 Apr 2021 19:05:47 +0800
Message-ID: <CAEemH2cai9qNXiqq=MDi4KOo=2ZjiBxD2SssCT=vVp7F+qgDQA@mail.gmail.com>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/reboot: Update to new API
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
Content-Type: multipart/mixed; boundary="===============0619083773=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0619083773==
Content-Type: multipart/alternative; boundary="00000000000013922305c1065d56"

--00000000000013922305c1065d56
Content-Type: text/plain; charset="UTF-8"

> Nice work on API converting and cleanup, pushed!

BTW, I made some modifications in a separate patch[1], because
I forget to submit them in the last code-reviewing.

https://github.com/linux-test-project/ltp/commit/b71b1a494be4126917221bb3b78594ec25c71ea0

--- a/testcases/kernel/syscalls/reboot/reboot02.c
+++ b/testcases/kernel/syscalls/reboot/reboot02.c
@@ -31,7 +31,7 @@
 char nobody_uid[] = "nobody";
 struct passwd *ltpuser;

-static struct test_case_t {
+static struct tcase {
        int flag;
        int exp_errno;
        const char *option_message;
@@ -40,19 +40,19 @@ static struct test_case_t {
        {LINUX_REBOOT_CMD_CAD_ON, EPERM, "LINUX_REBOOT_CMD_CAD_ON"},
 };

-static void run(int n)
+static void run(unsigned int n)
 {
-       struct test_case_t *tcase = &tcases[n];
+       struct tcase *tc = &tcases[n];

        if (n == 0)
-               TST_EXP_FAIL(reboot(tcase->flag),
-                       tcase->exp_errno, "%s", tcase->option_message);
+               TST_EXP_FAIL(reboot(tc->flag),
+                       tc->exp_errno, "%s", tc->option_message);
        else {
                ltpuser = SAFE_GETPWNAM(nobody_uid);
                SAFE_SETEUID(ltpuser->pw_uid);

-               TST_EXP_FAIL(reboot(tcase->flag),
-                       tcase->exp_errno, "%s", tcase->option_message);
+               TST_EXP_FAIL(reboot(tc->flag),
+                       tc->exp_errno, "%s", tc->option_message);

                SAFE_SETEUID(0);
        }


-- 
Regards,
Li Wang

--00000000000013922305c1065d56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>&gt; Nice work on API converting and cleanup, pushed!<=
br><br>BTW, I made some modifications in a separate patch<span class=3D"gma=
il_default" style=3D"font-size:small">[1]</span>, because<div>I forget to s=
ubmit them in the last code-reviewing.</div><div><br><a href=3D"https://git=
hub.com/linux-test-project/ltp/commit/b71b1a494be4126917221bb3b78594ec25c71=
ea0">https://github.com/linux-test-project/ltp/commit/b71b1a494be4126917221=
bb3b78594ec25c71ea0</a><br><br>--- a/testcases/kernel/syscalls/reboot/reboo=
t02.c<br>+++ b/testcases/kernel/syscalls/reboot/reboot02.c<br>@@ -31,7 +31,=
7 @@<br>=C2=A0char nobody_uid[] =3D &quot;nobody&quot;;<br>=C2=A0struct pas=
swd *ltpuser;<br>=C2=A0<br>-static struct test_case_t {<br>+static struct t=
case {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 int flag;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int exp_errno;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *option_messag=
e;<br>@@ -40,19 +40,19 @@ static struct test_case_t {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 {LINUX_REBOOT_CMD_CAD_ON, EPERM, &quot;LINUX_REBOOT_CMD_CAD_ON&q=
uot;},<br>=C2=A0};<br>=C2=A0<br>-static void run(int n)<br>+static void run=
(unsigned int n)<br>=C2=A0{<br>- =C2=A0 =C2=A0 =C2=A0 struct test_case_t *t=
case =3D &amp;tcases[n];<br>+ =C2=A0 =C2=A0 =C2=A0 struct tcase *tc =3D &am=
p;tcases[n];<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (n =3D=3D 0)<br>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TST_EXP_FAIL(reboot(tcase-=
&gt;flag),<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 tcase-&gt;exp_errno, &quot;%s&quot;, tcase-&gt;option_mes=
sage);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TST_EXP_FAIL(r=
eboot(tc-&gt;flag),<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tc-&gt;exp_errno, &quot;%s&quot;, tc-&gt;option=
_message);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ltpuser =3D SAFE_GETPWNAM(nobody_uid);<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_SETEUID(ltpu=
ser-&gt;pw_uid);<br>=C2=A0<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 TST_EXP_FAIL(reboot(tcase-&gt;flag),<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcase-&gt;exp_errno, &=
quot;%s&quot;, tcase-&gt;option_message);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 TST_EXP_FAIL(reboot(tc-&gt;flag),<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tc-&gt;exp_e=
rrno, &quot;%s&quot;, tc-&gt;option_message);<br>=C2=A0<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_SETEUID(0);<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 }<br><br><br>-- <br>Regards,<br>Li Wang</div></div>

--00000000000013922305c1065d56--


--===============0619083773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0619083773==--

