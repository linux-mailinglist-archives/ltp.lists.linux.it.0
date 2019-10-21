Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0030ADE20A
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 04:25:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D9B93C229E
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 04:25:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 5B37C3C2241
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 04:24:58 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 577F61400754
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 04:24:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571624695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mkPno/B/3gqGDHCpqC2LZh4PwyGDHWdH3ApHuZBHFQU=;
 b=iQ18ClwdpiMjUkEZqJoWfml8dNRP70YVwqOiaQJ1ZhI6W8ezFLuomoW5Z52QQU4U73Ss+H
 +m2xYWHH9o+hKSHQlBpvu/mypaXPq4SBaSufNh/FBs6tdXth2+V+mVYVvk6veiidW2noPv
 Sbj35Qw/u0IJe8SHQJwcTXUo5bGYbIA=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-PdVGy1TTMd6ZLnaQ6py8Dw-1; Sun, 20 Oct 2019 22:24:50 -0400
Received: by mail-ot1-f72.google.com with SMTP id i8so6007625otc.19
 for <ltp@lists.linux.it>; Sun, 20 Oct 2019 19:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ubs1wmTYs99ekIJQBJOcBfyfwQH29eMFrPNyTi7oFR0=;
 b=fs5mg/Al3y478eV49rAMW96Jsmq0dRR79t9i0n5pEFo6s0sGoPb0cDw2Q42R0TrJXq
 GKd5qXPRfApEu9veGHlfKa+HEfCdFqfmm6X+4enuo2ynSWyy8oCdZlwPGSDM00FKx5j2
 wJhtr+WKUgJ3Qs0zzlfa2SXBzNH6ZfVr5UHjzqzFR9pz3L8TjAe4lWqnbxDxygntLl7R
 Ff90uyceQVBP1cwd4Y/s148D5NurfSoFLRh8n+1cnUDxm5aTDunNnwr6Caf3LFGPEY8G
 X+ah3AzRh8aGRhe8sOxgVi1oQiJdBZfEIWxGRNzLmAQ4ehgriTIAOT1rZixeMOBw2pkq
 7+5g==
X-Gm-Message-State: APjAAAWilVB7wlue473TjZHODQvSJVim9AJXoQbDYl1GP7389ctq9W+d
 fQCgWKyvm/2CYx0cFnGldS0qo1hoqLulmmEN68ub1fyfhmUlkj/i8N+Koku9FoDGB4+ZX4FOncT
 xRSPq7f0a/iuGzXPMamolHTLlW+k=
X-Received: by 2002:a9d:4d90:: with SMTP id u16mr6042173otk.26.1571624690081; 
 Sun, 20 Oct 2019 19:24:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx7EtZZvzYGI53FLgp3PTh0ZNivs8NP0LGwWUF0ivb5fPDv2JiDzRzjF60BZQ7Ig9RY52kPIX5BoZ5l3MkySDc=
X-Received: by 2002:a9d:4d90:: with SMTP id u16mr6042165otk.26.1571624689845; 
 Sun, 20 Oct 2019 19:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191021012940.31678-1-pengfei.xu@intel.com>
In-Reply-To: <20191021012940.31678-1-pengfei.xu@intel.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 21 Oct 2019 10:24:38 +0800
Message-ID: <CAEemH2ceVOOWhT9zjBM+UWfwnuow1ei3C1iTBiWaGEELLMjwJw@mail.gmail.com>
To: Pengfei Xu <pengfei.xu@intel.com>
X-MC-Unique: PdVGy1TTMd6ZLnaQ6py8Dw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] umip_basic_test.c: remove useless new lines print
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
Cc: Su Heng <heng.su@intel.com>, Neri Ricardo <ricardo.neri@intel.com>,
 ltp <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1392013657=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1392013657==
Content-Type: multipart/alternative; boundary="0000000000005bea6b05956263fc"

--0000000000005bea6b05956263fc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Pushed.

--=20
Regards,
Li Wang

--0000000000005bea6b05956263fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Pushed.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></d=
iv>

--0000000000005bea6b05956263fc--


--===============1392013657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1392013657==--

