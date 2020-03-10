Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EE917EECC
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 03:45:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BDFD3C6194
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 03:45:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8125E3C613B
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 03:45:13 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 0AA6B601E23
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 03:45:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583808311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=V7soeGZH75VHGfHywCxxqNX1aflin+GYHBReXVNKPdU=;
 b=XzQAeUX6HLtTRVg5si+2fVfVjzz+IRY8ze+RGANq1ifGwXs013Sivb5HrDAPgcWY2DkG86
 vl0tbnDn51lgGhVXfVW9tv9KZYIzZBHSPWtWs8xD3Q34eDuKxEyGos4vCt9bzPOQURxPpE
 3RytBf2+SKB0FgT3t+nbu34wDC7rFmI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-Q-_8ezwsPomRmpZY0EXPoA-1; Mon, 09 Mar 2020 22:45:07 -0400
X-MC-Unique: Q-_8ezwsPomRmpZY0EXPoA-1
Received: by mail-lj1-f197.google.com with SMTP id l18so400866lja.19
 for <ltp@lists.linux.it>; Mon, 09 Mar 2020 19:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BXgCwh2eSq/XMmxA0VKtBSHEBf9U8BNFOqkV99Nu8R8=;
 b=eFG0pdxqsQrkDVeABsmrc2wwnwj7VTacVXqIKlsCrLHVnYLYc3kvbEwD6fU0UtdGlx
 KncgHdaet6WrHRbN80AEl0gvo7z/I5sMI++mMtNobm2rZNEOQZjOxHQbG4R3r+27XGqS
 9vTLVpr80YBV7Dm094sOhM3G0AeWFO8Bf8+h+n6+h+fIOYdFgi4UdAHkl/ESgOQbMihB
 ZvbJeF2D6kUXzWgMS24wjwUjqlIVKmr4Nh4aLLGJMELXpNWtLm8toNfYmR2ALQ7vih3y
 0Fa3FeUb9DRqa95BHGidovFsROOOjzcPpwZcqUfuJx2Q1v3Uo51VE3sRvjOpbI8d4j9n
 OzHA==
X-Gm-Message-State: ANhLgQ02wJ6pbQ6gAWc4lWVLJv6NiYOc5DPxEsODoNQN4UVT50+BUnid
 0hru01IRtlTFfcstg2QWBhyScjqf2cdr+t/d/VDf8sMnwXJqNNvTMHD5xrtADl4Uv+fghY8NLy4
 QVBh1uI7eFGuHtZGKD0T9iDg950A=
X-Received: by 2002:a2e:a312:: with SMTP id l18mr2706731lje.229.1583808305691; 
 Mon, 09 Mar 2020 19:45:05 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt7Ps7GvpQ41OoZu+D0AEe4Nq5U45k2tIfbJgLHVgGO/ISc33uodqNC8nz3/3TizA/2OmvnExnSJ1po1uZ0dyw=
X-Received: by 2002:a2e:a312:: with SMTP id l18mr2706722lje.229.1583808305428; 
 Mon, 09 Mar 2020 19:45:05 -0700 (PDT)
MIME-Version: 1.0
From: Ronald Monthero <rmonther@redhat.com>
Date: Tue, 10 Mar 2020 12:44:54 +1000
Message-ID: <CAGR3Yi6r+caUYV+yZYHGsuRUPQBbpsN_PJOTTSvHwE2VARy92g@mail.gmail.com>
To: ltp@lists.linux.it
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] Fix build error because of undefined CAP_SYS_TIME
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
Content-Type: multipart/mixed; boundary="===============0513806247=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0513806247==
Content-Type: multipart/alternative; boundary="000000000000700a8505a0771b20"

--000000000000700a8505a0771b20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Details of the build log at pr#654
https://github.com/linux-test-project/ltp/pull/654

Signed-off-by: Ronald Monthero <rmonther@redhat.com>
---
diff --git a/include/lapi/capability.h b/include/lapi/capability.h
index 8833f0605..8ed68bfce 100644
--- a/include/lapi/capability.h
+++ b/include/lapi/capability.h
@@ -24,6 +24,10 @@
 # define CAP_NET_RAW          13
 #endif

+#ifndef CAP_SYS_TIME
+#define CAP_SYS_TIME          25
+#endif
+
 #ifndef CAP_SYS_ADMIN
 # define CAP_SYS_ADMIN        21
 #endif
---

--000000000000700a8505a0771b20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Det=
ails of the build log at pr#654=C2=A0=C2=A0<a href=3D"https://github.com/li=
nux-test-project/ltp/pull/654">https://github.com/linux-test-project/ltp/pu=
ll/654</a></div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">Signed-off-by:=
 Ronald Monthero &lt;<a href=3D"mailto:rmonther@redhat.com">rmonther@redhat=
.com</a>&gt;<br></div><div class=3D"gmail_default" style=3D"font-size:small=
">---<br>diff --git a/include/lapi/capability.h b/include/lapi/capability.h=
<br>index 8833f0605..8ed68bfce 100644<br>--- a/include/lapi/capability.h<br=
>+++ b/include/lapi/capability.h<br>@@ -24,6 +24,10 @@<br>=C2=A0# define CA=
P_NET_RAW =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013<br>=C2=A0#endif<br>=C2=A0<br=
>+#ifndef CAP_SYS_TIME<br>+#define CAP_SYS_TIME =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A025<br>+#endif<br>+<br>=C2=A0#ifndef CAP_SYS_ADMIN<br>=C2=A0# define =
CAP_SYS_ADMIN =C2=A0 =C2=A0 =C2=A0 =C2=A021<br>=C2=A0#endif<br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">---</div></div>

--000000000000700a8505a0771b20--


--===============0513806247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0513806247==--

