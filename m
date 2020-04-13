Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3BA1A61CF
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Apr 2020 05:48:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E33A23C2C0D
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Apr 2020 05:48:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0448E3C0428
 for <ltp@lists.linux.it>; Mon, 13 Apr 2020 05:48:12 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 428781401820
 for <ltp@lists.linux.it>; Mon, 13 Apr 2020 05:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586749689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SAwjJaWGJy+CJIqk9YBHuwzAac2WIUd7IW2maZbckMo=;
 b=OR+GF0RKoSnJLaThiN0tu9KjNtMhv7jATDMywCgOBmBETDqIC/BFo0Aeukb/cVlaURDTOB
 M5rU7jE33B9UzsWKBesXDPa+o1/kku51MbnX1fhrM6Bzcck7ObH+A+UgVeE90E5BauUyLb
 3KcIZ5x3sReiJrJWumcepQJL+K94j/I=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-l7Oub4XDMbivZR_MKhZ_KQ-1; Sun, 12 Apr 2020 23:48:07 -0400
X-MC-Unique: l7Oub4XDMbivZR_MKhZ_KQ-1
Received: by mail-lf1-f69.google.com with SMTP id s1so1382384lfd.16
 for <ltp@lists.linux.it>; Sun, 12 Apr 2020 20:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=81CEg/iIpQZyDwrO9t7twrbsgp6ux5s/M+LRf/AUgWM=;
 b=B+mkonnua7Nd9/ZD6ka/Kerj83fszKZFCBqgzd43vFofaMZCyeC4jnHRjK/YXlZpMb
 EuqNWT3paFPnWGqjKv2F85C025MRJKmhdSmj285uEZfjEXRQYyWUhIgTPxLALgb0ATFM
 ZSkYbEsWK5AYlk9wX8m2oeLHxl3k4qIygSvCU3jcO1767UnPlyO4BtGqJMtdC1cy39hd
 lp1yGFRHirEl7Tuf/wD95+pUG8jOej22pd2cHa1TEzyNbZanSOQUiWQCgX1C+wkgvQZG
 TVpu6zfTKB7+1Q1OAAjnX1gdSEwiR5IhkKdqgOW/lW2qxLNzyAba51UM6HfHBomZOfnt
 PdCA==
X-Gm-Message-State: AGi0PuYtykhJOxP9A6eB4GIKf+N4daOoJDxxeHkkrkeSlKA/ra7WlK0V
 rj+o1juJKo35vbqyoBChJcAur9jkPXBQaKVSVpw1LYROv8gwHJvzlF9llp7q2XXdgfOiavQfdqY
 2egXmbuInnQiT9moXqgh1d+GcrYI=
X-Received: by 2002:ac2:4551:: with SMTP id j17mr3215530lfm.147.1586749685844; 
 Sun, 12 Apr 2020 20:48:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypI+gPR8XtM4d39sU2/Rf4bcCOnpnIBQGB5Y9VugrxDzLtSNXDyw8gxo5B8VEH3TlM3Kynuj+2RWtdV+AZqpfh8=
X-Received: by 2002:ac2:4551:: with SMTP id j17mr3215520lfm.147.1586749685662; 
 Sun, 12 Apr 2020 20:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191016131506.17193-1-chrubis@suse.cz>
 <1282930646.6466524.1571232948788.JavaMail.zimbra@redhat.com>
 <20191016141339.GA19297@rei.lan>
In-Reply-To: <20191016141339.GA19297@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Mon, 13 Apr 2020 11:47:54 +0800
Message-ID: <CAEemH2dONxJS2kxh3RKvB=x=cV5ikMhs4yDVffz2UiF58EZYEg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: tst_taint: Ignore WARN taint flag if already
 set
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
Cc: LTP List <ltp@lists.linux.it>, Chang Yin <cyin@redhat.com>
Content-Type: multipart/mixed; boundary="===============1187976518=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1187976518==
Content-Type: multipart/alternative; boundary="0000000000005c999c05a323f3a4"

--0000000000005c999c05a323f3a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cyril,

Per the discussion in history, I'm asking do you plan to draft patch v2 for
it?
Or, do we have new thoughts on this?

--=20
Regards,
Li Wang

--0000000000005c999c05a323f3a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Cyril,</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">P=
er the discussion in history, I&#39;m asking do you plan to draft patch v2 =
for it?</div><div class=3D"gmail_default" style=3D"font-size:small">Or, do =
we have new thoughts on this?</div></div><div><br></div>-- <br><div dir=3D"=
ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></=
div></div>

--0000000000005c999c05a323f3a4--


--===============1187976518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1187976518==--

