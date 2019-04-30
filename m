Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F3662F1CF
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 10:10:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B77CB3EACAB
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 10:10:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 6D5613EACA0
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 10:09:58 +0200 (CEST)
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
 [209.85.221.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 58E5F1A013A7
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 10:09:56 +0200 (CEST)
Received: by mail-vk1-f193.google.com with SMTP id h127so2898605vkd.12
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 01:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O9ioM7ll3QmtP3wTbIyoBCBxMrJvxfajZu+0cmFKmcs=;
 b=LMeR+SHI5o+szGG7AVxWOIoMCch6x6ZjUUZQQeggvNiDgwhqB+okpQfWR36S2pzIA9
 C47nKl3Vsx2rsgmw4+phIH4TcmxB+Mdt3PbxbQ3hFC0x3ctpCxAovSKRp+NB73Pa3FLB
 fdKGmqFk4q8fUZwR0XRqf3revR0TEfKFaY0Nny1eHqOfjJbEcOBvFh8Tohwaor91ECwZ
 x0lAQ1a0me6prGR7aaAKld2+Rjokrrq5ojPuZqnilDAhQTxTKJOZPXyC0Cp+SnHlN4E8
 MGebhQZ8vN0WaUB6fa/lcVPuOnuUIN9yLuMBWDMBaVGhPQ+rEKD1CaZrgeuzrclB9rmM
 rgfw==
X-Gm-Message-State: APjAAAVnlDUDTYgPP6ZU5ZAAVzE02sSo3YnaUeqfhBblcxSymNn2FwrQ
 CYHEpBQEWyGiNB7dod2mb9fh04OhUY0zXGOoM8WzlBAWE29mgA==
X-Google-Smtp-Source: APXvYqwM+vWWm7KzSj3x8ud12VZW4XrS5R7VSmNQF4lFNLoQk3tWn5IXoVNG0KZky1FrIJQ3InEkz3Y2TIMoeTT9pLA=
X-Received: by 2002:a1f:1284:: with SMTP id 126mr34767004vks.72.1556611795035; 
 Tue, 30 Apr 2019 01:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190430045746.1332-1-xzhou@redhat.com>
 <CAEemH2diyxXisD=f2DX7ptq3c_+XhNe3=xjXU+KXS2BPohaT0A@mail.gmail.com>
 <20190430073453.45cblrgmxh3a44hd@XZHOUW.usersys.redhat.com>
In-Reply-To: <20190430073453.45cblrgmxh3a44hd@XZHOUW.usersys.redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 30 Apr 2019 16:09:44 +0800
Message-ID: <CAEemH2e79SWd2R2TrBXbYjuE_A5a9FVOeFghXSKp2aJrckLUaw@mail.gmail.com>
To: Murphy Zhou <xzhou@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0304864871=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0304864871==
Content-Type: multipart/alternative; boundary="00000000000018ce370587baede1"

--00000000000018ce370587baede1
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 30, 2019 at 3:34 PM Murphy Zhou <xzhou@redhat.com> wrote:

> On Tue, Apr 30, 2019 at 03:18:32PM +0800, Li Wang wrote:
> > On Tue, Apr 30, 2019 at 12:58 PM Murphy Zhou <xzhou@redhat.com> wrote:
> >
> > > Now it failis on overlayfs this way:
> > > fcntl33.c:120: INFO: .... failed on overlapfs as expected:
> > > EAGAIN/EWOULDBLOCK
> > > tst_checkpoint.c:149: BROK: fcntl33.c:178: tst_checkpoint_wait(0,
> 10000):
> > > ETIMEDOUT
> > > tst_test.c:357: BROK: Reported by child (12066)
> > >
> >
> > I'm wondering that if the parent failed to set lease, should child
> > still valuable to run the remaining test after it being wakened?
>
> In do_child it just open file and calculate the time spent on it. Also
> parent will reap the child before exit anyway. That checkpoint is needed
> while everything goes fine, so even it's not that valuable to run the
> remaining tests in child, it's not hurting though, :)
>

Indeed, it sounds reasonable to me.

Reviewed-by: Li Wang <liwang@redhat.com>


>
> Thanks for reviewing!
> --
> M
> >
> >
> > >
> > > Signed-off-by: Murphy Zhou <xzhou@redhat.com>
> > > ---
> > >  testcases/kernel/syscalls/fcntl/fcntl33.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/testcases/kernel/syscalls/fcntl/fcntl33.c
> > > b/testcases/kernel/syscalls/fcntl/fcntl33.c
> > > index 43dc5a2af..ce27e1006 100644
> > > --- a/testcases/kernel/syscalls/fcntl/fcntl33.c
> > > +++ b/testcases/kernel/syscalls/fcntl/fcntl33.c
> > > @@ -121,6 +121,7 @@ static void do_test(unsigned int i)
> > >                 } else {
> > >                         tst_res(TFAIL | TTERRNO, "fcntl() failed to set
> > > lease");
> > >                 }
> > > +               TST_CHECKPOINT_WAKE(0);
> > >                 goto exit;
> > >         }
> > >
> > > --
> > > 2.21.0
> > >
> > >
> > > --
> > > Mailing list info: https://lists.linux.it/listinfo/ltp
> > >
> >
> >
> > --
> > Regards,
> > Li Wang
>


