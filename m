Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 31571F118
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 09:18:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C9733EACA5
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 09:18:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9BC353EACA0
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 09:18:45 +0200 (CEST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 352E620033D
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 09:18:44 +0200 (CEST)
Received: by mail-vs1-f48.google.com with SMTP id x78so4988157vsc.3
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 00:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lmkDX3kXJyZV7shZ69SmMqHiblzOmqz8LAjePgRzfNo=;
 b=lmkZ/HT34aq3JNGw5q3gEIqupJX08Efz5OrSIHOdHLVPkAunSyAFCEoCQB4dk3k5Nu
 zM5DNcI8UUnQGQV9aQspQre9UsvCMW7lcTIGhWfgKUnaAp3XlZTEZA+O2IO3CQX36Mat
 Yqf6/GsAxbR+n/L9/TV0EOnFl0jrwB+mDO1sCjusgQ0qEGWjerTYj4kzJmecx56ArvON
 sO4A6A2z2lSmNx39jtEFaeWnj6+0MHNH4IxSfUBKYIikT83waj84LTt5/wxIQ4Airmp2
 Fq2P2ihSXw6Em206BxeGtthqyWPWSVqAkKVueAu8RLAUXpPSLu9vR2+gTsOPUyITEnGN
 Q8/A==
X-Gm-Message-State: APjAAAUs+HvV4Jbj4vO0QNVd+tqeAC8YywdtBv5k7dTOFRvg+8/tOCNl
 jQUl63245hxxvNkGluxmc+8TqouttmKLhXTLKnG4tVdYeLdFBQ==
X-Google-Smtp-Source: APXvYqwnSwB/CVQuwsibA9STX3p8mj2tuE3CVdqy/cLzYf22pO2u23QNP2NIOkf2Lv3sQJrMiCVICLJy83DMpiV8ZZA=
X-Received: by 2002:a67:ea0b:: with SMTP id g11mr14002658vso.130.1556608722953; 
 Tue, 30 Apr 2019 00:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190430045746.1332-1-xzhou@redhat.com>
In-Reply-To: <20190430045746.1332-1-xzhou@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 30 Apr 2019 15:18:32 +0800
Message-ID: <CAEemH2diyxXisD=f2DX7ptq3c_+XhNe3=xjXU+KXS2BPohaT0A@mail.gmail.com>
To: Murphy Zhou <xzhou@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] fcntl33: weakup child before exit if fail in
	parent
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
Content-Type: multipart/mixed; boundary="===============0926364210=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0926364210==
Content-Type: multipart/alternative; boundary="000000000000fc86fb0587ba3581"

--000000000000fc86fb0587ba3581
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 30, 2019 at 12:58 PM Murphy Zhou <xzhou@redhat.com> wrote:

> Now it failis on overlayfs this way:
> fcntl33.c:120: INFO: .... failed on overlapfs as expected:
> EAGAIN/EWOULDBLOCK
> tst_checkpoint.c:149: BROK: fcntl33.c:178: tst_checkpoint_wait(0, 10000):
> ETIMEDOUT
> tst_test.c:357: BROK: Reported by child (12066)
>

I'm wondering that if the parent failed to set lease, should child
still valuable to run the remaining test after it being wakened?


>
> Signed-off-by: Murphy Zhou <xzhou@redhat.com>
> ---
>  testcases/kernel/syscalls/fcntl/fcntl33.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/testcases/kernel/syscalls/fcntl/fcntl33.c
> b/testcases/kernel/syscalls/fcntl/fcntl33.c
> index 43dc5a2af..ce27e1006 100644
> --- a/testcases/kernel/syscalls/fcntl/fcntl33.c
> +++ b/testcases/kernel/syscalls/fcntl/fcntl33.c
> @@ -121,6 +121,7 @@ static void do_test(unsigned int i)
>                 } else {
>                         tst_res(TFAIL | TTERRNO, "fcntl() failed to set
> lease");
>                 }
> +               TST_CHECKPOINT_WAKE(0);
>                 goto exit;
>         }
>
> --
> 2.21.0
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


-- 
Regards,
Li Wang

--000000000000fc86fb0587ba3581
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 30, 2=
019 at 12:58 PM Murphy Zhou &lt;<a href=3D"mailto:xzhou@redhat.com">xzhou@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Now it failis on overlayfs this way:<br>
fcntl33.c:120: INFO: .... failed on overlapfs as expected: EAGAIN/EWOULDBLO=
CK<br>
tst_checkpoint.c:149: BROK: fcntl33.c:178: tst_checkpoint_wait(0, 10000): E=
TIMEDOUT<br>
tst_test.c:357: BROK: Reported by child (12066)<br></blockquote><div><br></=
div><div><div class=3D"gmail_default" style=3D"">I&#39;m wondering that if =
the parent failed to set lease, should child still=C2=A0valuable=C2=A0to ru=
n the remaining test after it being wakened?</div></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Murphy Zhou &lt;<a href=3D"mailto:xzhou@redhat.com" target=
=3D"_blank">xzhou@redhat.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/syscalls/fcntl/fcntl33.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/testcases/kernel/syscalls/fcntl/fcntl33.c b/testcases/kernel/s=
yscalls/fcntl/fcntl33.c<br>
index 43dc5a2af..ce27e1006 100644<br>
--- a/testcases/kernel/syscalls/fcntl/fcntl33.c<br>
+++ b/testcases/kernel/syscalls/fcntl/fcntl33.c<br>
@@ -121,6 +121,7 @@ static void do_test(unsigned int i)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tst_res(TFAIL | TTERRNO, &quot;fcntl() failed to set lease&quot;=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TST_CHECKPOINT_WAKE=
(0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-- <br>
2.21.0<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div></div></div>

--000000000000fc86fb0587ba3581--

--===============0926364210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0926364210==--
