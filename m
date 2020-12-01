Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 935D02CA58D
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 15:27:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D6983C6382
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 15:27:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B43453C2C11
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 15:27:47 +0100 (CET)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 562511401110
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 15:27:47 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id f9so4509501ejw.4
 for <ltp@lists.linux.it>; Tue, 01 Dec 2020 06:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kIYzZWKG4SGc4Ak51vGBDFohtQphUdl86LSAJVogNck=;
 b=lZwyH3N570kYvG7hGDB4ibYgzDIT/oTBko328ecV/jhrfAztPFU9vqjSmeK+uMhCjC
 PfEa45JFPSpNHBbU4XuxQ0OLL8ZHqdaS8y84phj1V4kVQay7h6d9B7/9dGaY9qsoQjXY
 BBaX9JBrLUBaD4wOMzP5+wFuSEpF3JrU3NNdUYcgDMEFhNkvNg1K56saRQi24Jj8Ljkl
 KKmx+tP9qpaLVB6nYAtFC6hEveGXN47nrpApHcTWq3PcMKajwiiMhzS/YchvC7mduyh6
 +6KR3Tx6TPYzzMOTAKir7wv97r7VOSr0G8qD3rwD/ljAIxEgaPfX+puKheUzmXvFTlwC
 iGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kIYzZWKG4SGc4Ak51vGBDFohtQphUdl86LSAJVogNck=;
 b=QJuUpskW+VBF4dQyU5cjzg0C6soLbhun3F4BWIjp+qGsfP/SVRe72O9sdzgj8MN8Bi
 5KcVW6a3deA5yCaRIH1OcPMG0p6IAeBd6GFsGIG55H4kUcvk01Vrfda2Z1r1zR7Bpg9V
 SVXmAoWBO0v3SyCmDfjhdk4n5Hk0jRG/HiJs/Z8AKnWgsFg4xxxjgL4aWCcHG98/n8Lg
 t7ThaVBvbPdxOAYtb+95Ipk3LUoO5qu8AlD5FytGft0BG51xIW7Ydl4Wqjul3ObC+yy/
 +lh7trwENblpLFy3lL+rvZ5mru8m7vp64mPTWN5COoWOw+p7hux6xfxI9oP0uho01dVs
 f4mA==
X-Gm-Message-State: AOAM533yXNPOIKrZjHOEmu4KmfAQGzam+a7mLMUJU8eQqurlM/+G0l7e
 tuCs1Cc2/MJMKeSmaSYEsqFRRFscEPXM9HCfsNE=
X-Google-Smtp-Source: ABdhPJw/wa6C8zHpqZJmGVBauZfUJtvj+E2Y2tYdQi1Nbokd5sieDO7uhE8qBSKOsoO0fdNj7WwaS2fDBl+Hc1PEBp4=
X-Received: by 2002:a17:906:768a:: with SMTP id
 o10mr3321197ejm.212.1606832866935; 
 Tue, 01 Dec 2020 06:27:46 -0800 (PST)
MIME-Version: 1.0
References: <CAPeFc=TgA6ABrvDthLBoruqfmopx5nhqYYDAv7h0B+CjaFY-CA@mail.gmail.com>
 <20201201125542.GB27684@yuki.lan>
In-Reply-To: <20201201125542.GB27684@yuki.lan>
From: Peter Gubka <pgubka@gmail.com>
Date: Tue, 1 Dec 2020 15:27:35 +0100
Message-ID: <CAPeFc=Rvpq90yQKaGfg9gtFhyJNui3CvjY4ewOy6DS2na9RXNQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] linux kernel versions vs. ltp release tags
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
Cc: ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============0945635168=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0945635168==
Content-Type: multipart/alternative; boundary="0000000000003f499f05b567ee47"

--0000000000003f499f05b567ee47
Content-Type: text/plain; charset="UTF-8"

Hi.

thanks for the answer. In my particular case there is a test
https://github.com/linux-test-project/ltp/blob/b59c662104c8989704953d1e5dc8c3c6412daa2a/testcases/kernel/syscalls/sendto/sendto03.c
which causes kernel panic because it tests something which is not present
in my kernel.
Are there any recommendations on what to do in such a case?

Regards,
Peter Gubka

On Tue, Dec 1, 2020 at 1:54 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > I would like to test linux with kernel version 5.4.47.
> > Is there any relation between ltp releases and kernel versions?
>
> Short answer: No.
>
> More detailed answer:
>
> LTP should be backwards compatible for about 10 years back for both
> kernel and userspace (libc, gcc, etc.). I.e. latest should run fine on
> 10 years old distribution and anything newer. Latest LTP also contains
> more testcases and fixes so in 99% of the cases it makes senes to use
> either latest stable release or a git HEAD.
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>

--0000000000003f499f05b567ee47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi.</div><div><br></div><div>thanks =
for the answer. In my particular case there is a test</div><div><a href=3D"=
https://github.com/linux-test-project/ltp/blob/b59c662104c8989704953d1e5dc8=
c3c6412daa2a/testcases/kernel/syscalls/sendto/sendto03.c">https://github.co=
m/linux-test-project/ltp/blob/b59c662104c8989704953d1e5dc8c3c6412daa2a/test=
cases/kernel/syscalls/sendto/sendto03.c</a></div><div>which causes kernel p=
anic because it tests something which is not present in my kernel.</div><di=
v>Are there any recommendations on what to do in such a case?</div><div><br=
></div><div>Regards,<br></div><div>Peter Gubka</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 1, 2020 at 1:54 P=
M Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br=
>
&gt; I would like to test linux with kernel version 5.4.47.<br>
&gt; Is there any relation between ltp releases and kernel versions?<br>
<br>
Short answer: No.<br>
<br>
More detailed answer:<br>
<br>
LTP should be backwards compatible for about 10 years back for both<br>
kernel and userspace (libc, gcc, etc.). I.e. latest should run fine on<br>
10 years old distribution and anything newer. Latest LTP also contains<br>
more testcases and fixes so in 99% of the cases it makes senes to use<br>
either latest stable release or a git HEAD.<br>
<br>
-- <br>
Cyril Hrubis<br>
<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a><br=
>
</blockquote></div></div></div>

--0000000000003f499f05b567ee47--

--===============0945635168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0945635168==--