-- 
Regards,
Li Wang

--00000000000018ce370587baede1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 30, 2019 at 3:34 PM Mu=
rphy Zhou &lt;<a href=3D"mailto:xzhou@redhat.com">xzhou@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, A=
pr 30, 2019 at 03:18:32PM +0800, Li Wang wrote:<br>
&gt; On Tue, Apr 30, 2019 at 12:58 PM Murphy Zhou &lt;<a href=3D"mailto:xzh=
ou@redhat.com" target=3D"_blank">xzhou@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Now it failis on overlayfs this way:<br>
&gt; &gt; fcntl33.c:120: INFO: .... failed on overlapfs as expected:<br>
&gt; &gt; EAGAIN/EWOULDBLOCK<br>
&gt; &gt; tst_checkpoint.c:149: BROK: fcntl33.c:178: tst_checkpoint_wait(0,=
 10000):<br>
&gt; &gt; ETIMEDOUT<br>
&gt; &gt; tst_test.c:357: BROK: Reported by child (12066)<br>
&gt; &gt;<br>
&gt; <br>
&gt; I&#39;m wondering that if the parent failed to set lease, should child=
<br>
&gt; still valuable to run the remaining test after it being wakened?<br>
<br>
In do_child it just open file and calculate the time spent on it. Also<br>
parent will reap the child before exit anyway. That checkpoint is needed<br=
>
while everything goes fine, so even it&#39;s not that valuable to run the<b=
r>
remaining tests in child, it&#39;s not hurting though, :)<br></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">I=
ndeed, it sounds reasonable to me.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">li=
wang@redhat.com</a>&gt;</div></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
Thanks for reviewing!<br>
--<br>
M<br>
&gt; <br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Murphy Zhou &lt;<a href=3D"mailto:xzhou@redhat.com=
" target=3D"_blank">xzhou@redhat.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 testcases/kernel/syscalls/fcntl/fcntl33.c | 1 +<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/testcases/kernel/syscalls/fcntl/fcntl33.c<br>
&gt; &gt; b/testcases/kernel/syscalls/fcntl/fcntl33.c<br>
&gt; &gt; index 43dc5a2af..ce27e1006 100644<br>
&gt; &gt; --- a/testcases/kernel/syscalls/fcntl/fcntl33.c<br>
&gt; &gt; +++ b/testcases/kernel/syscalls/fcntl/fcntl33.c<br>
&gt; &gt; @@ -121,6 +121,7 @@ static void do_test(unsigned int i)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} el=
se {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL | TTERRNO, &quot;fcntl() failed to se=
t<br>
&gt; &gt; lease&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TST_CHECK=
POINT_WAKE(0);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto=
 exit;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.21.0<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp=
" rel=3D"noreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp<=
/a><br>
&gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Regards,<br>
&gt; Li Wang<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div></div>

--00000000000018ce370587baede1--

--===============0304864871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0304864871==--
