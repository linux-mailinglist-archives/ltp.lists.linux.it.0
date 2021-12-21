Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEAB47BFC8
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Dec 2021 13:35:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D38373C921F
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Dec 2021 13:35:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 420DD3C9207
 for <ltp@lists.linux.it>; Tue, 21 Dec 2021 13:35:34 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DB6A110011DF
 for <ltp@lists.linux.it>; Tue, 21 Dec 2021 13:35:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640090132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=T5iPwFQzTGdR6scHSPC7wD5QbAZaB4B1M3waHGRB15M=;
 b=LpEIxShTCOxPFxk0dcMc6hfY/Wh4Qsqytho7O2G0tV1zhKDpCnbXs2KUbemITpF3Q2Spe4
 BWrfAJpIAiMBNNvvAFHXIxW7C3FR7e08UAnoA471gOK6jJQ/ApZ2W1bolHaJ7b/RxIZy33
 /1JLRSQoeiUJo1mArEMpNw+iUr4jQRk=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-8DFmvVM6MdeE-h9JTnbIJA-1; Tue, 21 Dec 2021 07:35:30 -0500
X-MC-Unique: 8DFmvVM6MdeE-h9JTnbIJA-1
Received: by mail-yb1-f200.google.com with SMTP id
 t24-20020a252d18000000b005c225ae9e16so25270707ybt.15
 for <ltp@lists.linux.it>; Tue, 21 Dec 2021 04:35:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=T5iPwFQzTGdR6scHSPC7wD5QbAZaB4B1M3waHGRB15M=;
 b=FUIeljXLWDaV7BDvlIyHZ2doE3CKS+Iy7/4o3Qtk73axTVQLOqKX+y5oEVBv+ZwKRD
 YAyGtwsSkkP0b5NOi9V6fnc063tbNIlhJb/XD8t67kHDJNW/2/6sfxO4Mv9HtgBt3SEF
 evLa97+XkjvwPdAxdUUyHavZ94WopDsV0EfP8mZLuAL6jKSxuOAPM9hIWbr8OSf/3ST/
 n6Iv/ZvQDcWtzYbekZueq2Bz3BmTLNnYY4OvlDhqRCZar7qVwJq9P2kAKwHdYHu09RSI
 2E29sWWzikM6eqChlstZpf+5J8z87B+uQhilyk6jaYiTj/pJSZjzBdNQhflMZGxhfOXA
 JiRg==
X-Gm-Message-State: AOAM532RYKd/AonM4TqKCldKRPR3IkBfaF7j6KhJzRcT+WhNKwFKEKmS
 cX1cykihsmP3pEhHc5EZsNLD65Iu8Cili7DAIQuAULNCOulwutNHEvwMGCxlJj6T2zH4jNM4aUM
 Jz8Rop4KL7NNlVR5VXnRM4yll0XU=
X-Received: by 2002:a25:8c9:: with SMTP id 192mr4255197ybi.102.1640090128706; 
 Tue, 21 Dec 2021 04:35:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxha+q6FegFgRs4MWqNgbztNmfb+kTv9GZW7/I6eEb5Z24342Yv7SkYqYjJ/VfoIm78OPENKCKiDRLH8D0MSc=
X-Received: by 2002:a25:8c9:: with SMTP id 192mr4255173ybi.102.1640090128445; 
 Tue, 21 Dec 2021 04:35:28 -0800 (PST)
MIME-Version: 1.0
From: Li Wang <liwang@redhat.com>
Date: Tue, 21 Dec 2021 20:35:17 +0800
Message-ID: <CAEemH2eZDBODpZwjcCq=M=wT0uiSUSM+iS88F7-OQP-pkYRn=A@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>
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
Subject: [LTP] [Question] Why test C API failed in github CI
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
Content-Type: multipart/mixed; boundary="===============0974918091=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0974918091==
Content-Type: multipart/alternative; boundary="00000000000081857b05d3a73d05"

--00000000000081857b05d3a73d05
Content-Type: text/plain; charset="UTF-8"

Hi Petr and all,

