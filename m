Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BB623A081
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 09:52:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B0DCF3C6ABD
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 09:52:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id DE7EF3C6AB2
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 09:52:51 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 6396F1A01789
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 09:52:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596441170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dxbxq/d135t+fsgsaqIJHr8XPIaiPH38ZE8V4iGOFSs=;
 b=DIUz72s+EfwlEUWHLQ89r5vc0T6Qd0ftWFU63g15lZbKrB7UrabJjiHj3UUOYi6Mp/sWiJ
 h386X6vFsddp0jKWzczB+8bgow3BAHmlbgntzrUhOce+5jCertBiQY0i7vnOws5a70U8ce
 rLaZJBy8hvck64ieDb8CcMy7LxRT2u8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494--oKHpb8wOL28RYjytfBl6A-1; Mon, 03 Aug 2020 03:52:47 -0400
X-MC-Unique: -oKHpb8wOL28RYjytfBl6A-1
Received: by mail-lf1-f69.google.com with SMTP id p192so10740959lfa.0
 for <ltp@lists.linux.it>; Mon, 03 Aug 2020 00:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dxbxq/d135t+fsgsaqIJHr8XPIaiPH38ZE8V4iGOFSs=;
 b=bC9WOUR+bm1wteNaFFVI3bXhARUCZtOwIqp59JtFUeqnKyqp0KawLEOUXkI4LH56nO
 f091PyLuT6epT04ncQbAp02z3AevkIgSTEMgOcy1H4hrxh9wxROmIW15MAUbzj8yo6b1
 wydDXdvjwEsJORly6UT86ev+1N9saww8CgBfwO7tmdHQSuR5jsV42UbEnFVvEpXxp1Zx
 ChI2NFEPrYTHbDdtOL303rg7ijj2HCD/73WBNnwReAfbkkdgEpNTrGYg/EegNbCbv6UU
 S/PE3zJsLnl4sHAwoJv/CfQNpiSJvsZYyhjYliBGisRpbVcoZMaqRmdMqG9qXdB4nkMZ
 LMjw==
X-Gm-Message-State: AOAM532XaGr5n8J1CWl2MseLlSTHE7D/mfAm5+uZnlZFVHCHpd5uuxi8
 jcaBTiVTwatoXpGcQSywLZWI0q8xfG4BZyEa753qWwcf66CiMWeIS6OVBO/CEaf9O4FfBjJu3c8
 nJsisXp+2RjrnCfDrdISVvEJHfBI=
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr7500181ljk.309.1596441166404; 
 Mon, 03 Aug 2020 00:52:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+gdXZNLJMyfvEYWRD6Rb+Jf0Li2qgStnSLoxltoEX1ZlWtXDJmoy1qCMkCidRtXnlrL+sgrHwwG4nI42Fn4U=
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr7500175ljk.309.1596441166164; 
 Mon, 03 Aug 2020 00:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200731121508.12805-1-chrubis@suse.cz>
 <20200731121508.12805-4-chrubis@suse.cz>
In-Reply-To: <20200731121508.12805-4-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Mon, 3 Aug 2020 15:52:34 +0800
Message-ID: <CAEemH2cesasP_fwGu18S4tKuWP4_+69ssKSx1ErL=0E6kNcRvA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] build system: Silence the output a bit more
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
Content-Type: multipart/mixed; boundary="===============1223047634=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1223047634==
Content-Type: multipart/alternative; boundary="0000000000009d748d05abf46c07"

--0000000000009d748d05abf46c07
Content-Type: text/plain; charset="UTF-8"

> +ifdef VERBOSE
>         @set -e; for dir in $(SUBDIRS); do \
>             $(MAKE) -C "$$dir" -f "$(abs_srcdir)/$$dir/Makefile" $@; \
>         done
> +else
> +       @set -e; for dir in $(SUBDIRS); do \
> +           echo "DIR $$dir"; \
>

I don't think to print the DIR has any help for debugging, we could find
the correct source file easily without it too.

Otherwise, the patchset looks pretty good.

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--0000000000009d748d05abf46c07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
+ifdef VERBOSE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @set -e; for dir in $(SUBDIRS); do \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MAKE) -C &quot;$$dir&quot; -f &=
quot;$(abs_srcdir)/$$dir/Makefile&quot; $@; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
+else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@set -e; for dir in $(SUBDIRS); do \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;DIR $$dir&quot;; \<br>=
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">I don&#39;t think to print the DIR has any help for debugging,=
 we could find the correct source file easily without it too.</div></div></=
div><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Otherwise, the patchset looks pretty good.</div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a =
href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</div></div><div=
><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"lt=
r"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000009d748d05abf46c07--


--===============1223047634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1223047634==--

