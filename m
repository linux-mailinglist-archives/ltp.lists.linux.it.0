Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 149093FC495
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:02:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 200793C2A8C
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:01:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 956383C2A05
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:01:56 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 70C301000A5D
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:01:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630400513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6ZUVmMK6005xTduTTbsSgd26NMk2PsTc6PLaGm+u2Yc=;
 b=N4myRY/A20vBwySVIF/d7EAvzVw01+EKtb7i/XfYyRfIGI5AyzGELwLrTOlmHEFLS32M1h
 wpRWMTNeEUeL4lnFE/AGu1DWV9/byuJA1+Mw5jw/KqCRbkC/Ehjx4+THgtR93vMFh2sgBQ
 AMlUjA0XNeVgF9RkOWJ0jVuQZzyvt30=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-fc4zqawkOlGT3BR3h0SLYQ-1; Tue, 31 Aug 2021 05:01:51 -0400
X-MC-Unique: fc4zqawkOlGT3BR3h0SLYQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 q13-20020a25820d000000b0059a84a55d89so17760011ybk.23
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 02:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ZUVmMK6005xTduTTbsSgd26NMk2PsTc6PLaGm+u2Yc=;
 b=bq35rQADzwiKTdQ31NtBqRYcyVT/poQNqTgF5er6IU7azMHeUKTChuamf2H5fYWGVa
 5G4KmZQb6NqReJcMP4e2MjDuYxkfp8C0Q+K0EsE1Hr7ArLIkqeZ/j4xnOHlEKu6M1og7
 V6BOlhLYBCNZx2oHWFeLcSSH5yoRmzbQ9lWFZjMp1e4f2RebcMxhYL2kZMjajJTshKnL
 5/lDM930Yd73SM8laUwo7QShxtceTfG2yaLKcSVbq+NkufpaOhGVhiQW+Re07uNsN5Q/
 Lf3QT0P1gFFXDD67R0opucM6EmvG/IY+c2WhVSeiTFzd/TgW6qNBUn6tyGYOEIG0HZn5
 mZog==
X-Gm-Message-State: AOAM533cdBbt0FYNlmUQJ2FjXIrN2fmTLV1qgMkukmswfijK43yYR37v
 Zdabkxm0jnoV6ZmmtiNkP4E+x1X1Qx+kz22azHxY9wUTi1izJkUsta3CFXezaUNWI7Gi/jNfbWK
 Xz+cMZlhxu4/cGZQdCaQClv85NQI=
X-Received: by 2002:a25:bdc5:: with SMTP id g5mr28838299ybk.403.1630400511168; 
 Tue, 31 Aug 2021 02:01:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnTtSdo81NBkBNjUVOK1YCp6d77fhpFdItnysQX+H1+DBF+gp10W87k915lM1ADYvMRsIUvjl1uoR278AFn0o=
X-Received: by 2002:a25:bdc5:: with SMTP id g5mr28838270ybk.403.1630400510956; 
 Tue, 31 Aug 2021 02:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210831014358.28459-1-zhanglianjie@uniontech.com>
In-Reply-To: <20210831014358.28459-1-zhanglianjie@uniontech.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 31 Aug 2021 17:01:32 +0800
Message-ID: <CAEemH2c1cwsxiqg7p+E0NvNg1Qw2j8+mYQYVqre0r1y_LiF9Pg@mail.gmail.com>
To: zhanglianjie <zhanglianjie@uniontech.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] tst_test_macros.h: Add TST_EXP_VAL macro
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
Content-Type: multipart/mixed; boundary="===============0092659999=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0092659999==
Content-Type: multipart/alternative; boundary="0000000000004c2c6d05cad733cd"

--0000000000004c2c6d05cad733cd
Content-Type: text/plain; charset="UTF-8"

Hi Lianjie, Cyril,

I have revised the order of the macros and pushed them.
(put them on the top of TST_EXP_PASS_* to make the whole more readable)

-- 
Regards,
Li Wang

--0000000000004c2c6d05cad733cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Lianjie, Cyril,</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">I have revised the order of the macros and pushed them.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">(put them on the top of TS=
T_EXP_PASS_* to make the whole more readable) </div></div><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr"><br></div></div>-- <br><div=
 dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></=
div><div>Li Wang<br></div></div></div></div>

--0000000000004c2c6d05cad733cd--


--===============0092659999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0092659999==--

