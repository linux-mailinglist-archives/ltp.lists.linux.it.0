Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D3419251299
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 09:07:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 790613C2ECA
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 09:07:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A0D4F3C12A1
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 09:07:46 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 8C720600987
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 09:07:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598339264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1JompILqS0uBq0KMSb5ZZ7f+NRinNk5/OCORRmt14eU=;
 b=GVCpcPXh1iLf9fGGRMffGTcN/iCrRZVJ5+CWASDZcg8rqFwJTHg/JOG9PS6/rbV/Bw9ziW
 NE/Q2Ter5bFa3KZ2Kdnq3Iy05Z/7bFxKPiv+RXvfGexeddobTYoFi7RRiex39erJG8C8vp
 VV8Xm8XE236QBGtYDYT3K6vnlUf30YI=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-zTB4qiKbM-GB-LfYg-wlww-1; Tue, 25 Aug 2020 03:07:41 -0400
X-MC-Unique: zTB4qiKbM-GB-LfYg-wlww-1
Received: by mail-yb1-f199.google.com with SMTP id v11so13786511ybm.22
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 00:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1JompILqS0uBq0KMSb5ZZ7f+NRinNk5/OCORRmt14eU=;
 b=aTNT/Dzv8WxUt876zWQ8Drplq9jCKpHDhwH+JbKN9/2si0Pk7iQ5Ziv+GcM2Z4WhYa
 ECCai/UZ4O2k6WjpLd173pUTLFATd2qsuAoa2Ma4Lnr2eyoCGXMrfyBN+6hp0vghE5/D
 afPx3OrxnLdINB1ElUa/tswFSgpitMLfKlts98e+7uvNMWyP5OQj3Uj1afw7vxFn7mT5
 XzQutsoIcj9A9nlA1+B71lFPu9yKrmJG4EvSg6TkX0cXehnumOG6AIiaxmg200hCQxOJ
 baxQc2MHGO7ZLP8VtELAT9sGSUxKp7eRJ5pUeoFMS7UaZGj/184eLgVsN6Jfh0+1quIe
 qATg==
X-Gm-Message-State: AOAM532tr8yQNg0RVQzZGxREp5I+5OW8cx3hDdab8Y60A9aBnaH3gOGb
 FrdLWIzzOF7uc1ODDwAuvX8EZum4BF++JiG0pVCrQBaQFf70luA3KV8s8w1SOFQNNe15XLYLISP
 rB1tug+DDIV+snQfWr4Uro+jfGWU=
X-Received: by 2002:a25:c102:: with SMTP id r2mr12813485ybf.110.1598339261174; 
 Tue, 25 Aug 2020 00:07:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOvNXUFtUHsQ61Y+crWsV/lrKuO7vju3klUOMofJDO9QyML74pOwpm/d0vA1Cb+/rAkXyAG19sYOQKf6Gi/1Q=
X-Received: by 2002:a25:c102:: with SMTP id r2mr12813462ybf.110.1598339260908; 
 Tue, 25 Aug 2020 00:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <1597042181-12722-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <b0e940e7-945b-cdd9-695d-025bdc4a1ba1@cn.fujitsu.com>
In-Reply-To: <b0e940e7-945b-cdd9-695d-025bdc4a1ba1@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 25 Aug 2020 15:07:29 +0800
Message-ID: <CAEemH2dds8rJetEKXfwm5ck_knxOG=QFssbWtiRbxQk4oiZDVQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuset_inherit_test: Add cgroup.clone_children
 swith for cpuset.cpus and mems
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
Content-Type: multipart/mixed; boundary="===============1667700791=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1667700791==
Content-Type: multipart/alternative; boundary="000000000000e0ba9705adae5bfe"

--000000000000e0ba9705adae5bfe
Content-Type: text/plain; charset="UTF-8"

Hi Xu,

I helped correct the test counting and pushed after self-testing.

------------

-# Case 1-3
+# Case 1-6
 test_cpus

-# Case 4-6
+# Case 7-12
 test_mems

-# Case 7-14
+# Case 13-20
 test_three_result_similar_flags

-# Case 15-18
+# Case 21-24
 test_spread_flags

-# Case 19-20
+# Case 25-26
 test_sched_load_balance_flag

-# Case 21-27
+# Case 27-33
 test_domain

-- 
Regards,
Li Wang

--000000000000e0ba9705adae5bfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I he=
lped correct the test counting and pushed after self-testing.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">------------</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">-# Case 1-3<br>+# Case 1-6<br>=C2=A0test_cpus<br>=
=C2=A0<br>-# Case 4-6<br>+# Case 7-12<br>=C2=A0test_mems<br>=C2=A0<br>-# Ca=
se 7-14<br>+# Case 13-20<br>=C2=A0test_three_result_similar_flags<br>=C2=A0=
<br>-# Case 15-18<br>+# Case 21-24<br>=C2=A0test_spread_flags<br>=C2=A0<br>=
-# Case 19-20<br>+# Case 25-26<br>=C2=A0test_sched_load_balance_flag<br>=C2=
=A0<br>-# Case 21-27<br>+# Case 27-33<br>=C2=A0test_domain<br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div></div>-- <br><div=
 dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></=
div><div>Li Wang<br></div></div></div></div>

--000000000000e0ba9705adae5bfe--


--===============1667700791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1667700791==--

