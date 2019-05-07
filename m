Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4735E161A6
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2019 12:06:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B1993EA373
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2019 12:06:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 433813EA046
 for <ltp@lists.linux.it>; Tue,  7 May 2019 12:06:29 +0200 (CEST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F1536608A62
 for <ltp@lists.linux.it>; Tue,  7 May 2019 12:06:30 +0200 (CEST)
Received: by mail-vk1-f176.google.com with SMTP id t74so3909413vke.2
 for <ltp@lists.linux.it>; Tue, 07 May 2019 03:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NEaVe5D9lOeqmBYSI3ZUuwmiMx8T/eMWgh1wxrRDAmo=;
 b=kFaUwGK9L0YFlFuJX4jp1kprc5YqxIr4v4QC7CZ8GXsZ2WYZk7KI1+gkQc+b0QXroK
 IsvmEcoNI690zzEWVir6vOAjd1zKSp2NdU7aISdQTb9V36m/JV+HKnq0F9LogPFEksmQ
 vAyFYD4pXZkNUEq9z2FAgM2B/paEFGRvS1iqTifGvjoW3u9nH0gmMuC0gqyXb07pjkS/
 R7CC8rGQC9bpNxmgYEmgrA39HzvCHD7KcO0O3ywtDTn0qBEKvuT3Cbxuo5RT9xnHcbTg
 TQ/dYIuJYWOaLViuvNT8ak/d8VxSWSULshdmdVs7KJRaiez3ius4kCsGfD1Ww2p/HMFs
 qLUA==
X-Gm-Message-State: APjAAAULStjJsRBthd2SVhjYH6f+ouIELppjsCVjFnuW2ZVKGj0bpct9
 USM9gD0pei++fERoxfOaZKvjfh2oNhUJryPNK3oi9w==
X-Google-Smtp-Source: APXvYqzUeQ+gBgxppTRgIfk3CRRXB16pi0FUD22cwO7u1kuO9fu4NtCeEd3dke+aOksxGSkOaHf2Z1cCiCTPAyzr76c=
X-Received: by 2002:a1f:28d7:: with SMTP id o206mr15340847vko.36.1557223587598; 
 Tue, 07 May 2019 03:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190507065530.12174-1-camann@suse.com>
 <CAEemH2e=9J_7OtSsS5wq+4YgfOm1zj=PK5cnaBk69LKtdR71ZA@mail.gmail.com>
 <7f9b69db-12a2-6e88-7687-602b88ce8cd7@suse.de>
In-Reply-To: <7f9b69db-12a2-6e88-7687-602b88ce8cd7@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Tue, 7 May 2019 18:06:16 +0800
Message-ID: <CAEemH2cgcYG7OAkwbVHrjUCaHUrsXJkU2gKDnTUuvqp=9D1QcA@mail.gmail.com>
To: Christian Amann <camann@suse.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v1] crypto/af_alg02: fixed read() being stuck
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0452198688=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0452198688==
Content-Type: multipart/alternative; boundary="000000000000c67aa20588495e1d"

--000000000000c67aa20588495e1d
Content-Type: text/plain; charset="UTF-8"

On Tue, May 7, 2019 at 4:59 PM Christian Amann <camann@suse.de> wrote:

> Hi Li,
>
> Thanks for having a look at my patch. To my knowledge
> *pthread_timedjoin_np* does not kill the thread if it times out. It
> returns ETIMEDOUT which, in this case, leads to the whole testcase
> terminating.
>
Yes, you method could be work but not elegant. AFAIK, pthread_timedjoin_np
is non-standard and first appeared in glibc in version 2.3.3

> I chose this method over setting test.timeout because this way an
> informative error-message can be printed.
>
> I may be missing the problem here. Can you point me in the right direction
> why this is bad practice?
>
Seems you misundertood my words:). I was not suggest to set timeout for the
test before. As I saw you define VERIFY_TIMEOUT by yourself and involves
many variables to revoke thread when it hits reading stuck. That looks a
bit redundant.

Maybe we can take use of tst_timeout_remaining() to make things simpler?

we could call:

pthread_setcancelstate(PTHREAD_CANCEL_ENABLE)

at the start of parent, then creat thread to run test for a while of time,
until the tst_timeout_remaining() < 10sec, then call:

pthread_cancel(<thread_b_pid>)

At last, print something to declear if necessary.


-- 
Regards,
Li Wang

--000000000000c67aa20588495e1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, May 7, 2019 at 4:59 PM Christian Amann &lt;<a href=3D"mailto:camann=
@suse.de" target=3D"_blank">camann@suse.de</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <p>Hi Li,</p>
    <p>Thanks for having a look at my patch. To my knowledge <i>pthread_tim=
edjoin_np</i>
      does not kill the thread if it times out. It returns ETIMEDOUT
      which, in this case, leads to the whole testcase terminating.</p></di=
v></blockquote><div class=3D"gmail_default">Yes, you method could be work b=
ut not elegant. AFAIK, pthread_timedjoin_np is non-standard and first appea=
red in glibc in version 2.3.3</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div bgcolor=3D"#FFFFFF">
    <p>I chose this method over setting test.timeout because this way an
      informative error-message can be printed.</p>
    <p>I may be missing the problem here. Can you point me in the right
      direction why this is bad practice?</p></div></blockquote><div class=
=3D"gmail_default" style=3D"font-size:small">Seems you misundertood my word=
s:). I was not suggest to set timeout for the test before. As I saw you def=
ine VERIFY_TIMEOUT=C2=A0by yourself and involves many variables to revoke t=
hread when it hits reading stuck. That looks a bit redundant.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">Maybe we can take use of tst_timeout_r=
emaining() to make things simpler?</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><span class=3D"gmail_default" style=3D"font-=
size:small">we could </span>call:</div><div class=3D"gmail_quote"><br><div =
class=3D"gmail_default" style=3D"font-size:small">pthread_setcancelstate(PT=
HREAD_CANCEL_ENABLE)<br></div></div><div class=3D"gmail_quote"><br><span cl=
ass=3D"gmail_default" style=3D"font-size:small"></span>at the start of <spa=
n class=3D"gmail_default" style=3D"font-size:small">parent,</span>=C2=A0the=
n<span class=3D"gmail_default" style=3D"font-size:small"> creat thread to r=
un test for a while of time,</span></div><div class=3D"gmail_quote"><span c=
lass=3D"gmail_default" style=3D"font-size:small">until the tst_timeout_rema=
ining() &lt;=C2=A010sec, then</span> call:<br>=C2=A0<br>pthread_cancel(&lt;=
thread_b_pid&gt;)</div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">At last, print something<span class=3D"gmail_default" style=3D"=
font-size:small"> to declear</span> if necessary.<br></div><div class=3D"gm=
ail_quote"><br></div><div class=3D"gmail_quote"><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail-m_-7895759389871492517gmail_signature"><div dir=3D"=
ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div></div><=
/div></div>

--000000000000c67aa20588495e1d--

--===============0452198688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0452198688==--
