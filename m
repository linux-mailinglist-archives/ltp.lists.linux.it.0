Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C681A1C678C
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 07:44:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C2AE3C2618
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 07:44:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id EAC1B3C260F
 for <ltp@lists.linux.it>; Wed,  6 May 2020 07:44:04 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id C198A1000539
 for <ltp@lists.linux.it>; Wed,  6 May 2020 07:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588743841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R4GuGu1telCNVvRTWgOquNaf4oui/qekVPs5f1PlvoQ=;
 b=UtxOdIxVF55AVm046r8JYNOC8zDEUcEMbYo2jGsMfD/Lf9S+MxwcRcNERQB7GV/VL4bJsa
 zCT9NI6vH2jSXGAzywCFEpPXoqmAlK4aWTPXEiBwd/5kR/3SkG92G8Mayj9roKiFf/sqFG
 50Jr1T/ELdzLOMXyOwBgYOvLjtGN7Yg=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-X-W-QW2EPxKdykD8_u__6w-1; Wed, 06 May 2020 01:43:32 -0400
X-MC-Unique: X-W-QW2EPxKdykD8_u__6w-1
Received: by mail-lf1-f72.google.com with SMTP id q11so387549lfe.21
 for <ltp@lists.linux.it>; Tue, 05 May 2020 22:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gy923jblwFwvrIXq52R2ovwsHiZ1EmDAp5feZr9dG1I=;
 b=pNAQ7sgAKjAOqksYvmTcc9j7Kdi/XYbvl/3BDifErOHFX252+JqWqQYNWkTE7j6m7g
 Mm1XdHy3DMDafnm5Xe8v8/i0ge9ByyqcRDtoE0D2SR10eQw+jMYDqOAf8uJ/BMA44Kk6
 uXpw26L4cmsfYVrtmLZo+8uurzpocrrWRFDoXdllIzf3RlGFdgOm/X0E5pBubYtu8Kkn
 RpMYcIyeAcjlVZGJ8gB0nl/XiykLbs+KuE3g50gyjnWdIFa5yGIrT1VOT+GtJf0sY6E3
 HyX7Nb7fGUCleLpticXhKbkYBAEsE14/pTNoqn/NgVzDPP1CcNGo2wpX1NOkkA6pVX3b
 xlkA==
X-Gm-Message-State: AGi0PuZFOe1WBanYjTdVd4piCxwUytLpqFdQ15QZt7sYnYI9M786ewfJ
 vVX4idxqD0NPOtkFre9uPgWTsskhh4Kk983pHk3AGUhjyNwot8PrPMyZov6wO5TmxTzEpkCKMYf
 oGuFnAqrME0xTReLVq9Wb+Femqo0=
X-Received: by 2002:ac2:464c:: with SMTP id s12mr3839316lfo.147.1588743810886; 
 Tue, 05 May 2020 22:43:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypLsPv7KvfY3bn4stGXXqX2Tj9POHuYuaH84JFUqfWaGY3Z3KYeQ6dnQIaMD0fpiYlmxKxni0cYlTqH+V0y+CY4=
X-Received: by 2002:ac2:464c:: with SMTP id s12mr3839308lfo.147.1588743810701; 
 Tue, 05 May 2020 22:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200427053813.23112-1-pvorel@suse.cz>
In-Reply-To: <20200427053813.23112-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 6 May 2020 13:43:19 +0800
Message-ID: <CAEemH2e6jUk8yAs759OZzoiKU4_k5KfYQd_GYF1tb3d9qdt+QQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] tst_test.sh: eval TST_RETRY_FN_EXP_BACKOFF
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
Content-Type: multipart/mixed; boundary="===============0031203529=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0031203529==
Content-Type: multipart/alternative; boundary="00000000000079ee9005a4f43e33"

--00000000000079ee9005a4f43e33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patchset pushed, thanks!

--=20
Regards,
Li Wang

--00000000000079ee9005a4f43e33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Patchset pushed, thanks!</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div></div>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></di=
v></div></div></div>

--00000000000079ee9005a4f43e33--


--===============0031203529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0031203529==--