Firstly, I'm sorry to push the patchset about oom protection cursorily.

The GitHub CI complained about the following failures, I feel confused
when I add a bit of debug code in my private branch then. It gets passed
in access(score_path, R_OK|W_OK) but failed in closing the file and
give no EACCESS errno, that's wired.

Did I miss anything?

https://github.com/wangli5665/ltp/runs/4594473907?check_suite_focus=true

-----error log------
runtest TINFO: * test05
14tst_memutils.c:118: TWARN: Failed to close FILE
'/proc/63046/oom_score_adj'
15tst_memutils.c:119: TBROK: Failed to close FILE
'/proc/63046/oom_score_adj': EACCES (13)
...
----------------------

--- a/lib/tst_memutils.c
+++ b/lib/tst_memutils.c
@@ -111,7 +111,13 @@ static void set_oom_score_adj(pid_t pid, int value)
                        tst_brk(TBROK, "%s does not exist, please check if
PID is valid", score_path);
        }

+       //debug code
+       if (access(score_path, R_OK | W_OK) == -1)
+               tst_brk(TBROK, "%s not readable/writeable", score_path);
+
        FILE_PRINTF(score_path, "%d", value);
+       SAFE_FILE_PRINTF(score_path, "%d", value);
+
        FILE_SCANF(score_path, "%d", &val);

        if (val != value) {


-- 
Regards,
Li Wang

--00000000000081857b05d3a73d05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Petr and all,<br><br><span class=3D"gmail_default" styl=
e=3D"font-size:small">Firstly,</span> I&#39;m sorry to push the patchset ab=
out oom protection cursorily.<br><br>The GitHub CI complained about the fol=
lowing failures, I feel confused<br>when I add a bit of debug code in my pr=
ivate branch then. It gets passed<br>in access(score_path, R_OK|W_OK) but f=
ailed in closing the file and<br>give no EACCESS errno, that&#39;s wired.<s=
pan class=3D"gmail_default" style=3D"font-size:small">=C2=A0</span><div><sp=
an class=3D"gmail_default" style=3D"font-size:small"><br></span></div><div>=
<span class=3D"gmail_default" style=3D"font-size:small">Did I miss anything=
?</span><br><a href=3D"https://github.com/wangli5665/ltp/runs/4594473907?ch=
eck_suite_focus=3Dtrue"><br>https://github.com/wangli5665/ltp/runs/45944739=
07?check_suite_focus=3Dtrue</a><br><br>-----error log------<br>runtest TINF=
O: * test05<br>14tst_memutils.c:118: TWARN: Failed to close FILE &#39;/proc=
/63046/oom_score_adj&#39;<br>15tst_memutils.c:119: TBROK: Failed to close F=
ILE &#39;/proc/63046/oom_score_adj&#39;: EACCES (13)<div><div class=3D"gmai=
l_default" style=3D"font-size:small">...</div><div class=3D"gmail_default" =
style=3D"font-size:small">----------------------</div><br>--- a/lib/tst_mem=
utils.c<br>+++ b/lib/tst_memutils.c<br>@@ -111,7 +111,13 @@ static void set=
_oom_score_adj(pid_t pid, int value)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TBROK, &quot;%s do=
es not exist, please check if PID is valid&quot;, score_path);<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0<br>+ =C2=A0 =C2=A0 =C2=A0 //debug code<br>=
+ =C2=A0 =C2=A0 =C2=A0 if (access(score_path, R_OK | W_OK) =3D=3D -1)<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TBROK, &quot;%s no=
t readable/writeable&quot;, score_path);<br>+<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 FILE_PRINTF(score_path, &quot;%d&quot;, value);<br>+ =C2=A0 =C2=A0 =C2=
=A0 SAFE_FILE_PRINTF(score_path, &quot;%d&quot;, value);<br>+<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 FILE_SCANF(score_path, &quot;%d&quot;, &amp;val);<br>=C2=
=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (val !=3D value) {<br><br><br>-- <br>=
Regards,<br>Li Wang</div></div></div>

--00000000000081857b05d3a73d05--


--===============0974918091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0974918091==--

