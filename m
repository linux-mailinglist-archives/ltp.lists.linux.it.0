Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DB5E12F2
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 09:18:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 539E83C2290
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 09:18:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4EAFB3C225A
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 09:18:27 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 80AA8140148D
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 09:18:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571815104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wkTFBsp0vEZtT54it96ko6OE5/0kbZ4oCkcUAMgiyTk=;
 b=hTPQIW2oY+RP8Yr+Y37l4kuFpVjQgK0tDNja2VLBF8Ck5KBl8vpMkG0VPWmKTdgB9fZWzB
 fdiEIjwnNvtXRZhYulvnS8y6uqs1nS55qARx7qrcOUgJBj71LWoUOn1O6s6+tK2zrY6Wkm
 jPywVxTK5roSXB62iiMGelypAuTkxKE=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-X3GofjDFNS-2sGB_FRPECQ-1; Wed, 23 Oct 2019 03:18:21 -0400
Received: by mail-ot1-f69.google.com with SMTP id i8so10341517otc.19
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 00:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9JGw2wHizSqgQixob6q6d/0vwFFkQSHbcedinMLYqNE=;
 b=hTpTZ0++s76k8/Z3mJkhSTdmvUd9mp4zmXW1CdA62mFSngWFpzYggvghQfgAjTjUVE
 FfLLPwM8lCOgxpMy1iAAVucLMX2o0xVgPcbz5cdNKZlkg/ytC9aK15jqWrlDKO2ap7HP
 Zrey9gknOZ96163dtGJwsjkxUz6fWHIaIapE+TWOmR97xf7mMpCVtfaopNjwcs88u97o
 7yDS+jJZ3eXhXsV3Pkx1JmPvSDbCISCNyuluZuG6iE/Q0sKNedLzlj3POzlQw2uBD1Gn
 flxNTNbhRZrV90S78iejSIqDFB684sfuvuafeDcfIg5Ooq3COqzX+KKRDGZzXfqFcKZ+
 EEag==
X-Gm-Message-State: APjAAAXTdWs7gvsNZDjthL62RW+zCCc78oDeeVcuVx8XjJ9ispCbtUNH
 GJAX7lKgzL8DJjDdTIUp3KA1HsjC43n28ZZgrggSNMrRZ1KT1K1wdbMs6nYklJotBYxMBiRdUOW
 Tz/VvjPfbOOKnI74t+6DUlnp+D60=
X-Received: by 2002:a05:6808:b15:: with SMTP id
 s21mr5647496oij.138.1571815100459; 
 Wed, 23 Oct 2019 00:18:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/CM0Rau1HAp3QjRyU0NFz449Xp1tYvADGhYvBkj1im1VKZumdEojO5TAFkrWOrjNpo9ukWoakAwqID89OdYA=
X-Received: by 2002:a05:6808:b15:: with SMTP id
 s21mr5647479oij.138.1571815100017; 
 Wed, 23 Oct 2019 00:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191022140757.29713-1-chrubis@suse.cz>
 <20191022140757.29713-3-chrubis@suse.cz>
In-Reply-To: <20191022140757.29713-3-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 23 Oct 2019 15:18:08 +0800
Message-ID: <CAEemH2egMr_zqWxbuLAAg8etCgcaBX3Wd_tr3egB1_jA7nW72A@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: X3GofjDFNS-2sGB_FRPECQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] testcases/kernel: Add linux git and CVE
 tags
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
Content-Type: multipart/mixed; boundary="===============1716200478=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1716200478==
Content-Type: multipart/alternative; boundary="000000000000b087ef05958eb831"

--000000000000b087ef05958eb831
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2019 at 10:08 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Not all tests are annotated at the moment but the majority has been
> finished for now.
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
Reviewed-by: Li Wang <liwang@redhat.com>

--=20
Regards,
Li Wang

--000000000000b087ef05958eb831
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Oct 22, 2019 at 10:08 PM Cyril Hrubis &lt;<=
a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Not all =
tests are annotated at the moment but the majority has been<br>
finished for now.<br>
<br>
Signed-off-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=
=3D"_blank">chrubis@suse.cz</a>&gt;<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br></blockquote><div><span class=3D"gmail_defau=
lt" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:li=
wang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&gt;</span></div><d=
iv><span class=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</d=
iv></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><d=
iv>Li Wang<br></div></div></div></div>

--000000000000b087ef05958eb831--


--===============1716200478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1716200478==--

