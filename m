Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D237A39BE3A
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 19:12:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5E2503C7FDC
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 19:12:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 10D633C27F0
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 19:12:31 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0D6D014004FD
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 19:12:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622826749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0nroGZ20TnSEqPO3v+HcAQEhLB+C/pbu5IOhrT+oHr0=;
 b=Crz5FWuUyOdK1Ni6mP3If9uL7BQTm3Wb+/D+yLSWE6uS31JBKkd+zgodsXZC0Zkztn9k6b
 AnIazNg3djwOqozKI9v+vP83QkH6Y7gtF4piU1Nts99to5+gcDYkuOZqAFbWT9JdSgEMfH
 yrIZgd9dR5pw5MoCQzcosYKVvygNzt0=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-cyyr7vkVM1m_sFSa_CXbrg-1; Fri, 04 Jun 2021 13:12:26 -0400
X-MC-Unique: cyyr7vkVM1m_sFSa_CXbrg-1
Received: by mail-ot1-f72.google.com with SMTP id
 r16-20020a0568301350b0290363e6a9392fso5676915otq.13
 for <ltp@lists.linux.it>; Fri, 04 Jun 2021 10:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0nroGZ20TnSEqPO3v+HcAQEhLB+C/pbu5IOhrT+oHr0=;
 b=dMg91Ho2QJQAEHX1CVvVtr06Oq/7Fum7PaOb5+Ks8SFCTSj7x8vxYvl0IbCCqrB/ln
 F/0a1vc6qAlfJXuzneWZ69JrFTeYBM1UfsLowvU4lBwGlzXEcDAJrDiuBbA2GKkeWapI
 LACzmGJijpu5ZmcTfP9Vcs9qQNUpisY80UzoNwE9yFd0M6D+sTmIU+EE+hd7kv6NgRBK
 WMA5wpZonekM7Yer1i4VVA91z3a2lzSAKC+vZ0hchLcPexCTnCMKyT+liBVnXXXr+WgT
 0cTacC6EvCpQyZUsAuf2Mn4eDMq5lX95asbfNbq0QEMUsYXCBh7LkyxvIU8Ys/Fkze61
 VRTQ==
X-Gm-Message-State: AOAM532W+uKGiLt+lmKVA8SDFRyOSdVMhLMj/kwSTd/k+50t973WetNQ
 FEL5WAwrdb0YRcJ3fLgPXDwePMnUjCtllHHVmj4wMxCx3tjnbYUgG5yARA2UiSzRcqkhlt32WV8
 auKTPt0oqQhpv34Yo9VMf7dVtO3o=
X-Received: by 2002:aca:b509:: with SMTP id e9mr11513574oif.66.1622826745821; 
 Fri, 04 Jun 2021 10:12:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBbhNw79EDWol0Y59bLK9VqBQ/3zNuyERMBKKNWj9ZRhsi8jVdY6NeiRrW+i+Mmovnfd0SFm0RWxmQZAMXbf0=
X-Received: by 2002:aca:b509:: with SMTP id e9mr11513557oif.66.1622826745598; 
 Fri, 04 Jun 2021 10:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <YLh9jvI/p/VxsSmx@pevik>
In-Reply-To: <YLh9jvI/p/VxsSmx@pevik>
From: Jan Stancek <jstancek@redhat.com>
Date: Fri, 4 Jun 2021 19:12:09 +0200
Message-ID: <CAASaF6yHHty1m+1U-buHUt4P80fnoTqXTaSO7G-YBm=REWZyWw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Remove disktest from LTP
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
Cc: Mike Frysinger <vapier@gentoo.org>,
 automated-testing <automated-testing@yoctoproject.org>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============0227132732=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0227132732==
Content-Type: multipart/alternative; boundary="000000000000b42ca705c3f3cbf0"

--000000000000b42ca705c3f3cbf0
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 3, 2021 at 8:58 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> does anybody use testcases/kernel/io/disktest ?
>
> It supports various OS, but not sure if it's relevant now in SSD era.
> Last update was in 2008 (version 1.4.2).
>

I don't think I ever used it, it does look outdated, so I won't miss it.
If it has upstream repo somewhere, we could put a reference in commit
message.



> It's not in any runtest file thus not being run by default.
>
> I'd either delete it. Or, if still useful, I'd put it into separate project
> under https://github.com/linux-test-project.
>
> Kind regards,
> Petr
>
>

--000000000000b42ca705c3f3cbf0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace"><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jun 3, 2021 at 8:58 AM Petr Vorel &lt=
;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
does anybody use testcases/kernel/io/disktest ?<br>
<br>
It supports various OS, but not sure if it&#39;s relevant now in SSD era.<b=
r>
Last update was in 2008 (version 1.4.2).<br></blockquote><div><br></div><di=
v><div style=3D"font-family:monospace" class=3D"gmail_default">I don&#39;t =
think I ever used it, it does look outdated, so I won&#39;t miss it.<br></d=
iv><div style=3D"font-family:monospace" class=3D"gmail_default">If it has u=
pstream repo somewhere, we could put a reference in commit message.<br></di=
v><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
It&#39;s not in any runtest file thus not being run by default.<br>
<br>
I&#39;d either delete it. Or, if still useful, I&#39;d put it into separate=
 project<br>
under <a href=3D"https://github.com/linux-test-project" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/linux-test-project</a>.<br>
<br>
Kind regards,<br>
Petr<br>
<br>
</blockquote></div></div>

--000000000000b42ca705c3f3cbf0--


--===============0227132732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0227132732==--

