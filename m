Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EB6BC22B
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Sep 2019 09:01:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 631D53C207E
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Sep 2019 09:01:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B81CB3C0032
 for <ltp@lists.linux.it>; Tue, 24 Sep 2019 09:01:32 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id D2E221401B75
 for <ltp@lists.linux.it>; Tue, 24 Sep 2019 09:01:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1569308490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c9rWsT821tFQXJgCvd7UzUD+x9bQ0ASejlxZT4QA4Ak=;
 b=dUINb/WcDCNZdutAYokwA11gdOxsqGSx3AuU6DyKnQdT58L3ftSv2002665/knJExkqXOV
 dgMcvnC9AlEVQ1zPqOtUdHm7onKZ+ddQmM55BClwZg3yEyJgoUSJ1MZ85U4Op8Xv/kCO9P
 aBS6Szww9eme8+CDeE1rHK9f6IixJv8=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-FUBjQxzYMaKD9e1F7J4udQ-1; Tue, 24 Sep 2019 03:01:26 -0400
Received: by mail-ot1-f71.google.com with SMTP id f6so629629oti.9
 for <ltp@lists.linux.it>; Tue, 24 Sep 2019 00:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mTmbwJOyiDDWO9t0xRRNlkChCXEaeaNJVsv6JO/gJkU=;
 b=dM4xygv2tYR/hA9UIeFY+bx+sAjQKDoyiJFRdKJV6yUcKMuw1PDEDGXz+kg7gEWvrl
 yObVb3YJxT1SF2LQjSdD9LpiSysr3kZasC9tH/LXh25Rj29VywDTClxC2VqxF8zKr0Z/
 rCajS525D5pS/Iyi2PCjb4MU1l7ZnRclRs04+EPgQQDo3MTJWxIvptYSJUcepojwODV1
 1kbsze2vnwY/nml5DhpX9t3YM3hAfPrwM/37mzeon/4lH1TV+scEYf/rBAizQxnMbgzE
 2/keb4a6UrvFpJMTRjSw6dwivQQy0aZkU/6q/PFoDqHtHCBmN6Tke7It5xT19SdGaFq1
 Y09w==
X-Gm-Message-State: APjAAAWb7s9h1XcbEiEtC78KBc41QLGZhVhoPrXTPxcQzh9hOWEal/H7
 vMb3QTj0nN9wu4++C+KLcCIZ5n5keVOJyeKEcRnMhY8jwyKLgcCDWdfbYnumlIvOexz2fKfZ4Hd
 a/y4zcZDcGp6/Nn9EoMQRYbBcTmo=
X-Received: by 2002:a9d:7841:: with SMTP id c1mr720163otm.264.1569308485971;
 Tue, 24 Sep 2019 00:01:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMWP/BpW/cSM7QhT2IxPzp7fkBGd4qwBkmfuStGIPmVTGNhja6fO0XNu7684zKqQCCvlSv3S1ZM6UIvZcjgO4=
X-Received: by 2002:a9d:7841:: with SMTP id c1mr720146otm.264.1569308485676;
 Tue, 24 Sep 2019 00:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190919135043.14359-1-pvorel@suse.cz>
 <1568987303.3024.7.camel@suse.de>
In-Reply-To: <1568987303.3024.7.camel@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Tue, 24 Sep 2019 15:01:14 +0800
Message-ID: <CAEemH2caTOuR_oa_h727bz2pb4oo_W223gJNK6YDkdC4m3vpJA@mail.gmail.com>
To: cfamullaconrad@suse.com
X-MC-Unique: FUBjQxzYMaKD9e1F7J4udQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 0/3] shell: Introduce TST_TIMEOUT variable
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
Content-Type: multipart/mixed; boundary="===============2060932248=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2060932248==
Content-Type: multipart/alternative; boundary="000000000000d509530593471ad7"

--000000000000d509530593471ad7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Clemens Famulla-Conrad <cfamullaconrad@suse.de> wrote:

> ...
> > * add 2 tests for TST_TIMEOUT (it'd be more useful to test
> >   LTP_TIMEOUT_MUL, but I'd wait for Christian's shell test
> >   patch [1] being merged)
>
> lets place them in `lib/newlib_tests/shell/testcases` as Christian is
> doing and add the `# output: ` tag so it might work then.
>

Agree on this. ACK.

--=20
Regards,
Li Wang

--000000000000d509530593471ad7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">Clemens Famulla-Conrad &lt;<a href=3D"mailto:cfamul=
laconrad@suse.de">cfamullaconrad@suse.de</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_default" style=
=3D"font-size:small">...</span><br>
&gt; * add 2 tests for TST_TIMEOUT (it&#39;d be more useful to test<br>
&gt;=C2=A0 =C2=A0LTP_TIMEOUT_MUL, but I&#39;d wait for Christian&#39;s shel=
l test<br>
&gt;=C2=A0 =C2=A0patch [1] being merged)<br>
<br>
lets place them in `lib/newlib_tests/shell/testcases` as Christian is<br>
doing and add the `# output: ` tag so it might work then.<br></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">A=
gree on this. ACK.</div></div></div><div><br></div>-- <br><div dir=3D"ltr" =
class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li W=
ang<br></div></div></div></div>

--000000000000d509530593471ad7--


--===============2060932248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2060932248==--

