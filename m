Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F93B1FBB
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 15:31:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F22C3C207B
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 15:31:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 9DB0E3C1483
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 06:16:30 +0200 (CEST)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E2442200D0F
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 06:16:29 +0200 (CEST)
Received: by mail-wm1-x341.google.com with SMTP id r17so879889wme.0
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 21:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=kNop8pY6ZFy6ZLLITjkEIuwGSrP+qQ1YfD+IhYHQ0tU=;
 b=Ur/a/cqXC+8Znf570QGPaYpCldi/ZOAss8/kwZt2ZwzAB7ST2M0f2yEwp5gG2KivuG
 vRbmZ/GqiLcT2P1lMIHhTr1KaPuEPs2mjOAjNAJBKW7INDQKM0kYUALb1T27uFqbLAXx
 AFdCHksbxVyZTxdt9qtJvlSO5p0uytJC/QpNCwvXOSSvn2hHH+gB7ALUbDx5SFrHjESa
 i0y9bCq9ak8RUnR/xMidaUqQa5geSxu6Cm4e4RhVspr4hGbFDLaRfyw3yPOEKI1TF+Pd
 XrBEOuiZGaKnVRYffDJk7e81ragnVdZsdhgVTjCiqfK5tGlIp3UrjP1FxFcVv+KDoanB
 W3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kNop8pY6ZFy6ZLLITjkEIuwGSrP+qQ1YfD+IhYHQ0tU=;
 b=QGKOieScSeY93KX4JoMbtgtGiYda+adwoZKjrdOELvLMj6Qs8QDUjbmkWaDdVQlyKJ
 8ypKe53+P1ypuyrmNW9ZmH5GQ9b0UhPpDiNJ5lR4U2TMCymPwM7oR50+mJGTvvyl3Ybz
 mE3MjA6hDH9G2qdZd7pNn2bNn4L5UUgmXDZcALqmv4g+9NPgLCrN2H4E3LlviylusfZ/
 nS3qp1abRjeOOe0zPRaxDrTgHcZhlm7ypjDCyhrYk9z8FvbiV6TsiWGjVZXx4SZYMnPd
 lXYGC8JsO3YGZZxUYurMlbkeTxsfxYqv3yjrajpmCR3HHzLrwNcaSYdFLcaBlg5fTu5W
 7eZQ==
X-Gm-Message-State: APjAAAXqNTJHOX7JuZWMf6WAeXLQycyTbAq62Q/LIpjvEPlXSteYj3qu
 Ns/LFCgl4vIwpbXBV+ztkEJ0KguArWMcbNmFWnE=
X-Google-Smtp-Source: APXvYqyG00atlDFDvnvrXSDwHM6bp/dr2t3XHy8CQs0pyXe3lCaP4SNaO1f5Z7n/oupyfCHDdcjJv7MT5SjqQKSUn6Y=
X-Received: by 2002:a7b:c401:: with SMTP id k1mr1459520wmi.62.1568348189525;
 Thu, 12 Sep 2019 21:16:29 -0700 (PDT)
MIME-Version: 1.0
From: Patricia Mikando <patmika28@gmail.com>
Date: Fri, 13 Sep 2019 04:16:16 +0000
Message-ID: <CAMFDpzUZjFfoq81at_ob35prOzDsSTcYuzBQTrcj4BLS2UiFVw@mail.gmail.com>
To: undisclosed-recipients:;
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS,T_KAM_HTML_FONT_INVALID autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 13 Sep 2019 15:31:01 +0200
Subject: [LTP] wish you all the best
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
Content-Type: multipart/mixed; boundary="===============0614667618=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0614667618==
Content-Type: multipart/alternative; boundary="000000000000b88e2e059267841f"

--000000000000b88e2e059267841f
Content-Type: text/plain; charset="UTF-8"

I hope this email finds you.
I want to know if you received the last message I sent you?
I really want to hear from you.
wish you all the best.
Patricia Mikando......
I look forward to your response.

--000000000000b88e2e059267841f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"margin:0px;padding:0px;border:0px;font-varia=
nt-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;fon=
t-size:16px;line-height:inherit;font-family:Calibri,Helvetica,sans-serif;ve=
rtical-align:baseline;color:rgb(0,0,0)"><span style=3D"margin:0px;padding:0=
px;border:0px;font:inherit;vertical-align:baseline;color:inherit"><font fac=
e=3D"comic sans ms, sans-serif">I hope this email finds you.<br></font></sp=
an></div><div style=3D"margin:0px;padding:0px;border:0px;font-variant-numer=
ic:inherit;font-variant-east-asian:inherit;font-stretch:inherit;font-size:1=
6px;line-height:inherit;font-family:Calibri,Helvetica,sans-serif;vertical-a=
lign:baseline;color:rgb(0,0,0)"><font face=3D"comic sans ms, sans-serif"><s=
pan style=3D"margin:0px;padding:0px;border:0px;font:inherit;vertical-align:=
baseline;color:inherit"></span></font></div><div style=3D"margin:0px;paddin=
g:0px;border:0px;font-variant-numeric:inherit;font-variant-east-asian:inher=
it;font-stretch:inherit;font-size:16px;line-height:inherit;font-family:Cali=
bri,Helvetica,sans-serif;vertical-align:baseline;color:rgb(0,0,0)"><div sty=
le=3D"margin:0px;padding:0px;border:0px;font:inherit;vertical-align:baselin=
e;color:inherit"><font face=3D"comic sans ms, sans-serif">I want to know if=
 you received the last message I sent you?<br></font></div><div style=3D"ma=
rgin:0px;padding:0px;border:0px;font:inherit;vertical-align:baseline;color:=
inherit"><font face=3D"comic sans ms, sans-serif">I really want to hear fro=
m you.<br></font></div><div style=3D"margin:0px;padding:0px;border:0px;font=
:inherit;vertical-align:baseline;color:inherit"><font face=3D"comic sans ms=
, sans-serif">wish you all the best.</font></div></div><font face=3D"comic =
sans ms, sans-serif" style=3D"color:rgb(0,0,0);font-size:16px">Patricia Mik=
ando......<br>I look forward to your response.=C2=A0 =C2=A0=C2=A0</font>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<br></div>

--000000000000b88e2e059267841f--

--===============0614667618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0614667618==--
