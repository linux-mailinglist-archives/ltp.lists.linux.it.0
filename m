Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AC6202D8
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 11:49:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D5DD3EA3F7
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 11:49:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 94F303EA2E5
 for <ltp@lists.linux.it>; Thu, 16 May 2019 11:49:36 +0200 (CEST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 47FF5600A3A
 for <ltp@lists.linux.it>; Thu, 16 May 2019 11:49:34 +0200 (CEST)
Received: by mail-vs1-f48.google.com with SMTP id d128so1887624vsc.10
 for <ltp@lists.linux.it>; Thu, 16 May 2019 02:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jk/PB87Tx0UYCcrU9ghngC0SEJPVquKMqmvi7n7c8dU=;
 b=ACaKtrlYUCighySnWDrr/Yc/Oyhaa6D7j3gilKLQMNJSxvIZJRj3Uv5tYAg4EFe5xP
 p5Bj/ow38CgY52jzoOJWvIuCeec3HDD30anrgTOPHXt9WwaBqOSt3MJTX8ZvcD+kStcW
 LyIUj56fuXFqkQu4e44YfJ2dwOJvcSOqkLIbCJoIk1NjYw+xTSFOWp/PbS96Sy2JkmwD
 M8nZAgTEF0a6Rejzdhiso18cYkgQ225Pw8voPHgRzOiDVjsYpidq9w9fFb1nE+FYPXpd
 uhIx6oQcD/YqBD4Vkpl3A8cW+iwIqIbZMftmBTRy4WFAs3laFkA367sRlJ0l3Buvf3Xv
 7XgQ==
X-Gm-Message-State: APjAAAWFHuvEwJ+RNqoFRWxrzgjnjGv1ujEM4DosKZUfE/Ukjdc9/TqX
 2r0FZJrdhMMcwXdAN56CjWSWntsTGJCTLUYtj22Olg==
X-Google-Smtp-Source: APXvYqxTUOZUgxYVAz6FAxUpuTjwVfaeUxRlYzdRFi8FAgclyOMsRIRi4ECezpE82OyE7dyNTi0B4kN8qXjUAB+bpEs=
X-Received: by 2002:a67:ad0f:: with SMTP id t15mr5141607vsl.179.1558000173206; 
 Thu, 16 May 2019 02:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190516073826.GA14532@dell5510>
 <1051593197.23090826.1557995723298.JavaMail.zimbra@redhat.com>
 <20190516090705.GA21814@rei.lan>
In-Reply-To: <20190516090705.GA21814@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Thu, 16 May 2019 17:49:22 +0800
Message-ID: <CAEemH2dj3Txm=otnF+UEg2eJY70wTC-5tbT2R1VfrB0qAxtqmQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] Oldest still supported kernel
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
Content-Type: multipart/mixed; boundary="===============1261491590=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1261491590==
Content-Type: multipart/alternative; boundary="000000000000e26ca00588fe2ebe"

--000000000000e26ca00588fe2ebe
Content-Type: text/plain; charset="UTF-8"

On Thu, May 16, 2019 at 5:07 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > > Is it the oldest version we want to support or even something older?
> >
> > I'd like minimum to be at least 3.10.0 / glibc-2.17 (RHEL7).
>

This minimum looks good to me.


> >
> > Older distros use LTP mostly for regression tests, so it might be
> acceptable
> > for users to switch to older release tag, rather than always latest
> master.
>

I think so. To switch to older release is a better option in that situation.

> >
> > There's also an option, we create a "legacy" branch for old distros,
> > and accept only critical fixes (no new tests, rewrites, etc.). It would
> > be unsupported, but provide place where legacy users can cooperate.
>
> I was trying to avoid having several active branches for LTP for several
> reasons. Mainly to avoid people running old LTP on reasonably modern
> kernels because they were under an impression that older release is more
> stable. Hence I would like to avoid having this if possible.
>

Yes, to maintain an old LTP branch will also cost more energy, I agree to
avoid do that too.

But one more question, if a person posts a patch to fix an older issue
which conflicts with the new kernel stuff, what should we do for that?

-- 
Regards,
Li Wang

--000000000000e26ca00588fe2ebe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, May 16, 2019 at 5:07 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt; Is it the oldest version we want to support or even something old=
er?<br>
&gt; <br>
&gt; I&#39;d like minimum to be at least 3.10.0 / glibc-2.17 (RHEL7).<br></=
blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-s=
ize:small">This minimum looks good to me.</div></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Older distros use LTP mostly for regression tests, so it might be acce=
ptable<br>
&gt; for users to switch to older release tag, rather than always latest ma=
ster.<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">I think so. To switch to older release is a better option =
in that situation.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; There&#39;s also an option, we create a &quot;legacy&quot; branch for =
old distros,<br>
&gt; and accept only critical fixes (no new tests, rewrites, etc.). It woul=
d<br>
&gt; be unsupported, but provide place where legacy users can cooperate.<br=
>
<br>
I was trying to avoid having several active branches for LTP for several<br=
>
reasons. Mainly to avoid people running old LTP on reasonably modern<br>
kernels because they were under an impression that older release is more<br=
>
stable. Hence I would like to avoid having this if possible.<br></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">Yes, to maintain an old LTP branch will also cost more energy, I agree to=
 avoid do that too.</div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">But one more question, if a person posts a patch to fi=
x an older issue which conflicts with the new kernel stuff, what should we =
do for that?=C2=A0</div></div></div><div><br></div>-- <br><div dir=3D"ltr" =
class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li W=
ang<br></div></div></div></div>

--000000000000e26ca00588fe2ebe--

--===============1261491590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1261491590==--
