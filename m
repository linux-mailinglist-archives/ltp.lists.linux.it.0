Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B30CC6A1CC
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 07:19:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 163E43C1D0A
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 07:19:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 977D83C1508
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 07:19:14 +0200 (CEST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CC8A31A01112
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 07:19:12 +0200 (CEST)
Received: by mail-vs1-f44.google.com with SMTP id m8so13078463vsj.0
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 22:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZN2kjeZ6F77u15yoQ7ACr/twyQEfpgUwqQG9+8qqc2o=;
 b=hFoNpXexAV/S0Ok1de6LOjp/9rynUyEq/qSNrcpeAoxjcivdDhIiSQL7W77n+LAvI2
 Jx0ex1bKxAvlQjPR80k+Wn5w0eRBA7K0K/Xz1jDaxZpjk9nE2TR1zxa97FKCfOpqRuxy
 oQVCBtpVMnSuRf+VWANyh7eL42XCKhy9O27C//oxzpynyV/nm0R/G5sz2c7Lz25hw6JS
 BHWL200spVfnVlUl8GgZTYTnm4G4phAvlzCx1ijQgS6URPO/gqVyAIzyXXn3DGPvzlcY
 4Yqg1fl17gZEdIvZKkcQGe7mrGvRJPwrOt255ECWeHcNOw1Fqkb9ogUir5ZWfxQI5AR7
 nSnw==
X-Gm-Message-State: APjAAAX25jIPNp75+UotFkviPDjzZh0aZsIpPmoaGvxxbL4+YYZgsBPr
 4ajsjS1jNDr0S8k1UJW0ceFgZbrlnRPWG/wikBCmcg==
X-Google-Smtp-Source: APXvYqyL3ipLETWeEaGpN7H/nHG3rUWaMm+5C1m9RCo1i3X4aNqUyes5awdJtFWH2x+D70Y5E0mEfEVl6PRjbfnd2Rs=
X-Received: by 2002:a67:11c1:: with SMTP id 184mr18648729vsr.217.1563254351569; 
 Mon, 15 Jul 2019 22:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAEemH2e5b4q+bOeE3v8FG-piSUteCinPMVmxpnkVcYCmrUc4Uw@mail.gmail.com>
 <20190611074741.31903-1-xzhou@redhat.com>
In-Reply-To: <20190611074741.31903-1-xzhou@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 16 Jul 2019 13:19:00 +0800
Message-ID: <CAEemH2c6FcpN-Z6pBK277UOWoBH+vSvxrCHddH2WCaRcG8N4hw@mail.gmail.com>
To: Murphy Zhou <xzhou@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 1/4] lib/tst_ioctl.c: add helper tst_fibmap
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
Cc: linux-fsdevel@vger.kernel.org, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1578680851=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1578680851==
Content-Type: multipart/alternative; boundary="00000000000051c194058dc5846f"

--00000000000051c194058dc5846f
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 11, 2019 at 3:48 PM Murphy Zhou <xzhou@redhat.com> wrote:

> To check if FIBMAP ioctl is supported by the filesystem we are
> testing on. It also can check the support status of specific
> files, but that may not needed for now.
>
> Reviewed-by: Li Wang <liwang@redhat.com>
> Signed-off-by: Murphy Zhou <xzhou@redhat.com>
>

Patch set pushed, thanks.

I also added Amir's reviewed by.
    Reviewed-by: Amir Goldstein <amir73il@gmail.com>

-- 
Regards,
Li Wang

--00000000000051c194058dc5846f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Tue, Jun 11, 2019 at 3:48 PM Murphy Zhou &lt;<a href=
=3D"mailto:xzhou@redhat.com">xzhou@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">To check if FIBMAP ioctl is su=
pported by the filesystem we are<br>
testing on. It also can check the support status of specific<br>
files, but that may not needed for now.<br>
<br>
Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_bl=
ank">liwang@redhat.com</a>&gt;<br>
Signed-off-by: Murphy Zhou &lt;<a href=3D"mailto:xzhou@redhat.com" target=
=3D"_blank">xzhou@redhat.com</a>&gt;<br></blockquote><div><br></div><div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Patch set pushed, than=
ks.</div><div class=3D"gmail_default"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">I also added Amir&#39;s reviewed by.</div><div =
class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 Reviewed-by=
: Amir Goldstein &lt;<a href=3D"mailto:amir73il@gmail.com">amir73il@gmail.c=
om</a>&gt;</div></div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<b=
r></div></div></div></div>

--00000000000051c194058dc5846f--

--===============1578680851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1578680851==--
