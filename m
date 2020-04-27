Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E76251B96BF
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 07:46:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8FAEC3C5FB8
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 07:46:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 92D6B3C2858
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 07:46:26 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 6A9541A00A3D
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 07:46:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587966383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D4AaIFK9+g6ITCkjG+Xgli8fzzQ//cnbtKuZA0MzEI8=;
 b=OLzWSVv9UvKkZGSW6AD7dDzf2zCOBzH36Or+BHvRoL2ahI/NO2xFFo5j2mZh9bQ4yj6Gf/
 gS1zZiisbCXaUiewa6l7IInnruSxBym9rtQz2VyqrdlhVQNftbp9uxqvaHBH3Gc8vrtv4z
 2uIReaxv9h1/IUSt4Cv6xBJT+zqwYYo=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-0cWkYBW1Py63dWGltpjVXg-1; Mon, 27 Apr 2020 01:46:20 -0400
X-MC-Unique: 0cWkYBW1Py63dWGltpjVXg-1
Received: by mail-lj1-f200.google.com with SMTP id p7so2973960ljg.15
 for <ltp@lists.linux.it>; Sun, 26 Apr 2020 22:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qaQZX6SRXUAPqeEAwTBmvqwmdIm+Q9FMbrZLN79NmZE=;
 b=b7qEAlVl7eFc7zfsiQtkNinYxWEI4iLlrpRv5FjXklVM/tGtKWNUIspQrp7mk/h1ue
 QTq++KwoHH+uvQJkK7An8GHwuLQw2xUzJ1sixpidv6ExYM7W3UQwoHa+A0haTkz5vQ/E
 9UjvSH3S1F4VN4k9UAZbt+Sica3sZunEu2Ob2Z9vKHa8CwMVt7yT/oPlgEUKvqKX7B1r
 LlmE/HliPDUhIVZRJKdUx25FUJTvrxKKWWoPI8NYmuJixz9cGeioPDDp4WJvwz1ukTog
 k0ns5qh+Pitio01UhL4e+xIyQ4Phl5bDa1VNeOqNncm4wPqwqXaxuaEYmN8MlyvBuJcz
 mTkg==
X-Gm-Message-State: AGi0Pubi/lg355FqORRKFbThpfdV4hPr9ZKB6iPnnwUL5k4obOLMgTy+
 OrSVr1cL2k8YPCOVSL4WNFDMpw/KK5P6qXNMC27aB56TXcepfpFl20xpIclRpiDqlZvUzd40WEk
 n+zc/z+Kam1q1EYHNBk8jq8kExRk=
X-Received: by 2002:a05:6512:1c5:: with SMTP id
 f5mr14188176lfp.138.1587966379076; 
 Sun, 26 Apr 2020 22:46:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypK3EwpxkbPGLs/1WCMW80gNhmHd6TleVX5M2EwE5QRwlOiQtUTN2txcRiGKrauWhsa3rNp6QQaWP3w+3hEZR+g=
X-Received: by 2002:a05:6512:1c5:: with SMTP id
 f5mr14188167lfp.138.1587966378866; 
 Sun, 26 Apr 2020 22:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200427053813.23112-1-pvorel@suse.cz>
In-Reply-To: <20200427053813.23112-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Mon, 27 Apr 2020 13:46:07 +0800
Message-ID: <CAEemH2dXChqqU9yQ0NRqBjJoTWhu+1ugnVnqCVUM=ZnTBSJR6w@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1281879136=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1281879136==
Content-Type: multipart/alternative; boundary="000000000000ed954b05a43f3b35"

--000000000000ed954b05a43f3b35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For patchset:
    Reviewed-by: Li Wang <liwang@redhat.com>

--=20
Regards,
Li Wang

--000000000000ed954b05a43f3b35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">For patchset:=C2=A0</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">=C2=A0 =C2=A0 Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@re=
dhat.com">liwang@redhat.com</a>&gt;</div></div><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr"><br></div></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li=
 Wang<br></div></div></div></div>

--000000000000ed954b05a43f3b35--


--===============1281879136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1281879136==--

