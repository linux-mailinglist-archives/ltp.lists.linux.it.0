Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC58DA452
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 05:22:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E94373C18FA
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 05:22:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id DD9953C147F
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 05:22:33 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 6D8DB1A0067A
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 05:22:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571282549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/5ncGBczi9w0DWlQ+IZOnlW7L2fLjjXuVOZno3Vh0JA=;
 b=cV02rSlvSuHgkpJQ7lMJqEtp+u7F7L4Woi0Goge6Sfrdh6nC8JgGzJNSc0b+A1J38CV3ar
 ZiWXrhauyrV2jQG3fGlj7jawzCYJljqqlr2UqIz8khRP6jPv9NmrznCLKl4chSOleeQdrS
 tdiLmvSu1Yp6A07bquHwo9ESykzhSt0=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-7H0Ag578O2GlL5omFvUWbQ-1; Wed, 16 Oct 2019 23:22:26 -0400
Received: by mail-oi1-f197.google.com with SMTP id p206so610120oib.14
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 20:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=55MbpAf4viVW48aZglFByXvZUHVC3jHLig52DjK4o2c=;
 b=UCzaYY4GL/7NSzu0CyCMnEr4toNA9Df05q2SQ11P49WTIK1+dXQVZFMSQJBEPKXB0Z
 tWyX4B+OWcEdArwka4vje6laSGgBDwP77HX/5RwKrUzquLdEK0UNYS/+5B8N1WC+mWch
 4gznzRcIPTvlXx+lc9UocUIg7gsLiI79b7h2boHADdvsOo2M3rerZQ42lxA64uk3R+zH
 xP2b5I+vmp1U0dAbFfHA8xMmiXzBtuG1HjknTYWg+ZIfvCg4JW/bvnAZFt2w9xpsS8qH
 Ioe72nhkxStuaxZyShUWQ4kxvpORAXQXircUcuxCqYFlRe5gY+wyjxpXjD/wF1o84935
 ADEQ==
X-Gm-Message-State: APjAAAUo8ATyMdT5LoSXtG4MN8rcD6jpWnno7o/VINBO1bBgGIEny0cV
 E30CoJF1hiwOL9/h5wxitLMnlrumu22Xl4ifmS9gtqbDwpURfJhfcefwuzHoyJHUxIVTDi3jglq
 rHyY+37BwvPZ+4sL9coU0509HFRs=
X-Received: by 2002:a54:480a:: with SMTP id j10mr1228060oij.138.1571282545888; 
 Wed, 16 Oct 2019 20:22:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLFNn0oXGffVDlRQASpLnWtyWz5g+WJHo083v0G4BcroXyu3lexi1tji/AvXVh8BbJ0389KdhS1tl6TaWoWFA=
X-Received: by 2002:a54:480a:: with SMTP id j10mr1228051oij.138.1571282545492; 
 Wed, 16 Oct 2019 20:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20191014112522.24548-1-chrubis@suse.cz>
 <20191014112522.24548-3-chrubis@suse.cz>
 <CAEemH2f0ZXYEwsvcxWhdE33EzLJKr=EeeG91Uq_8rBZOsx57NQ@mail.gmail.com>
 <20191015095225.GA14021@rei> <20191016132139.GA4526@dell5510>
In-Reply-To: <20191016132139.GA4526@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Thu, 17 Oct 2019 11:22:14 +0800
Message-ID: <CAEemH2ciP7nZ+5ADxctpHSaLQs3Lk5bnKUYtfV5XMhN6T7diUA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: 7H0Ag578O2GlL5omFvUWbQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] testcases/kernel: Add linux git and CVE tags
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
Content-Type: multipart/mixed; boundary="===============0079927977=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0079927977==
Content-Type: multipart/alternative; boundary="000000000000f7661a059512b922"

--000000000000f7661a059512b922
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Petr Vorel <pvorel@suse.cz> wrote:

...
> nit: I don't that much blank lines, I'd prefer more compact output:
> ...
> TAGS
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D0c461cb727d1
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2017-2618
>
>
The explanation(HINT: ...) is needed, otherwise, it will misleading someone
not familiar with LTP I think.

--=20
Regards,
Li Wang

--000000000000f7661a059512b922
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.=
cz</a>&gt; wrote:<br></div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><span class=3D"gmail_default" style=3D"font-size:s=
mall">...</span><br>
nit: I don&#39;t that much blank lines, I&#39;d prefer more compact output:=
<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
TAGS<br>
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3D0c461cb727d1" rel=3D"noreferrer" target=3D"_blank">https://=
git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3D0c4=
61cb727d1</a><br>
<a href=3D"https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2017-2618" =
rel=3D"noreferrer" target=3D"_blank">https://cve.mitre.org/cgi-bin/cvename.=
cgi?name=3DCVE-2017-2618</a><br>
<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">The explanation(HINT: ...) is needed, otherwise, it will mislea=
ding someone not familiar with LTP I think.</div></div><div><br></div>-- <b=
r><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,=
<br></div><div>Li Wang<br></div></div></div></div>

--000000000000f7661a059512b922--


--===============0079927977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0079927977==--

