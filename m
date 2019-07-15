Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA83E68268
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 05:01:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F71B3C1D1F
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 05:01:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 57E763C18F9
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 05:01:20 +0200 (CEST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EABE11000972
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 05:01:13 +0200 (CEST)
Received: by mail-vs1-f50.google.com with SMTP id y16so10374717vsc.3
 for <ltp@lists.linux.it>; Sun, 14 Jul 2019 20:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jOgdmHv+QvY6TaF0ADuhLWYxg8KGatyd7eKr4eAsNHI=;
 b=Xwj6dpGkU9hyxa+RUaroGJqf/wTMMFsfKDrp5NPPPFSOUam0cLn9mO080AFdYz/uSF
 sL/nyTZ/5jaGCQEmK5CCUVU7YIsgycTymy8lh9dvyNh/Ei94XBIf8zZtJ001ENjq9HTM
 J9LcGcoxMoWqtetlVA3y22jTJzBwnsvYWqxXWmSS0VIy1MewH4Njuqpo/ZxT1lGDgEyn
 3MJGjxTpz4fcViI6Mal5/xzyOmDHIvZHaVkXhPrkkkUpplGgHWoTd/plXLmtQZQOOplc
 zQ9qGpfXVADqnJhxV3XHCt5Kyvnn2Gyls7rJCmBoeeU8ygsw1IIOqoYuaf3qe4WrNno0
 jqRQ==
X-Gm-Message-State: APjAAAUO7QNQa6Sgni+nfvUxV886d0EyWWU977bS75NsnRXIQIKuJvMJ
 dwdpM5tWM0YN11eYFpJ0gckIKm7Vr2YkzzlG8OszybYt
X-Google-Smtp-Source: APXvYqzmj+n2PelDkBOLFFUOTjZpdG05F1iCF+mgubN6MYYB3B2SIi/YIWWiQUExiE5kvH3yO6d9NUipnAMcDrvgUH4=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr14903524vsq.179.1563159677780; 
 Sun, 14 Jul 2019 20:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190705051603.24599-1-liwang@redhat.com>
 <02ade9af1634c4681156dceecfd51721284044e3.1562591065.git.jstancek@redhat.com>
In-Reply-To: <02ade9af1634c4681156dceecfd51721284044e3.1562591065.git.jstancek@redhat.com>
From: Li Wang <liwan@redhat.com>
Date: Mon, 15 Jul 2019 11:01:06 +0800
Message-ID: <CAEemH2dTzdxABL_W4Y-TuZEdUJ+Nag936+1P_kD6NGLQP0otPQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3.1] lib: add tst_no_corefile()
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
Content-Type: multipart/mixed; boundary="===============0114528432=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0114528432==
Content-Type: multipart/alternative; boundary="0000000000005262a7058daf792f"

--0000000000005262a7058daf792f
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 8, 2019 at 9:08 PM Jan Stancek <jstancek@redhat.com> wrote:

> Li,
>
> I'd like to avoid generating TWARN when user has done nothing wrong.
> What would you tell on this version? Only tst_no_corefile()
> is changed compared to your v3.
>

Agree on this, TWARN seems unnecessary. Feel free to modify&push v3.1 as
Cyril suggested.

Thank you, Jan!

-- 
Regards,
Li Wang

--0000000000005262a7058daf792f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jul 8, 2019 at 9:08 PM Jan Stancek &lt;<a h=
ref=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Li,<br>
<br>
I&#39;d like to avoid generating TWARN when user has done nothing wrong.<br=
>
What would you tell on this version? Only tst_no_corefile()<br>
is changed compared to your v3.<br></blockquote><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Agree on this, TWARN seems =
unnecessary. Feel free to modify&amp;push v3.1 as Cyril suggested.</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">Thank you, Jan!</div></div><div><=
br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr">Regards,<br>Li Wang<br></div></div></div></d=
iv></div>

--0000000000005262a7058daf792f--

--===============0114528432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0114528432==--
