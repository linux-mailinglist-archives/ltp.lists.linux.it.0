Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1CA18194C
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 14:11:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE9083C5F1E
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 14:11:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 5B5F93C5F1E
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 14:11:18 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 4CA74600F09
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 14:11:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583932274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t2wmeMftCLhbJ61ezquJlS5K9cKub+Wzsx3eIg2PMd4=;
 b=P2aEsHheR/OiDhqV8Y1SSecKDT3XH0zwQOCdlLP3/xSZs7N4xz7gWZ4XARlYfuXhj8lWGD
 4tAdjyrPIrfpwsft3UQzK2Fa5fDlYqy8dCDe8nqb9CzvkOaQWUTY4oi3brwRwbzQYX93XF
 RVEYyE3OWt3d58HQWN83/4fwP35q2vs=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-q-MfthgsNY6s7OSBm3-tPQ-1; Wed, 11 Mar 2020 09:11:12 -0400
X-MC-Unique: q-MfthgsNY6s7OSBm3-tPQ-1
Received: by mail-ot1-f72.google.com with SMTP id t16so1199358otc.3
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 06:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+M1gFvk8RofkqC69Okj4GQEjlx9ktrQ+QTsc2jk7DrU=;
 b=Ne3S2bIGaJ8uezU3Mt6bvjjlA387/gNl6Sk82QJ/mpCY/Z28jbFCNgKpo9sGVEtEBB
 b5MmB3DUca/pmg+X2BopETpLT1skENi4Ue14TUrA9JttH/aZyRtzScVuQAwejkofI1ST
 oVa6FckjvfURElxvZpYdytwhzflDeQ2nQBJUO6SXGcLWWkwmiBC9FwFS/w70gJTJYUGQ
 KcRgyc1c58gPovrIyOpJdSFVAcilvbJV7FazWOTs9+wGOGCKE6WQ8kLsrjl5DyGUhwMJ
 jVBRaYyBiECrMaSpO0//ucQxtXNaHJGwvF7l+Tr0QZ5bFCwvjdY11eMK60PM1hbriOwK
 FnYg==
X-Gm-Message-State: ANhLgQ0PXeoTOoXea1R2r4E3gHcveNQ4E0oQ1L8dlu/nDQNbvsEMP1Vc
 nVZ6Atqwkvwc9aAxw6C+8CJpTbL33r46b4pX+Qcne3hVEypQmPaMyPrUEVf2inFBxsS3mgX46g8
 Fxya+v623QqaYBKiX3JoYO8NgEho=
X-Received: by 2002:a05:6808:5d4:: with SMTP id
 d20mr1771693oij.138.1583932271865; 
 Wed, 11 Mar 2020 06:11:11 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtTMgQhibk4Cusqi/PkzeBR9n5E2coq7Nku4tgwyWvmFueKWdNOSWPhQJmsX4Kz/m4bMf2ooFZy5Sce52KTL7I=
X-Received: by 2002:a05:6808:5d4:: with SMTP id
 d20mr1771670oij.138.1583932271587; 
 Wed, 11 Mar 2020 06:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <2071e47d7d8cb3e7f8bc6558e86999eddd9c3762.1582779464.git.viresh.kumar@linaro.org>
 <20200306124546.GA3375@rei.lan>
 <CAEemH2drJyp5kU21jS7Ej+-q6hTysb5oDNM+3KiWsmPoLAbMQA@mail.gmail.com>
 <20200311102620.GB3802@rei.lan>
 <CAEemH2fqKvEU8+FBvTunv8VCOzXf0SMCHe6Ky9neFKQX51cZ7g@mail.gmail.com>
In-Reply-To: <CAEemH2fqKvEU8+FBvTunv8VCOzXf0SMCHe6Ky9neFKQX51cZ7g@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 11 Mar 2020 21:11:00 +0800
Message-ID: <CAEemH2fqcnETtW47kB5BNGyf8_F11zD8Y_RpDaNOhSmEGHJYtA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 01/10] tst_device: Add tst_is_mounted() helper
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1364672231=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1364672231==
Content-Type: multipart/alternative; boundary="0000000000006582bb05a093f855"

--0000000000006582bb05a093f855
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 8:45 PM Li Wang <liwang@redhat.com> wrote:

> ...
>>
>> int tst_is_mntpoint_at_tmpdir(const char *path);
>>
>
> Hmm, the return value shouldn't the full right path, why return int here?
> or I misunderstand here?
>
>
s/shouldn't/should

--=20
Regards,
Li Wang

--0000000000006582bb05a093f855
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Mar 11, 2020 at 8:45 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">.<span c=
lass=3D"gmail_default" style=3D"font-size:small">..</span><br>
<br>
int tst_is_mntpoint_at_tmpdir(const char *path);<br></blockquote><div><br><=
/div><div><div style=3D"font-size:small">Hmm, the return=C2=A0value shouldn=
&#39;t the full right path, why return int here? or I misunderstand here?</=
div></div></div><div dir=3D"ltr"><div dir=3D"ltr"><div><br></div></div></di=
v></div></blockquote><div><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">s/shouldn&#39;t/should</div></div><div><br></div>-- <br><di=
v dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br><=
/div><div>Li Wang<br></div></div></div></div>

--0000000000006582bb05a093f855--


--===============1364672231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1364672231==--

