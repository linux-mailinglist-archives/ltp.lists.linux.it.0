Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D5E2B15BA
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 07:02:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DC2B3C2ED7
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 07:02:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id CA8663C2EC1
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 07:02:45 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 3D239600787
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 07:02:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605247362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mBwO2/D0xk3h1bSryz5sKP/lD0RLuo0z3bwnOYhaT3I=;
 b=aCR5YbfPi/Z1q1GcrXlxJx85X+vy9phFi6jwlC1WiHiKkULTmbRMCLxDYwETuB6syNXChw
 WYJkBiKhCnY5876af6zV4MPR2kXrws6ZqKUph4G2MeFTsRdPZ+W0oleIRLU2yEbWcjm7mQ
 95Ko9Uzio7Vb9bAgwqjxM19/G5oFKLQ=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-B0ThDdUiNrSufZcLnFvg_g-1; Fri, 13 Nov 2020 01:02:39 -0500
X-MC-Unique: B0ThDdUiNrSufZcLnFvg_g-1
Received: by mail-yb1-f197.google.com with SMTP id k7so9088140ybm.13
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 22:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mBwO2/D0xk3h1bSryz5sKP/lD0RLuo0z3bwnOYhaT3I=;
 b=pdFYApxnYUB6/DKQuDZj5uSCzL/bE/hX7Bc21HYaVH7AXlBMPjTt2mmVmVAhEZQN9j
 CZt3ciqAr/+Z5ESNSt2R3QRsufndPDKxOIBOeCDPFLUlEZvASq6IhbnBIBxrkQVnoag+
 cbySBjlzVbL89vAWB1JGH1xgjD1e7qqg3Nac464gcVQhiRPbWJ1kFj910eN9L1eV2Atp
 NEcVJSKb92VgJKh3fiKaI+f65QRZyvTEtY6SJg8Saf9jkPMYxCdR53rMkW6u3MtxAyvo
 E5shlxjhVsRAyOWR09QVRovJz+1j/LxA9Jz/OIOl/BaJcP6AAH7edqiySb5XU0fh8BCt
 UnOw==
X-Gm-Message-State: AOAM532RxG35hOSHTFCcIsG2OGdymPWGWCp1XK4nk7OdUIlCpD3rfBrf
 cjjfnKW/GRqDWU4LhWvW9RJ7+3EeLJDX0TjNCYoOFM7XZhjgOyvFfc9CLdpKKjaGMZX9MdBDSZ9
 4oIkqkn+On5jmyIcFz7wDFVq8zXo=
X-Received: by 2002:a25:ba4c:: with SMTP id z12mr787447ybj.366.1605247359336; 
 Thu, 12 Nov 2020 22:02:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3+lpgrKdJQ6hnp8b1yZtdi294NFYqgU2EAwOuPaJqs4YvpcBIgh3tlnY4vCPJ6uaGMJmuYmmsoWsWp52iS24=
X-Received: by 2002:a25:ba4c:: with SMTP id z12mr787426ybj.366.1605247359023; 
 Thu, 12 Nov 2020 22:02:39 -0800 (PST)
MIME-Version: 1.0
References: <20201109164605.25965-1-mdoucha@suse.cz>
 <20201112142146.GA19824@yuki.lan>
 <2c091ecd-af38-2569-5fd4-a1f3e3458a01@suse.cz> <20201112174341.GB29575@pevik>
In-Reply-To: <20201112174341.GB29575@pevik>
From: Li Wang <liwang@redhat.com>
Date: Fri, 13 Nov 2020 14:02:27 +0800
Message-ID: <CAEemH2cnAmZ-Ovc4DpGRe8NkQdFgX4cjaOrqbboc+o1aYpTuwA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] Add tst_secureboot_enabled() helper
 function
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
Content-Type: multipart/mixed; boundary="===============1523023406=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1523023406==
Content-Type: multipart/alternative; boundary="0000000000009c99d205b3f6c69b"

--0000000000009c99d205b3f6c69b
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2020 at 1:44 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> > On 12. 11. 20 15:21, Cyril Hrubis wrote:
> > > Hi!
> > > I've looked into the library and what it actually does in this case is
> > > that it opens a sysfs file and reads a few bytes from there. I guess
> > > that we can even avoid linking the library in this case, since we just
> > > want to know a value of the single bit in the SecureBoot file.
>
> > > The full path is:
>
> > >
> /sys/firmware/efi/efivars/SecureBoot-8be4df61-93ca-11d2-aa0d-00e098032b8c
>
> > Yes, we could read the sysfile directly. But do we want to deal with
> > potential compatibility issues and test breakage if the UEFI vars API
> > changes in the future? The binary format of those sysfiles is controlled
> > by the UEFI Forum, not by kernel devs. The efivars library is available
> > on basically all modern distros and we most likely won't do any
> > SecureBoot tests on distros that don't have it.
>
> I also don't see a big deal to use the efivars library.
>

That's true. I have no objection to the patchset.

But we always try to avoid the LTP dependency on other libraries, in this
point, I agree with Cyril.

-- 
Regards,
Li Wang

--0000000000009c99d205b3f6c69b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Nov 13, 2020 at 1:44 AM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
&gt; On 12. 11. 20 15:21, Cyril Hrubis wrote:<br>
&gt; &gt; Hi!<br>
&gt; &gt; I&#39;ve looked into the library and what it actually does in thi=
s case is<br>
&gt; &gt; that it opens a sysfs file and reads a few bytes from there. I gu=
ess<br>
&gt; &gt; that we can even avoid linking the library in this case, since we=
 just<br>
&gt; &gt; want to know a value of the single bit in the SecureBoot file.<br=
>
<br>
&gt; &gt; The full path is:<br>
<br>
&gt; &gt; /sys/firmware/efi/efivars/SecureBoot-8be4df61-93ca-11d2-aa0d-00e0=
98032b8c<br>
<br>
&gt; Yes, we could read the sysfile directly. But do we want to deal with<b=
r>
&gt; potential compatibility issues and test breakage if the UEFI vars API<=
br>
&gt; changes in the future? The binary format of those sysfiles is controll=
ed<br>
&gt; by the UEFI Forum, not by kernel devs. The efivars library is availabl=
e<br>
&gt; on basically all modern distros and we most likely won&#39;t do any<br=
>
&gt; SecureBoot tests on distros that don&#39;t have it.<br>
<br>
I also don&#39;t see a big deal to use the efivars library.<br></blockquote=
><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">That=
&#39;s true. I have no objection to the patchset.</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">But we always try to avoid the LTP dependency on o=
ther libraries, in this point, I agree with Cyril.</div></div><div><br></di=
v>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>R=
egards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000009c99d205b3f6c69b--


--===============1523023406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1523023406==--

