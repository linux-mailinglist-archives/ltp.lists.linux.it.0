Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8084317B697
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 07:11:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D21E3C63B6
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 07:11:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7455E3C1AFA
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 07:11:20 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id B6F836013C6
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 07:11:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583475078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YWoQlrFXuCTuehEV0wT5EVY0Ot1u8OEBkznlv0+qk5I=;
 b=Y5EomvzyRu8uELTVxwWZtGB61PG4TF+zf2Ev3fea3PyJjlXk5nuAttuhipjuiDQCnBkm6W
 E1PbiYmKcc5kNZ3bySdZpVeX+VAMgm/9sbNZWep7vNr8hKBRoLCOEXBsgYIm6EJqkKtxmU
 rqo1CdHyiFIth334kE4gMPw8/y/eRJk=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-XO2qVSc_OtuqNezEBLcwrQ-1; Fri, 06 Mar 2020 01:11:15 -0500
X-MC-Unique: XO2qVSc_OtuqNezEBLcwrQ-1
Received: by mail-oi1-f199.google.com with SMTP id r125so879913oie.23
 for <ltp@lists.linux.it>; Thu, 05 Mar 2020 22:11:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OlJkPfY4yb9SKXtCN7UfMxVsSjPvX7GlJxQbp2xklCM=;
 b=S+ti3hnXMfpCovQuPk3MiyoVcn3sMu3ZMBeCYjQQcrZM3cDrCiIxapLbiuVuLHpDKW
 FXfajEuE9JTy75f1zwQ/vgSsQitnRLaPHOpxUK8gZSgshyZ2FAT1kzhec/eZUQSp25CL
 Sp53ow5jqofSBDH9mfNTZyWVqvvBNLPjzvFNn/9O/Eew1QaKUN4STtrX6HSsJ2ysEF8F
 5egeVvJRmKEtrZM05IsJhwWYGGN0SNLb/C/rHcrQxWzldqBUTr3nx//a4rwrqWS4rfgc
 DlW4D77Z/NWNOPnBF/98Y/Wg2ePw+oProghTyTSgfcEFc83HQYti6pNT51DSPFNkfU+q
 /FFg==
X-Gm-Message-State: ANhLgQ3sNShJRsmLi51HRFzZFujWCGd+S/l4Y5mECGy+ZX0ywhcLi8bf
 8dZgJ6ko0Jkk3xLV44hpEJos3GqE5ZaoeGhfhygkCUumEadKZdQh7EqyghBAN+qYvk90mqX7uup
 xeBbjGqdenYV+SwUuteYNY1un/9k=
X-Received: by 2002:a9d:7a81:: with SMTP id l1mr1241615otn.26.1583475074717;
 Thu, 05 Mar 2020 22:11:14 -0800 (PST)
X-Google-Smtp-Source: ADFU+vscJCR727p/MUr7VPvssAlfJuLJ7I0R82SZOVdnMmManzAfkNfmFwPfX0Q3/bF0+E/XPw+ooWS4/OnOMRb6DZU=
X-Received: by 2002:a9d:7a81:: with SMTP id l1mr1241602otn.26.1583475074442;
 Thu, 05 Mar 2020 22:11:14 -0800 (PST)
MIME-Version: 1.0
References: <1583402023-22461-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200305172142.GA24302@dell5510>
In-Reply-To: <20200305172142.GA24302@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Fri, 6 Mar 2020 14:11:03 +0800
Message-ID: <CAEemH2f+tOCEm=6k9p+xZNAKgKcCu95ZdDdyy1RQqtqRYD+zOA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] hugeshmctl01: Revert "hugeshmctl: Use loop from
 the API"
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
Content-Type: multipart/mixed; boundary="===============0817840541=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0817840541==
Content-Type: multipart/alternative; boundary="00000000000052b99605a0298578"

--00000000000052b99605a0298578
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2020 at 1:21 AM Petr Vorel <pvorel@suse.cz> wrote:

> ..
> I'd personally prefer to keep .tcnt =3D ARRAY_SIZE(tcases),
>

+1 Me too. I don't think we should revert the patch. Just fix the problem
and do refactor or improvement will make the code more readable.

--=20
Regards,
Li Wang

--00000000000052b99605a0298578
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Mar 6, 2020 at 1:21 AM Petr Vorel &lt;<a hr=
ef=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_default" st=
yle=3D"font-size:small">..</span><br>
I&#39;d personally prefer to keep .tcnt =3D ARRAY_SIZE(tcases),<br></blockq=
uote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
+1 Me too. I don&#39;t think we should revert the patch. Just fix the probl=
em and do refactor or improvement=C2=A0will make the code more readable.</d=
iv></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><=
div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></=
div>

--00000000000052b99605a0298578--


--===============0817840541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0817840541==--

