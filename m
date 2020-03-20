Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5840B18C828
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 08:32:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 288EF3C538E
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 08:32:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 30F573C537E
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 08:32:31 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 2FD82201488
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 08:32:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584689548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EqvwlkR8xa3z5T/hjocUzXONfNI+IdclxNx7EzDeXpc=;
 b=ZMEgvCZfQRQY1geEtbv5EMQvZfuaRzauzPZNawJ9LvTGQAmSXduhULvTWDOaMz2Ma9pyUr
 CNvylfeC9xyChOt7NRGzgu2tyNkBSS9t6+4zrKFPt5K8i/2cKCdHzXMR0FkG6HEIRMznKC
 MLDrbhvsG2wnU83B5gnBrx6LC6vDkcY=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-4F5c5xHCPH-ahy9WAsEdMQ-1; Fri, 20 Mar 2020 03:32:25 -0400
X-MC-Unique: 4F5c5xHCPH-ahy9WAsEdMQ-1
Received: by mail-oi1-f198.google.com with SMTP id s10so3410354oie.22
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 00:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xG3XeuCWFhe4/dEJA4FgFGJfSJ8mD2Yi/o24ztyMgGY=;
 b=JS2MCAsfK9EgNBbvfwge04sJJMG3U/6FlB8Ou3TVLKwPaIJFASLPap8y9Xt3qvibks
 a165QLEcBniAcQ7W9dF5EFR40lfZm9NW3yGCHVqkz213w/qp1nHQvhtIQnLdrf04iho3
 3BbwbvPQChUGmQqGa8DGgcwqLCQih8yz8sxnr2TWikQ4ESSgKl7KdMOWEOdjRHkNsFbf
 ppBcTdQTs0wYavwKaeCA0eupsZUi+dGkfoO2vxOPM5+JUes/KgwcO4kOXQHJMeHnphxw
 2n+gWLtMYJu5hT2N54D0pZ+OtzHXRvKL7KruFiRz9ccVzUURAk/IaHBAoJW0ieHZYIvN
 q5hA==
X-Gm-Message-State: ANhLgQ3tw3VhC90bPExkFEFCJ50c6qF0MwmZj0C72Ze1JthMRjflCJ9n
 nvFsdsFAQD7dN7vq9j8qrfqP7pLI45n4IbUh9QlCFWerXy6ExnmSdjXPyRkBU9ib3zV88s82+Cn
 g4LRNr9bHbR8t+RDoqRIXOgdHA0Y=
X-Received: by 2002:aca:484c:: with SMTP id v73mr5091217oia.138.1584689544578; 
 Fri, 20 Mar 2020 00:32:24 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vufPQmwsbwYIxk9fxyeuKcKGkcdEctphvu20qY1LhfJqQi3UDuOhT+VNK7IQoKMgKbUlYsnE1AmvVP340x6260=
X-Received: by 2002:aca:484c:: with SMTP id v73mr5091203oia.138.1584689544202; 
 Fri, 20 Mar 2020 00:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200318153801.3529-1-chrubis@suse.cz>
 <20200318153801.3529-6-chrubis@suse.cz>
 <CAEemH2f_Md7hkEWgLYABD+TLbDJvvR-aMfuuNqLNeyWSWK1EnQ@mail.gmail.com>
 <20200319220006.GA29386@yuki.lan>
In-Reply-To: <20200319220006.GA29386@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Fri, 20 Mar 2020 15:32:11 +0800
Message-ID: <CAEemH2fLbXBCLSJB5CnSb4ta_PVDunae4UH+ZR8_fj6SM4i4Ng@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/9] syscalls/sysinfo03: Add time namespace test
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
Content-Type: multipart/mixed; boundary="===============0710743508=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0710743508==
Content-Type: multipart/alternative; boundary="0000000000005ca30c05a14449bd"

--0000000000005ca30c05a14449bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cyril,

On Thu, Mar 19, 2020 at 10:04 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> ...
> > Ending with '{}' in tags struct?
>
> Of course, thanks for catching that!
>

Thanks, and don't forget to fix in rest patches too.


>
> I will fix these before applying, if the patchset is acked otherwise.
>

I have finished all the patches' reviews. Nice patchset!
LGTM.

--=20
Regards,
Li Wang

--0000000000005ca30c05a14449bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Cyril,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Mar 19, 2020 at 10:04 PM Cyril Hrubis=
 &lt;<a href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail=
_default" style=3D"font-size:small">...</span><br>
&gt; Ending with &#39;{}&#39; in tags struct?<br>
<br>
Of course, thanks for catching that!<br></blockquote><div><br></div><div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Thanks, and don&#39;t =
forget to fix in rest patches too.</div></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
I will fix these before applying, if the patchset is acked otherwise.<br></=
blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">I have finished all the patches&#39; reviews.=C2=A0Nice patchset!</di=
v><div class=3D"gmail_default" style=3D"font-size:small">LGTM.</div></div><=
div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D=
"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000005ca30c05a14449bd--


--===============0710743508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0710743508==--

